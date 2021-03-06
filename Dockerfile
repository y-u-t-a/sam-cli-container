FROM python:3.8-slim-buster as builder
RUN pip install aws-sam-cli

FROM python:3.8-alpine
RUN apk --update --no-cache add git
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=builder /usr/local/bin/sam /usr/local/bin/sam
ENTRYPOINT [ "sam" ]