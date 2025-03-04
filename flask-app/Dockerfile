# ------------------- Stage 1: Build Stage ------------------------------
    FROM python:3.9 AS builder

    WORKDIR /app
    
    # Install build dependencies
    RUN apt-get update && \
        apt-get install -y --no-install-recommends gcc default-libmysqlclient-dev pkg-config && \
        rm -rf /var/lib/apt/lists/*
    
    # Copy and install Python dependencies
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt
    
    # ------------------- Stage 2: Final Stage ------------------------------
    FROM python:3.9-slim
    
    WORKDIR /app
    
    # Install runtime dependencies (MariaDB client libraries)
    RUN apt-get update && \
        apt-get install -y --no-install-recommends libmariadb3 && \
        rm -rf /var/lib/apt/lists/*
    
    # Copy dependencies and application code from the builder stage
    COPY --from=builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/
    
    # Copy the rest of the app code
    COPY . .
    
    # Expose port for the Flask app
    EXPOSE 5000
    
    # Run the Flask app
    CMD ["python", "app.py"]
    