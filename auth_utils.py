from functools import wraps
from flask import session, redirect, url_for

def login_required(*roles):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            if 'user_id' not in session:
                return redirect(url_for('login'))
            if roles and session.get('role') not in roles:
                return 'Unauthorized', 403
            return f(*args, **kwargs)
        return decorated_function
    return decorator
