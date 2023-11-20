import os
import json
import boto3


def process_data(data):
    # Implemente a lógica de processamento dos dados aqui
    # Retorna os resultados do processamento
    return {"processed_data": data.upper()}


def send_to_sqs(data):
    # sqs = boto3.client('sqs')
    # queue_url = os.environ['OUTPUT_SQS_URL']

    # response = sqs.send_message(
    #     QueueUrl=queue_url,
    #     MessageBody=json.dumps(data)
    # )

    print(f"Resultado enviado para a fila SQS")


def lambda_handler(event, context):
    for record in event["Records"]:
        body = json.loads(record["body"])
        processed_data = process_data(body)
        send_to_sqs(processed_data)

    return {
        "statusCode": 200,
        "body": json.dumps("Processamento concluído com sucesso!"),
    }
