# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements directly to leverage Docker caching
COPY requirements.txt .

# Install required packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY query_data_gemini.py .

# Define the entrypoint command to run the script with arguments
ENTRYPOINT ["python", "query_data_gemini.py"]
