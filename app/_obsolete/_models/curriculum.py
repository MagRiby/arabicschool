from .base import db, BaseModel

class CurriculumGroup(BaseModel):
    """CurriculumGroup model for organizing curriculum items."""
    __tablename__ = 'curriculum_groups'
    
    # Core fields
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.Text, nullable=True)
    display_order = db.Column(db.Integer, default=0)
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    level_id = db.Column(db.Integer, db.ForeignKey('levels.id'), nullable=False)
    level = db.relationship('Level', back_populates='curriculum_groups')
    items = db.relationship('CurriculumItem', back_populates='group', 
                          order_by='CurriculumItem.display_order')
    
    def __init__(self, name, level_id, description=None, display_order=0):
        self.name = name
        self.level_id = level_id
        self.description = description
        self.display_order = display_order
    
    def to_dict(self, include_items=False):
        """Convert curriculum group to dictionary."""
        result = {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'display_order': self.display_order,
            'level_id': self.level_id,
            'level_name': self.level.name if self.level else None,
            'is_active': self.is_active,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }
        
        if include_items:
            result['items'] = [item.to_dict() for item in self.items]
            
        return result


class CurriculumItem(BaseModel):
    """CurriculumItem model representing individual learning items."""
    __tablename__ = 'curriculum_items'
    
    # Core fields
    name = db.Column(db.String(200), nullable=False)
    description = db.Column(db.Text, nullable=True)
    code = db.Column(db.String(50), nullable=True)  # Short code for the item
    display_order = db.Column(db.Integer, default=0)
    is_active = db.Column(db.Boolean, default=True)
    
    # Relationships
    group_id = db.Column(db.Integer, db.ForeignKey('curriculum_groups.id'), nullable=False)
    group = db.relationship('CurriculumGroup', back_populates='items')
    
    def __init__(self, name, group_id, description=None, code=None, display_order=0):
        self.name = name
        self.group_id = group_id
        self.description = description
        self.code = code
        self.display_order = display_order
    
    def to_dict(self):
        """Convert curriculum item to dictionary."""
        return {
            'id': self.id,
            'name': self.name,
            'description': self.description,
            'code': self.code,
            'display_order': self.display_order,
            'group_id': self.group_id,
            'group_name': self.group.name if self.group else None,
            'is_active': self.is_active,
            'created_at': self.created_at.isoformat() if self.created_at else None,
            'updated_at': self.updated_at.isoformat() if self.updated_at else None
        }
