FROM ubuntu

RUN apt-get update && apt-get install -y python 

RUN pip install flask flask-mysql

COPY . /opt/source-code

ENTRYPOINT FLASK_APP=/opt/source-code/app.py flash run 
