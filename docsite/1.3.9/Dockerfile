FROM ubuntu:18.04
RUN apt-get update && apt-get install nodejs npm -y
RUN npm install -g docsite@1.3.9
RUN mkdir -p /home/root/.ssh && mkdir -p /home/root/workspace
WORKDIR /home/root/workspace
ADD script.sh /home/root/workspace/script.sh
CMD [ "chmod +x /home/root/workspace/script.sh && /home/root/workspace/script.sh $0 $@" ]