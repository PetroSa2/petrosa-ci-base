FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    make \
    git \
    curl \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip
RUN pip install --upgrade pip

# Install common CI/CD tools
RUN pip install \
    ruff==0.1.15 \
    mypy==1.8.0 \
    pytest==7.4.4 \
    pytest-asyncio==0.23.5 \
    pytest-cov==4.1.0 \
    bandit==1.7.10 \
    pre-commit==4.1.0 \
    black==26.3.1 \
    isort==6.0.1 \
    flake8==7.0.0

# Install common Petrosa libraries to speed up CI
RUN pip install \
    pydantic==2.12.4 \
    pydantic-settings==2.12.0 \
    nats-py==2.12.0 \
    motor==3.7.1 \
    fastapi==0.115.11 \
    httpx==0.28.1 \
    structlog==25.5.0 \
    python-dotenv==1.2.1

# Set working directory
WORKDIR /app

CMD ["/bin/bash"]
