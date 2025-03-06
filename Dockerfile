# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Install pkg-config and MySQL development headers
# Install pkg-config, gcc, and MySQL development headers
RUN apt-get update && apt-get install -y \
    pkg-config \
    gcc \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*


# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

# Specify the command to run the application
#CMD ["python", "run.py"]
CMD ["sh", "-c", "cp /app/database.yaml /app/market/database.yaml && python run.py"]