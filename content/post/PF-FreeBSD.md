---
title: The Basics of FreeBSD's PF Firewall
author: Matthew Pherigo
description: |
    This tutorial will teach you the basics of using FreeBSD's PF, starting with
    a simple one-computer ruleset and expanding until it becomes the firewall
    for a network.
date: "2015-02-18"
categories: [ FreeBSD, Firewall, Tutorial, PF ]
tags: [ FreeBSD, Firewall, Tutorial, PF ]
---

**This tutorial assumes you're running FreeBSD 10 or 10.1.**

What is PF?
-----------

PF, or *Packet Filter*, is a dead-simple and blazingly fast firewall, first
introduced in [OpenBSD][] 3.0. Up until that time, OpenBSD had been using the
popular IPFilter firewall, a great piece of software until the creator suddenly
announced that -- surprise! -- the license terms didn't allow its modification.
The OpenBSD developers, being the beastly coding machines that they are,
stripped out all traces of IPFilter and replaced it with a brand-new firewall:
PF. This new firewall, as suddenly as it was developed, performed as well (or
better) then IPFilter and iptables, and it quickly proliferated to the other
BSDs, including FreeBSD, NetBSD, and DragonflyBSD.

Since maintaining a multi-platform kernel module is quite a task, each BSD's
version of PF is a little bit different from any other. These differences
mainly lie in the version of PF was originally ported. FreeBSD's version of PF
was based on OpenBSD 4.5, and the syntax of the two platforms has diverged
notably, so be sure to specify *FreeBSD* in any search queries.

[OpenBSD]: http://www.openbsd.org/

Two Minimal Config Files
------------------------

PF has an easy-to-read syntax similar to English grammar, stored in the 
configuration file `/etc/pf.conf`. If it doesn't exist yet, create it:

```bash
sudo touch /etc/pf.conf
```

And insert this tiny config.

    # pf.conf
    pass in
    pass out

Now we're going to load the PF service, like so:

```bash
sudo kldload pf
sudo sysrc pf_enable=YES
sudo sysrc pflog_enable=YES
```

```html
<pre><code class="bash">sudo touch /etc/pf.conf</code></pre>
```

```c
unsigned int flips;
const char* errstr;
unsigned int i;

flips = (unsigned int)strtonum(argv[1], 1, UINT_MAX, &errstr);
```

### The Most *Secure* pf.conf

    block in
    block out

See Also
--------

[*The Book of PF*, 3rd Edition](http://www.nostarch.com/pf3) by Peter N.M. 
Hansteen

[PF - from the FreeBSD 
Handbook](https://www.freebsd.org/doc/handbook/firewalls-pf.html)

[pf.conf(5)](https://www.freebsd.org/cgi/man.cgi?query=pf.conf&sektion=5)
