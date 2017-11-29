+++
draft = true
date = "2017-03-15T19:20:47+01:00"
title = "You might not need X"

+++

We as developers, and feel free to exclude yourself, are very inclined to adopt
the latest and greatest tech, framework, library, you name it. Often times without
really evaluating the pros and cons. If the latest post on hackernews says X is great,
then lets use X. I have definately fell into this trap before. This is a short story about how I wanted to refactor a toy project of mine
to use [redux](https://github.com/reactjs/redux), only to arrive at a point where I didn't need redux itself.

This toy project I'm talking about is an app to visualize a certain kind of xml format by rendering an appropriate 3D representation.
You can imagine there is already a plethora of libraries and frameworks involved. As this is a toy project,
I of course did not deeply investigate each and every one of them, but picked whatever tech stack seemed fitting and interesting. Here's
a few:

* [Electron](https://electron.atom.io)
* [React](https://facebook.github.io/react/)
* [ThreeJS](https://threejs.org)

As I wanted this app to be potentially cross-platform, I'm fluent in Javascript, have Node.js experience,
and most of all have no desire to write any kind of GUI application in some lower-level language like C,
the JS/Node.js/Electron stack seemed viable. With electron comes ~~great responsibility~~ a lot of unanswered
questions. After getting tired of a lot of `document.getElementById` calls and manual view updating, I looked
for alternatives. React solved that. But react is only (thankfully) a view-component library, not a desease-healing, hunger-solving
know-it-all. I was quite a bit unhappy about updating state and binding actions. Let me show you:
