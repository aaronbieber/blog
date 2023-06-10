---
title: "The Rise of the Indie Web"
date: 2022-11-20T11:30:39-04:00
---

{{< img "right" "/images/uploads/indie-web/bird-on-fire.png" "caption" >}}

[Elon taking over Twitter][elon] and the rise in [subscription everything][subs],
paired with a renewed fear of [surveillance capitalism][sc] has caused a ton of
folks, myself included, to think a little harder about what services we use, or,
maybe more accurately, *depend on*.

[elon]: https://www.theverge.com/2022/10/30/23430008/elon-musk-twitter-homepage-subscriptions-changes
[subs]: https://survivingtomorrow.org/the-math-is-clear-you-will-own-nothing-and-billionaires-will-own-everything-within-our-lifetime-6cd80d13876c
[sc]: https://amzn.to/3SLhPBm
[bitdepth]: https://bitdepth.show/episodes/bd005-should-you-own-your-tools/

My buddy Chris and I even talked about [subscription art programs][bitdepth] on
our podcast (with some surprising results).

But there is something else going on here, something beyond just "paid vs. free"
or "monolithic vs. distributed."

Could this be the rise of the *indie web*?

<!--more-->

{{< dots >}}

I don't think there is a single canonical definition of "the indie web," but I
like the one put forward on the eponymous [indieweb.org](https://indieweb.org):

> The IndieWeb is a people-focused alternative to the "corporate web".

IndieWeb has some specific criteria for what it means to participate, and I
agree with most of it, but I don't think you have to perfectly conform to their
approach to join this "indie web" (with a space) movement.

In my mind, "indie web" just means "the independent web." At the core is the
idea that you own your data, but I see a bit more gray area surrounding how you
achieve that ownership or control.

Rather than self-hosting everything (which can surely be burdensome and/or
expensive), I've adopted a middle ground, and that's what I want to talk about.

## Self-hosting

I do self-host this blog, which is easy because this blog (and my other blogs,
and even [my homepage](https://aaronbieber.com) at the root of this domain) are
static sites generated with [Hugo](https://gohugo.io).

Hosting a static site only requires a bit of disk space and the bandwidth
necessary to serve it. My sites receive modest traffic, so I've been able to get
by with a $5/month VPS account at [Hostwinds](https://hostwinds.com).

If you're comfortable with a little command line stuff (my readers surely are!)
you can have a Hugo blog up on the web in an hour. Feel free to peruse the
[source code of this blog](https://github.com/aaronbieber/blog) for ideas.

For the sake of completeness, I use Hugo to build:

* This blog
* My personal homepage, [aaronbieber.com](https://aaronbieber.com)
* My photography blog, [Single-Serving Photo](https://singleservingphoto.com/)
* My coaching blog, [Your Technologist Coach](https://blog.aaronbieber.coach)
* My art gallery, [aaronbieber.art](https://aaronbieber.art)
* My podcast website, [bitdepth.show](https://bitdepth.show)

All of these sites are also version-controlled in git and stored on
Github. Admittedly, Github is kind of a corporate juggernaut at this point, but
I haven't seen any substantial reasons to doubt their reliability or attention
to privacy, etc.

So that's great for blogs and simple static sites, but what about everything
else?

## Distributed file sync

My first big leap into this idea of the "indie web" was giving up Dropbox
entirely and switching to [Syncthing](https://syncthing.net/). In their words:

> Syncthing is a continuous file synchronization program. It synchronizes files
> between two or more computers in real time, safely protected from prying
> eyes. Your data is your data alone and you deserve to choose where it is
> stored, whether it is shared with some third party, and how it's transmitted
> over the internet.

It's a lot like Dropbox, except that there is no single, centralized, canonical
version of a file. You can treat it that way if you like (I consider my NAS
to be the "canonical" source), but functionally all Syncthing clients
communicate with one another.

You can decide whether you want to:

* Choose a "central" device and link each of your other devices to it (in a
  classic server/client configuration), or
* Link each device to every other device (in a distributed peer-to-peer
  configuration).
  
I tried it the first way for a while because it was the way I was used to, and I
figured it would be less error-prone. As it turned out, it's also often slower.

Any change on *Client A* has to sync to the *Server* before it can then sync to
*Client B*. Of course that's how Dropbox works, and Dropbox is pretty quick.

It's quite possible that Dropbox is actually faster than Syncthing, but if you
simply interconnect your clients, devices just fire changes off to each other
immediately and you don't have to wait for any central arbiter.

{{< dots >}}

There are some caveats here. Syncthing is cross-platform, and I have used it in
Linux (Ubuntu within Windows Subsystem for Linux), Windows 10 & 11, and Android.

Generally, it works great. However, Syncthing itself is just a daemon. Each of
the OS-specific UI programs are developed separately and they vary a bit. The
*de facto* Windows client, SyncTrayzor, is awesome and even supports conflict
resolution.

The Mac client is fine, it gets the job done, but doesn't do much more than what
is necessary. In Linux, you're on your own, it's just a daemon you can run
however you run daemons on your system.

On Android, it works surprisingly like you'd expect, but I have had issues with
conflicts and it pretty much won't tell you when things conflict, which can
create headaches.

There is no official Syncthing client for iOS. An 
[issue requesting a native iOS port][ios] was opened in 2014 and was the
longest-standing open issue on the project until it was closed this year (2022).

[ios]: https://github.com/syncthing/syncthing/issues/102

There is a commercial Syncthing client for iOS called [Möbius Sync][mobius] and
as I understand it, it works well and has been out there for a long time.

[mobius]: https://apps.apple.com/us/app/m%C3%B6bius-sync/id1539203216

## Music

I have some music that I can't readily stream. Mainly it's music I bought on
Bandcamp and I don't want to use their app to stream it because it sucks. I also
have a fairly large collection of music that can't be found on any streaming
service.

As fickle record labels endlessly re-negotiate deals with streaming service
providers, it seems inevitable that *some* music is always unavailable. My wife
and I still use Spotify, and I still discover a lot of music that way, but I
have always wanted on-demand access to my own collection.

Well, I finally have it! Enter [Navidrome](https://www.navidrome.org/), a
personal music streaming server written in Go.

But it took me a while to get here and you may want to understand the landscape
of personal streaming servers before you dive in.

{{< dots >}}

It all started with [Subsonic](http://www.subsonic.org/pages/index.jsp), "your
complete, personal media streamer." Subsonic is still around, it's very mature,
but I had a lot of trouble getting it to reliably scan my music files and
playback had some snags that I couldn't resolve.

Subsonic is a Java app, so running it takes a touch of finesse unless you just
use a Docker image (which I did). Mainly, the Subsonic web interface is pretty
clunky. It's complex and crowded and a bit dated.

But what Subsonic really brought to the table was a *protocol*.

The project forked into [Airsonic](https://github.com/airsonic/airsonic) and
then [Airsonic Advanced](https://github.com/airsonic-advanced/airsonic-advanced).
Someone wrote a C# version called Hypersonic, I found another one written in
straight C. But all of these implement the *Subsonic API*.

The API is important because it encouraged others to develop different mobile
clients. The most talked-about one on Android is DSub, which is a terrible name,
and it's a so-so app. I really like Subtracks, myself.

Navidrome, of course, implements the Subsonic API as well.

{{< dots >}}

I like Navidrome because the setup is quite simple and the web interface is
clean and straightforward. I'm using the [official Docker image][navi], but I'm
running it alongside the [Linuxserver SWAG][swag] gateway, which gives me a
turnkey, SSL-enabled nginx proxy server in front of it.

[navi]: https://hub.docker.com/r/deluan/navidrome
[swag]: https://docs.linuxserver.io/images/docker-swag

SWAG will set up its own Let's Encrypt SSL certificate on boot if you tell it
to and Navidrome immediately scans the music location you give it. Once you have
your config dialed in, it's off to the races.

A fully functional home music streaming server in an hour (or less, if you type
faster than me)!

## "Microblogging"

This is the one I'm both excited and curious about, and that you've probably
been hearing a lot about if you're reading this in late 2022.

That's right, I got on [Mastodon][joinmasto], the decentralized, not-for-sale,
"federated" social networking system. I use the word "system" deliberately
because Mastodon is not a monolithic, centrally operated service like Twitter,
but rather a software project that anyone can run.

The two "main" servers, [mastodon.online][mo] and [mastodon.social][ms], which
have the largest number of users each (at the time of this writing), are both
operated by the project's founder and lead maintainer, Eugen Rochko. But there
are *thousands* of other Mastodon servers out there.

[joinmasto]: https://joinmastodon.org/
[mo]: https://mastodon.online/
[ms]: https://mastodon.social/

I elected to join both [indieweb.social][iw] and [mastodon.art][ma] because they
appeal to my topical sensibilities. The general rule is to join the smallest
server that suits your dominant interest(s).

[iw]: https://indieweb.social/
[ma]: https://mastodon.art/

{{< dots >}}

The first important thing to understand about Mastodon is the "federated"
part. For most Mastodon users, the crucial distinction is that you can follow
users on *other* Mastodon servers. For instance, I follow [Douglas Rushkoff][rushkoff],
who is on `social.coop`, and I follow [Judd Legum][judd] who is on `journa.host`.

[rushkoff]: https://social.coop/@rushkoff
[judd]: https://journa.host/@juddlegum

I see their posts on my "home" timeline along with everyone else's. For this
reason, the server you choose is somewhat less important. Users in the Mastodon
world take on some of the user discovery challenges themselves, which might seem
tricky or tedious, but on the other hand there is no algorithm making decisions
for you.

{{< dots >}}

So what's "microblogging" anyway? In a way, even "tweeting" is microblogging,
but what makes Mastodon so much more like a blog is... Well, there are a few
things.

1. All posts on Mastodon are displayed chronologically, for everyone,
   always. "Favoriting" a post gives feedback to its author and nothing
   more. There is no "algorithm." The Mastodon feed is much more like an RSS
   reader than it is like Twitter.

2. Not all posts on Mastodon were made on Mastodon.

As we established, Mastodon posts can travel between servers. A post I make on
`indieweb.social` might be seen on someone's feed on `hachyderm.io`. But it goes
further than that. The protocol that Mastodon uses to interconnect each instance
is called [ActivityPub][ap], which is a full-fledged W3C Recommendation.

[ap]: https://www.w3.org/TR/activitypub/

So in fact, posts may appear on your Mastodon home feed *that aren't even made
on Mastodon at all*.

This is where things get really exciting. The concept of "protocols, not
platforms" has been written about for years. A nice example of what it might
mean in practice was produced recently by Cory Doctorow and the EFF, called
[Interoperable Facebook][interop].

The gist is that "platforms" lock you in with high switching costs and hold your
social connections hostage. But if there was a protocol to interconnect
services, competition could grow in such a space, to the benefit of all
users. Imagine if you could leave Facebook, but still talk to all of your
friends who are there?

[interop]: https://www.eff.org/interoperablefacebook

ActivityPub and systems that implement it, like Mastodon, are *building that in
from day one*.

If you get tired of the Mastodon server you're on, you can switch. If Mastodon
proves unsuitable for any purpose, it can be replaced. The connections that
you've made are exportable as follow lists and the networks can be
reconstructed.

{{< dots >}}

The TL;DR is that Twitter's problems are catalyzing a renewed interest in
alternatives, and more pluralistic, humane, and distributed ones are leaping in
to fill the void.

I really liked Twitter. I still check it from time to time. But if you're
interested in any of this and want to get involved,
[come find me on the indie web](https://indieweb.social/@aaronbieber).
