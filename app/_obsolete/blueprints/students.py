from flask import Blueprint, request, jsonify, render_template, redirect, url_for, flash
from ..models import db, Student, Class, User, StudentSuperBadge, SuperBadge
from .auth import login_required, get_current_user

bp = Blueprint('students', __name__, url_prefix='/students')

@bp.route('', methods=['GET'])
@login_required()
def list_students():
    """List all students with optional filtering."""
    # Get query parameters
    class_id = request.args.get('class_id', type=int)
    is_active = request.args.get('is_active', default=True, type=lambda v: v.lower() == 'true')
    
    # Build query
    query = Student.query.filter_by(is_active=is_active)
    
    # Apply filters
    if class_id:
        query = query.filter_by(class_id=class_id)
    
    students = query.order_by(Student.last_name, Student.first_name).all()
    
    if request.accept_mimetypes.accept_json:
        return jsonify([{
            'id': s.id,
            'name': f"{s.first_name} {s.last_name}",
            'class_id': s.class_id,
            'class_name': s.student_class.name if s.student_class else None,
            'is_active': s.is_active
        } for s in students])
    
    # For HTML response, we'll need to implement this later
    return "Student list view will be implemented here"

@bp.route('/<int:student_id>', methods=['GET'])
@login_required()
def get_student(student_id):
    """Get a single student's details."""
    student = Student.query.get_or_404(student_id)
    
    if request.accept_mimetypes.accept_json:
        return jsonify(student.to_dict(include_class=True))
    
    # For HTML response
    return f"""
        <h1>{student.first_name} {student.last_name}</h1>
        <p>Class: {student.student_class.name if student.student_class else 'None'}</p>
        <p>Parent: {student.parent_name or 'N/A'}</p>
        <p>Phone: {student.parent_phone or 'N/A'}</p>
        <p>Email: {student.parent_email or 'N/A'}</p>
        <a href="{url_for('students.edit_student', student_id=student.id)}">Edit</a>
    """

@bp.route('', methods=['POST'])
@login_required(roles=['admin', 'teacher'])
def create_student():
    """Create a new student."""
    if request.is_json:
        data = request.get_json()
    else:
        data = request.form.to_dict()
    
    # Basic validation
    required_fields = ['first_name', 'last_name']
    missing = [field for field in required_fields if not data.get(field)]
    if missing:
        if request.is_json:
            return jsonify({'error': f'Missing required fields: {", ".join(missing)}'}), 400
        flash(f'Missing required fields: {", ".join(missing)}', 'danger')
        return redirect(url_for('students.list_students'))
    
    try:
        student = Student(
            first_name=data['first_name'],
            last_name=data['last_name'],
            class_id=data.get('class_id'),
            date_of_birth=data.get('date_of_birth'),
            gender=data.get('gender'),
            address=data.get('address'),
            parent_name=data.get('parent_name'),
            parent_phone=data.get('parent_phone'),
            parent_email=data.get('parent_email'),
            notes=data.get('notes')
        )
        
        db.session.add(student)
        db.session.commit()
        
        if request.is_json:
            return jsonify(student.to_dict()), 201
            
        flash('Student created successfully', 'success')
        return redirect(url_for('students.get_student', student_id=student.id))
        
    except Exception as e:
        db.session.rollback()
        if request.is_json:
            return jsonify({'error': str(e)}), 400
        flash(f'Error creating student: {str(e)}', 'danger')
        return redirect(url_for('students.list_students'))

@bp.route('/<int:student_id>', methods=['PUT'])
@login_required(roles=['admin', 'teacher'])
def update_student(student_id):
    """Update a student's information."""
    student = Student.query.get_or_404(student_id)
    
    if request.is_json:
        data = request.get_json()
    else:
        data = request.form.to_dict()
    
    try:
        # Update fields if they exist in the request
        for field in ['first_name', 'last_name', 'class_id', 'date_of_birth', 
                     'gender', 'address', 'parent_name', 'parent_phone', 
                     'parent_email', 'notes', 'is_active']:
            if field in data:
                setattr(student, field, data[field])
        
        db.session.commit()
        
        if request.is_json:
            return jsonify(student.to_dict())
            
        flash('Student updated successfully', 'success')
        return redirect(url_for('students.get_student', student_id=student.id))
        
    except Exception as e:
        db.session.rollback()
        if request.is_json:
            return jsonify({'error': str(e)}), 400
        flash(f'Error updating student: {str(e)}', 'danger')
        return redirect(url_for('students.get_student', student_id=student.id))

@bp.route('/<int:student_id>/super-badges', methods=['GET'])
@login_required()
def get_student_super_badges(student_id):
    """Get all super badges for a student."""
    student = Student.query.get_or_404(student_id)
    
    # Get all available super badges
    all_badges = SuperBadge.query.filter_by(is_active=True).all()
    
    # Get the student's active badge IDs
    student_badge_ids = {sb.super_badge_id for sb in student.super_badges}
    
    # Prepare response
    badges = []
    for badge in all_badges:
        badges.append({
            'id': badge.id,
            'name': badge.name,
            'description': badge.description,
            'icon_type': badge.icon_type,
            'icon_value': badge.icon_value,
            'is_active': badge.id in student_badge_ids,
            'awarded_at': next(
                (sb.created_at.isoformat() 
                 for sb in student.super_badges 
                 if sb.super_badge_id == badge.id),
                None
            )
        })
    
    return jsonify(badges)

@bp.route('/<int:student_id>/super-badges/<int:badge_id>', methods=['POST', 'DELETE'])
@login_required(roles=['admin', 'teacher'])
def toggle_student_super_badge(student_id, badge_id):
    """Add or remove a super badge from a student."""
    student = Student.query.get_or_404(student_id)
    badge = SuperBadge.query.get_or_404(badge_id)
    
    if request.method == 'POST':
        # Check if the student already has this badge
        existing = StudentSuperBadge.query.filter_by(
            student_id=student_id, 
            super_badge_id=badge_id
        ).first()
        
        if not existing:
            # Add the badge
            student_badge = StudentSuperBadge(
                student_id=student_id,
                super_badge_id=badge_id,
                awarded_by=get_current_user().username
            )
            db.session.add(student_badge)
            db.session.commit()
            
        return jsonify({'message': 'Badge added to student'})
    
    else:  # DELETE
        # Remove the badge
        StudentSuperBadge.query.filter_by(
            student_id=student_id,
            super_badge_id=badge_id
        ).delete()
        db.session.commit()
        
        return jsonify({'message': 'Badge removed from student'})
