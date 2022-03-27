---
title: "Bright Cellars, the Latest Wine Education Scam"
date: 2022-03-27T11:18:14-04:00
---

Have you seen ads for Bright Cellars yet? If you haven't, you must be one of the
lucky ones, because I can't seem to escape their ads. They're in my Twitter
feed, they're in newsletters I subscribe to, they're on LinkedIn for heaven's
sake.

The thing is... Bright Cellars is a grift *at best*. I'm not a lawyer, so I
won't use any legal terms for fear of committing accidental slander, but once
you see what I'm about to show you, I think you'll reconsider whether Bright
Cellars deserves your money.

<!--more-->

The idea behind Bright Cellars is that you take an online quiz (which they once
claimed was developed "by MIT grads") and then you start receiving wine monthly,
bi-monthly, or quarterly. As you try and rate those wines, they'll send you
better and better matches for your taste.

That all sounds intriguing, but the problem is, it's all kind of a hoax.

Not only is wine tasting itself [basically junk science][tasting], but Bright
Cellars doesn't actually find amazing wines from around the world that you'll
love. Oh no, not at all, in fact... They only sell you *their own wines*.

[tasting]: https://www.theguardian.com/lifeandstyle/2013/jun/23/wine-tasting-junk-science-analysis

The motive for what they're doing here is obvious. If you could take the quiz,
learn what wines you'll probably like, and then just go buy those yourself,
Bright Cellars would make no money.

Now, it's shady enough that Bright Cellars will only sell you their own wine,
but Bright Cellars doesn't really want you to *know* that they're only selling
you their own wine. They want you to think that these wines were selected from
among *all the world's wines*, and that's where "shady" turns to "sleazy," if
you ask me.

## The evidence

To give you the impression that the selected wines are simply "out there" in the
market to be found, they've set up shell websites for each of their wine brands
so that when you search the web for them, you don't come up empty handed. You'll
find a shallow vineyard website for each one, listing the wines, and often even
allowing you to *buy them direct*.

But how can I possibly know that these vineyards don't exist?

Oh, that's simple... Because every single one is just a WordPress installation
running on *the same servers*.

But don't take my word for it, first check out the `dig` results for
yourself. These are just a few brands I identified by reading the labels off of
pictures on their website and posted by people on Twitter.

```
humdrumwines.com.       0       IN      A       54.82.12.146
obscurawines.com.       0       IN      A       54.82.12.146
airglowwines.com.       0       IN      A       54.82.12.146
folkandfablewines.com.  0       IN      A       54.82.12.146
gladioluswines.com.     0       IN      A       54.82.12.146
jetbirdwines.com.       0       IN      A       54.82.12.146
```

Well OK so maybe they're all hosted by one of those big WordPress hosting
places, right? Maybe it's just a coincidence that every single brand of wine
that Bright Cellars "selects" for you shares website hosting.

If that were the case, then it would be very strange for each of these websites
to have, for instance, favicons served from a `bright-cellars` path within their
WordPress installation, right? (Paths abbreviated for legibility.)

```
/wp-content/.../bright-cellars/img/portfolio-sites/obscura/.../favicon.ico
/wp-content/.../bright-cellars/img/portfolio-sites/humdrum/.../favicon.ico
/wp-content/.../bright-cellars/img/portfolio-sites/airglow/.../favicon.ico
/wp-content/.../bright-cellars/img/portfolio-sites/folk-and-fable/.../favicon.ico
/wp-content/.../bright-cellars/img/portfolio-sites/gladiolus/.../favicon.ico
/wp-content/.../bright-cellars/img/portfolio-sites/jetbird/.../favicon.ico
```

What you can learn by reading the site source, huh?!

But it doesn't take an experienced internet sleuth to uncover the undocumented
relationship between these brands, if you just open their sites
side-by-side. Don't all of these headers look just a little *too similar* to
you?

{{< img "/images/uploads/bright-cellars/bright-cellars-portfolio.jpg" >}}

Bright Cellars may not be your ticket to global wine discovery, but *damn
they're good at branding*!

This actually grosses me out, though. It isn't just the fact that wine tasting
is scientifically tenuous, or that people like the things they like regardless
of what "MIT grads" might guess based on their preference for types of
chocolate.

It's that Bright Cellars is selling you a shortcut to find the things you like
among a vast field of things, but what they deliver is not only a dramatic
subset of that vast field, but a *mutually exclusive one*, and they *lie to you
about it*.

A lie by omission is nonetheless a lie.

Here are some other wine brand websites that are actually operated by Bright
Cellars (yeah, they have a *lot* of them):

* [Meet Cute](https://www.meetcutewines.com/)
* [Corsa All'Oro](https://www.corsaallorowines.com/)
* [Colorfast](https://www.colorfastwines.com/)
* [Silverscape](https://www.silverscapewines.com/)
* [Cactus Park](https://www.cactusparkwines.com/)
* [Still Bend](https://www.stillbendwines.com/)

## What if I want to learn about wine?

Right out of the gate: don't pay Bright Cellars. If you want to pay money to
taste wines, boy do I have a deal for you: visit a vineyard. Visit your local
wine shop. Visit a friend's house and pay *them* to taste *their* wine. At least
these three options are honest.

For the amount of effort you put into making a grocery list, you can write down
wines that you've tried that you like and don't like. At the end of the day,
that's approximately all it takes to understand your own taste in wine. You
don't need some "MIT grads" to tell you what you like.

You certainly don't need to buy wholesale white-labeled wine from a startup
struggling to pay down $24 million in VC. If you really want to buy wholesale
white-labeled wine, try Costco, or Trader Joe's; at least they're telling you
the truth.
