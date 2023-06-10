---
title: "Something Seems Different"
date: 2019-12-06T13:16:21-05:00
---

Does something seem a little "off?" I mean, something other than me posting here
after a conspicuously silent gap of over two years...

That's right, I'm generating the site with Hugo now! No, I didn't expect you to
notice, because everything looks *exactly* the same. This blog was built by
Octopress/Jekyll for years, but after migrating desktops and having to get it
all set up each time, I tired of the whole Ruby house of cards that it felt like
it was perched upon, so, I switched.

Read on for some of my thoughts, if you care.

<!--more-->

## But why?

A few core reasons drove my decision to painstakingly migrate to Hugo (and more
about the painstakingness of it later on):

1. Octopress is a Ruby gem, which layers functionality onto Jekyll

2. Jekyll... Is a Ruby gem

3. My site used a sophisticated Sass system called Compass, which is... Yes,
   it's a Ruby gem

But I really have nothing against Ruby, or gems for that matter; the real reason
I couldn't deal with all of this anymore is that the Ruby and gem ecosystem was
built to support *application development*, and I don't do Ruby application
development.

That means that every time I want to get my blog working on a new machine so I
can just *write a simple post*, I have to remember how to install `rbenv` and
get the right version of Ruby bootstrapped and remember how to get `bundler` to
work, and then make sure I get the right version of Octopress, and so on.

But even all of that aside, which I could solve by actually writing and
maintaining a `Makefile` that would do most of it for me, is the disconcerting
fact that the Octopress homepage has been saying "Octopress 3.0 Is Coming" for
about *five years*.

So yeah, I really loved Octopress. I even wrote a [really nice Emacs
package][octopress.el] to provide an interactive interface into it. But it is
apparently *abandonware* at this point.

[octopress.el]: https://github.com/aaronbieber/octopress.el

OK so why Hugo?

I mean, there are probably 15-20 alternatives at this point. I've even used a
couple, like Metalsmith, in my past jobs. Why choose Hugo?

Well, first, I like Go, I have written some Go, and the general Go philosophy of
convention over configuration and portability appeal to me. Go is also
(generally speaking) fast, which dare I say Ruby is not. Also I have one friend
who ported his blog to Hugo and enjoyed it.

And then there's the unavoidable fact that I switched from a Mac laptop to a PC
desktop in search of better Photoshop and Lightroom performance for my dollar,
and getting virtually any UNIX-oriented development stuff set up in Windows
always feels like a chore.

I was partway down the path of building a Docker container for my Octopress
environment so that I could run it easily from within Windows Subsystem for
Linux when I realized that Hugo will run anywhere, and probably run faster, and
I could use the migration as an excuse to dump all the extraneous dependencies
from this toolchain.

## So, how'd it go?

I'm glad you asked. It took about two days, almost two solid days, to get
the site's layout ported over so it looks the same. This was a tedious process
of learning about where Hugo's templates and layouts should live and then
copying and pasting as much markup as I could from the Jekyll versions and
translating the variables and such.

As for the content itself, I used a tool called "octohug" to convert my Jekyll
markdown documents to Hugo ones, though it didn't do the most amazing job. It
was a decent starting point, but more had to be done.

In particular, octohug wrote "slug" keys into most of the articles' front
matter, and that's not necessary if you use a slug derived from the date and all
articles have a date (well, they should, though five of mine were missing one
for some reason and I had to type them in myself, but not a big deal).

And then, as is always the case, I had a couple of custom tags implemented in
Liquid that I had to translate into Hugo "shortcodes." I may have further
musings on the pros and cons between those systems, but it wasn't terribly hard
to do.

Along with migrating those tags to shortcodes, of course I also had to go
transform all of the article content that used them to the new shortcode
syntax. `sed` to the rescue there, as always, which turned out to be less
arduous than I anticipated.

## Great, so, more posts?

At the very least, I can now confidently pop open Emacs and create a new blog
post. In Windows, no less. Yes, I know, I'm an insane person; you aren't the
first one to tell me this. I'm not promising that I'm going to post more often,
or even post at all, but I will surely be more likely to now that things are
working smoothly.

I may write up some thoughts on my experience running GUI Emacs in Windows,
which has also been an interesting journey. It's really not bad, but there are
quirks, and I'm sure you're all dying to hear about them.
