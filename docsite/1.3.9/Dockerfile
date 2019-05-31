FROM ubuntu:18.04
RUN apt-get update && apt-get install nodejs npm git -y
RUN npm install -g docsite@1.3.9
RUN mkdir -p /root/.ssh && mkdir -p /root/workspace
WORKDIR /root/workspace
ADD script.sh /root/workspace/script.sh
RUN chmod +x /root/workspace/script.sh
ENTRYPOINT [ "./script.sh" ]