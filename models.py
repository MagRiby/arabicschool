import uuid
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

class SuperBadge(db.Model):
    __tablename__ = 'super_badges'
    id = db.Column(db.String(36), primary_key=True, default=lambda: str(uuid.uuid4()))
    name = db.Column(db.String(128), nullable=False)
    icon_type = db.Column(db.String(20), nullable=True)      # NEW FIELD
    icon_value = db.Column(db.Text, nullable=True)           # NEW FIELD
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
