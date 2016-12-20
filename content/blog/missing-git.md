+++
date = "2016-12-10T13:33:13+01:00"
draft = true
title = "Missing Git"

+++

Working across different software projects you experience many different technologies. Each software is different in
its own way, little nuances all the way. This can range from programming language, execution environment, codestyle
to version control system and much more. I have spent most of my personal and professional life using Git, however
I frequently work in SVN and Mercurial as well. The following is a small ode to Git, mainly how I miss it when working in
the other two VCS.

## git add -p

`git add -p` or `git add --patch` allows you to stage modifications hunk by hunk. Say you fixing a bug in a method, and want to commit.
However, while scanning that file to look for the bug, you also fixed a typo in an unrelated comment. These two
changes have nothing to do with each other, right? So at least two commits should be issued. With Git thats easy.
With Subversion? Not possible out of the box. (http://stackoverflow.com/questions/75809/partial-commits-with-subversion#17538550)[Some workarounds with TortoiseSVN appear to exist].
With Mercurial? Depends on your version there now seems to be `hg commit --interactive`.

## git rebase -i master

Oftentimes, when working on a feature branch, the master/default branch moves along. At some point, I want to bring in the latest changes from
master into my feature branch. However, to me personally, it is not relevant to have that reflected in the repo history. Naturally, I reach for
a rebase. Again, on projects with SVN, branching is not even that popular, so you are not even missing a rebase, but rather branching at all.
However, it seems that not even Mercurial has great story here either.
