var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
if (isChrome) {
	document.write("<style>");
	document.write("body {");
	document.write("image-rendering: pixelated;");
	document.write("}");
	document.write("</style>");
} else {
	document.write("<style>");
	document.write("body {");
	document.write("image-rendering: crisp-edges;");
	document.write("}");
	document.write("</style>");
}