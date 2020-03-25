var elem = document.getElementById("load");


function readTextFile(file)
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                allText = rawFile.responseText;
                
            }
        }
    }
    rawFile.send(null);
}
function readTextFileAlt(file)
{
    var rawFile = new XMLHttpRequest();
    rawFile.open("GET", file, false);
    rawFile.onreadystatechange = function ()
    {
        if(rawFile.readyState === 4)
        {
            if(rawFile.status === 200 || rawFile.status == 0)
            {
                allTextAlt = rawFile.responseText;
                
            }
        }
    }
    rawFile.send(null);
}
var i = 0
while (true) {
i = i + 1
allText=null
allTextAlt=null
readTextFile(`../apps/${i}/index.html`)
readTextFileAlt(`../apps/${i}/index.htm`)
if (allText != null) {
	index="index.html"
}
if (allTextAlt != null) {
	index="index.htm"
}
if (allText != null || allTextAlt != null) {
allTextAlt=null
allText=null
readTextFileAlt(`../apps/${i}/NAME`)
readTextFile(`../apps/${i}/favicon.ico`)
if (allText != null) {
allText=null
document.write("<br><br>")
document.write(`<appext></appext><app><a href=../apps/${i}/${index}><img src="../apps/${i}/favicon.ico" width=20px height=20px> </img> ${allTextAlt}</a></app>`);
} else {
readTextFile(`../apps/${i}/icon.png`)
if (allText != null) {
allText=null
document.write("<br><br>")
document.write(`<appext></appext><app><a href=../apps/${i}/${index}><img src="../apps/${i}/icon.png" width=20px height=20px> </img> ${allTextAlt}</a></app>`);
} else {
readTextFile(`../apps/${i}/NAME`)
document.write("<br><br>")
document.write(`<appext></appext><app><a href=../apps/${i}/${index}><img src="deficon.png" width=20px height=20px> </img> ${allTextAlt}</a></app>`);
}
}
} else {
  elem.remove();
  break
}
}