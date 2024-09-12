## create a bucket
aws s3 mb s3://bucket-policy-example-sk-1232

## put the policy
aws s3api put-bucket-policy --bucket bucket-policy-example-sk-1232 --policy file://policy.json