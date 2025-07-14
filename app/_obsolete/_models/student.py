from .base import db, BaseModel

class Student(BaseModel):
    """Student model for managing student information."""
    __tablename__ = 'students'
    
    # Core fields
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=True, unique=True)
    first_name = db.Column(db.String(50), nullable=False)
    last_name = db.Column(db.String(50), nullable=False)
    date_of_birth = db.Column(db.Date, nullable=True)
    gender = db.Column(db.String(10), nullable=True)  # 'male', 'female', 'other'
    address = db.Column(db.Text, nullable=True)
    parent_name = db.Column(db.String(100), nullable=True)
    parent_phone = db.Column(db.String(20), nullable=True)
    parent_email = db.Column(db.String(120), nullable=True)
    notes = db.Column(db.Text, nullable=True)
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    class_id = db.Column(db.Integer, db.ForeignKey('classes.id'), nullable=True)
    student_class = db.relationship('Class', back_populates='students')
    
    # Super badges relationship
    super_badges = db.relationship('StudentSuperBadge', back_populates='student')
    
    def __init__(self, first_name, last_name, class_id=None, date_of_birth=None, 
                 gender=None, address=None, parent_name=None, parent_phone=None, 
                 parent_email=None, notes=None, user_id=None):
        self.user_id = user_id
        self.first_name = first_name
        self.last_name = last_name
        self.class_id = class_id
        self.date_of_birth = date_of_birth
        self.gender = gender
        self.address = address
        self.parent_name = parent_name
        self.parent_phone = parent_phone
        self.parent_email = parent_email
        self.notes = notes
    
    @property
    def full_name(self):
        """Get the full name of the student."""
        return f"{self.first_name} {self.last_name}"
    
    def to_dict(self, include_class=False):
        """Convert student to dictionary."""
        result = {
            'id': self.id,
            'user_id': self.user_id,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'full_name': self.full_name,
            'date_of_birth': self.date_of_birth.isoformat() if self.date_of_birth else None,
            'gender': self.gender,
            'address': self.address,
            'parent_name': self.parent_name,
            'parent_phone': self.parent_phone,
            'parent_email': self.parent_email,
            'notes': self.notes,
            'is_active': self.is_active,
            'class_id': self.class_id,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }
        
        if include_class and self.student_class:
            result['class_name'] = self.student_class.name
            
        return result
