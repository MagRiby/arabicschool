""
Database migration script for Arabic School Management System.
This script helps migrate an existing database to the new schema.
"""
import os
import sys
from flask import Flask
from flask_migrate import upgrade as upgrade_database

# Add the project root to the Python path
project_root = os.path.abspath(os.path.dirname(__file__))
sys.path.insert(0, project_root)

def create_app():
    ""
    Create a Flask application for database migrations.
    
    This is a minimal app configuration that only includes what's needed for migrations.
    """
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

def backup_database(db_path):
    """Create a backup of the database file."""
    import shutil
    import time
    
    backup_path = f"{db_path}.backup_{int(time.time())}"
    print(f"Creating database backup at: {backup_path}")
    shutil.copy2(db_path, backup_path)
    return backup_path

def check_database_connection(app):
    """Check if we can connect to the database."""
    with app.app_context():
        try:
            # Try to execute a simple query
            result = app.db.engine.execute('SELECT 1')
            result.close()
            print("✓ Database connection successful")
            return True
        except Exception as e:
            print(f"✗ Database connection failed: {e}")
            return False

def main():
    """Main migration function."""
    print("=== Arabic School Management System Database Migration ===")
    print("This script will help migrate your existing database to the new schema.")
    
    # Create the Flask app
    app = create_app()
    
    # Check database connection
    if not check_database_connection(app):
        print("\nPlease check your database configuration and try again.")
        sys.exit(1)
    
    # Get the database path
    db_uri = app.config['SQLALCHEMY_DATABASE_URI']
    if db_uri.startswith('sqlite:///'):
        db_path = os.path.abspath(db_uri[10:])
        print(f"\nDatabase path: {db_path}")
        
        # Create a backup
        if os.path.exists(db_path):
            backup_path = backup_database(db_path)
            print(f"✓ Database backup created at: {backup_path}")
    
    # Run migrations
    print("\nRunning database migrations...")
    with app.app_context():
        try:
            upgrade_database()
            print("✓ Database migrations completed successfully")
        except Exception as e:
            print(f"✗ Error running migrations: {e}")
            print("\nIf you encounter any issues, please restore from the backup")
            if 'backup_path' in locals():
                print(f"Backup location: {backup_path}")
            sys.exit(1)
    
    print("\nMigration completed successfully!")

if __name__ == '__main__':
    main()
