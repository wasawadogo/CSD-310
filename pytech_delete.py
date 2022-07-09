#required Python code to connect to the students collection
import pymongo
from pymongo import MongoClient 
url = "mongodb+srv://admin:admin@cluster0.hnv8p.mongodb.net/?retryWrites=true&w=majority"
client = MongoClient(url)
db = client.pytech
collection = db.students
#Formating
firstDisplay = "-- DISPLAYING STUDENTS DOCUMENTS FROM find() QUERY --"
secondDisplay ="-- DISPLAYING STUDENTS DOCUMENTS 1007 -- "
insert1 = "-- INSERT STATEMENTS --"
insert2 = "Inserted student record into the student collection with document_id"
testDoc = "-- DISPLAY TEST DOC--"

# find() method and display the results to the terminal window
print(firstDisplay)
users = collection.find()
for user in users:
    print(user,'\n')
#insert_one() method and Insert a new document into the pytech collection with student_id 1010.
print(insert1)
student = [
    {
        "student_id": "1010",
        "first_name": "John",
        "last_name": "Doe"        
    }
]
for stud in student:
    new_student_id = collection.insert_one(stud).inserted_id
    print(insert2, new_student_id, '\n')
    print(collection.find_one({"student_id": "1010"})), '\n'

#the delete_one() method by student_id 1010
users = collection.delete_one({"student_id": "1010"})

#the find() method and display the results to the terminal window.
print(firstDisplay)
users = collection.find()
for user in users:
    print(user,'\n')
