# s3 buckets

## create buckets

``` aws s3api create-bucket --bucket magus-bucket-2 --create-bucket-configuration LocationConstraint=ca-central-1 ```

### retrieve bucket names
``` aws s3api list-buckets --query Buckets[].Name --output table ```
### list buckets with query
`aws s3api list-buckets --query "Buckets[?Name == 'my-bucket'].Name"`

### move files from local dir to aws bucket
`aws s3 sync images/ s3://magus-bucket-2 `

### move files using aws s3api
