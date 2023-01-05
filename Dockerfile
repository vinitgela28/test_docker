FROM python:3.8

ARG STAGE
ARG TENANT
ARG REDSHIFT_USERNAME
ARG REDSHIFT_PASSWORD
ARG REDSHIFT_HOST
ARG REDSHIFT_PORT
ARG REDSHIFT_IAM_ROLE
ENV STAGE=$STAGE\
    TENANT=$TENANT\
    REDSHIFT_USERNAME=$REDSHIFT_USERNAME \
    REDSHIFT_PASSWORD=$REDSHIFT_PASSWORD \
    REDSHIFT_HOST=$REDSHIFT_HOST \
    REDSHIFT_PORT=$REDSHIFT_PORT \
    REDSHIFT_IAM_ROLE=$REDSHIFT_IAM_ROLE
    
COPY requirements.txt .
RUN python3 -m pip install --no-cache-dir --upgrade setuptools wheel \
    && python3 -m pip install --no-cache-dir --use-deprecated=legacy-resolver -r requirements.txt \
    && rm requirements.txt