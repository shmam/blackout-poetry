import requests
import json
import os

# getting my NYT app API key from env variables 
API_KEY = os.environ["API_KEY"]
JSON_FILENAME = "data.json"

#array of articles 
arr = []

# from the years 2005 to 2005
for year in range(2005,2006):
    
    # from the months march to april	
    for month in range(3,5):
        
        # get all of the articles published for that given month and year 		
        r = requests.get("https://api.nytimes.com/svc/archive/v1/{0}/{1}.json?api-key={2}".format(year,month,API_KEY))
        data = r.json()
        
        # in the case of a keyerror		
        try: 
            # create a string thats a combination of the lead paragraph and the
            # snippet
            for d in data["response"]["docs"]:
                article = d["lead_paragraph"] + " " + d["snippet"]
                arr.append(article)
        except: 
            ...
        
jsonData = {}

# Create a dictionary from the array of all the gathered articles, use the index into
# the array as the unique key, and the article as the value 
for index in range(0,len(arr)): 
    if len(arr[index]) > 25: 
        jsonData.update({index:arr[index]})

# Dump the dict to a json file
with open(JSON_FILENAME, 'w') as fp:
    json.dump(jsonData, fp)
    
        