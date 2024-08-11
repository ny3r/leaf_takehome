FROM python:3.11-slim

# Install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       curl \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry and set up the project
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"
RUN poetry config virtualenvs.create false
WORKDIR /code
COPY pyproject.toml poetry.lock /code/

# Install Poetry without Dev
RUN poetry install --no-dev

# Copy the application code into the container
COPY /weather_app/app.py /code/weather_app/app.py

# Expose the application port
EXPOSE 80

# Command to run the application
CMD ["poetry", "run", "python3", "weather_app/app.py"]