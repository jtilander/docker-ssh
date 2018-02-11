FROM alpine:3.7

RUN apk --no-cache add \
		bash \
		curl \
		openssh-server \
		tini

RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config

COPY docker-entrypoint.sh /

ENV KEYS_URL https://github.com/jtilander.keys

ENTRYPOINT ["/sbin/tini", "-g", "--", "/docker-entrypoint.sh"]
CMD ["ssh"]
