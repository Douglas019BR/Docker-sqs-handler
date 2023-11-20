# Use a imagem Python oficial
FROM python:3.9

# Define o diretório de trabalho como /app
WORKDIR /app

# Copia os arquivos necessários para o contêiner
COPY requirements.txt .
COPY app/ ./app

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Define a variável de ambiente OUTPUT_SQS_URL
ENV OUTPUT_SQS_URL="sua_url_da_fila_sqs_de_saida"

# Executa o aplicativo quando o contêiner for iniciado
CMD ["python", "-u", "./app/main.py"]
