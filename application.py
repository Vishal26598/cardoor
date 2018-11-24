# import MySQLdb

from flask import Flask, render_template, request

# conn = MySQLdb.connect(host='localhost',user='root',password='',database='try')
# cur = conn.cursor()
from flask import Flask, render_template, request

import mysql.connector
from mysql.connector import Error
conn=''
try:
    conn = mysql.connector.connect(host='localhost',
                             database='cardoor_db',
                             user='mydb_user',
                             password='')

    if conn.is_connected():
       db_Info = conn.get_server_info()
       print("Connected to MySQL database... MySQL Server version on ",db_Info)
       cursor = conn.cursor()
       cursor.execute("select database();")
       record = cursor.fetchone()
       print ("Your connected to - ", record)
except Error as e :
    print ("Error while connecting to MySQL", e)


app = Flask(__name__)

@app.route("/", methods = ["GET","POST"])
def index():
    if request.method == "GET" :
        return render_template("index.html")
    else :
        pickupdate = request.form.get("pickupdate")
        returndate = request.form.get("returndate")
        pickuptime = request.form.get("pickuptime")
        returndate = request.form.get("returntime")
        if pickupdate is "" :
            return render_template("index.html")
        if returndate is "" :
            return render_template("index.html")
        if pickuptime is "" :
            return render_template("index.html")
        if pickuptime is "" :
            return render_template("index.html")
        return render_template("book.html")


@app.route("/signup", methods = ["GET","POST"])
def signup():
    if request.method == "GET" :
        return render_template("signup.html")
    else :
        name = request.form.get("name")
        age = request.form.get("age")
        email = request.form.get("email")
        mobile = request.form.get("mobile")
        dlno = request.form.get("dlno")
        password = request.form.get("password")

        cur.execute('INSERT INTO abcd (name, email, mobile, password) VALUES (%s, %s, %s, %s)', (name, email, mobile, password))
        conn.commit()
        return render_template("login.html")


@app.route("/login", methods = ["GET","POST"])
def login():
    if request.method == "GET" :
        return render_template("login.html")
    else :
        return render_template("index.html")


@app.route("/book")
def book():
    return render_template("book.html")









if __name__ == '__main__' :
    app.run(debug=True)
