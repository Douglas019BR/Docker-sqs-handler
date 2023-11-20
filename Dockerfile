# Use a imagem Python oficial
FROM python:3.9

# Instala o AWS CLI
RUN apt-get update && apt-get install -y awscli

# Define o diretório de trabalho como /app
WORKDIR /app

# Copia os arquivos necessários para o contêiner
COPY requirements.txt .
COPY app/ ./app

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Define as variáveis de ambiente
ENV OUTPUT_SQS_URL="sua_url_da_fila_sqs_de_saida"
ENV DATABASE_HOST="localhost"
ENV DATABASE_USER="user"
ENV DATABASE_PASSWORD="password"
ENV DATABASE_NAME="mydatabase"

# Executa o aplicativo quando o contêiner for iniciado
CMD ["python", "-u", "./app/main.py"]
