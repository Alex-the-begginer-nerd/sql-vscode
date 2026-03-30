import csv
import os

print("Dont manually change the csv file")

folder_path = os.path.dirname(__file__) 

# Full path to CSV.
csv_file = os.path.join(folder_path, "Study_progress.csv")

file_size = 0
if os.path.exists(csv_file):
    file_size = os.path.getsize(csv_file)

#DATA_COLLECTION
Sub_inp = input("Subject: ") 
Dur_inp = input("Duration: ")
Theme_inp = input("Theme: ")
Mark_inp = input("Mark: ") 
Book_inp = input("Book: ")
Page_inp = input("Page: ")

data = [{"Subject": Sub_inp ,
        "Duration": Dur_inp,
        "Theme": Theme_inp,
        "Mark": Mark_inp,
        "Book": Book_inp  ,
        "Page": Page_inp }]



#CSV_FILE_CREATION
with open(csv_file, "a+", newline="") as csvfile:
    fieldnames = ["Subject", "Duration", "Theme", "Mark","Book","Page" ]
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    if file_size == 0:
        writer.writeheader()
    writer.writerows(data)

print("Saved")
