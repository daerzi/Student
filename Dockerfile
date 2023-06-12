FROM python:3.6
MAINTAINER lqz
EXPOSE 8080
ADD ./requirement.txt /home/
RUN pip install -r /home/requirement.txt -i https://pypi.douban.com/simple/
RUN pip install uwsgi -i https://pypi.douban.com/simple/
VOLUME ["/home"]
WORKDIR /home/django_test
CMD ["python", "/home/django_test/manage.py", "runserver","0.0.0.0:8080"]