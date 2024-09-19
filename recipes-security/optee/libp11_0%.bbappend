# libp11 uses libckteec.so.0.1.0 by default
EXTRA_OECONF:append = " --disable-static --with-pkcs11-module=${libdir}/libckteec.so.0.1.0"
