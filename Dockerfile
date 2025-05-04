FROM python:3.10-slim-buster

# Set working directory
WORKDIR /src

# Install dependencies for psycopg2
RUN apt update && \
    apt install -y build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Switch to a non-root user if your app allows it (optional but recommended)
# RUN adduser --disabled-password appuser && chown -R appuser /src
# USER appuser

# Default command
CMD ["python", "app.py"]
