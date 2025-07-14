from werkzeug.security import generate_password_hash, check_password_hash
from .base import db, BaseModel
from datetime import datetime

class User(BaseModel):
    """User model for authentication and authorization."""
    __tablename__ = 'users'
    
    # Core fields
    username = db.Column(db.String(80), unique=True, nullable=False)
    password_hash = db.Column(db.String(128), nullable=False)
    role = db.Column(db.String(20), nullable=False)  # super_admin, local_admin, teacher, student
    email = db.Column(db.String(120), unique=True, nullable=True)
    phone = db.Column(db.String(20), nullable=True)
    is_active = db.Column(db.Boolean, default=True)
    last_login = db.Column(db.DateTime, nullable=True)
    
    # Relationships
    created_by_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=True)
    created_by = db.relationship('User', remote_side='User.id', backref='created_users')
    
    # Teacher-specific relationship (if user is a teacher)
    teacher_profile = db.relationship('Teacher', back_populates='user', uselist=False)
    
    def __init__(self, username, password, role, email=None, phone=None, created_by=None):
        self.username = username
        self.set_password(password)
        self.role = role
        self.email = email
        self.phone = phone
        self.created_by = created_by
    
    def set_password(self, password):
        """Create hashed password."""
        self.password_hash = generate_password_hash(password)
    
    def check_password(self, password):
        """Check hashed password."""
        return check_password_hash(self.password_hash, password)
    
    def update_last_login(self):
        """Update the last login timestamp."""
        self.last_login = datetime.utcnow()
        db.session.commit()
    
    def has_role(self, role):
        """Check if user has the specified role."""
        return self.role == role
    
    def is_admin(self):
        """Check if user is an admin (super or local)."""
        return self.role in ['super_admin', 'local_admin']
    
    def is_teacher(self):
        """Check if user is a teacher."""
        return self.role == 'teacher'
    
    def is_student(self):
        """Check if user is a student."""
        return self.role == 'student'
    
    def to_dict(self):
        """Convert user to dictionary."""
        return {
            'id': self.id,
            'username': self.username,
            'role': self.role,
            'email': self.email,
            'phone': self.phone,
            'is_active': self.is_active,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'last_login': self.last_login.isoformat() if self.last_login else None
        }
