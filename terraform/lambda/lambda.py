import json
import boto3
import os

def lambda_handler(event, context):
    # Connect to DynamoDB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['resume.json'])

    # Error handling for DynamoDB table access
    try:
        # Get the the item from DynamoDB
        response = table.get_item(Key={
            'id': '1'
            })
        if 'Item' not in response:
            return {
                'statusCode': 404,
                'body': json.dumps('Resume not found')
            }
        return {
            'statusCode': 200,
            'body': json.dumps(response['Item'])
        }
    # Catch any exceptions and return an error message
    except Exception as e:
        return {
            'statusCode': 400,
            'headers': {
                'Content-Type': 'application/json'
            },
            'body': json.dumps(f'Error accessing DynamoDB: {str(e)}')
        }
