---
title: "A Celebration of CFQUERY"
date: 2021-01-03T13:14:05-05:00
---

As the byline of this blog can attest, I was once a ColdFusion developer. In
fact, I wrote ColdFusion professionally for about seven years, which is long
enough to learn all of its dirty secrets and come to appreciate its (few)
strengths.

Here's a controversial take: ColdFusion has the best SQL interface for
developers, period.

Having used SQL interfaces in ColdFusion, PHP, Python, Ruby (Rails), and Java
(8), I can say with some confidence that, at least to my taste, ColdFusion's
implementation of the modest SQL query is far and away the most elegant. Prove
me wrong. Or, wait, read the rest of this thing first.

<!--more-->

Before I get hundreds of angry comments, tweets, and emails, let me take a
paragraph to calm you all down a little bit. I don't have the audacity to claim
that ColdFusion's SQL query paradigm is best suited to any particular purpose,
or is even objectively the best on any given axis of measure for a modern
application architecture. It is, however---and again, to my mind---the simplest
I've seen to offer ergonomics **and** security **out of the box**. The last part is
important because virtually all other languages have a framework or helper that
meets the security and ergonomics qualifications, but is not in the core API of
the language.

If you haven't written ColdFusion before, and let's be honest that is the vast
majority of you, allow me to introduce you to `<cfquery>`.

Actually, let me first introduce you to ColdFusion, since I suppose few of you
have ever even seen it before.

## Introducing ColdFusion

ColdFusion was created by Allaire Corporation (remember them? If you do, you're
as old as me... Maybe I'll eventually do a post about my abiding love for
HomeSite, the best HTML editor that was ever created) back in 1995. In 2001
Allaire was acquired by Macromedia, and in 2005 Macromedia was acquired by
Adobe.

I started writing ColdFusion around 2006, and used one of the earlier versions
released under Macromedia's brand (ColdFusion MX 6 or ColdFusion MX 7), but as
far as I know, very little ever changed about the core syntax of the language.

ColdFusion was a response to the challenges of creating dynamic websites at the
time, where chief among them was just getting dynamically selected or
dynamically generated bits of HTML onto a page. In 1995, nobody had any idea of
what a "template language" was, and many sites were built by Perl scripts
concatenating strings of HTML.

The allure of ColdFusion was that it used tags, just like HTML, so ColdFusion
code and HTML code could live directly within the same document. Here is an idea
of what that often looked like:

```.html
<cfset allNames = ["Daniel", "Johnny", "Miguel", "Robby", "Hawk"]>
<ol>
    <cfloop array="#allNames#" item="name">
        <li><cfoutput>#name#</cfoutput></li>
    </cfloop>
</ol>
```

When the ColdFusion server executed a script, it essentially spat out the HTML
as-is, interpreted ColdFusion tags in-place, and output the content of
`<cfoutput>` tags with variable interpolation. This allowed a developer to
author a whole HTML page "in the usual way," sprinkling special ColdFusion tags
wherever necessary to get the desired result.

ColdFusion tags all start with `cf` and most accept some list of named
parameters that are expressed in the style of HTML properties (see "item" in the
example above).

Where ColdFusion starts to deliver some real value for building larger websites
is when you use smaller ColdFusion scripts as included templates, using
`<cfinclude template="literally-any-file">`. ColdFusion files are interpreted
(and their own output buffered into the main page's output) and non-ColdFusion
files are output statically. This allowed us to create more complex arrangements
of reusable parts.

That said, this whole paradigm of mixing the literal HTML of your website with
a dynamic scripting language was bonkers, led to total chaos in larger sites,
and made it really hard to refactor things over time.

Anyone who wrote old-fashioned PHP (`<?="Hey remember me?"?>`) can probably
relate (I did that for money, once, too).

But nonetheless, it is from these humble SGML-esque roots that the power of our
query interface is born, and so let us finally (*finally*) dive into the
incredible `<cfquery>` tag.

## Introducing `<cfquery>`

Just like every other ColdFusion tag, `<cfquery>` can appear anywhere within
your ColdFusion script, even mixed among HTML... And it frequently did. Now,
that by itself is pretty bad practice, but the absolute simplicity and safety of
this design is awesome.

Let's take a look at an example and then I'll enumerate the ways in which it
still captures my heart, even after writing Rails, Symfony, and Django.

```.html
<cfquery
  name="allEmployees"
  dataSource="companyDB"
  result="employees">
    
  SELECT   firstName AS first,
           lastName AS last,
           department AS dept,
  FROM     employees
  WHERE    homeOffice = <cfqueryparam value="#officeId#" cfsqltype="CF_SQL_INTEGER">
  ORDER BY startDate ASC
</cfquery>

<table>
    <tr>
        <th>First</th>
        <th>Last</th>
        <th>Dept.</th>
    </tr>
    <cfloop query="allEmployees">
        <tr>
            <td><cfoutput>#first#</cfoutput></td>
            <td><cfoutput>#last#</cfoutput></td>
            <td><cfoutput>#dept#</cfoutput></td>
        </tr>
    </cfloop>
</table>
```

OK, absorb that for a moment. The first thing, and one of the biggest for me, is
that you can write long-form SQL statements the way you would in a SQL client,
format them as you like, and make them totally legible. Because the entire body
of the `<cfquery>` tag is interpreted as a query, you don't need to do awkward
string concatenation as you do with many, many other query interfaces that
accept a SQL statement as a string.

That benefit should become instantly clear to any of you who have built up
queries with multiple joins and tried to get the resulting string expression to
look even mostly human-readable while still appeasing whatever style conventions
the project is subject to.

Second, you *cannot* pass dynamic values into the query without using
`<cfqueryparam>`. Because `<cfquery>` accepts only a literal body, you cannot
interpolate strings within it at all, and the only way to introduce dynamic
values is through this one tag, you have *instant, mandatory SQL injection
protection*. There is literally no way to pass unquoted values into SQL queries
in ColdFusion.

That isn't to say that ColdFusion is un-hackable; I'm sure there are bugs or
edge cases around providing the wrong parameter types or exploits using buffer
overflows or other such things, but unlike *most other languages*, this
first-class SQL query interface prevents a developer from doing stupid things
with SQL query strings.

As a sidebar, the same as true for `<cfoutput>`; there is no way to output
values onto a webpage that are not quoted for HTML entities, which also prevents
the majority of XSS attacks.

Third, and finally, this query implementation provides you with totally rational
structured data **out of the box**. You don't need to install any additional
library or framework to be able to access query rows and columns by name (or by
alias, as shown above), and `<cfloop>` even has a special `query` argument
that automatically iterates over a query's result for you

You would typically reference the query object directly ("query" is a special
data type in ColdFusion), but `<cfquery>` can be instructed to return query
results in other formats, too, like ColdFusion's native "struct" (dictionary,
associative array, map, or whatever you want to call it), a multi-dimensional
array, or even json.

## Lamenting the death of ColdFusion

For all of its (many) faults, ColdFusion had a really excellent query
interface, and it enforced security best practices in the simplest and most
airtight way that I've seen. I do, now and then, miss writing it, although
nobody in their right mind today would reach for a commercial server platform
with a highly limited ecosystem when building a side project.

I hope that I've been able to give you a glimpse into why ColdFusion captured
the hearts and minds of many web developers in the late '90s and early '00s, and
perhaps it has given you a new perspective on the ORMs that you use now.
