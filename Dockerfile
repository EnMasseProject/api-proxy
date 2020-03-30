FROM centos:7

RUN yum -y install httpd mod_ssl mod_proxy && yum -y clean all

ARG version
ARG maven_version
ARG commit
ENV VERSION=${version} COMMIT=${commit} MAVEN_VERSION=${maven_version}

COPY cfg/httpd.conf /etc/httpd/conf

EXPOSE 8443


RUN chmod -R a+rwx /var/run/httpd
USER 1001

ENTRYPOINT apachectl -DFOREGROUND

