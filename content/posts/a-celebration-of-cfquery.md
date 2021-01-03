---
title: "A Celebration of CFQUERY"
date: 2021-01-03T13:14:05-05:00
draft: true
---

Here's a controversial take: the best SQL interface for developers existed
(exists?) in ColdFusion.

Having written SQL interfaces in ColdFusion, PHP, Python, Ruby (Rails), and Java
8, I can say with some confidence that, at least to my taste, ColdFusion's
implementation of the modest SQL query is far and away the most elegant. Prove
me wrong.

<!--more-->

Before I get hundreds of angry comments, tweets, and emails, let me take a
paragraph to calm you all down a little bit. I don't have the audacity to claim
that ColdFusion's SQL query paradigm is best suited to any particular purpose,
or is even objectively the best on any given axis of measure for a modern
application architecture. It is, however--and again, to my mind--the simplest
I've seen to offer ergonomics *and* security /out of the box/. The last part is
important because virtually all other languages have a framework or helper that
meets the security and ergonomics qualifications, but is not in the core API of
the language.

If you haven't written ColdFusion before, and let's be honest that is the vast
majority of you, allow me to introduce you to ~<cfquery>~.
