---
title: "Vibe Coding Is a Lot Like Ruby on Rails"
date: 2025-05-31T06:14:20-04:00
---

Our bucket *overflows* with news about the exploits of "vibe coding," and
journalists are now (apparently) paid by how many times they can fit the word
"agentic" into a piece, because no other explanation makes sense to me.

As I've written before (somewhere, maybe not here), I use AI and I like AI and I
think we'll come out the other end of this with some really interesting and
useful new stuff, but at the moment it feels like the hype machine has shifted
into overdrive.

I can't shake the feeling that in some ways, we've seen this before... With Ruby
on Rails.<!--more-->

{{< dots >}}

Do you remember when Rails was *the shit*? I do, because I was deep in it, and
when I first tried it out (not at the very beginning, but early in its
maturity), I fucking *loved* it. I was a pretty big PHP fanboy in those days,
and web frameworks for PHP were nascent, so Rails was the first true ORM I had
ever used.

One thing is true of Rails, and maybe even of ORMs in general: they let you move
so fast. The de-facto first Rails project was to build a blog, which you could
do in probably an hour or less. Define a couple of models, build a couple of
forms, and before you know it you have an actual blog site.

I was drunk with power! I used Rails to build the website for my photography
workshop business, and for a friend's fine art printing business, and numerous
other sites and toys. Of course, none of these ideas reached any sort of
popularity, and I did it mostly out of the novelty of it rather than any real
business need or pressure.

Meanwhile, companies like 37signals were using Rails to build shit like
Basecamp, and not long after that GitHub appeared. Rails was apparently used to
build Twitch, Shopify, and AirBnB (little did I know!)

Rails introduced the idea of "convention over configuration," which was baked
into the idioms of the framework. It felt really good to make fewer decisions,
accept what might seem like slightly flawed designs in the absence of any viable
alternatives, and just get on with life.

With 90% of the boilerplate of a database-backed CRUD app buried inside the
framework, it felt like you only had to write a couple of lines of logic and you
had a working thing. That part felt truly magical. Need to validate a field's
format before it's saved? One line of code. Need to give the user some feedback
about a thing they just did? One line of code.

{{< dots >}}

Now Windsurf and Cursor and Copilot are on the scene, promising almost the same
kind of step-function improvement in raw productivity. Imagine not even writing
any logic *at all*! Just describe what the thing is supposed to *do* and let the
AI write all the code for you!

In [this recent piece on NPR][npr], a developer uses AI to build a site in about
100 hours that he said would have taken him "a year" to build by hand. The
article speculates on how this will affect the software development industry
(and who is to say?)

[npr]: https://www.npr.org/2025/05/30/nx-s1-5413387/vibe-coding-ai-software-development

Meanwhile, even a whisper about reducing engineering staffing requirements is
causing the vulture capitalists to convulse like a 14-year-old boy who just
found a copy of the Kama Sutra in his local library. The damp men of Silicon
Valley's tech investment circle-jerk are absolutely ravenous for AI.

Sometimes it does feel pretty magical. I can ask Copilot to just write me some
code, or an Elasticsearch query (that's been really helpful because the query
DSL is so insane), and it just does it. I'm sure it's saved me numerous hours of
searching and copying and pasting and debugging.

But it's still wrong a lot. I mean, a lot. My favorite thing about AI is how
confidently wrong it can be. It will say, definitively, "here is a way to do
this thing," and give you absolute nonsense. So you tell it, "no, that's wrong,
it's more like this..." and it confidently replies "oh you're right, I'm sorry,
here is a different way..."

When it works it's like rubbing the magic lamp, and when it's wrong it's like
herding blind cats.

{{< dots >}}

This brings me back around to Rails. While perhaps the debate still rages on,
there are always tradeoffs implicit in any framework, and Ruby on Rails
attracted a great deal of criticism regarding scalability and security.

DHH, the creator of Rails, and himself a *controversial figure*, is quick to pin
the performance issues of Rails apps on the architectural decisions their
authors made, and since I don't know what any of those were I couldn't rightly
say who is right and who is wrong.

But I can say that an ORM, out of the box, will never be as performant as a
system written by hand, from scratch, by someone who knows what the fuck they're
doing. The database is the primary bottleneck, and queries dynamically composed
by ORMs are always going to hit some limits.

There is also the challenge of hydrating chains of dependent models, and as I
recall, Rails offers various escape hatches and hooks into managing all of that,
once you get very serious, but it's arguably as tricky to tune Rails as it is
to... Write a performant web app from scratch.

The advantage of a framework like Rails---that it hides the boilerplate deep
within the framework---may eventually become a hindrance; how can you optimize
what you cannot see or touch?

In point of fact, when I worked at Wayfair, we started evaluating GitHub. They
sent a couple of folks out to talk to us, and I remember asking the tech guy,
"how do you manage the risks of things like Rails updates?"

His answer: "We employ several core Rails developers."

{{< dots >}}

Ruby on Rails and AI have this in common: they're both *so fast for
prototyping*. You can go from zero to working blog in no time flat! Finally you
can build that weird recipe website you've been dreaming about, or whatever.

But eventually you will reach a tipping point. Either a tipping point of scale,
or of capability, or of complexity, or all of the above. At some point, you need
someone who knows *how Rails really works*. Someone who can tune it and deeply
debug it and upgrade it.

When you're sitting on 30,000, or 50,000, or 100,000 lines of code that AI wrote
for you, and you start to have performance or security issues, you're totally
reliant on AI to solve them because *you don't understand how any of it works*.
The promise of vibe coding is that AI writes all the code and you just sit back
and collect the subscription fees.

That's the dream that has these thirsty, puff-vested Silicon Valley capitalists
so riled up. And let's be honest with ourselves, they're not entirely wrong
about it. Sometimes, you just need an idea that works well enough to get someone
like Google to feel threatened and buy you out. But if that's the play, at least
admit it.

In the long-term, any piece of software---whether it was written by human or
machine, using Rails or Django or no framework at all---will require some
intelligent person or people to figure out how to make it go. The longer it
takes to get to that point, the more frantic and catastrophic and urgent it will
feel when it arrives, but arrive it will.

Unless, of course, it fails.
