from flask import render_template, redirect, url_for
from app import app
from werkzeug.urls import url_parse

@app.route('/')
@app.route('/index')
def index():
	return render_template('index.html')

@app.route('/projects')
def projects():
	return render_template('projects.html')

@app.route('/blog')
def blog():
	return render_template('blog.html')

@app.route('/contact')
def contact():
	return render_template('contact.html')