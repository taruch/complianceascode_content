# platform = Red Hat Enterprise Linux 8,Fedora
# reboot = true
# strategy = restrict
# complexity = low
# disruption = low

RULE_LINE='+VERS-ALL:-VERS-DTLS0.9:-VERS-SSL3.0:-VERS-TLS1.0:-VERS-TLS1.1:-VERS-DTLS1.0'
CONF_FILE=/etc/crypto-policies/back-ends/gnutls.config
CP='SYSTEM=NONE:+MAC-ALL:-MD5:+GROUP-ALL:+SIGN-ALL:-SIGN-RSA-MD5:-SIGN-DSA-SHA1:-SIGN-DSA-SHA224:-SIGN-DSA-SHA256:-SIGN-DSA-SHA384:-SIGN-DSA-SHA512:+SIGN-RSA-SHA1:%VERIFY_ALLOW_SIGN_WITH_SHA1:+CIPHER-ALL:-CAMELLIA-256-GCM:-CAMELLIA-128-GCM:-CAMELLIA-256-CBC:-CAMELLIA-128-CBC:-3DES-CBC:-ARCFOUR-128:+ECDHE-RSA:+ECDHE-ECDSA:+RSA:+DHE-RSA:+VERS-ALL:-VERS-DTLS0.9:-VERS-SSL3.0:-VERS-TLS1.0:-VERS-TLS1.1:-VERS-DTLS1.0:+COMP-NULL:%PROFILE_MEDIUM'

grep -q ${RULE_LINE} ${CONF_FILE} || echo ${CP} > ${CONF_FILE}
