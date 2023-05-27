---
title: "The Joy and Pain of the Enphase API"
date: 2023-05-27T08:38:42-04:00
---

I recently had rooftop solar installed, and my system uses what are called
"microinverters" made by the company Enphase. I'm going to make the brash
assumption that because you are here, reading this article, titled such as it
is, that you have at least a passing knowledge of what the hell I'm talking
about. If anything is unclear, feel free to leave a comment!

Anyway, I wanted to get my solar power data into a local system, and was excited
to learn that Enphase does have an API! Unfortunately, it has some issues. Allow
me to explain them all in tedious detail!

<!--more-->
{{< dots >}}

Here's a picture of what we're shooting for:

{{< img "grafana-dashboard-screenshot.png" >}}

This is a dashboard that I built in Grafana (which is awesome). The "Solar
Energy" section at the top mimics the way the Enphase official app displays this
data. Basically you only have "consumption" and "production" numbers (blue and
orange bars) and from that we can compute "import" and "export" (the red and
green bars).

The Enphase API provides production and consumption "meter" readings across
"intervals," which are 15-minute windows locked at the quarter-hour. In other
words, an "interval" starts at the top of the hour, quarter past the hour, half
past the hour, etc.

## APIs Are Awesome

Having access to this data is great. I run a relatively straightforward Python
program that sucks in the readings and fires them off to Carbon/StatsD, and
Grafana can read it from there. Having my own copy of the data means that I can
slice and dice it any way I want, and you can see a couple ways I've done that
on the dashboard (per-week and 30-day production vs. consumption being one).

The Enphase API is straightforward. It uses OAuth, it follows the typical access
token/refresh token pattern, its endpoints are mostly reasonable, and it speaks
JSON (as you'd expect these days). Their documentation is "fine," but even more
"software savvy" companies have weak API documentation so I don't hold it
against them. I'd consider myself adept in this area, so YMMV, but it was
adequate to get me up and running in one afternoon.

Another nice thing about the Enphase API is that polling meter readings can
return one interval, a day of intervals, or a week of intervals. This becomes
crucial when I start to talk about the challenges.

## The Challenges

The first challenge you will face, as a technically inclined consumer interested
in reading their own system data, is the API subscription tiers. Oh yes, here in
America, cursed art thou who shall fail to monetize thy data! There are three
tiers: Watt, Kilowatt, and Megawatt (I'm not kidding).

Watt is free, so that's the tier I'm using. There is a tight request limit on
this tier of only 1,000 requests per month. That seems like a lot until you do
the math. The "production" and "consumption" meter readings are on different API
endpoints, so each time you want to update your energy usage, you will make two
requests.

1,000 requests across 31 days amounts to 1.3 requests per hour. Not enough to
request both production and consumption each hour. Let alone to request each
15-minute interval as it happens.

I know what you're going to say: why do I need the data updated that frequently?
Surely the real value of the data is in the historical aggregates, so even a
daily request should be fine, right? And sure, that sounds reasonable.

But look, the Enphase "Enlighten" app can show me my ongoing meter readings, and
even a *live view* of current production and house load, so I just wanted
something *approaching* that frequency. Since all Enphase consumers have this
Enlighten app that can load their system data instantly at any time, updated
within the last 15 minutes, it seemed reasonable to expect that their API could
offer the same.

## Commercialization Sidebar

Skip this section if you wish to be spared my rant about API commercialization.

The Enphase developer portal says "If you are a developer or homeowner looking
to access Enphase systems' data...", which leads you to believe that homeowners
are among the groups addressed here, but I don't think that's actually true.

First, homeowners are not going to be a great profit center for an API anyway.
Each homeowner will only read one system's data (their own) and are unlikely to
pay big bucks for access to data that is shown in the Enlighten app for free
(why would they!)

The Kilowatt plan is $250/month and the Megawatt plan is $1,000/month. Either is
a very steep price to pay for API access for a single person, but totally
reasonable for a company to pay to access data for multiple systems and perhaps
syndicate it out, collecting a fee from commercial system owners.

It seems as though we, the lowly homeowners, are supposed to be grateful to
Enphase for offering us their API table scraps so that we can own and control
our own system data, collected from the box mounted physically on our homes and
uploading it through our own wifi networks. Let's get one thing straight: if
there was a way to read this data locally off the device, no matter how arcane,
I'd be up for that.

Instead, companies suck the data up into their own "cloud" and charge admission
for rate-limited read-only access to it. I signed up for this and "it is what it
is," as they say, but I'm going on record here that this is a bad pattern.

## Loading...

Using the free API tier, I calculated that I can request my system data every
two hours, which leaves me a bunch of request headroom if I need to make some
extra manual requests to debug issues and so on (which I did, as you'll see).

I was elated to get this program stood up and running, and the data flowing into
Grafana. For a few days I fiddled with the dashboard, adding and editing the
meters and graphs until I had what you see up above. This ran flawlessly for a
week or two and then suddenly stopped.

I figured that I screwed up some refresh token request or something, but oh no,
the problem was much funnier.

Running the program in VSCode locally revealed the problem: the API response
couldn't be parsed as JSON due to some unexpected character. Huh. Let's add some
additional output and see what the raw response looks like, shall we?

```
<h2>This website is under heavy load (queue full)</h2><p>We're sorry, too many
people are accessing this website at the same time. We're working on this
problem. Please try again later.</p>
```

Yeah, that's decidedly not JSON. To the trained eye, it appears to be HTML.

Naturally, Enphase offers no status dashboard, nor did they send any emails to
my registered developer address (top-tier API operations over there, clearly) so
I can only speculate at what happened. So I will.

Based on my experience operating web applications, that HTML message appears to
have been generated by an edge device, perhaps a load balancer or reverse proxy.
After some web searching, I've concluded that the message is emitted by the
Phusion Passenger app server popular for use with Rails apps (though evidently
it supports Python, Node, and Meteor now).

Looking at the API usage stats on the Enphase developer site (below), you can
see that I used about half of the number of requests you'd expect for two days.

{{< img "enphase-statistics.png" >}}

This supports the hypothesis that the Passenger app queue was full at the edge
and the requests never even made it to the API application itself, therefore
those attempts didn't count against my quota (hooray?)

Still, it's some bush league shit for your JSON API to suddenly start spewing
HTML whenever you get an unexpected surge of requests. It's also bush league
shit for your $1,000/month API to go dark for *almost a whole day* with no
proactive communication or status page at all.

Clearly, API operations is not Enphase's strength as a company.

## Oh, and Also the Lag

That outage was the only one I've seen so far, but it's also not unusual for the
Enphase API to simply not return any new data for a couple of hours. Even when
the Enlighten app is displaying data up through the most recent interval, the
API sometimes does not.

I could also speculate on why this might be, and it would have something to do
with internal data transfer queues or database replication or similar, but
clearly the Enlighten app is reading data from a *different source* that
provides more up-to-the-minute results (for free, too, remember).

## Solutions

Fortunately the API offers granularity options and the default setting is "one
day," so in each telemetry request you'll get back an array of interval readings
with epoch timestamps for the past day (up to whatever the latest value is that
the API has access to).

Taking that into account, I wrote my polling program to keep track of the last
interval timestamp it has seen, and simply discard any readings older than that
from each read. I am using a cron job to run the program every two hours, but
even if data is lagged by a couple hours more, eventually all of that data will
flow in and get loaded, as long as it's less than a day.

Because StatsD wants to receive metrics in realtime, you can't use it to send
historical data. Fortunately, StatsD is just a convenience frontend for Carbon,
which exposes its own TCP interfaces. One of those interfaces is called
"pickle," which can receive tuples of timestamped metrics in a "pickle" format
that Python can natively speak.

So the solution is quite simple, you just filter the API data to discard
timestamps you've already seen, map them into tuples, pickle them, and send them
to Carbon. All of this is just a few lines of Python.

## Problem Solved!

If you've made it this far you're truly committed, and I appreciate you.

I've had all of this running for a few weeks now and it seems to work quite
well. I've published all of the code in the
[enphase-stats project on GitHub][es], so feel free to check that out, modify
it, use it, etc. If you want to make improvements and send me PRs, go for it.

[es]: https://github.com/aaronbieber/enphase-stats/

I did contact Enphase via their [api@enphaseenergy.com][api] address to share
with them my disappointment about the low rate limits and how I believe they
could open this up to homeowners more thoughtfully (mainly by creating a
single-system read-only tier with a restrictive per-minute limit but more
generous per-month limit).

As of today, I have received no response from them.

[api]: mailto:api@enphaseenergy.com
