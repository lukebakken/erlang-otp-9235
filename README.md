# erlang-otp-9235
https://github.com/erlang/otp/issues/9235

# Setup

The following will update the `tls-gen` submodule and generate X509 certs for `localhost`

```
./setup.sh
```

# OpenSSL test

Terminal 1:

```
./run-openssl-server.sh
```

Terminal 2:

```
./run-tls-client.sh -tls1_2
```

Note that the output includes the following:

```
Extended master secret: yes
```

# Erlang / OpenSSL test

Ensure `erlc` is in your `PATH`.

Terminal 1:

```
./run-tls-server.sh
```

Terminal 2:

```
./run-tls-client.sh -tls1_2
```

Note that the output includes the following:

```
Extended master secret: no
```
