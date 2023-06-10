---
title: "An Algorithmic Middle Ground"
date: 2023-03-30T06:00:12-05:00
---

As a devoted listener of the [Decoder][d] podcast, I'm no stranger to the topics
of content moderation and social media algorithms, but ever since that one
certain rich guy bought that one certain bird website the internet has been
*abuzz* with hot takes on these subjects.

[d]: https://www.theverge.com/decoder-podcast-with-nilay-patel

It seems clear that algorithmic content recommendation is the source of [real world harms][algo],
but at least some people think it's [actually pretty OK][ok].

[algo]: https://www.businessinsider.com/facebook-algorithm-sociopath-management-too-greedy-to-stop-it-2020-5?op=1
[ok]: https://www.makeuseof.com/why-algorithmic-social-media-feeds-good/

It's a nuanced topic, and in my opinion, the right answer will be equally
nuanced. Maybe there is a reasonable middle ground?

<!--more-->
{{< dots >}}

Algorithmic content recommendations only exist because they are profitable for
the social media companies, but why, again, are they bad?

In my observation, this setup has a few failure modes:

1. Perpetually fresh content feeds are purposefully addictive and are actively
   eroding everyone's attention span[^1].
   
2. Objectively harmful content (self-harm or pro-anorexia are examples we've
   seen on TikTok lately[^2]) may be surfaced automatically to people who are
   most likely to be harmed by it.

3. Modern algorithms are black boxes and create emergent echo chambers that
   content consumers can scarcely understand let alone manage[^3].
   
[^1]: https://thesciencesurvey.com/editorial/2021/04/23/social-medias-influence-on-our-attention-spans/
[^2]: https://www.theguardian.com/technology/2022/dec/15/tiktok-self-harm-study-results-every-parents-nightmare
[^3]: https://www.pnas.org/doi/10.1073/pnas.2023301118

We're past the point of asking whether recommendation algorithms at scale are
good or bad. They sure are great for the companies that created them, but
objectively they are bad for us.

So why not simply abandon recommendations?

{{< dots >}}

As with most things, there are two sides to the coin. On the one hand, content
recommendations at scale cause direct harm. But on the other hand, there is
something to be said for discovery.

The amount of content generated on any given social media platform now is beyond
comprehension. Every minute, Twitter receives over a half million tweets,
Instagram receives some 60,000 photos, and YouTube receives over 500 *hours* of
video.

Increasingly, people are turning to these platforms to see more than content
generated by others they know personally. TikTok is bucking the trend of relying
on a "social graph" to drive recommendations and the other platforms are
following suit.

For good reason: I personally follow authors, journalists, makers, and musicians
alongside the people I know from my personal and professional lives. My feeds
would be boring (to me) if they *only* contained photos of meals and hot takes
from people I know.

How do we discover the people we want to follow without allowing some AI to find
them for us?

Without some manner of recommendation, everyone would have to *search* for
things they like, which has two fatal flaws:

1. People are bad at describing things (which might be solved by a sufficiently
   intuitive search system).

2. You can only search for things if you know that they exist.

It's the second one that is damning. I definitely follow people who are doing
things I wouldn't have dreamed of or ever searched for. Thanks, YouTube.

So recommendations are harmful, but recommendations are necessary. What do?

{{< dots >}}

I'm trying to resist the urge to give in to *technosolutionism* and propose some
new, simpler, better algorithm that will decisively fix all of our problems.
Although some different technological approach to recommendations may work, my
proposal is more fundamental.

To my mind, the only way to create a system that truly acts to serve its users
alone is for the users to own it. You can see the beginnings of what that looks
like on Mastodon, the most popular platform within the so-called "fediverse."
Mastodon has no algorithm at all, and most discovery is driven by hashtags.

No algorithm means you'll never see something and not know why; you only see
posts from people you follow, and those "boosted" by people you follow, and the
difference is explicitly shown.

Mastodon's use of hashtags feels like the OG Instagram, where hashtags was the
only way anyone found you. You can even follow a hashtag now, and those posts
will appear in your home timeline.

By viewing the "federated timeline," you can view all of the posts made publicly
by *anyone followed by anyone* on your home server. Each Mastodon server also
suggests trending hashtags.

Mastodon is only one platform, and may or may not prove itself to be as useful,
effective, or fun as the others. I use it only as an example of what social
media discovery features look like when designed *by the users themselves*.

{{< dots >}}

I think the position I've come around to is that complex, AI-driven
recommendation algorithms may not be necessary. A naive algorithm could surface
things that are unexpected, but wouldn't exhibit the intrinsic bias of its
training data or the humans who created it.

"See what you ask for, or see everything." Mastodon's tag-based discovery solves
the problem of finding what you want to see, but if you want to diversify your
feed, you can view that federated timeline, which is simply chronological. It's
a firehose, and on some servers it can be overwhelming, but it's all-or-nothing.

This way, you never see "only the concerning posts our computer brain thought
you'd like." You'll see those, too, but along with everything else in
chronological order for you to make the final call.

This is a hard problem. Maybe the hardest problem in communication at scale
today. What do you think? Are recommendation algorithms good? Bad? Neither?