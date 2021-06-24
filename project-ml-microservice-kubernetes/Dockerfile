FROM python:3.7.10

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY requirements ./requirements

# hadolint ignore=DL3013
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]

