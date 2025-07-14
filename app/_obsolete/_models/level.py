from .base import db, BaseModel

class Level(BaseModel):
    """Level model representing different educational levels/classes."""
    __tablename__ = 'levels'
    
    # Core fields
    name = db.Column(db.String(50), nullable=False, unique=True)
    description = db.Column(db.Text, nullable=True)
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    classes = db.relationship('Class', back_populates='level')
    curriculum_groups = db.relationship('CurriculumGroup', back_populates='level')
    
    def __init__(self, name, description=None):
        self.name = name
        self.description = description
    
    def to_dict(self, include_classes=False):
        """Convert level to dictionary."""
        result = {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'is_active': self.is_active,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }
        
        if include_classes:
            result['classes'] = [{
                'id': c.id,
                'name': c.name,
                'teacher_name': c.teacher.user.full_name if c.teacher and c.teacher.user else None
            } for c in self.classes]
            
        return result
