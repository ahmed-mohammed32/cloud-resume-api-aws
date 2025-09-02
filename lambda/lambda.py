import json
import boto3
import requests
import os

def lambda_handler(event, context):
    # Connect to S3
    s3 = boto3.client('s3')
    bucket_name = os.environ['BUCKET_NAME']
    file_key = os.environ['FILE_KEY']
    