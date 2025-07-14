"""
Development environment setup script for Arabic School Management System.
"""
import os
import sys
import subprocess
from pathlib import Path

def run_command(command, cwd=None):
    """Run a shell command and return the output."""
    print(f"Running: {command}")
    try:
        result = subprocess.run(
            command,
            shell=True,
            check=True,
            cwd=cwd or os.getcwd(),
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
        )
        if result.stdout:
            print(result.stdout)
        return True
    except subprocess.CalledProcessError as e:
        print(f"Error running command: {command}")
        print(f"Exit code: {e.returncode}")
        if e.stdout:
            print("Stdout:", e.stdout)
        if e.stderr:
            print("Stderr:", e.stderr)
        return False

def create_virtualenv():
    """Create a Python virtual environment if it doesn't exist."""
    venv_dir = Path('venv')
    if not venv_dir.exists():
        print("\nCreating virtual environment...")
        if not run_command('python -m venv venv'):
            print("Failed to create virtual environment.")
            return False
    return True

def activate_virtualenv():
    """Activate the virtual environment."""
    if os.name == 'nt':  # Windows
        activate_script = 'venv\\Scripts\\activate.bat'
        activate_cmd = f'call {activate_script}'
    else:  # Unix/Linux/MacOS
        activate_script = 'venv/bin/activate'
        activate_cmd = f'source {activate_script}'
    
    if not os.path.exists(activate_script):
        print(f"Virtual environment activation script not found at {activate_script}")
        return False
    
    print(f"\nTo activate the virtual environment, run:")
    print(f"  {activate_cmd}")
    return True

def install_dependencies():
    """Install Python dependencies."""
    print("\nInstalling dependencies...")
    if not run_command('pip install -r requirements.txt'):
        print("Failed to install dependencies.")
        return False
    return True

def setup_database():
    """Set up the database."""
    print("\nSetting up database...")
    
    # Create instance directory if it doesn't exist
    instance_dir = Path('instance')
    instance_dir.mkdir(exist_ok=True)
    
    # Create .env file if it doesn't exist
    env_file = Path('.env')
    if not env_file.exists():
        print("Creating .env file from .env.example...")
        with open('.env.example', 'r') as src, open('.env', 'w') as dst:
            dst.write(src.read())
    
    # Initialize migrations if needed
    migrations_dir = Path('migrations')
    if not migrations_dir.exists():
        print("Initializing database migrations...")
        if not run_command('python init_migrations.py'):
            print("Failed to initialize migrations.")
            return False
    
    # Run migrations
    print("Running database migrations...")
    if not run_command('python migrate_db.py'):
        print("Failed to run migrations.")
        return False
    
    return True

def main():
    """Main setup function."""
    print("=== Arabic School Management System Development Setup ===")
    
    # Create and activate virtual environment
    if not create_virtualenv():
        sys.exit(1)
    
    # Install dependencies
    if not install_dependencies():
        sys.exit(1)
    
    # Set up database
    if not setup_database():
        print("\nDatabase setup encountered issues. Please check the output above.")
    
    # Show activation instructions
    if not activate_virtualenv():
        sys.exit(1)
    
    print("\n✓ Setup completed successfully!")
    print("\nTo start the development server, run:")
    print("  python run.py")
    print("\nThen open http://localhost:5000 in your browser.")

if __name__ == '__main__':
    main()
