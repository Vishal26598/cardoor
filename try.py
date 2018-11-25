import MySQLdb
# import os

from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

conn = MySQLdb.connect(host='localhost',user='root',passwd='', database='cardoor')
cur = conn.cursor()
#cursor.execute('Create database try')
# cur.execute('insert into vdetails(`name of car`, `rate/hour`, avaialbility) values ("i30", 20, 0);')
cur.execute('select cid, avaialbility from vdetails where avaialbility > 0;')

conn.commit()
result = cur.fetchall()

print(cur.rowcount)
print(result[0][0])
