#!/bin/sh

set -eu

readonly curdir="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"
readonly tlshost="${1:-*}"
readonly tlsport="${2:-4433}"

readonly certs_dir="$curdir/tls-gen/basic/result"
readonly ca_file="$certs_dir/ca_certificate.pem"
readonly cert_file="$certs_dir/server_localhost_certificate.pem"
readonly key_file="$certs_dir/server_localhost_key.pem"

openssl s_server -accept "$tlshost:$tlsport" -verify 8 -CAfile "$ca_file" -cert "$cert_file" -key "$key_file"
