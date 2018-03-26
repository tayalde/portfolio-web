from flask import render_template, redirect, url_for
from app import app
from werkzeug.urls import url_parse

@app.route('/')
@app.route('/index')
def index():
	return render_template('index.html')