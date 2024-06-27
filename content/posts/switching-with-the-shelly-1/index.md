---
title: "Switching with the Shelly 1"
date: 2024-06-27T08:56:32-04:00
---

I'm a bit of a home automation hobbyist. I bought my first few Philips Hue
lights before anyone knew what Hue was, and I wrote one of the first couple
hundred Amazon Alexa integrations (they even gave me a t-shirt for it!)

My house isn't as jammed with sensors and self-made IoT devices as some of the
folks I've seen on YouTube, but I do run Home Assistant and appreciate the
occasional well-designed automation. Almost all of the wall switches in my house
are "smart" and "does it connect to Home Assistant" is now a question I ask
about every new connected device I consider buying.

Recently I had a couple "problems" (we home automation nerds tend to see "minor
inconveniences" as "major solvable problems") and decided to solve them with
Shelly relays. This is that story.

<!--more-->
{{< dots >}}

## What is Shelly?

[Shelly](https://www.shelly.com) is a somewhat mysterious European connected
device company. They're best known for their connected "switches," which aren't
actually switches because a switch is something that you touch, but without
belaboring the semantics these things are pretty great.

Shelly makes a [pretty large variety][shelly-switches] of these "switches,"
spanning three generations. There's the "Shelly 1," the "Shelly Plus 1," the
"Shelly Plus 1PM," the "Shelly 1 Mini Gen3," and on and on. Fundamentally,
though, these are essentially all WiFi-connected relays (or dimmers).

[shelly-switches]: https://www.shelly.com/en-us/products/switching-and-triggering#unfiltered

I decided to use the Shelly 1 (first generation), which is a WiFi-connected
on/off relay, with a connection for a physical external switch that we'll talk
about later. Right now, on Amazon, you can pick up
a [two-pack of Shelly 1 relays][buyshelly] for about $22, putting these at about
$11 a pop, which to my mind is a great bargain.

{{< img "shelly1gen1.png@300" >}}

[buyshelly]: https://amzn.to/3XI969k

So what are these good for?

## My "Problems"

These Shelly 1 devices have three big advantages over alternatives like the
wildly popular [Sonoff][sonoff]:

1. They're really small. About half the size of a Sonoff.
2. They can switch AC and DC loads across a huge range of voltages.
3. The switch input adds another dimension of capabilities.

[sonoff]: https://amzn.to/4cvPNEo

Both of the things I wanted to better automate call for a 12v DC relay, so the
Sonoff wouldn't even work; it can't power up without 100v AC at the minimum. The
Shelly 1 can switch 110-240v AC, 30-50v DC, or 12v DC. There is a jumper that
you can swap to select 12v or "more than 12v."

My first issue was that the LED light bars I put up in my office closet took
seconds to light up after being powered by a Kasa WiFi plug, which is entirely a
delay within the transformer. Using a physical switch on the 12v supply coming
out of the transformer, the bars light up instantly.

Shelly 1 to the rescue! Since the LED light bars are all connected by 5mm barrel
jacks, it was trivial to wire the Shelly 1 between a male and female barrel jack
and insert it into the circuit. Suddenly, I can now turn the closet lights on
instantly.

This seems like a minor thing, but when you're reaching into the closet for
something you know is there, you don't want to wait seconds for the lights to
turn on.

{{< dots >}}

My second little experiment is much less "necessary" and more "this is cool." I
have a similar set of LED light bars installed above the kitchen range using the
simple included rocker switch installed under a cupboard. What I wanted to do
was switch the lights on automatically when the range or oven is turned on.

We have an induction range, so it runs off a 240v 50-amp circuit. There are
exactly zero smart home devices that deal with that kind of current. So we
actually have two problems:

1. How do I know when the range is on?
2. How can I switch the lights, but keep a local toggle switch for manual
   override?

The answer to the first question is "by monitoring the current draw of the
range/oven," and I won't go into specifics in this post, but let me know if you
would find this interesting to hear more about.

The answer to the second question is by using a Shelly 1 to switch the 12v light
bars in the exact same way that I did in my office closet, and also wiring the
toggle switch into the Shelly 1's switch input.

The Shelly 1 has several options for how to treat the connected switch or
button:

* Momentary (pressing a button toggles the Shelly on or off)

* Toggle (the on/off state of the switch sets the on/off state of the Shelly)

* Edge switch (the on/off state of the Shelly is *toggled* when the switch state
  changes)

* Detached (the switch state is exposed to your WiFi-connected system, but has
  no effect on the Shelly state)

* Activation switch (any switch input toggles "on," and Shelly will toggle "off"
  after a preset time; like a motion sensor)

For my application, "edge switch" is perfect, because I want to toggle the
lights with a Home Assistant automation, but also have the attached physical
switch toggle the lights on or off (regardless of the current state, and
regardless of the switch position).

Another brilliant thing about the Shelly's external switch feature is that you
can use a *button* or a *switch* and choose a setting that works for your needs.
With "edge switch," flipping the rocker to "on" or "off" has the same effect (it
triggers the Shelly relay to toggle to its opposite setting). But using
"momentary" would give you the same result with a momentary button.

This was *wildly* successful! When the current draw of the range increases above
a threshold for a few seconds, the lights turn on, and if that isn't what you
want you can flip the toggle and they turn off. Or, if you just need to clean
the range and want some light, you can flip the toggle and the lights turn on,
as though the Shelly isn't even there.

I literally love these things and I'm going to end up putting them everywhere!
