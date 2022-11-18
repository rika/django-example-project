# syntax=docker/dockerfile:1
FROM python:3.9.15-slim-bullseye

ENV PIP_TOOLS_VERSION 6.10.0
RUN pip install --quiet pip-tools==$PIP_TOOLS_VERSION

RUN mkdir /code
WORKDIR /code
COPY . /code

RUN pip-sync requirements.txt dev-requirements.txt

# RUN pnpm install
# RUN pnpm compile
# RUn pnpm build

EXPOSE 8000

CMD python ./example/manage.py runserver 0.0.0.0:8000
