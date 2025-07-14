from .base import db, BaseModel

class Class(BaseModel):
    """Class model representing a class/group of students."""
    __tablename__ = 'classes'
    
    # Core fields
    name = db.Column(db.String(100), nullable=False)
    academic_year = db.Column(db.String(20), nullable=True)  # e.g., "2023-2024"
    description = db.Column(db.Text, nullable=True)
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    level_id = db.Column(db.Integer, db.ForeignKey('levels.id'), nullable=False)
    level = db.relationship('Level', back_populates='classes')

    teacher_id = db.Column(db.Integer, db.ForeignKey('teachers.id'), nullable=True)
    teacher = db.relationship('Teacher', foreign_keys=[teacher_id], back_populates='classes')

    backup_teacher_id = db.Column(db.Integer, db.ForeignKey('teachers.id'), nullable=True)
    backup_teacher = db.relationship('Teacher', foreign_keys=[backup_teacher_id], backref='backup_classes')

    students = db.relationship('Student', back_populates='student_class')
    
    def __init__(self, name, level_id, teacher_id=None, academic_year=None, description=None):
        self.name = name
        self.level_id = level_id
        self.teacher_id = teacher_id
        self.academic_year = academic_year
        self.description = description
    
    def to_dict(self, include_students=False, include_teacher=False, include_level=False):
        print(f"[GENERIC DEBUG] Class.to_dict called for class id={self.id}, name={self.name}")
        """Convert class to dictionary."""
        result = {
            'id': self.id,
            'name': self.name,
            'academic_year': self.academic_year,
            'description': self.description,
            'is_active': self.is_active,
            'level_id': self.level_id,
            'teacher_id': self.teacher_id,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }

        print(f"[DEBUG] Class {self.id}: teacher_id={self.teacher_id}, backup_teacher_id={self.backup_teacher_id}")
        if include_teacher:
            if self.teacher:
                print(f"[DEBUG]   teacher found: Teacher.id={self.teacher.id}, user_id={self.teacher.user_id}")
                if self.teacher.user:
                    print(f"[DEBUG]     teacher user: {self.teacher.user.username}")
                else:
                    print(f"[DEBUG]     teacher user: None")
            else:
                print(f"[DEBUG]   teacher NOT found")

            if self.backup_teacher:
                print(f"[DEBUG]   backup_teacher found: Teacher.id={self.backup_teacher.id}, user_id={self.backup_teacher.user_id}")
                if self.backup_teacher.user:
                    print(f"[DEBUG]     backup_teacher user: {self.backup_teacher.user.username}")
                else:
                    print(f"[DEBUG]     backup_teacher user: None")
            else:
                print(f"[DEBUG]   backup_teacher NOT found")

        if include_students:
            result['students'] = [{
                'id': s.id,
                'name': s.full_name,
                'is_active': s.is_active
            } for s in self.students]

        if include_teacher and self.teacher and self.teacher.user:
            result['teacher_name'] = f"{self.teacher.user.first_name} {self.teacher.user.last_name}"
        else:
            result['teacher_name'] = None

        if include_teacher and self.backup_teacher and self.backup_teacher.user:
            result['backup_teacher_name'] = f"{self.backup_teacher.user.first_name} {self.backup_teacher.user.last_name}"
        else:
            result['backup_teacher_name'] = None

        if include_level and self.level:
            result['level_name'] = self.level.name

        return result
