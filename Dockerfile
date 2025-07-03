FROM python:3.10-slim

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências
# --no-cache-dir: Desabilita o cache, o que pode reduzir o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta 8000, que é a porta padrão do uvicorn
EXPOSE 8000

# Comando para executar a aplicação em produção
# --host 0.0.0.0 torna a aplicação acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000","--reload"]
