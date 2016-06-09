FROM debian
 
COPY src/localtime /etc/localtime

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get install -y exim4 net-tools curl vim tree  \
    && apt-get install -y nginx \
    && apt-get install -y php5-fpm php5-mysql php5-redis php5-gd php5-mcrypt \
    && apt-get install -y python python-pip \
    && apt-get install -y perl net-tools curl sudo logtail python-yaml \
    && pip install pyinotify \
    && pip install jinja2

RUN mkdir -p /home/entrypoint
COPY src/entrypoint.sh /home/entrypoint/entrypoint.sh
RUN chmod u+x /home/entrypoint/entrypoint.sh

ENTRYPOINT ["/home/entrypoint/entrypoint.sh"]
