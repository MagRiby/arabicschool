from flask import Blueprint, request, jsonify, session, redirect, url_for, flash
from functools import wraps
from ..models import db, User
from werkzeug.security import check_password_hash
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

bp = Blueprint('auth', __name__)

def login_required(roles=None):
    """Decorator to ensure a user is logged in and has the required role."""
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'user_id' not in session:
                if request.accept_mimetypes.accept_json:
                    return jsonify({'error': 'Authentication required'}), 401
                return redirect(url_for('auth.login'))
            
            if roles and session.get('role') not in roles:
                if request.accept_mimetypes.accept_json:
                    return jsonify({'error': 'Insufficient permissions'}), 403
                flash('You do not have permission to access this page.', 'danger')
                return redirect(url_for('main.dashboard'))
                
            return f(*args, **kwargs)
        return decorated_function
    return decorator

@bp.route('/login', methods=['GET', 'POST'])
def login():
    """Handle user login."""
    if request.method == 'POST':
        data = request.get_json() if request.is_json else request.form
        username = data.get('username')
        password = data.get('password')
        
        if not username or not password:
            if request.is_json:
                return jsonify({'error': 'Username and password are required'}), 400
            flash('Username and password are required', 'danger')
            return redirect(url_for('auth.login'))
        
        user = User.query.filter_by(username=username).first()
        
        if user and user.check_password(password):
            session.clear()
            session['user_id'] = user.id
            session['username'] = user.username
            session['role'] = user.role
            
            # Update last login
            user.update_last_login()
            
            if request.is_json:
                return jsonify({
                    'message': 'Login successful',
                    'user': {
                        'id': user.id,
                        'username': user.username,
                        'role': user.role,
                        'email': user.email
                    }
                })
                
            flash('You were successfully logged in', 'success')
            return redirect(url_for('main.dashboard'))
        
        if request.is_json:
            return jsonify({'error': 'Invalid username or password'}), 401
            
        flash('Invalid username or password', 'danger')
    
    # For GET requests or failed POST requests with HTML response
    return '''
        <form method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
    '''

@bp.route('/logout')
def logout():
    """Log the user out."""
    session.clear()
    flash('You were logged out', 'info')
    return redirect(url_for('auth.login'))

@bp.route('/profile')
@login_required()
def profile():
    """Display the current user's profile."""
    user = User.query.get(session['user_id'])
    if not user:
        session.clear()
        flash('User not found', 'danger')
        return redirect(url_for('auth.login'))
        
    return jsonify(user.to_dict()) if request.accept_mimetypes.accept_json else f"""
        <h1>Profile</h1>
        <p>Username: {user.username}</p>
        <p>Email: {user.email or 'N/A'}</p>
        <p>Role: {user.role}</p>
        <a href="{url_for('auth.logout')}">Logout</a>
    """

# Helper function to get the current user
def get_current_user():
    """Get the current user from the session."""
    if 'user_id' in session:
        return User.query.get(session['user_id'])
    return None
