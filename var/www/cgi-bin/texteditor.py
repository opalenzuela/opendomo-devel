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
		<html><head>
		<link rel='stylesheet' type='text/css' href='/cgi-bin/css.cgi?admin'/>
		<link rel='stylesheet' type='text/css' href='/css/texteditor.css'/>
		<link rel='stylesheet' type='text/css' href='/css/solarized_light.css'/>
		<script type="text/JavaScript" src='/scripts/vendor/jquery.min.js'></script>
		<script type='text/JavaScript' src='/scripts/texteditor.js'></script>
		<script type='text/JavaScript' src='/scripts/vendor/highlight.pack.js'></script>
		</head>
		<body>
		<pre id='textcontent' contenteditable='true'><code class='bash'>%s</code></pre>
		<div id='btns' class='toolbar'>
		<button id='btnback' class='button' onclick='history.back()'>Back</button>
		<button id='btnsave' class='button' >Save</button>
		<button id='btnhelp' class='button' >Help</button>
		<a href='#'>Next</a>
		</div>
		<script>
		var path='%s';
		hljs.initHighlightingOnLoad();
		</script>
		</body></html>
		""" % (data,filename)

	except IOError:
		message = 'Invalid file'
		print """\
		Content-Type: text/html\n
		<html><head><link rel='stylesheet' type='text/css' href='/cgi-bin/css.cgi?admin'></head>
		<body>
		<h2>%s</h2>
		</body></html>
		""" % (message,)
