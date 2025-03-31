FROM ubuntu:latest

# Set the working directory
WORKDIR /usr/src/app

COPY *.sh .
RUN chmod +x *.sh

CMD [ "./user_script.sh" ]

# Install dependencies


