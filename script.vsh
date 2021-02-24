#!/usr/local/bin/v run

import log

mut l := log.Log{}
l.set_level(log.Level.info)

l.debug("Test debug log message")
l.info("Test info log message")
l.warn("Test warn log message")
l.error("Test error log message")
l.fatal("Test fatal log message")

println(ls("."))

println("Environment: " + environ().str())