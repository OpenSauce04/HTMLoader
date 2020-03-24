var OSName="Unknown OS";
if (navigator.appVersion.indexOf("Win")!=-1) OSName="Windows";
if (navigator.appVersion.indexOf("Mac")!=-1) OSName="MacOS";
if (navigator.appVersion.indexOf("X11")!=-1) OSName="UNIX";
if (navigator.appVersion.indexOf("Linux")!=-1) OSName="Linux";
if(navigator != undefined && navigator.userAgent != undefined) {
    user_agent = navigator.userAgent.toLowerCase();
    if(user_agent.indexOf('android') > -1) { // Is Android.
       OSName="Android";
    }
}

console.log("Detected OS: "+OSName)
if (OSName!="Windows") {
	document.write("<style>");
	document.write("body {");
	document.write("	background-color: #7de4ff;");
	document.write("}");
	document.write("</style>");
} else {
	document.write("<style>");
	document.write("body {");
	document.write("	background-color: #7de4ff;");
	document.write("}");
	document.write("@-moz-document url-prefix() {");
	document.write("body {");
	document.write("	background-color: #88FFFF;");
	document.write("}");
	document.write("}");
	document.write("</style>");
}
var isChrome = /Chrome/.test(navigator.userAgent) && /Google Inc/.test(navigator.vendor);
if (OSName=="Android") {
	if (isChrome) {
	//alert("android");
		document.write("<style>");
		document.write(".waveWrapper {");
		document.write("bottom: 34.9vh;");
		document.write("}");
		document.write("</style>");
	}
}