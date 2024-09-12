## create a bucket
aws s3 mb s3://metadata-fun-ab-123132

## createa new file

echo "Hello mars" > hello.txt

## upload file with metadata
```sh
aws s3api put-object \
--bucket metadata-fun-ab-123132 \
--key hello.txt \
--body hello.txt \
--metadata Planet=Mars,Air=Oxygen
```
## cleanup
```
aws s3 rb s3://metadata-fun-ab-123132
```