FROM python:3.9

RUN wget https://github.com/blawar/nut/archive/refs/tags/v3.3.zip && unzip v3.3.zip && mv nut-3.3 nut && mkdir /nut/game-data
VOLUME /nut/game-data

WORKDIR /nut

RUN apt update && apt install libssl-dev libcurl4-openssl-dev -y && pip3 install -r requirements.txt && python3 nut.py --update-check -U && python3 nut.py

EXPOSE 9000
ENTRYPOINT ["python3","nut.py","-p","9000","-S"]
