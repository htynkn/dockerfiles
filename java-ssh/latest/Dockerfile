FROM openjdk:11
RUN apt-get update && apt-get install -y openssh-server
COPY entrypoint.sh entrypoint.sh
EXPOSE 22
CMD "bash"
ENTRYPOINT [ "./entrypoint.sh" ]