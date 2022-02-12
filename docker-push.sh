mvn clean package

cd ruoyi-ui

yarn build:prod

docker login --username=richardgong1987 --password-stdin  < ~/DockerPassword.txt

cd ../docker_pro/ruoyi-vue

sh deploy-dev.sh

cd ../nginx

sh deploy-dev.sh





