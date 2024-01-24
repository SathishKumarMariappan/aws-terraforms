import os
import logging
import json
import boto3

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def lambda_handler(event, context):
    table_name = 'GameScores'
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(table_name)
    try:
        logger.info('Lambda function is starting...')
        
        response =  table.scan()
        
        if 'Items' in response:
            item = response['Items']
            return {
                'statusCode': 200,
                'body': json.dumps(item)
            }
        else:
            return {
                'statusCode': 404,
                'body': json.dumps(response)
            }
    except Exception as e:
        logging.info("Error: %s", str(e))
        return {
            'statusCode': 500,
            'body': 'Internal service Error || From Labmda ',
        }