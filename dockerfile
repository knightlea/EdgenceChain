      FROM python:3.6

      WORKDIR /app

      RUN apt install git \
          && git clone https://github.com/EdgeIntelligenceChain/EdgenceChain \
          && cd EdgenceChain \
          && sed -i '9d' requirements.txt \
          && pip install -r requirements.txt \
          && cd params \
          && sed -i 's/PEERS: Iterable\[Tuple\] = list(\[/&(\"172.17.0.1\",9999)/' Params.py

      WORKDIR /app/EdgenceChain

      CMD ["python3","main.py"]
