FROM python:3.6

RUN apt-get update && apt-get install wget -y
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install google-chrome-stable zip ttf-wqy-microhei -y

RUN wget https://chromedriver.storage.googleapis.com/2.45/chromedriver_linux64.zip && \
unzip chromedriver_linux64.zip && rm -f chromedriver_linux64.zip && \
 mv -f chromedriver /usr/bin/chromedriver && chmod +777 /usr/bin/chromedriver

COPY google-chrome-launcher /usr/bin/google-chrome
RUN chmod +777 /usr/bin/google-chrome
