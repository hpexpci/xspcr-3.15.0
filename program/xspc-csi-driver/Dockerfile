# syntax = docker/dockerfile:1-experimental
FROM registry.access.redhat.com/ubi8/ubi:latest

LABEL name="HPE XP Storage Plug-in for Containers" \
      vendor="HPE" \
      version="v3.15.0" \
      release="1" \
      summary="CSI driver for HPE storages" \
      description="CSI driver for HPE storages" \
      maintainer="HPE"

RUN mkdir -p /spc && mkdir -p /csi && mkdir /chroot
WORKDIR /spc

COPY etc-pki-entitlement /etc/pki/entitlement
COPY rhsm.conf /etc/rhsm
COPY rhsm-ca /etc/rhsm/ca

RUN rm /etc/rhsm-host && \
 yum repolist --disablerepo=* && \
 subscription-manager register --org="HPE-Internal" --activationkey="james.crump-09162019-key" && \
 subscription-manager repos --enable rhel-8-for-x86_64-baseos-rpms --enable rhel-8-for-x86_64-appstream-rpms && \
 yum -y update-minimal --security --sec-severity=Important --sec-severity=Critical && \
 yum install -y e2fsprogs sysfsutils sg3_utils util-linux lsof device-mapper-multipath xfsprogs && \
 subscription-manager unregister && \
 rm -rf /etc/pki/entitlement && \
 rm -rf /etc/rhsm

COPY licenses /licenses

COPY spc ./
COPY entrypoint.sh ./
COPY host-cmd-wrapper.sh /chroot/

RUN chmod 755 spc entrypoint.sh /chroot/host-cmd-wrapper.sh \
  && ln -s /chroot/host-cmd-wrapper.sh /chroot/iscsiadm \
  && ln -s /chroot/host-cmd-wrapper.sh /chroot/nvme
ENV PATH /chroot:$PATH

ENTRYPOINT [ "./entrypoint.sh" ]
