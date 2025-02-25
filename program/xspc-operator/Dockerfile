FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

LABEL name="HPE XP Storage Plug-in for Containers Operator" \
      vendor="HPE" \
      version="v1.15.0" \
      release="1" \
      summary="Operator for XSPC" \
      description="Operator for XSPC" \
      maintainer="HPE"

RUN microdnf update -y && microdnf clean all

WORKDIR /
COPY manager .
RUN chmod +x manager
COPY xspc-*.yaml ./
COPY spcnode.yaml ./
COPY licenses /licenses

ENTRYPOINT ["/manager"]

ENV USER_UID=1001 \
    USER_NAME=operator

USER ${USER_UID}
