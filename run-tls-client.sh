#!/bin/sh

set -e
set -u

readonly openssl_xtra_args="${1:-}"

if command -v brew
then
    readonly openssl_bin="$(brew --prefix openssl)/bin/openssl"
else
    readonly openssl_bin='openssl'
fi

readonly hostname='localhost'

"$openssl_bin" s_client "$openssl_xtra_args" -ign_eof -connect localhost:4433 \
    -CAfile ./tls-gen/basic/result/ca_certificate.pem \
    -cert "./tls-gen/basic/result/client_${hostname}_certificate.pem" \
    -key "./tls-gen/basic/result/client_${hostname}_key.pem" -servername "$hostname"
