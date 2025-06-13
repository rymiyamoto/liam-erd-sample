ARG MYSQL_VERSION=8.4.3

FROM mysql:${MYSQL_VERSION}
RUN microdnf install glibc-locale-source glibc-langpack-ja
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
