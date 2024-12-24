FROM python:3.9-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir opencv-python-headless numpy open3d

# Set the working directory in the container
WORKDIR /app

# Copy video_to_images into the container
COPY video_to_images.py /app/video_to_images.py

# Execute the Python script
ENTRYPOINT ["python", "video_to_images.py"]