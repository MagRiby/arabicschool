#!/usr/bin/env python3
"""
Create an admin user for the Arabic School Management System.
"""
import os
import sys
import getpass
from app import create_app, db
from app.models.user import User

def create_admin_user():
    """Create an admin user interactively."""
    print("=== Create Admin User ===")
    print("Please provide the following information to create an admin user.\n")
    
    # Get user input
    while True:
        username = input("Username: ").strip()
        if username:
            break
        print("Username cannot be empty. Please try again.")
    
    while True:
        email = input("Email: ").strip()
        if '@' in email and '.' in email.split('@')[1]:
            break
        print("Please enter a valid email address.")
    
    while True:
        first_name = input("First name: ").strip()
        if first_name:
            break
        print("First name cannot be empty. Please try again.")
    
    while True:
        last_name = input("Last name: ").strip()
        if last_name:
            break
        print("Last name cannot be empty. Please try again.")
    
    while True:
        password = getpass.getpass("Password: ")
        if len(password) >= 8:
            confirm_password = getpass.getpass("Confirm password: ")
            if password == confirm_password:
                break
            print("Passwords do not match. Please try again.")
        else:
            print("Password must be at least 8 characters long.")
    
    # Create the user
    try:
        user = User(
            username=username,
            email=email,
            first_name=first_name,
            last_name=last_name,
            role='admin',
            is_active=True
        )
        user.set_password(password)
        
        db.session.add(user)
        db.session.commit()
        
        print("\n✓ Admin user created successfully!")
        print(f"Username: {username}")
        print(f"Email: {email}")
        print("\nYou can now log in with these credentials.")
        
    except Exception as e:
        db.session.rollback()
        print(f"\n✗ Error creating admin user: {e}")
        print("Please check the error message above and try again.")
        sys.exit(1)

def main():
    """Main function."""
    # Create the Flask app
    app = create_app()
    
    # Create database tables if they don't exist
    with app.app_context():
        # Check if there are any admin users
        admin_exists = User.query.filter_by(role='admin').first() is not None
        
        if admin_exists:
            print("An admin user already exists in the database.")
            response = input("Do you want to create another admin user? (y/n): ").strip().lower()
            if response != 'y':
                print("Exiting without creating a new admin user.")
                return
        
        # Create a new admin user
        create_admin_user()

if __name__ == '__main__':
    main()
