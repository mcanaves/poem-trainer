FROM python:3.8-slim-buster

ENV PYTHONPATH=/opt
ENV PYTHONUNBUFFERED=1

WORKDIR /opt

COPY ./requirements.txt ./requirements.txt

RUN pip install --no-cache-dir --disable-pip-version-check -r ./requirements.txt \
 && rm -rf ./requirements.txt

RUN [ "python", "-c", "import nltk; nltk.download('stopwords'); nltk.download('wordnet')" ]

COPY . .

EXPOSE 8888

CMD jupyter notebook --allow-root --ip=0.0.0.0 --no-browser --notebook-dir=/opt/notebooks
