#### ECR Push Commands

docker build -t mrpxalewedding .
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 471112920891.dkr.ecr.us-west-2.amazonaws.com
docker build -t mrpalewedding .
docker tag mrpalewedding:latest 471112920891.dkr.ecr.us-west-2.amazonaws.com/mrpalewedding:latest
docker push 471112920891.dkr.ecr.us-west-2.amazonaws.com/mrpalewedding:latest
