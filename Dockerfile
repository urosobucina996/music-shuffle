FROM python:3.6

# Install system dependencies
# Clear cache

RUN apt-get update && apt-get install -y --no-install-recommends \
        python3-setuptools \
        python3-pip \
        python3-dev \
        python3-venv \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#COPY ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /app
COPY ./app /app
WORKDIR /app

#to run user must not be ROOT security reason
RUN adduser -D user

USER user