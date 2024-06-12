---
title: "Go-ing Local With Enphase"
date: 2024-06-12T08:52:45-04:00
---

We have solar panels on the house, and their energy production is managed by an
Enphase Envoy microinverter system. I love data, so I wanted to build my own
dashboard of energy consumption and production, which took me down
a [rabbit hole][en] of dealing with Enphase's shitty API.

[en]: {{< ref "the-joy-and-pain-of-the-enphase-api" >}}

Since then, I discovered that the Envoy system does, in fact, serve its energy
data locally, so this is my brief explanation of how I moved over to that
approach instead.

<!--more-->

Credit where credit is due, I was made aware of this possibility by a reader
calling themselves "Vintage," who commented on the previous linked post. It
seems that interest in this area is fairly limited and there aren't many
resources out there, so this is my attempt to add a little more value to that
short stack.

The basics of the implementation are described on [BASHing data][datafix] and
[Envoy-S metered readings][guytec]. Essentially the Envoy serves a JSON dump of
current readings, and you can request that data as often as you like. This
resolves the whole "insufficient API request quota" situation.

[datafix]: https://www.datafix.com.au/BASHing/2019-09-06.html
[guytec]: https://guytec.com/Envoy-S/

There's only one fly in the ointment, so to speak. In red letters at the top of
the second page linked above, it says:

> Warning: Don't change to a Token based Envoy, also make sure your system
> doesn't allow the automatic update

The newer Envoy systems require you to authenticate through the Enphase website
to acquire a token, and then you use the token to access your local data, which
is, how should I put this... Bullshit? Well, guess how new *my* system is!

Unfortunately, there's nothing you, nor I, can do about it. Remember that the
Envoy is a proprietary system, and your only alternative to what I'm describing
here is to request the data generated on the side of your house from a database
that Enphase maintains.

So at least we can reduce our reliance on Enphase to a token exchange and get
all the raw data directly from the local device. And that's what we're going to
do.

{{< dots >}}

There is one substantial pivot from the [previous implementation][es] to this one.
Because the previous implementation was rate-limited by the API, I was
requesting windows of time, pickling all the readings, and sending those
directly to Carbon. (Review my [previous post][en] for details).

[es]: https://github.com/aaronbieber/enphase-stats

The local endpoint will never return a series of readings, it can only return
the instantaneous reading at the current moment. That means I need to request
data more frequently and send it to StatsD immediately (the way StatsD was
intended to be used). Since I no longer need to pickle the data, I also don't
need to be tied to Python to build this.

I really like Python, don't get me wrong, but for this project I elected to use
Go instead (hence "Go-ing local"; get it??) Of course, as I proceeded to build
this thing I decided to pickle the data anyway and ended up writing a minimal
Carbon client in Go as well.

I've now been running this system for almost a year with no modifications, and
as I write this I'm failing to remember why I went back to the Carbon interface,
but it may have something to do with Carbon accepting a timestamp, versus
sending "live" data and allowing StatsD to record the current time. But honestly
I have no recollection.

The core Envoy stat collection project is called [envoystats][evs], and it
relies on two other packages, one that talks to the Envoy,
called [envoyclient][ec], and one that talks to Carbon, called
[carbonclient][cc].

[evs]: https://github.com/aaronbieber/envoystats
[cc]: https://github.com/aaronbieber/carbonclient
[ec]: https://github.com/aaronbieber/envoyclient

All of these projects are released with basically no license at all, so if this
code is of any use to you feel free to use it for anything. There's nothing
particularly novel or exciting about it, but the Envoy client does manage
requesting the token from the Enlighten site, caching it, and using it to
request your production data, which is most of the labor involved.

I run the client from cron every 10 minutes and like I said it's been running
like that for almost a year now, so I think it's safe to say that it's stable.

If this was helpful to you in some way, please leave a comment! I'd love to know
what you've been getting up to.
