from .base import db, BaseModel

class Teacher(BaseModel):
    """Teacher model extending the User model with teacher-specific fields."""
    __tablename__ = 'teachers'
    
    # Foreign Keys
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False, unique=True)
    local_admin_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)
    
    # Teacher-specific fields
    bio = db.Column(db.Text, nullable=True)
    qualifications = db.Column(db.Text, nullable=True)
    subjects = db.Column(db.String(200), nullable=True)  # Comma-separated subjects
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    user = db.relationship('User', back_populates='teacher_profile', uselist=False)
    local_admin = db.relationship('User', foreign_keys=[local_admin_id])
    classes = db.relationship('Class', back_populates='teacher')
    
    def __init__(self, user, local_admin, bio=None, qualifications=None, subjects=None):
        self.user = user
        self.local_admin = local_admin
        self.bio = bio
        self.qualifications = qualifications
        self.subjects = subjects
    
    def to_dict(self):
        """Convert teacher to dictionary."""
        return {
            'id': self.id,
            'user_id': self.user_id,
            'username': self.user.username if self.user else None,
            'email': self.user.email if self.user else None,
            'phone': self.user.phone if self.user else None,
            'bio': self.bio,
            'qualifications': self.qualifications,
            'subjects': self.subjects.split(',') if self.subjects else [],
            'is_active': self.is_active,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }
