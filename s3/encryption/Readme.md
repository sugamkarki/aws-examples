## create a bucket

aws s3 mb s3://encryption-fun-sk-1232

## create a file

echo "Hello world" > hello.txt

aws s3 cp hello.txt s3://encryption-fun-sk-1232

## put object with encryption of KMS

aws s3api put-object \
--bucket encryption-fun-sk-1232 \
--key hello.txt \
--body hello.txt \
--server-side-encryption aws:kms
--sse-kms-key-id