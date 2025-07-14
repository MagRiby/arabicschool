from sqlalchemy import Column, Integer, String, Text, DateTime, ForeignKey
from sqlalchemy.orm import relationship
from app.models import db

class Event(db.Model):
    __tablename__ = 'events'
    id = Column(Integer, primary_key=True)
    class_id = Column(Integer, ForeignKey('classes.id'), nullable=False)
    title = Column(String(255), nullable=False)
    description = Column(Text)
    start = Column(DateTime, nullable=False)
    end = Column(DateTime)
    color = Column(String(20))
    recurrence = Column(String(20))  # none, weekly, monthly

    # Relationship to class (if needed)
    class_ = relationship('Class', back_populates='events', lazy='joined')

    def to_dict(self):
        return {
            'id': self.id,
            'class_id': self.class_id,
            'title': self.title,
            'description': self.description,
            'start': self.start.isoformat() if self.start else None,
            'end': self.end.isoformat() if self.end else None,
            'color': self.color,
            'recurrence': self.recurrence
        }
