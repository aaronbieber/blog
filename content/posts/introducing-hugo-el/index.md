---
title: "Introducing Hugo.el"
date: 2019-12-10T16:32:57-05:00
slug: "introducing-hugo-el"
---

I promised more posts, and more posts you shall have. Indeed I have been a busy
little bee, and finally I have something to show for it.

{{< img noborder "/images/uploads/introducing-hugo-el/hugo-el-screenshot.png" >}}

When I was blogging frequently, using Octopress, one of the things I did
straight away was to write a wrapper for Emacs called `octopress.el`
([view on GitHub][octopress]), which provides an interactive interface to its
basic functions and a few ergonomic benefits like easy image and post URL
insertion.

But, as I noted in my [previous post][hugo], Octopress is effectively dead (and
slow, and tricky to set up), so I moved onto Hugo. I immediately missed having
an Emacs-based interface directly into Hugo's essential functions (though eshell
works surprisingly well)... So I wrote one. I call it `hugo.el`.

[octopress]: https://github.com/aaronbieber/octopress.el
[hugo]: {{< ref "something-seems-different" >}}

<!--more-->

A package like this one exists on MELPA already. It is called `easy-hugo`, and I
did give it a try. It's OK, but it wasn't very intuitive for me and it felt like
it was trying to do too much.

I modeled `octopress.el` after the amazing, timeless Magit, and I followed the
same pattern with `hugo.el`. In fact, `hugo.el` is a fork of `octopress.el` for
all intents and purposes, though I did it all manually.

The vast majority of the code is copied from the other package, with instances
of `octopress` and `jekyll` replaced with `hugo`, but I took the time to move
each block of functionality separately by hand to ensure that it all hangs
together properly.

There's plenty more that can be done, but it's in a workable state and I'll
probably work on writing a nice `README` and try to get it into MELPA soon.

For now, you can view the spartan repository such as it is: 
[Hugo.el on GitHub](https://github.com/aaronbieber/hugo.el).
