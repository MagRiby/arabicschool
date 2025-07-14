""
WSGI config for Arabic School Management System.

It exposes the WSGI callable as a module-level variable named ``application``.
"""
import os
from app import create_app

# Create application instance
application = create_app(os.environ.get('FLASK_ENV', 'development'))

if __name__ == '__main__':
    # This is used when running locally only.
    application.run(host='0.0.0.0', port=5000, debug=True)
