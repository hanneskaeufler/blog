/* eslint no-console:0 */
import RailsUjs from "rails-ujs"
import Turbolinks from "turbolinks"

// https://gist.github.com/danshearmur/1993718
document._write = document.write;
document.write = function(str) {
  if (str.indexOf('<div id=\"gist-') != 0) {
    if(str.indexOf('https://gist.github.com/stylesheets/gist/embed.css') == -1) {
      // if you got this far it's not a github document.write call
      document._write(str);
    }
    return;
  }
  var id = /<div id=\"gist-(\d+)/.exec(str)[1];
  var script = document.querySelector('script[src="https://gist.github.com/' + id + '.js"]');
  var div = document.createElement('div');
  div.innerHTML = str;
  script.parentNode.insertBefore(div, script.nextElementSibling);
}
