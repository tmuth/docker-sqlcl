#FROM airdock/oracle-jdk
FROM kurron/docker-oracle-jdk-8

LABEL maintainer Tyler Muth <tmuth@splunk.com>

RUN apt-get update && apt-get install -y \
  unzip

ADD assets /assets
WORKDIR /assets
RUN unzip binary/*.zip || true

RUN echo "export PATH=$PATH:/assets/sqlcl/bin" >> ~/.bash_profile
RUN echo "export TZ=EDT" >> ~/.bash_profile
RUN echo "export TNS_ADMIN=/assets" >> ~/.bash_profile

RUN echo "alias sys='sql system/welcome1@//xe-2.2:1521/xe'" >> ~/.bash_profile
RUN echo "alias sys-tns='sql system/welcome1@xe'" >> ~/.bash_profile
