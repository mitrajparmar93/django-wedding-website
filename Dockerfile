# Use an official Python runtime as a parent image
FROM python:3.10.11-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# ENV RUNNING_IN_DOCKER 1

# Set work directory
RUN ["mkdir", "-p", "/code"]
WORKDIR /code

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev

# Install Python dependencies
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . /code/

# Collect static files
RUN cd /code/
RUN python mrpxalewedding/manage.py collectstatic --noinput
# Expose port
EXPOSE 8000

# Run the application:
# CMD ["gunicorn", "bigday.wsgi:application", "-b", "0.0.0.0:8000"]
CMD python mrpxalewedding/manage.py migrate && python mrpxalewedding/manage.py runserver 0.0.0.0:8000