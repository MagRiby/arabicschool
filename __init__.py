import os
from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS
from flask_mail import Mail
from flask_caching import Cache
from werkzeug.middleware.proxy_fix import ProxyFix
from app.config import config

# Initialize extensions
db = SQLAlchemy()
migrate = Migrate()
mail = Mail()
cache = Cache()

def create_app(config_name=None):
    """Application factory function."""
    app = Flask(__name__)
    
    # Load configuration
    if config_name is None:
        config_name = os.environ.get('FLASK_ENV', 'development')
    
    app.config.from_object(config[config_name])
    
    # Initialize extensions
    db.init_app(app)
    
    # Initialize Flask-Migrate with the app and db
    migrate.init_app(app, db, render_as_batch=True)  # render_as_batch helps with SQLite migrations
    mail.init_app(app)
    cache.init_app(app)
    
    # Enable CORS if needed
    CORS(app, resources={r"/api/*": {"origins": "*"}})
    
    # Handle proxy headers if behind a reverse proxy
    app.wsgi_app = ProxyFix(app.wsgi_app, x_proto=1, x_host=1)
    
    # Register blueprints
 #   from .blueprints import auth, students, super_badges
 #   app.register_blueprint(auth.bp)
 #   app.register_blueprint(students.bp)
 #   app.register_blueprint(super_badges.bp)
    
    # Register error handlers
    @app.errorhandler(404)
    def not_found_error(error):
        return "Page not found", 404
    
    @app.errorhandler(500)
    def internal_error(error):
        db.session.rollback()
        return "An internal error occurred", 500
    
    return app
