#!/bin/bash

################################################################
# This script will list all the resources in the aws account

# Author: Pushkar Mondal
# Date: 15/08/2024

# Usage: ./aws.sh <region> <service_name>
# Example: ./aws.sh us-east-1 EC2
################################################################

if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi


aws_region=$1
aws_service=$2



if ! command -v aws &>/dev/null; then
    echo "AWS Cli is not installed. Please install!"
    exit 1
fi

if [ ! -d ~/.aws ]; then
    echo "AWS Cli is not configured. Please configure it!"
    exit 1
fi

# List the resources based on the service
case $aws_service in
ec2)
    echo "Listing EC2 Instances in $aws_region"
    aws ec2 describe-instances --region $aws_region
    ;;

rds)
    echo "Listing RDS Instances in $aws_region"
    aws rds describe-db-instances --region $aws_region
    ;;

s3)
    echo "Listing S3 Buckets in $aws_region"
    aws s3api list-buckets --region $aws_region
    ;;

cloudfront)
    echo "Listing CloudFront Distributions in $aws_region"
    aws cloudfront list-distributions --region $aws_region
    ;;

vpc)
    echo "Listing VPCs in $aws_region"
    aws ec2 describe-vpcs --region $aws_region
    ;;

iam)
    echo "Listing IAM Users in $aws_region"
    aws iam list-users --region $aws_region
    ;;

route5)
    echo "Listing Route53 Hosted Zones in $aws_region"
    aws route53 list-hosted-zones --region $aws_region
    ;;

cloudwatch)
    echo "Listing CloudWatch Alarms in $aws_region"
    aws cloudwatch describe-alarms --region $aws_region
    ;;

cloudformation)
    echo "Listing CloudFormation Stacks in $aws_region"
    aws cloudformation describe-stacks --region $aws_region
    ;;

lambda)
    echo "Listing Lambda Functions in $aws_region"
    aws lambda list-functions --region $aws_region
    ;;

sns)
    echo "Listing SNS Topics in $aws_region"
    aws sns list-topics --region $aws_region
    ;;

sqs)
    echo "Listing SQS Queues in $aws_region"
    aws sqs list-queues --region $aws_region
    ;;

dynamodb)
    echo "Listing DynamoDB Tables in $aws_region"
    aws dynamodb list-tables --region $aws_region
    ;;

ebs)
    echo "Listing EBS Volumes in $aws_region"
    aws ec2 describe-volumes --region $aws_region
    ;;

*)
    echo "Invalid service. Please enter a valid service."
    exit 1
    ;;

esac


