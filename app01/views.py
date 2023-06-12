from django.shortcuts import render,HttpResponse

# Create your views here.


def index(requset):
    return HttpResponse('hello world')

def order(requset):
    return HttpResponse('order')