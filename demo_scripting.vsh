#!/usr/local/bin/v run

// NOTE: using logger with functions is a bit more of a hassle,
//       since the logger can not be defined globally.
import log

// Logging
mut l := log.Log{}
l.set_level(log.Level.info)
l.debug('Test debug log message')
l.info('Test info log message')
l.warn('Test warn log message')
l.error('Test error log message')
l.fatal('Test fatal log message')

// Interaction with the system.
println(ls('.'))
println('Environment: ' + environ().str())

// Calling commands from within vlang
result := exec('ls -la') or { panic('Failed to execute command: $err') }
if result.exit_code != 0 {
	panic('Failed to execute command with exit code: $result.exit_code: $result.output')
}
