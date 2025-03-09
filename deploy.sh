#!/bin/bash
set -e

# Define variables
FUNCTION_ARN="arn:aws:lambda:us-west-2:466733620502:function:cicdLambdatest"
ZIP_FILE="lambda_function.zip"
AWS_REGION="us-west-2"

# Remove old package directory if it exists
rm -rf package lambda_function.zip

# Install dependencies inside a 'package' directory
mkdir package
pip install -r requirements.txt -t package

# Create deployment package
cd package
zip -r ../$ZIP_FILE .
cd ..
zip -g $ZIP_FILE lambda_function.py

# Deploy the function
aws lambda update-function-code --function-name $FUNCTION_ARN --zip-file fileb://$ZIP_FILE --region $AWS_REGION
