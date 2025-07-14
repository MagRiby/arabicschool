# Flask environment variables
FLASK_APP=wsgi.py
FLASK_ENV=development
FLASK_DEBUG=1

# Database
DATABASE_URL=sqlite:///instance/arabic_school.db

# Enable debug toolbar (if installed)
DEBUG_TOOLBAR_ENABLED=True

# Disable SSL for development
OAUTHLIB_INSECURE_TRANSPORT=1

# Disable SSL verification for development
PYTHONHTTPSVERIFY=0
