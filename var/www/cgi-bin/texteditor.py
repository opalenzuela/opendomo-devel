#!/usr/bin/env python
import cgi, os, sys
import cgitb; cgitb.enable()

try: # Windows needs stdio set for binary mode.
    import msvcrt
    msvcrt.setmode (0, os.O_BINARY) # stdin  = 0
    msvcrt.setmode (1, os.O_BINARY) # stdout = 1
except ImportError:
    pass
	
form = cgi.FieldStorage()

if "fname" not in form:
	message = 'Invalid format'
	print """\
	Content-Type: text/html\n
	<html><head><link rel='stylesheet' type='text/css' href='/cgi-bin/css.cgi?admin'></head>
	<body>
	<h2>%s</h2>
	</body></html>
	""" % (message,)
	sys.exit()
else:
	filename = form.getvalue("fname")
	try: 
		with open ("/var/opendomo/tmp/" + filename, "r") as myfile:
			data=myfile.read()
		print """\
		Content-Type: text/html\n
		<html><head><link rel='stylesheet' type='text/css' href='/cgi-bin/css.cgi?admin'></head>
		<body>
		<pre>%s</pre>
		</body></html>
		""" % (data,)

	except IOError:
		message = 'Invalid file'
		print """\
		Content-Type: text/html\n
		<html><head><link rel='stylesheet' type='text/css' href='/cgi-bin/css.cgi?admin'></head>
		<body>
		<h2>%s</h2>
		</body></html>
		""" % (message,)
