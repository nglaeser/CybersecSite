#!/usr/bin/env python

from flask import Flask
from flask import render_template
from flask import url_for
from flask import send_from_directory
from flask import redirect

app = Flask(__name__, static_folder='static')

#Routes 
@app.route('/favicon.ico')
def favicon():
    return send_from_directory(app.static_folder, 'favicon.ico')

@app.route("/")
@app.route("/index.html")
def homePage():
    return render_template("index.html")

@app.route("/about.html")
def aboutPage():
    return render_template("about.html")

@app.route("/events.html")
def eventsPage():
    return render_template("events.html")

@app.route("/contact.html")
def contactsPage():
    return render_template("contact.html")

@app.route("/gallery.html")
def galleryPage():
    return render_template("gallery.html")

@app.route("/blog-fullwidth.html")
def getFullWidth():
    return render_template("blog-fullwidth.html")

@app.route("/blog-leftsidebar.html")
def getLeftSidebar():
    return render_template("blog-left-sidebar.html")

@app.route("/blog-right-sidebar.html")
def getRightSidebar():
    return render_template("blog-right-sidebar.html")

#TODO Server static files from nginx instead of flask
@app.route('/<path:filename>')
def send_file(filename):
    return send_from_directory(app.static_folder, filename)

#TODO Better error handling
@app.errorhandler(404)
@app.errorhandler(403)
def page_not_found(e):
    return render_template('404.html'),404


if __name__ == "__main__":
    app.run(host='0.0.0.0')
