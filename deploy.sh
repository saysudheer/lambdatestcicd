#!/bin/bash
set -e

# Define variables
FUNCTION_NAME="cicdLambdatest"
ZIP_FILE="lambda_function.zip"
AWS_REGION="us-east-1"

# Install dependencies
pip install -r requirements.txt -t package

# Create deployment package
cd package
zip -r ../$ZIP_FILE .
cd ..
zip -g $ZIP_FILE lambda_function.py

# Deploy the function
aws lambda update-function-code --function-name $FUNCTION_NAME --zip-file fileb://$ZIP_FILE --region $AWS_REGION
