# lambda-layer-mecab-python3

Please use from [AWS Serverless Application Repository](https://serverlessrepo.aws.amazon.com/applications/arn:aws:serverlessrepo:us-east-1:345513370492:applications~lambda-layer-mecab-python3).

### How to build

```bash
docker build -t lambda-layer-mecab-python3:latest .
docker run -v $(pwd)/opt:/mnt -it lambda-layer-mecab-python3:latest
```

### How to deploy via AWS SAM

```bash
sam package --output-template-file package.yaml --s3-bucket <YOUR S3 BUCKET>

sam deploy --template-file package.yaml --stack-name <YOUR STACK NAME>
```
