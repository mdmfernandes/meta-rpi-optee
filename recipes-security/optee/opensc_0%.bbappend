# pkcs11-tool uses libckteec.so.0.1.0 by default
EXTRA_OECONF:append = " --with-pkcs11-provider=${libdir}/libckteec.so.0.1.0"
