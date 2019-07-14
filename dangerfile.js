import { fromJson, default as mentor, defaultTips } from "danger-plugin-mentor"
import { message, warn, fail, markdown } from "danger"
import fs from "fs"

if (danger.github.pr.title.indexOf("[WIP]") !== -1) {
  warn("PR is classified as Work in Progress");
}

var bigPRThreshold = 200;
if (danger.github.pr.additions + danger.github.pr.deletions > bigPRThreshold) {
  warn(":exclamation: Big PR");
}

mentor(undefined, [...defaultTips(), ...fromJson(fs.readFileSync("./crystal-lang-tips.json"))])
