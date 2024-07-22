# Audiobook App

A full-stack audiobook application built with Django (backend) and Flutter (frontend) with MySQL as the database. This app allows users to browse, search, and review audiobooks.

## Features

- Browse and search audiobooks
- View detailed audiobook information like title,genre,author name,description,cover image and average rating 
- Add, edit, and delete reviews for audiobooks
- Add, edit, and delete audiobook information
- Filter audiobooks by genre and author name
- Sort audiobooks by rating
- Responsive design for web and mobile platforms

## Tech Stack

### Backend
- Django 3.2+
- Django REST Framework 3.12+
- MySQL 8.0+

### Frontend
- Flutter 2.5+
- Provider for state management
- http package for API requests

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed Python 3.8+
- You have installed MySQL 8.0+
- You have installed Flutter 2.5+
- You have a basic understanding of Django and Flutter

## Getting Started

To run the audiobook app locally, follow these steps:

### Clone the Repository
sh
git clone https://github.com/Peaceful-555/audiobooks_app.git
cd audiobooks_app


### Backend Setup

1. Navigate to the backend directory:
sh
cd backend


2. Create a virtual environment and activate it:
sh
python -m venv venv
source venv/bin/activate  # On Windows, use venv\Scripts\activate


3. Install the required packages:
sh
pip install -r requirements.txt


4. Set up the MySQL database:
   - Create a new MySQL database for the project
   - Update the `DATABASES` configuration in `audiobook_project/settings.py`:
     ```
python
DATABASES = {
'default': {
'ENGINE': 'django.db.backends.mysql',
'NAME': 'your_database_name',
'USER': 'your_mysql_username',
'PASSWORD': 'your_mysql_password',
'HOST': 'localhost',
'PORT': '3306',
}
}


5. Run database migrations:
sh
python manage.py makemigrations
python manage.py migrate


6. Create a superuser:
sh
python manage.py createsuperuser


7. Start the development server:
sh
python manage.py runserver


   The backend should now be running at `http://localhost:8000/api/reviews/' and `http://localhost:8000/api/audiobooks/'

### Frontend Setup

1. Navigate to the frontend directory:
sh
cd ../frontend


2. Get the Flutter packages:
sh
flutter pub get


3. Run the app:
sh
flutter run -d chrome  # For web

or
flutter run  # For mobile emulator


   The frontend should now be running at `http://localhost:52360`.

## API Endpoints

- `GET /api/audiobooks/`: List all audiobooks
- `POST /api/audiobooks/`: Create a new audiobook
- `GET /api/audiobooks/{id}/`: Retrieve a specific audiobook
- `PUT /api/audiobooks/{id}/`: Update a specific audiobook
- `DELETE /api/audiobooks/{id}/`: Delete a specific audiobook
- `GET /api/reviews/`: List all reviews
- `POST /api/reviews/`: Create a new review
- `GET /api/reviews/{id}/`: Retrieve a specific review
- `PUT /api/reviews/{id}/`: Update a specific review
- `DELETE /api/reviews/{id}/`: Delete a specific review

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## Acknowledgments

- [Django Documentation](https://docs.djangoproject.com/)
- [Django REST Framework Documentation](https://www.django-rest-framework.org/)
- [Flutter Documentation](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [MySQL Documentation](https://dev.mysql.com/doc/)

## Contact

Jay Dutonde - jaydutonde12@gmail.com
