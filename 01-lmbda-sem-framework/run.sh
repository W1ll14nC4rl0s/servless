# 1º criar um arquivo com as politicas de segurança
# 2º criar o role de segurança na AWS

aws iam create-role \
    --role-name lambda-ex1 \
    --assume-role-policy-document file://politicas.json \ ## informando o arquivo onde se encontra o item 1
    | tee logs/role.log

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://function.zip \
    --handler   index.handler \
    --runtime nodejs12.x \
    --role arn:<Arn>
    | tee logs/lambda-create.log

aws lambda update-function-code \
    --zip-file fileb://function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

aws lambda delete-function \
--function-name hello-cli 

aws iam delete-role \
--role-name lambda-ex1
    

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

