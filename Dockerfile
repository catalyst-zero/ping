FROM flynn/busybox

ADD ./ping /

EXPOSE 80
ENTRYPOINT ["/ping"]

