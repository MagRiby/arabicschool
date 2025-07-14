from .base import db, BaseModel

class SuperBadge(BaseModel):
    """SuperBadge model for special achievements or recognitions."""
    __tablename__ = 'super_badges'
    
    # Core fields
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=True)
    icon_type = db.Column(db.String(20), nullable=False)  # 'key', 'svg', 'url'
    icon_value = db.Column(db.Text, nullable=True)  # key name, SVG data, or URL
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    student_badges = db.relationship('StudentSuperBadge', back_populates='super_badge')
    
    def __init__(self, name, icon_type, icon_value, description=None):
        self.name = name
        self.icon_type = icon_type
        self.icon_value = icon_value
        self.description = description
    
    def to_dict(self, include_students=False):
        """Convert super badge to dictionary."""
        result = {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'icon_type': self.icon_type,
            'icon_value': self.icon_value,
            'is_active': self.is_active,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }
        
        if include_students:
            result['students'] = [{
                'student_id': sb.student_id,
                'awarded_at': sb.created_at.isoformat() if sb.created_at else None
            } for sb in self.student_badges]
            
        return result


class StudentSuperBadge(BaseModel):
    """Association table between Student and SuperBadge with additional data."""
    __tablename__ = 'student_super_badges'
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    # Core fields
    notes = db.Column(db.Text, nullable=True)
    awarded_by = db.Column(db.String(100), nullable=True)  # Name of the teacher/admin who awarded this
    
    # Relationships
    student_id = db.Column(db.Integer, db.ForeignKey('students.id'), nullable=False)
    super_badge_id = db.Column(db.Integer, db.ForeignKey('super_badges.id'), nullable=False)
    
    student = db.relationship('Student', back_populates='super_badges')
    super_badge = db.relationship('SuperBadge', back_populates='student_badges')
    
    def __init__(self, student_id, super_badge_id, awarded_by=None, notes=None):
        self.student_id = student_id
        self.super_badge_id = super_badge_id
        self.awarded_by = awarded_by
        self.notes = notes
    
    def to_dict(self):
        """Convert student super badge to dictionary."""
        return {
            'id': self.id,
            'student_id': self.student_id,
            'student_name': f"{self.student.first_name} {self.student.last_name}" if self.student else None,
            'super_badge_id': self.super_badge_id,
            'badge_name': self.super_badge.name if self.super_badge else None,
            'icon_type': self.super_badge.icon_type if self.super_badge else None,
            'icon_value': self.super_badge.icon_value if self.super_badge else None,
            'awarded_by': self.awarded_by,
            'notes': self.notes,
            'awarded_at': self.created_at.isoformat() if self.created_at else None
        }
