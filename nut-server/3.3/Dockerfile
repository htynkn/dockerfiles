FROM python:3
RUN wget https://github.com/blawar/nut/archive/refs/tags/v3.3.zip && unzip v3.3.zip && mv nut-3.3 nut && mkdir /nut/game-data
VOLUME /nut/game-data

WORKDIR /nut

RUN apt update && apt install libssl-dev libcurl4-openssl-dev -y && pip3 install -r requirements.txt && python3 nut.py --update-titles

EXPOSE 9000
ENTRYPOINT ["python3","nut.py","-S"]
