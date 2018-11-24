import MySQLdb
import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

conn = MySQLdb.connect(host='localhost',user='root',passwd='',)
cursor = conn.cursor()
#cursor.execute('Create database try')
cursor.execute('use try')
#cursor.execute('Create table abcd(name varchar(50), email varchar(50), mobile int, password varchar(50))')
name = "qwerty"
email = "abc@abc.com"
mobile = "9999999"
mobile=int(mobile)
password = "qwerty12"
cursor.execute('INSERT INTO abcd (name, email, mobile) VALUES (%s, %s, %s)', (name, email, mobile))
conn.commit()
print(cursor.rowcount, "was inserted.")
