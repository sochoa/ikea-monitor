FROM node:12

RUN touch /etc/inittab
RUN apt update && apt install -y runit

RUN chown -R www-data:www-data /srv

RUN mkdir -p /srv/ikea-monitor /logs
WORKDIR /srv/ikea-monitor

COPY . .

# https://nodejs.org/fr/docs/guides/nodejs-docker-webapp/
RUN npm install

COPY docker/runit/etc/service /etc/service/
RUN find /etc/service/ -type f
RUN find /etc/service/ -type f -name run -exec chmod 0755 {} \;

COPY docker/runit/usr/sbin/runit_bootstrap /usr/sbin/
RUN chmod 0755 /usr/sbin/runit_bootstrap
# ENTRYPOINT ["/usr/sbin/runit_bootstrap"]
