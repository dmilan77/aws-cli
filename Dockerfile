FROM python:3.7.7-alpine3.11 
RUN apk -v --update add \
        groff \
        less \
        mailcap \
        bash \
        zip \
        openssl \
        && \
    pip install --upgrade awscli==1.18.27 && \
    pip install --upgrade  s3cmd==2.0.2  python-magic requests==2.23.0 argparse==1.4.0 && \
    pip install --upgrade boto3==1.12.27 && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
