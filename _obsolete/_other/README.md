# Arabic School Management System

A comprehensive school management system designed for Arabic language schools to manage students, teachers, curriculum, and super badges.

## Features

- **User Management**: Multiple user roles (Admin, Teacher, Student)
- **Student Tracking**: Manage student information, attendance, and progress
- **Curriculum Management**: Organize curriculum by levels and groups
- **Super Badges**: Reward system for student achievements
- **Class Management**: Organize students into classes with assigned teachers
- **RESTful API**: Full-featured API for frontend integration

## Prerequisites

- Python 3.8+
- PostgreSQL (for production) or SQLite (for development)
- Redis (for caching and background tasks, optional)

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/arabic-school-management.git
   cd arabic-school-management
   ```

2. **Create and activate a virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

5. **Initialize the database**
   ```bash
   flask db upgrade
   ```

6. **Run the development server**
   ```bash
   flask run
   ```

## Project Structure

```
├── app/
│   ├── __init__.py         # Application factory
│   ├── config.py           # Configuration settings
│   ├── models/             # Database models
│   ├── blueprints/         # Application blueprints
│   ├── services/           # Business logic
│   └── static/             # Static files (CSS, JS, images)
├── migrations/            # Database migrations
├── tests/                  # Test files
├── .env.example           # Example environment variables
├── requirements.txt       # Project dependencies
└── wsgi.py                # WSGI entry point
```

## API Documentation

API documentation is available at `/api/docs` when running in development mode.

## Development

### Running Tests

```bash
pytest
```

### Code Style

This project uses Black for code formatting and Flake8 for linting:

```bash
black .
flake8
```

### Database Migrations

When making changes to the models, create a new migration:

```bash
flask db migrate -m "description of changes"
flask db upgrade
```

## Production Deployment

For production deployment, consider using:

- Gunicorn as the WSGI server
- Nginx as a reverse proxy
- PostgreSQL as the database
- Redis for caching and task queue
- Supervisor or systemd for process management

Example Gunicorn command:

```bash
gunicorn --bind 0.0.0.0:5000 wsgi:application
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
