xspc-csi-driver build procedure for version v3.11.0 or later

(1) Register your host to red hat subscription.

subscription-manager register --username=<username> --password=<password> --autosubscribe

(2) Copy subscription manager info to build directory. Fill in <XSPC version> with appropriate version. For example, if v3.11.0 is used, fill with "3_11_0".

cd xspc_<XSPC version>/program/xspc-csi-driver
cp -r /etc/pki/entitlement ./etc-pki-entitlement
cp /etc/rhsm/rhsm.conf ./
cp -r /etc/rhsm/ca ./rhsm-ca

(3) Build image.

podman build --no-cache -t <image name> .

For other procedure, see red hat document.
