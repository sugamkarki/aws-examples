## create a bucket

aws s3 mb s3://class-fun-sk-1231

## create a file
echo "Hello world" > hello.txt
aws s3 cp hello.txt s3://class-fun-sk-1231 --storage-class STANDARD_IA