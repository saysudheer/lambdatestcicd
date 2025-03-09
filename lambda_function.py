import json
import requests

def lambda_handler(event, context):
    print(f"received event::{event}")
    joke_api_url = "https://official-joke-api.appspot.com/random_joke"
    
    try:
        response = requests.get(joke_api_url)
        joke_data = response.json()
        
        joke = f"{joke_data['setup']} - {joke_data['punchline']}"
        
        return {
            "statusCode": 200,
            "body": json.dumps({"joke": joke})
        }
    
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps({"error": str(e)})
        }
