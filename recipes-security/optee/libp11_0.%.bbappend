# Set libp11 to use libckteec.so.0.1.0 by default
EXTRA_OECONF:append = "--with-pkcs11-module=${libdir}/libckteec.so.0.1.0"
