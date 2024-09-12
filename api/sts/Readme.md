## create a user with no permissions

we need to create a new user with no permissions and generate out acess keys
```sh
aws iam create-user --user-name sts-machine-user
```
```sh
aws iam create-access-key \
    --user-name sts-machine-user
```

Copy the access keys and secret
```sh
aws configure
```

Then edit the creds file to change away from defualt profile
```sh
open ~/.aws/credentials
```
Now test who you are:
```sh
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to s3

```sh
aws s3 ls --profile sts
```

## create a role
```sh
bin/deploy
```

## use the new creds and assume role
```sh
aws iam put-user-policy \
    --user-name sts-machine-user \
    --policy-name STSAssumePolicy \
    --policy-document file://policy.json
```

```sh 
aws sts assume-role \
--role-arn arn:aws:iam::944040227387:role/my-fun-sts-stack-sk-StsRole-ILOVJc3Eq1ly \
--role-session-name s3-sts-fun-sk \
--profile sts
```
## add the keys to creds
we need to create a role that will access a new resource

## cleanup

- teardown cfn from console
- delete the user 
```sh
aws iam delete-user \
--user-name Bob
```

get the policy
```sh
aws iam get-user-policy \
    --user-name sts-machine-user \
    --policy-name STSAssumePolicy
```


delete the policy
```sh
aws iam delete-user-policy \
    --user-name sts-machine-user \
    --policy-name STSAssumePolicy
```

aws iam list-access-keys \
    --user-name sts-machine-user

aws iam delete-access-key \
    --access-key-id "AKIA5XTJOWI53JNQBG2K" \
    --user-name sts-machine-user    
<!-- {
    "Credentials": {
        "AccessKeyId": "ASIA5XTJOWI52ZR6LFMR",
        "SecretAccessKey": "Ju/nJT2W85f34K7WG3MqY8JrVPKmkXwDF6H9tnIE",
        "SessionToken": "FwoGZXIvYXdzEJT//////////wEaDP6kp5iDAEpHo0la0CKxAQ2Z9xPeQaKKG5AUNgEh+qt8Wkja1d4cgfHYnbIz3kbk7uvGN+rWXeWTogzX6qE+1n1z5rLsM3KBRyGCyAa/+H170GP6U4bFH+GL3uu52EA73ACTwzhhAN7TacRYddSJ8479rli9CS9X703hTXQrlTi5AAkKn+RL9nxQ5gd3FnPshLWmc8obJkSO2iFud62QR7Pk08OSAcuE3N91WJ1dYRle/3HcI+NhuqbyAqZVG4AlrCiv74y3BjItHTIp6TrNQW0v0ekggB6a2HN5aYt3RiJl7xpAuIk+7tXs527i4S8YiU+NNTWI",
        "Expiration": "2024-09-12T19:49:19+00:00"
    },
    "AssumedRoleUser": {
        "AssumedRoleId": "AROA5XTJOWI546KL6B3HP:s3-sts-fun-sk",
        "Arn": "arn:aws:sts::944040227387:assumed-role/my-fun-sts-stack-sk-StsRole-ILOVJc3Eq1ly/s3-sts-fun-sk"
    }
} -->
