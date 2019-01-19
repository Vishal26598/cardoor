import MySQLdb
#import mysql.connector
from datetime import datetime
from flask import Flask, render_template, request, redirect, session, url_for
# from flask_session import session


res= None
res1= None
uid= None
name = None
start = None
drop = None
c = None
basefare = None

#conn = mysql.connector.connect(host='localhost',user='root',password='tanzytia',database='cardoor',buffered=True)
conn = MySQLdb.connect(host='localhost',user='root',password='',database='cardoor')
cur = conn.cursor()


app = Flask(__name__)


@app.route("/", methods = ["GET","POST"])
def index():
    global uid
    global name
    if request.method == "GET" :
        return render_template("index.html",uid=uid, name = name)
    else :
        global pickupdate
        global returndate
        global pickuptime
        global returntime
        global start
        global drop
        global c
        pickupdate = request.form.get("pickupdate")
        returndate = request.form.get("returndate")
        pickuptime = request.form.get("pickuptime")
        returntime = request.form.get("returntime")
        pickuptime=int(pickuptime) -1
        returntime=int(returntime) -1
        start = pickupdate+"T"+str(pickuptime)+":00:00Z"
        drop = returndate+"T"+str(returntime)+":00:00Z"
        a = datetime.strptime(start, '%m/%d/%YT%H:%M:%SZ')
        b = datetime.strptime(drop, '%m/%d/%YT%H:%M:%SZ')
        c = b-a
        c= c.total_seconds() / 3600
        cur.execute('call avail()')
        result = cur.fetchall()
        return render_template("book.html", result = result)



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
        cur.execute('INSERT INTO customer (name, email, mobile, password, age, dlno) VALUES (%s, %s, %s, %s, %s, %s)', (name, email, mobile, password, age, dlno))
        conn.commit()
        return render_template("login.html")



@app.route("/login", methods = ["GET","POST"])
def login():
    global uid
    global name
    if request.method == "GET" :
        return render_template("login.html")
    else :
        email=request.form.get("email")
        pwd=request.form.get("pwd")
        cur.execute("Select uid,name from customer where email=%s and password=%s", (email, pwd))
        conn.commit()
        user=cur.fetchall()
        if user == () :
            uid = None
            name = None
        else :
            uid = user[0][0]
            name = user[0][1]
        if uid is None:
            return render_template("login.html")
        else:
            return render_template("index.html",uid=uid,name=name)



@app.route("/logout")
def logout():
    global uid
    global name
    uid = None
    name = None
    return render_template("index.html",uid=uid, name = name)



@app.route("/custinfo")
def info():
    global uid
    global name
    cur.execute("select * from customer where uid=%s",(uid, ))
    conn.commit()
    cus=cur.fetchall()
    cur.execute("select b.bid, b.`vehicle no`, v.`name of car`, b.`booking date/time` from vdetails v,booking b where b.cid=v.cid and b.uid = %s",(uid, ))
    conn.commit()
    car=cur.fetchall()
    print(car)
    return render_template("customer.html",cus=cus,book=car,name =name)



@app.route("/book", methods = ["POST"])
def book():
    global res
    global basefare
    res = request.form.get("btn1")
    cur.execute("select `name of car`,`rate/hour` from vdetails where cid=%s limit 1", (res, ))
    conn.commit()
    global res1
    res1=cur.fetchall()
    basefare = int(res1[0][1])*int(c)
    return render_template("payment.html",res1=res1, total = int(basefare + 0.18*basefare))



@app.route("/payment")
def payment():
    if uid is None :
        return render_template("loginfirst.html")
    dt=datetime.now()
    cur.execute("select `vehicle no` from v_no where cid=%s and status=0 limit 1", (res, ))
    conn.commit()
    res2=cur.fetchall()
    cur.execute("update vdetails set avaialbility=avaialbility-1 where cid=%s", (res, ))
    conn.commit()
    cur.execute("update v_no set status=1 where `vehicle no`=%s ",(res2[0][0], ))
    conn.commit()
    x=res2[0][0]
    cur.callproc('booking', [res, x, uid, dt, pickupdate, returndate, pickuptime, returntime, basefare])
    return render_template("index.html",uid = uid, name=name)







if __name__ == '__main__' :
    app.run(debug=True)
