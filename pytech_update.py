import pymongo
from pymongo import MongoClient 
url = "mongodb+srv://admin:admin@cluster0.hnv8p.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
collection = db.students


firstDisplay = "-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --"
secondDisplay ="-- DISPLAYING STUDENTS DOCUMENTS 1007 -- "
print(firstDisplay)


users = collection.find()
for user in users:
    print(user,'\n')

collectionUpdate = collection.update_one({"student_id": "1007"}, {"$set":{"last_name": "Sawadogo"}})

print (secondDisplay)
print(collection.find_one({"student_id": "1007"}))

