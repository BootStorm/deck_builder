#!/usr/bin/python
# imports the cards into the database
import json

allsets = "AllSets-x.json"
allcards = "AllCards-x.json"

# open and load the file
with open(allsets) as sets_file:
    sets = json.load(sets_file)

# for keys, values in sets.keys():
#    print keys
#    print values["name"]
