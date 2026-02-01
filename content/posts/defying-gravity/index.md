---
title: "Defying Gravity"
date: 2026-02-01T06:41:54-05:00
---

Yes, this is a post about *Google Antigravity*. It's not about *Wicked*. But if
you want to listen to that while you read this, that's fine by me.

Yesterday I tried out this new AI-centric IDE from Google and I have...
Thoughts. This will be a mostly unstructured sequence of experiences and
opinions, so if you are looking for something well-researched I'm sure there are
1,000 other blogs you could read.

<!--more-->

In case you missed it, I've been developing software for 25 years now, and in
that time I've used hundreds of different tools. I've developed in Windows, in
"OS X" or "macOS" (depending on the year), and in Linux. I would consider myself
"advanced" in terms of understanding tools, environments, underlying OS
configurations, etc.

I currently use Windows 11 as my primary desktop OS. "Oh god why," you ask? [I
already answered that question]({{< ref "is-windows-tolerable-in-2020-" >}}). I think about switching *all the time* but right now this is where we are.

Installing Antigravity is straightforward, it installs like any other program. I
opened it up and was greeted by a familiar VSCode "what do you want to do" type
of splash screen. Open a recent project, open a folder, etc.

I created a folder in which to place my projects and opened it (an empty
folder). There is a right pane that is open by default where you converse with
the AI agent(s). I described a single-page static website that I wanted to build
and let it get started.

It started to fail to be able to run some programs. I asked it to pull some
content from a PDF and it tried to run "pdftotext," which is not installed. It
didn't bother asking me how to fix that and instead started writing a Python
program to do it.

At some point here I realized that it's running in a Windows shell environment
where I have much less stuff configured, because I typically develop in WSL2
(the Windows Subsystem for Linux).

That sent me down my first rabbit hole.

## Antigravity with WSL2

First off, connecting Antigravity to WSL2 is pretty easy. There is a
ctrl-shift-p command called "Remote-WSL: Connect to WSL" that just worked and
shifted my whole environment into WSL, as I would expect.

But the biggest selling point of Antigravity (as I currently understand it) is
this browser-based task validation. What it calls the "browser subagent."
Antigravity can remote control a Chrome browser to load your project, navigate
through it, observe the DOM, take screenshots, and check its own work.

That part catastrophically failed in WSL.

It couldn't launch a browser, then the browser remote control couldn't connect,
then the browser itself couldn't load the project's local server, and on, and
on, and on. Every time I found some blog post or GitHub thread and changed
something, it broke something else.

Naturally, most of these issues are because WSL is a weird, somewhat janky,
incomplete implementation (in my humble opinion). WSL is a virtual environment
that runs in the equivalent of a local container and suffers all of the
challenges of container networking layered with Microsoft's opaque design
choices.

This is a bit of a sidebar, but what users of WSL2 *want* is the experience that
all of our friends using Macs have: you open a terminal, it's UNIX-like, you can
run servers and programs and editors and you can't tell that it's virtualized.
Because on Macs it isn't virtualized, it's Darwin.

Well, tough shit, cowboy. WSL2 has its own private network, the IP it's issued
by Windows can change when you restart, and Windows Defender Firewall is in
there somewhere, too, just blocking half the stuff you want to do.

This leads to a familiar experience of following a breadcrumb trail of helpful
blog posts instructing you to do a combination of running obscure PowerShell
commands *as administrator* to punch holes in your firewall and *literally
writing Python scripts* to automatically map ports and routes between Windows
and WSL2 so that (theoretically) a WSL2 shell program can remote control a
Windows Chrome browser.

Spoiler alert: absolutely none of that worked for me.

I'm *sure* there is a way to make this all function smoothly, but I couldn't get
there. I was able to do a bunch of development and it built a site for me and I
figured out how to serve it locally myself (`python -m'http.server'` for the
win), but without the browser subagent it felt almost exactly like using Claude
Code, which under the circumstances here I would prefer.

## Back to Windows

I decided that the point of this experiment is to see how this browser shit
works, so I gave up on WSL2. I copied the whole project back into a Windows
local folder and opened that in Antigravity and reset all the configuration
stuff I changed and tried again.

This time it failed saying it couldn't install Playwright because there is no
`$HOME` environment variable set. That's odd, because, you know, that's one of
the most important and common environment variables. Go figure.

This time I did find a larger number of posts about this problem and I found yet
another obscure PowerShell command to run that apparently sets `$HOME` at the
"system level." After running that and restarting Antigravity, lo and behold, it
was able to open a browser!

## Browser Subagent

The browser subagent thing is definitely cool. It will serve your project (for
my static site it used Python like I did), and can then pop open a Chrome
browser, view the page, interact with it, read the DOM, and take screenshots and
videos. It seemed to work quite well!

It will display a little floating circle where the cursor/finger is hovering
when it interacts with the site, which is fun to watch. It figures out where to
tap/click and it is also spitting out commentary in the chat pane about where
it's scrolling or what it's trying.

This could be a big unlock for a lot of work where some kind of visual
verification is a critical step. With Claude Code, I just reload the page and
report back to Claude when things are broken, so this shortens or at least
automates that feedback loop.

## Conclusions

Google has created something here that is going to raise the bar for the other
tools. I'm sure they'll come up with some way for Claude to use Playwright; it
doesn't seem like this is a chasm to cross for them, technologically. But the
environment stuff, especially in Windows, especially with WSL2, is a big hurdle.

Developing software in Windows in 2026 is still stupid. If you're developing
software directly in Windows, storing your files in NTFS, typing commands into
PowerShell... Who the hell are you? I mean if you're developing Windows programs
great that makes a lot of sense. If you're developing web apps that way, uh,
that confuses me.

Web app production environments are 99.9% Linux-based now, so that feels like
the right environment in which to build them. In Windows, WSL2 is the current
best answer. And it still sucks.

If you've had a different experience, or know something I don't (which I'm
certain you do), please share it below!
