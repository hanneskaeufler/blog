// gist embeds are wonky because of document.write
// https://gist.github.com/danshearmur/1993718
document._write = document.write;
var addedStyleToHead = false;
document.write = function (str) {
  // gist css
  if (str.indexOf('<link rel="stylesheet"') == 0) {
    // just add the stylesheet to the head
    if (!addedStyleToHead) {
      document.head.innerHTML += str;
      addedStyleToHead = true;
    }
  }
  // gist html
  else if (str.indexOf('<div id="gist') == 0) {
    var idMatch = /<a href=\"https:\/\/gist\.github\.com\/hanneskaeufler\/(\w+)\//.exec(
      str
    );
    var id = idMatch[1];
    var script = document.querySelector(
      `script[src="https://gist.github.com/hanneskaeufler/${id}.js"]`
    );
    var div = document.createElement("div");
    div.innerHTML = str;
    script.parentNode.insertBefore(div, script.nextElementSibling);
    script.remove();
  } else {
    document._write(str);
  }
};
