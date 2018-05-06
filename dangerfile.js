import fixme from "danger-plugin-fixme"
import mentor from "danger-plugin-mentor"
import yarn from "danger-plugin-yarn"
import { message, warn, fail, markdown } from "danger"

if (danger.github.pr.title.indexOf("[WIP]") !== -1) {
  warn("PR is classified as Work in Progress");
}

var bigPRThreshold = 200;
if (danger.github.pr.additions + danger.github.pr.deletions > bigPRThreshold) {
  warn(":exclamation: Big PR");
}

mentor()
fixme()
schedule(yarn())

