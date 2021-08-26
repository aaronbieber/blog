---
title: "How Did I Start?"
date: 2021-08-25T08:30:35-04:00
---

This is going to be a personal post, and it's long, and I'm writing it mostly to
get it out there, so if you aren't into the whole "career journey memoir" thing,
feel free to skip this one.

Would it surprise you to know that I applied to the Rhode Island School of
Design and for a non-trivial number of years thought that I would have a (likely
struggling) career in the arts and graphic design? In fact, I have done a few
freelance graphic design gigs, and for a few years I ran a home business
restoring old photographs (that probably deserves its own post).

So how did I wind up writing ColdFusion for a living?

As many programming stories do, mine begins with Java.

<!--more-->

I wrote my first line of code when I was very young. I am not certain of my
exact age, but I was younger than ten. I learned how to launch GW-BASIC on my
dad's IBM desktop (the kind with a green monochrome monitor and two 5 1/2"
floppy drives) and write that first program everyone writes:

```basic
10 PRINT "Hello"
20 GOTO 10
```

I learned how to increment and decrement values and create scrolling patterns on
the screen. Interestingly, even as I was exploring programming concepts, my
goals always tended to be visual, and I think I still have that tendency today.

Years passed and I taught myself other languages. Perl, Visual Basic, mIRC
Script (who remembers that one?) and yes, PHP. None of that knowledge earned me
any money, but it was almost all of what I did in my free time. I wasn't deeply
into sports, or video games, or in a band. I wrote code for fun.

## My first tech job

Eventually I lucked into a tech job. It was actually luck: I had a high school
friend whose father and uncle had started an insurance software company decades
ago. The company had global reach, had made tons of money selling mainframe
software, and had a small office in my home town. They were looking for anyone
with half a brain to do rote work converting terminal-based input screens of
their program to GUI dialogs using Java and Swing. It was an hourly gig with no
contract term; "come do this until we decide we're done."

This was all part of a series of strategic initiatives to overcome the fact that
in 1999, nobody wanted to buy an IBM mainframe anymore. On top of that, their
software was written in COBOL, and, as you might recall if you're as old as I am,
there was something worrying anyone who ran important COBOL programs in 1999.

The "Y2K bug," as it was called, was in actuality the dramatic lack of foresight
that led COBOL programmers of decades past to allocate only two bytes for year
values and the associated anxiety about what would happen when those values
changed from "99" to "00" and millions of lines of code assumed it to be "1900."

So, in the frenetic atmosphere of COBOL consultants suddenly making a king's
ransom to sift through millions of lines of old code looking for dates, and the
company's looming inability to sell any new installations of their product, I
put on whatever could pass for "business casual" and started my job "writing
Java."

I have to put it in quotes because what I was actually doing was following a
very specific set of step-by-step instructions in a thick binder.

1. Open this terminal emulator and follow these steps to reach screen X.

2. Open IBM VisualAge for Java and create a new Swing dialog like this.

3. Place input controls onto the dialog such that they resemble the layout of
   the terminal screen.

4. Type in the following specific Java incantations to wire up the data to the
   controls.

And that was it, for eight hours each day.

I worked with three other people. One, a close friend of mine to this day, also
got referred in through our mutual friend whose dad owned the place, and would
end up working a series of career-defining tech jobs like me. The other two were
just folks looking for work, and happy to have it.

So there I was mindlessly typing in whatever was written in this binder. What I
immediately came to realize was that only a human could look at a terminal
screen and compose a usable GUI form based on it, but a lot of the typing I was
doing was redundant. A computer could do that.

We had to give the controls very specific names, which presumably aligned to
identifiers in the underlying COBOL that ran the terminal representation, but
once we had created the GUI controls and typed in their names, we had to type a
line of Java code for each control, repeating that field name twice, that would
sync its value with the "middle layer" that connected the GUI to the mainframe.

What irked me was that I was doing this work that was repetitive but also
derivative. Some part of me that had been recreationally programming for eight
years was offended to have to type the control names into the GUI editor and
then type them two more times in the Java code.

> Why do twice what you could instead do once?
> 
> ---Abraham Lincoln, probably

## Always work to reduce your toil

Being the industrious and resourceful young man that I was, I somehow discovered
(and I honestly have no memory of how I figured this out) that IBM VisualAge for
Java had a plugin architecture and that you could write Java code to automate
all sorts of functions of the editor, or to modify projects.

I got to work.

Instead of creating new screens, I literally stopped doing my actual job and
started writing Java to automate part of my actual job. I don't think it
actually took very long but I really can't recall the details. In the end, I had
written a plugin that added an item to the package context menu in the IDE. Once
the GUI form was created, I could right click the appropriate underlying code
file, select my custom entry, and all of the data sync code would be instantly
generated.

*This will save me hours!* I thought, triumphantly. Bursting with pride, I
showed my colleagues.

My good friend thought it was awesome and, at least in my recollection, he was
duly impressed. The other two *got mad*. "We're paid by the hour!" they
exclaimed.

What happened next changed the course of my career and life in a very real way.

## I got laid off

We kept creating GUI screens, using my new plugin, until one day the word came
down that our project was getting canceled. As noted, we were hourly employees
with no contract term, so it was over for us.

Well, it was over for them. The manager of the team called me into his office on
the day of this news and offered me a *full-time job*. With a *salary*.

I enthusiastically accepted. As I recall, it was almost a poverty wage, but I
was still living at home with my parents and figuring out what I wanted to do
with my life, and a job is a job after all. They wanted me to start immediately.

I was installed in a team of other full-timers who had been working, in
parallel, on a web-based front end for the product. It seemed to me that someone
higher up made the call that building two new front-ends at once was a waste of
time and money and decided to bet on the web, which was probably smart.

So I went from writing Java and dragging GUI controls around to learning
Javascript and "DHTML," which was all the rage in those days. This went on for
some time, though I can't recall how long. Long enough that I built a rapport
with the other two guys on the project and with my manager, a colorful Scot, who
would frequently use jargon from his home country such as "[jiggery pokery][jp],"
which amused me to no end.

[jp]: https://idioms.thefreedictionary.com/jiggery+pokery

All the while, the company was in negotiations to be acquired by a large
UK-based firm, and ultimately it went through. This meant a substantial golden
parachute for my friend's father and uncle who co-founded the business, but it
also meant massive layoffs for many others, including me.

## I forgot to mention PHP

During most of the time I was dragging GUI controls around in IBM VisualAge for
Java, I was bringing my laptop to work and spending every free moment writing
very bad PHP code. This was in 1999, so PHP didn't have objects yet, and people
were running around directly referencing `$_GET` and `$_POST` to the delight of
hackers everywhere.

At that time, it was very popular to get an account on LiveJournal and
essentially put your diary online. Some people posted frighteningly personal
things, others opined about their hobbies and interests. In retrospect, this was
the beginning of the "blog" as we know it today, though as the name implies most
of these "journals" were more exhibitionist than educational or theatrical.

I briefly had a LiveJournal, but I fancied the notion of having one whose entire
appearance and feature set I could control. Such is the megalomaniacal bent of
many programmers. So, I wrote one. I used PHP because it was the hip thing to
do, and much easier than Perl for making websites.

When I was working that office job copying and pasting Java, I was rewriting the
entire online journal site from scratch, having run afoul of so many of my bad
past decisions that it was simply untenable to me, and because I had a lot of
time on my hands as a teenager.

Knowing PHP as well as I did by then would turn out to be a boon for my career,
but of course I had no idea at the time.

## My second tech job

After getting laid off, I started a two-year graphic design degree at a local
community college (one of the best things I've ever done, in honesty), and kept
programming for fun and restoring old photographs for money.

During this time, another friend-of-a-friend told me about a startup he was
working for that needed a new corporate website, and asked if I'd like to help
out with that. The company had perhaps five employees and occupied a low-rent
incubator space in a building owned by one of the two large state
universities. They offered me some near-poverty wage to work for a few hours a
week on this website project. I enthusiastically accepted.

I used PHP, of course, and I enjoyed bringing their brand to life with CSS,
which had become sort of a side passion of mine, merging my nascent graphic
design leanings with my enjoyment of code.

By the time the website was all but complete, the CEO offered me a full-time
position with a salary to continue doing web-related work for them. The pay was
just OK. I enthusiastically accepted. This would begin an incredible five-year
journey from our tiny incubator office to an acquisition by a giant consulting
company, a move to a large and beautiful office, working for one of the best
managers I've ever had, building increasingly complex web applications
effectively by myself, and eventually my only real experience with burnout,
panic attacks, and the first time in my life that I quit a full-time job.

## My third tech job, and learning ColdFusion

I have so many fond memories of working for that startup, but after the
acquisition by a large consulting company, things started to go south. It was
not as a direct result that I started to grapple with burnout, but it was timely
that my well-being caused me to look around for something different.

I followed another good friend of mine to a different startup where he'd been
working for over a year by then, and before long the previous startup was
gone. Erased from the parent company's web presence.

The new startup was cash poor but reluctantly agreed to pay me a couple thousand
less than I was previously making. In spite of taking a modest pay cut, I moved
to the waterfront city where the company was located and began some of the best
years of my life.

I learned ColdFusion on the job, wrote whatever features were desired, helped
create an entirely new product from scratch, redesigned the company's logo, made
amazing new friends, met the woman I'd end up marrying, and had a vibrant social
life that in retrospect sounds absolutely exhausting.

I worked for that company for seven years, so I could write reams about my
experiences there, and about ColdFusion (which I may do, separately). What
ultimately pulled me away was my that my friend who had referred me moved up to
Boston to take a job at an even bigger company.

I took over his role, which was somewhat more senior than mine at the time, and
carried on for nearly another year before electing to try out at some other
places. I took a couple interviews, including at the company my friend had gone
to, and ultimately ended up following him there.

## My fourth tech job, and returning to PHP

This company was rounding out a long-term initiative to translate their entire
system from Classic ASP to PHP, so I narrowly avoided having to write a single
line of ASP (though I ended up having to read a lot of it to figure out bugs).

This was how I wound up working in a Boston high-rise office building with free
coffee and snacks and writing PHP every day. Again. Of course, by now, PHP had
objects and everyone was deeply embracing OOP and MVC and separating their
business objects from their view layers and so on, but I was delighted to just
be in Vim all day, hacking code.

The rest, as they say, is history. I ended up staying at that company for
another five years, so there are reams more after this, but I'll save it for
another time.

## When did I know?

The question is, when did I know that the programming I was doing for fun for
years and years could be my job?

I think it was that moment in 1999 or early 2000 when I had created the custom
IDE plugin and my whole team got canned except for me. I realized then that not
just being able to write code, but also being able to see problems and fix them,
had real value. Value beyond a paycheck; value that set me apart.

That experience also reinforced years of hacker behaviors that I had
acquired. Always trying to figure out how things work, always trying to make
things better or easier, always trying to solve problems by myself. Programming,
in that way, was perfect for me.

I've had an absolutely staggering amount of luck in getting to where I am now,
and I owe debts of gratitude to friends and colleagues who have trusted me
beyond my expectations. The industry and the world have changed since those
days, and I want to write a post about that, too, but I'll leave you with these
words of encouragement:

* You can write code for a living
* You don't actually need a college degree (though it helps)
* The one thing that has created the most repeatable opportunity for me in my
  two-decade career is *staying curious*
