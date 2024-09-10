## create a new S3 Bucket

```md
aws s3 mb s3://checksums-examples-ab-2343

```
## create a file to do a checksum on

```
echo "hello mars" > myfile.txt
```

## get the checksum of the file
```
md5sum myfile.txt 
```
410f1ae1c7dc3301898bceb8d7ae7fe3 *myfile.txt

## upload the file to s3
```
aws s3 cp myfile.txt s3://checksums-examples-ab-2343
aws s3api head-object --bucket checksums-examples-ab-2343 --key myfile.txt
```

## upload file with a different type of checksum
shit this does not work
