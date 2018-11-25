import MySQLdb
# import mysql.connector
from datetime import datetime

from flask import Flask, render_template, request, redirect
res=''
res1=''
uid=None
# conn = mysql.connector.connect(host='localhost',user='root',password='',database='cardoor')
conn = MySQLdb.connect(host='localhost',user='root',password='',database='cardoor')
cur = conn.cursor()

app = Flask(__name__)

@app.route("/", methods = ["GET","POST"])
def index():
    if request.method == "GET" :
        return render_template("index.html",uid=uid)
    else :
        global pickupdate
        global returndate
        global pickuptime
        global returntime
        pickupdate = request.form.get("pickupdate")
        returndate = request.form.get("returndate")
        pickuptime = request.form.get("pickuptime")
        returntime = request.form.get("returntime")
        print(pickupdate,returndate,pickuptime,returntime)
        cur.execute('select cid, avaialbility from vdetails')
        conn.commit()
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
    if request.method == "GET" :
        return render_template("login.html")
    else :
        email=request.form.get("email")
        pwd=request.form.get("pwd")
        cur.execute("Select uid,name from customer where exists (select email,password from customer where email=%s and password=%s)",(email,pwd))
        conn.commit()
        global uid
        user=cur.fetchall()
        uid=user[0][0]
        if uid is None:
            return render_template("login.html")
        else:
            return render_template("index.html",uid=uid,name=user[0][1])    

@app.route("/logout")
def logout():
    uid=None
    return render_template("index.html",uid=uid)

@app.route("/custinfo")
def info():
    cur.execute("select * from customer where uid=%s",(uid, ))
    conn.commit()
    cus=cur.fetchall()
    # cur.execute("select * from booking where uid=%s",uid)
    # conn.commit()
    # book=cur.fetchall()
    # print(cus,book)
    cur.execute("select * from vdetails v,booking b where b.cid in (select cid from booking where uid=%s)",(uid, ))
    conn.commit()
    car=cur.fetchall()
    print(car)
    return render_template("customer.html",cus=cus,book=car)






@app.route("/book", methods = ["POST"])
def book():
    global res
    res = request.form.get("btn1")

    cur.execute("select `name of car`,`rate/hour` from vdetails where cid=%s limit 1", res)
    conn.commit()
    global res1
    res1=cur.fetchall()
    #print(res[0][0],res[0][1])
    return render_template("payment.html",res1=res1)

@app.route("/payment")
def payment():
    dt=datetime.now()
    print(res)
    cur.execute("select `vehicle no` from v_no where cid=%s and status=0 limit 1", (res, ))
    conn.commit()
    res2=cur.fetchall()
    print(res2)
    # # print("hello3")
    # print(res1)
    cur.execute("update vdetails set avaialbility=avaialbility-1 where cid=%s", (res, ))
    # print("hello4")
    conn.commit()
    cur.execute("update v_no set status=1 where `vehicle no`=%s ",(res2[0][0], ))
    conn.commit()
    x=res2[0][0]
    cur.execute("insert into booking (cid, `vehicle no`, uid, `booking date/time`, `pickup date`, `drop date`, `pickup time`, `drop time`) values (%s, %s, %s, %s, %s, %s, %s, %s)", (res, x, uid, dt, pickupdate, returndate, pickuptime, returntime ))
    conn.commit()
    return render_template("index.html")









if __name__ == '__main__' :
    app.run(debug=True)
