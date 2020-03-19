FROM centos:7

RUN yum -y install httpd mod_ssl mod_proxy && yum -y clean all

ARG version
ARG maven_version
ARG commit
ENV VERSION=${version} COMMIT=${commit} MAVEN_VERSION=${maven_version}

COPY httpd.conf /etc/httpd/conf

EXPOSE 443

ENTRYPOINT apachectl -DFOREGROUND

