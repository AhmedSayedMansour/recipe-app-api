FROM python:3.7-alpine

ENV PYTHONUNBUFFERED 1

#install all reqirements
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# make dir contains the project in the image 
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# security --> so no one have an access to the ROOT image using the ROOT account
RUN adduser -D user
USER user

