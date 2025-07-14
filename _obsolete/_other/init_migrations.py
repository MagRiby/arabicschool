""
Initialize database migrations for Arabic School Management System.
"""
import os
import sys
from flask import Flask
from flask_migrate import init as init_migrations, migrate, upgrade

def create_app():
    """Create a minimal Flask app for migrations."""
    app = Flask(__name__)
    
    # Load configuration
    config_name = os.environ.get('FLASK_ENV', 'development')
    app.config.from_object(f'config.{config_name.capitalize()}Config')
    
    # Initialize SQLAlchemy
    from app import db
    db.init_app(app)
    
    # Initialize Flask-Migrate
    from flask_migrate import Migrate
    migrate = Migrate(app, db, render_as_batch=True)
    
    return app

def main():
    """Initialize migrations directory and create initial migration."""
    print("=== Initializing Database Migrations ===")
    
    # Create the Flask app
    app = create_app()
    
    # Ensure migrations directory exists
    migrations_dir = os.path.join('migrations')
    if not os.path.exists(migrations_dir):
        os.makedirs(migrations_dir)
    
    # Check if migrations directory is already initialized
    if os.path.exists(os.path.join(migrations_dir, 'env.py')):
        print("\nMigrations directory is already initialized.")
        print("If you want to reinitialize, please delete the 'migrations' directory first.")
        return
    
    # Initialize migrations
    with app.app_context():
        print("\nInitializing migrations directory...")
        init_migrations(directory=migrations_dir)
        
        print("\nCreating initial migration...")
        migrate(message='Initial migration', directory=migrations_dir)
        
        print("\n✓ Migration files created successfully!")
        print("\nNext steps:")
        print("1. Review the migration script in 'migrations/versions/'")
        print("2. Run 'python migrate_db.py' to apply the migrations to your database")

if __name__ == '__main__':
    main()
