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
![Screenshot (916)](https://github.com/user-attachments/assets/a6a2b714-3879-4352-b882-fe3936ddbd59)
![Screenshot (915)](https://github.com/user-attachments/assets/ead7154a-9f00-4d66-9569-bdd2da24052d)
![Screenshot (914)](https://github.com/user-attachments/assets/78e1cca4-356f-4067-83af-387b75c1e575)
![Screenshot (913)](https://github.com/user-attachments/assets/b5eed4c3-92af-4dec-a9fd-20482d84e540)
![Screenshot (912)](https://github.com/user-attachments/assets/df2b9942-2805-4c1a-b48e-cf88a630766a)
![Screenshot (911)](https://github.com/user-attachments/assets/982de1ba-f805-4edc-a3c4-974abda6fec5)
![Screenshot (910)](https://github.com/user-attachments/assets/c160460d-05f9-41cf-b6bf-bb3884ca8d3a)
![Screenshot (909)](https://github.com/user-attachments/assets/c02f85af-7e7a-4b6d-818f-4edda9f06e65)
![Screenshot (908)](https://github.com/user-attachments/assets/3b331be9-f32c-406a-b1f6-86d00f191827)
![Screenshot (907)](https://github.com/user-attachments/assets/43adc54d-f2a1-4115-90da-1614a84513ec)
![Screenshot (906)](https://github.com/user-attachments/assets/c1339d6d-46cb-407f-91a2-1093c9950ec5)
![Screenshot (905)](https://github.com/user-attachments/assets/135c1b9f-f32e-450f-89aa-e7ed435988cc)

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
