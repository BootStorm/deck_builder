#!/usr/bin/python
# imports the cards into the database
import json
import mysql.connector

# set some variables
allsets = "AllSets-x.json"
allcards = "AllCards-x.json"

# connection dictionary
config = {
    'user': 'jforrest',
    'password': 'password',
    'host': 'mysql-dev',
    'database': 'mtg',
    'raise_on_warnings': True,
}

# connect to DB
conn = mysql.connector.connect(**config)

# open and load the files
with open(allsets) as sets_file:
    sets = json.load(sets_file)

with open(allcards) as cards_file:
    cards = json.load(cards_file)

db = conn.cursor()

for keys in sets.keys():
    #    print keys
    #    print sets[keys]["name"]
    # if key exists will replace it, otherwise will insert new one.
    db.execute("REPLACE INTO Sets (Set_Code,Set_Name) VALUES (%s,%s)", (keys, sets[keys]["name"]))

for keys in cards.keys():
    # need to sort out how to add in array.
    db.execute("REPLACE INTO Card_DB (Card_Name,Card_Set) VALUES (%s,%s)", (keys, cards[keys][""]))

conn.commit()
db.close()

conn.close()
