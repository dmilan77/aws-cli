FROM alpine:3.6
RUN apk -v --update add \
        python \
        py-pip \
        groff \
        less \
        mailcap \
        bash \
        zip \
        && \
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic requests && argparse \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*
VOLUME /root/.aws
VOLUME /project
WORKDIR /project
ENTRYPOINT ["aws"]
