import csv
from api.models import Medicine


def run(path):
    with open(path) as file:
        csvreader = csv.DictReader(file)
        for row in csvreader:
                print(row)
                Medicine.objects.create(name=row['name'],mrp=row['MRP'],presc=row['Prescription']=='Prescription Required',manf=row['Manufacturer'],sidef=row['Side Effects'],howtouse=row['How to Use'],description=row['How it Works'],therapyclass=row['Therapeutic Class'])

if __name__ == '__main__':
  run("drg.csv")