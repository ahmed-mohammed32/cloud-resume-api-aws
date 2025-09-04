import json
import boto3
import os

def lambda_handler(event, context):
    # Connect to DynamoDB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['TABLE_NAME'])

    # Fetch the resume data
    try:
        response = table.get_item(Key={'id': '1'})
        item = response.get('Item')

        # Handle case where item is not found
        if not item:
            return {
                'statusCode': 404,
                'headers': {'Content-Type': 'application/json'},
                'body': json.dumps({'error': 'Resume not found'})
            }
        # Return the resume data as JSON
        return {
            'statusCode': 200,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps(item)
        }
    # Handle potential errors
    except Exception as e:
        return {
            'statusCode': 500,
            'headers': {'Content-Type': 'application/json'},
            'body': json.dumps({'error': f'Error accessing DynamoDB: {str(e)}'})
        }
