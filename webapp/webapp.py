#!/usr/bin/env python

from flask import Flask
from flask import render_template
from flask import send_from_directory
from flask import redirect
from flask import request
from flask_mail import Mail
from flask_mail import Message


app = Flask(__name__, static_folder='static')
app.config.update(MAIL_SERVER='mailhandler')
mail = Mail(app)

#Routes
@app.route('/favicon.ico')
def favicon():
    return send_from_directory(app.static_folder, 'favicon.ico')

@app.route("/")
@app.route("/index.html")
def homePage():
    return render_template("index.html")

def badForm():
    # TODO: show an error message
    # Stuff should only get here if people mess with client-side JS
    return redirect('/contact.html')

@app.route("/contact.html", methods=['GET','POST'])
def sendMail():
    if request.method == 'POST':
        subject = "Sent by {} through the Cyber Securtiy Website Contact Page".format(request.form.get('name').strip())
        sender = request.form.get('email').strip() 
        message = request.form.get('message')
        msg = Message(sender=sender,
                recipients=["hcnorris@email.sc.edu"],
                body = message,
                subject = subject)
        mail.send(msg)
        # TODO: have a mail_success page
        return redirect('index.html')

    else:
        return render_template("contact.html")

@app.route("/about.html")
def aboutPage():
    return render_template("about.html")

@app.route("/events.html")
def eventsPage():
    return render_template("events.html")

@app.route("/links.html")
def galleryPage():
    return render_template("links.html")

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
    app.run(threaded=True,host='0.0.0.0')

