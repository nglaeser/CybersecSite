FROM python:3.4-alpine
ADD . /WebApp
WORKDIR /WebApp
RUN pip install -r requirements.txt
CMD ["python", "app.py"]
