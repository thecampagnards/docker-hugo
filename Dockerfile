FROM alpine:latest

LABEL maintainer="TheCampagnards <konstantin.sidorenko@orange.fr>"

ARG GITHUB_TOKEN

RUN apk add --no-cache wget
RUN wget --user thecampagnards --password "$GITHUB_TOKEN" -O - "https://api.github.com/repos/gohugoio/hugo/releases/latest" \
| grep 'browser_download_url.*hugo_.*_Linux-64bit.tar.gz' \
| head -n 1 \
| cut -d '"' -f4 \
| wget --user thecampagnards --password "$GITHUB_TOKEN" -i - -O /tmp/hugo.tar.gz
RUN apk del wget
RUN tar -xzvf /tmp/hugo.tar.gz hugo -C /usr/local/bin && rm -f /tmp/hugo.tar.gz
RUN hugo version

WORKDIR /opt/hugo

EXPOSE 1313

ONBUILD COPY site/ /opt/hugo

ENV HUGO_BASE_URL http://localhost:1313
CMD ["hugo", "server", "-b", "$HUGO_BASE_URL", "--bind=0.0.0.0"]