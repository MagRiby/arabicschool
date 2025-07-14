#!/usr/bin/env python3
"""
Run the Arabic School Management System in development mode.
"""
import os
import sys
from app import create_app

# Create the application
app = create_app()

if __name__ == '__main__':
    # Check if we're running in a development environment
    if app.config.get('ENV') == 'production':
        print("WARNING: This is a development server. Do not use in production!")
        print("Use a production WSGI server like Gunicorn or uWSGI instead.")
        print("Example: gunicorn --bind 0.0.0.0:5000 wsgi:application")
        print("\nStarting development server anyway...\n")
    
    # Run the development server
    app.run(host='0.0.0.0', port=5000, debug=True)
