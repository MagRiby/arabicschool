from flask import Blueprint, request, jsonify, redirect, url_for, flash, current_app
from ..models import db, SuperBadge, Student, StudentSuperBadge
from .auth import login_required, get_current_user
import uuid

bp = Blueprint('super_badges', __name__, url_prefix='/super-badges')

@bp.route('', methods=['GET'])
def list_badges():
    """List all super badges."""
    is_active = request.args.get('is_active', default=True, type=lambda v: v.lower() == 'true')
    
    query = SuperBadge.query
    
    if is_active is not None:
        query = query.filter_by(is_active=is_active)
    
    badges = query.order_by(SuperBadge.name).all()
    
    if request.accept_mimetypes.accept_json:
        return jsonify([{
            'id': b.id,
            'name': b.name,
            'description': b.description,
            'icon_type': b.icon_type,
            'icon_value': b.icon_value,
            'is_active': b.is_active,
            'created_at': b.created_at.isoformat() if b.created_at else None,
            'updated_at': b.updated_at.isoformat() if b.updated_at else None
        } for b in badges])
    
    # For HTML response
    return "Super badges list view will be implemented here"

@bp.route('', methods=['POST'])
@login_required(roles=['admin', 'teacher'])
def create_badge():
    """Create a new super badge."""
    if request.is_json:
        data = request.get_json()
    else:
        data = request.form.to_dict()
    
    # Basic validation
    required_fields = ['name', 'icon_type', 'icon_value']
    missing = [field for field in required_fields if not data.get(field)]
    if missing:
        if request.is_json:
            return jsonify({'error': f'Missing required fields: {", ".join(missing)}'}), 400
        flash(f'Missing required fields: {", ".join(missing)}', 'danger')
        return redirect(url_for('super_badges.list_badges'))
    
    # Additional validation for SVG content if icon_type is 'svg'
    if data['icon_type'] == 'svg' and not data['icon_value'].strip().startswith('<svg'):
        error_msg = "SVG icon_value must be valid SVG content starting with <svg"
        if request.is_json:
            return jsonify({'error': error_msg}), 400
        flash(error_msg, 'danger')
        return redirect(url_for('super_badges.list_badges'))
    
    try:
        badge = SuperBadge(
            name=data['name'],
            icon_type=data['icon_type'],
            icon_value=data['icon_value'],
            description=data.get('description'),
            is_active=data.get('is_active', True)
        )
        
        db.session.add(badge)
        db.session.commit()
        
        if request.is_json:
            return jsonify(badge.to_dict()), 201
            
        flash('Super badge created successfully', 'success')
        return redirect(url_for('super_badges.list_badges'))
        
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f'Error creating super badge: {str(e)}')
        if request.is_json:
            return jsonify({'error': str(e)}), 400
        flash(f'Error creating super badge: {str(e)}', 'danger')
        return redirect(url_for('super_badges.list_badges'))

@bp.route('/<int:badge_id>', methods=['GET'])
def get_badge(badge_id):
    """Get a single super badge by ID."""
    badge = SuperBadge.query.get_or_404(badge_id)
    
    if request.accept_mimetypes.accept_json:
        return jsonify(badge.to_dict(include_students=True))
    
    # For HTML response
    return f"""
        <h1>{badge.name}</h1>
        <p>{badge.description or 'No description'}</p>
        <div>
            <strong>Icon Type:</strong> {badge.icon_type}<br>
            <strong>Created:</strong> {badge.created_at}<br>
            <strong>Active:</strong> {'Yes' if badge.is_active else 'No'}
        </div>
        <a href="{url_for('super_badges.list_badges')}">Back to list</a>
    """

@bp.route('/<int:badge_id>', methods=['PUT'])
@login_required(roles=['admin', 'teacher'])
def update_badge(badge_id):
    """Update a super badge."""
    badge = SuperBadge.query.get_or_404(badge_id)
    
    if request.is_json:
        data = request.get_json()
    else:
        data = request.form.to_dict()
    
    try:
        # Update fields if they exist in the request
        for field in ['name', 'description', 'icon_type', 'icon_value', 'is_active']:
            if field in data:
                # Additional validation for SVG content if updating icon_type or icon_value
                if field == 'icon_type' and data[field] == 'svg' and \
                   'icon_value' in data and not data['icon_value'].strip().startswith('<svg'):
                    error_msg = "SVG icon_value must be valid SVG content starting with <svg"
                    if request.is_json:
                        return jsonify({'error': error_msg}), 400
                    flash(error_msg, 'danger')
                    return redirect(url_for('super_badges.get_badge', badge_id=badge_id))
                
                setattr(badge, field, data[field])
        
        db.session.commit()
        
        if request.is_json:
            return jsonify(badge.to_dict())
            
        flash('Super badge updated successfully', 'success')
        return redirect(url_for('super_badges.get_badge', badge_id=badge_id))
        
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f'Error updating super badge: {str(e)}')
        if request.is_json:
            return jsonify({'error': str(e)}), 400
        flash(f'Error updating super badge: {str(e)}', 'danger')
        return redirect(url_for('super_badges.get_badge', badge_id=badge_id))

@bp.route('/<int:badge_id>', methods=['DELETE'])
@login_required(roles=['admin'])
def delete_badge(badge_id):
    """Delete a super badge."""
    badge = SuperBadge.query.get_or_404(badge_id)
    
    try:
        # First delete all student associations
        StudentSuperBadge.query.filter_by(super_badge_id=badge_id).delete()
        
        # Then delete the badge
        db.session.delete(badge)
        db.session.commit()
        
        if request.is_json:
            return jsonify({'message': 'Super badge deleted successfully'})
            
        flash('Super badge deleted successfully', 'success')
        return redirect(url_for('super_badges.list_badges'))
        
    except Exception as e:
        db.session.rollback()
        current_app.logger.error(f'Error deleting super badge: {str(e)}')
        if request.is_json:
            return jsonify({'error': str(e)}), 400
        flash(f'Error deleting super badge: {str(e)}', 'danger')
        return redirect(url_for('super_badges.get_badge', badge_id=badge_id))
