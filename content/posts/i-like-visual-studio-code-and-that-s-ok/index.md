---
title: "I Like Visual Studio Code and That's OK"
date: 2023-10-16T06:21:31-04:00
---

This is absolutely an Emacs apologist blog, and I'm writing this post in Emacs
right now. But I started at a new job recently and most of us use Visual Studio
Code, and I know that's considered a slur in many free software circles, but I'm
here to tell you, "It's OK."

<!--more-->
{{< dots >}}

Let me catch you up on a little bit of history. In the mid-oughts (around '06 or
so), I found myself tinkering on a to-do list package for Vim that I called
"Quicktask." The idea was to have a pure-text format for capturing, sorting, and
prioritizing work.

I knew of Emacs and Org Mode and I had made a couple of futile attempts to adopt
it in the past, but since I was deeply into this [Quicktask][qt] project I
thought it would be a good idea to just dip my toes in again and see what
concepts I could borrow. My love of tinkering and customization took hold and I
was fully sucked in. I abandoned Quicktask... And Vim.

[qt]: https://github.com/aaronbieber/vim-quicktask

Fast-forward to today, and here I am still using Emacs for most text editing
work and still using Org Mode daily. I have taken up Logseq specifically because
it supports Org Mode format, I have set up Logseq and Syncthing on my phone to
be able to capture tasks and ideas into my agenda from anywhere, and I've
fashioned my life around my Org agenda.

But now, I sit in Visual Studio Code all day. Am I a giant sellout? Do I
genuflect before Satya Nadella and *kiss the ring*? Well... Maybe.

{{< dots >}}

Let's get one thing clear straight away: "big tech" is slowly and inexorably
eroding everything we love about the internet and doing some real harm to
society. But that is a post for another time. I still own a Google phone, I
still buy things from Amazon, and I still use GitHub and LinkedIn.

I'm an advocate for free and open source software, I [donate to the EFF][eff],
and I want [everyone to make their own website][rebel], but I didn't pick up Vim
way back in the day because it represented freedom. I didn't switch to Emacs
because Richard Stallman convinced me to abandon commercial software. I have
opinions and principles regarding our digital freedoms, but I have mainly chosen
software on its merits.

[eff]: https://supporters.eff.org/donate/join-eff-4
[rebel]: https://therebelweb.org

I still believe that for all practical purposes,
[Emacs is better software][emv] than Vim. A substantial segment of Vim users 
moved to [Neovim][neovim], a project whose success can be attributed to all of 
the failings of Vim as a software project. As luck would have it, I pivoted 
to Emacs at about the same time Neovim was gaining traction and I never tried 
it myself.

[emv]: {{< ref "learning-to-love-emacs" >}}
[neovim]: https://github.com/neovim/neovim

Perhaps ironically, Emacs already solved most, if not all, of the grievances
broadly held against Vim as software, at least from a user perspective. If you
want to [you can try it, too][emacs]. But this isn't the point. The point is
that Visual Studio Code is good, too.

[emacs]: {{< ref "from-vim-to-emacs-in-fourteen-days" >}}

{{< dots >}}

As I described in [the post linked above][emv], what I love about Vim is its
"mnemonically fluent, composable grammar." I switched to Emacs mainly because
[Evil Mode exists][evil], and I've been quoted as saying that Evil mode is "a
better Vim than Vim."

[evil]: {{< ref "evil-mode" >}}

What I love about Vim isn't *Vim itself* but rather the key binding interface
that makes complex changes to text so easy that it looks like magic. That is the
true gift of Vim; a gift so profound that it has been implemented in, dare I
say, most major tools.

Visual Studio Code is one such tool. You can open its integrated "marketplace"
for extensions and install "Vim" (`vscodevim`), and voila, you have modal
editing in all Visual Studio Code editor windows. With a thorough Vim emulation
layer installed, Visual Studio Code becomes hands-down the best desktop IDE
available today.

There are probably some languages or situations where another specialized IDE is
better (I haven't tried Visual Studio Code with Java, for instance), but for
every language I've used so far (including Python, Go, Arduino, Javascript, and
probably others I'm forgetting), Visual Studio Code is like magic.

There's probably another whole post in here somewhere about what an IDE really
is and how our expectations of IDEs have changed over the years, but what
differentiates Visual Studio Code from Emacs is simply that it is an IDE, while
Emacs is fundamentally an editor.

Sometimes what you want is an editor. For writing this Markdown document, I want
an editor. For managing my notes and TODOs, an editor is the right choice. Even
for some more serious scripting activities, an editor is just fine.

But when you're sitting down to write a more complex application, or to muck
around with a language you're less familiar with, an IDE brings some important
assumptions:

* You'd probably like to have insight into what functions, object methods,
  properties, and variables exist while you're typing.

* Languages have automatic formatters available and you may want to use one.

* Compiled languages provide static analysis or checking, and you probably want
  to see that feedback.

* Software is made to be run, so you want to run it, and when live debugging is
  available you may want to use it.
  
What Visual Studio Code does extremely well is recognize what language you're
using and suggest the toggles you can flip to turn on any or all of the above
features, which suddenly makes writing software easier and less error-prone.

Emacs certainly has the ability to do many or most of the things I listed, but
setting up each one, for each language, is a manual process. There is no button
for "just run 'black' on all Python files" or "give me Go breakpoints." This is
why Visual Studio Code is so popular: it gives you all of the main features of
an IDE like IntelliJ or Eclipse or whatever, and it's free and intuitive.

Perhaps I'll do a separate post on all the specific things I think Visual Studio
Code does well, or the configuration options I've set up that I really like.
Comment or write to me if that would be of interest to you.

{{< dots >}}

In conclusion, the Vim editing interface remains my one true love, for what must
now be over 25 years, and since taking this new job and using Visual Studio Code
every day, I say with great enthusiasm that it is a satisfyingly capable
environment with a feature-complete Vim emulation mode.
