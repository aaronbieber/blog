---
title: "How I Social Post With Hugo"
date: 2024-09-13T06:20:09-04:00
---

I have a few blogs, including this one, and over the years I've used a few
different platforms. My first ever blog was on WordPress, but now all of my
blogs use [Hugo][hugo], a static site generator written in Go.

[hugo]: https://gohugo.io/

The one "downside" to using a static site generator is that you can't easily do
some of the things that a server-based system can do, like cross-posting to
other places. This is a post about why I chose to use Hugo and how I post to
Mastodon and Bluesky (mostly) automatically.

<!--more-->

## Why Hugo?

Back when I had a WordPress blog, there was one summer where it got repeatedly
hacked by some script kiddies who would replace the front page with some weirdo
message. I would restore the site from a backup and within an hour it was hacked
again.

Running WordPress, especially when you host it yourself as I did, is a part-time
job. It's software and it has bugs and vulnerabilities so you need to keep it
updated and deal with breaking changes and all of that stuff. I tired of the
effort just to put up some words and pictures.

I moved off of WordPress to Jekyll, using a cute wrapper called Octopress.
Jekyll is a general-purpose site generator written in Ruby, and Octopress added
some nice features for generating blogs specifically. I ran like that for years
and really liked it.

Eventually, though, Octopress maintenance stopped. Also, with
my [oldest blog][ssp] approaching 200 posts, Jekyll took forever to build the
site. Jekyll is so slow that Octopress had a feature called "isolate" that would
physically move the post files you're *not* editing so that it would only
regenerate the one you were working on when you saved a file. I think it was up
to like 15-20 seconds to build the whole site.

I gave Hugo a try. Hugo is written in Go, so it's a compiled program. Hugo
generates that same site, with 230 posts, in 700 milliseconds on my laptop. Now
you can afford to regenerate the entire site with any file change. No more
"isolate!"

## Cross-posting

Of course now your website is just HTML and CSS, which is great for stopping
hackers from hacking it---because they can't---but you can't build in any kind
of integrations or automation. Any additional process that you want to kick off
on posts has to either:

1. Be run locally, or triggered locally, or
2. Get triggered by some other service that watches your site content.

As I started to lean back into [micro-blog journaling][status], I wanted to
automatically post an update to my feed on [Mastodon][indieweb] and
[Bluesky][bsky]. There are a few ways people out there do this, but the one that
seemed the most reasonable to me was to drive it off of the site's RSS feed.
Hugo has a really nice RSS template out of the box, and I figured I could work
from that.

[status]: https://status.aaronbieber.com
[indieweb]: https://indieweb.social/@aaronbieber
[bsky]: https://bsky.app/profile/aaronbieber.bsky.social

## Setting up RSS

I won't get too far into the weeds here, but if you're curious about how any of
this works specifically just drop a comment or... Find me somewhere. I'm
everywhere.

The *key* to driving social posts via RSS is managing the post size. My plan was
to build an automation somewhere, on some hosted service, that would read the
RSS feed and post "new items" to my feeds, but both Bluesky and Mastodon have
post length limits.

What I wanted, ideally, was a brief statement or idea, and then a link to the
full post. None of these posts were going to be super long, but they'd certainly
overflow these two social services.

The trick ended up being two things:

1. Build a separate RSS feed specifically for posting on the social networks (I
   decided to, ironically, call it `tweets.xml`)

2. Consciously write the cross-postable "summary" as the first paragraph of each
   post.

Hugo has a built-in "summarize" function that is typically used to display the
beginning of a post on a listing (like an archive page or list of posts matching
a tag, or whatever), and if you set the summary "length" to a relatively small
number (like 10) and have the first paragraph be roughly one sentence,
"summarize" will automatically grab it.

This allows me to maintain a standard RSS feed (`index.xml`) that includes the
entire post contents, because I'm strongly of the opinion that RSS feeds should
contain all of the content they syndicate, otherwise it's hardly syndication.

## Creating the automation

Many people use Zapier for something like this. I have used Zapier for RSS stuff
in the past, but for some reason I stumbled on another post by someone who
recommended using Make.com, which is a service I had not heard of, let alone
used.

My first impressions of Make.com is that it's "like Zapier on crack." It's quite
pretty to look at, and is somewhat more visual and slightly less confusing than
Zapier, although I ran into my share of less intuitive bits along the way.

It was really easy to create a "scenario" (as they call them) that checks the
feed, gets the top item, and if it is "new" (hasn't been seen before), posts its
"description" (which is the field the Hugo template places the "summary" into)
to Buffer, which is connected to my two social accounts.

Buffer will let you have up to three accounts connected for free forever, so
that's a good way to go if you don't need more than that.

I accepted the default of polling every 15 minutes and let 'er rip.

## Solving the operation limit problem

What I didn't yet understand is that Make.com only gives you 1,000 "operations"
per month for free. Each time the feed is polled is one "operation" and if it
finds a new post to syndicate, the Buffer post is another "operation."

After only a few days I was at 75% of my limit. When I realized this, of course
I concluded that I do not need to be polling my feed every *fifteen minutes*.
Even daily would probably do.

But I also didn't love the idea of my posts all going out only daily at some
specific weird time. I'd rather consume operations only when I need them, and
have the posts go out when the new content lands.

*Webhooks to the rescue!*

Make.com supports incoming webhooks, and you can even teach it a data structure
and pull fields out of data posted to them. All I needed was to kick off a
"scenario" when my blog is deployed, and that's pretty easy to do!

I never figured out how to get an existing scenario to be triggered by a
webhook, but I figured out how to create a new scenario that way and I just
re-created the two steps, which was not difficult.

I typically use a Makefile on the command line to build and deploy my site, so I
just added a new step to `curl` the webhook URL and VIOLA, the site is deployed
and the scenario is triggered just like that!

## What's wrong with this?

Uh, I dunno, you tell me. So far it's working fine, but it is obviously
predicated on these free services remaining free and continuing to work. I guess
in the worst case scenario I could try to write my own thing and run it
somewhere else. I hope I never have to!

If this was helpful for you for any reason, drop me a comment! I'd love to hear
what you're up to.
