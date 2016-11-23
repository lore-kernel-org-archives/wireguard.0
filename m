Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a1e54c8
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Nov 2016 05:47:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0268f5e
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Nov 2016 05:47:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41fe69dd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Nov 2016 05:47:49 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t79so6044955wmt.0
 for <wireguard@lists.zx2c4.com>; Tue, 22 Nov 2016 21:51:28 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Nov 2016 06:51:26 +0100
Message-ID: <CAHmME9qHaQDuFW+HNZFip-Ba7q3aXoCpHUNz06hnFezGwXbjug@mail.gmail.com>
Subject: Qt Creator for Linux Kernel Development
To: qt-creator@qt-project.org
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Eike & Qt Creator mailing list,

I'm insane and decided to try using an IDE for Linux kernel
development. Much to my delight, it actually works well. (Everybody on
the mailing list to which this message is cross-posted just vomited a
little bit in their mouth and swallowed, but fear not: I'm a competent
VIM user too. It's just that sometimes clickity clicking around Qt
Creator is buttery nice. Here's a screenshot [2].)

I'm working on a small kernel module [1], and for it I made a very
minimal .pro file to import its files into Qt Creator. I even hooked
the build/run commands up to my qemu testing rig. Seems to work pretty
well. Here's the .pro I use:

CONFIG -= qt
INCLUDEPATH = /usr/src/linux/arch/x86/include
/usr/src/linux/arch/x86/include/generated/uapi /usr/src/linux/
arch/x86/include/generated /usr/src/linux/include
/usr/src/linux/arch/x86/include/uapi /usr/src/linux/arch/x
86/include/generated/uapi /usr/src/linux/include/uapi
/usr/src/linux/include/generated/uapi
DEFINES = __KERNEL__ DEBUG MODULE
SOURCES = $$system(find -L . -type f -iname $$system_quote(*.c) -and
-not -path $$system_quote(./tests/*)) $
$system(find -L . -type f -iname $$system_quote(*.S) -and -not -path
$$system_quote(./tests/*))
HEADERS = $$system(find -L . -type f -iname $$system_quote(*.h) -and
-not -path $$system_quote(./tests/*))

As you can see, it's a real hack.

I also do development on the main Linux kernel tree, and similarly for
that, I have a .pro file that works well:

CONFIG -= qt
INCLUDEPATH = $$system(find -L include/ -type d)
SOURCES = $$system(find -L . -type f -iname \'*.c\')
HEADERS = $$system(find -L . -type f -iname \'*.h\')
INCLUDEPATH = include/ arch/x86/include

Download the linux sources, put that in the tree, and load it up in Qt
Creator. It works. Amazing!

But don't get too excited. Unfortunately, there are two issues that
make things unbearable:

(A) Qt Creator doesn't seem to parse the C correctly. Things like
designated initializers and a few other C features here and there just
don't get parsed correctly, and the IDE stops being useful. I suspect
this is because things are actually being parsed in C++ mode. Bummer.
Developers: any interest in improving C support in Qt Creator?

(B) There is no way to tell Qt Creator that a particular header file
is included in every file -- that is, that gcc's "-include" is in use.
There is a way of messing with the "C++ Code Model" on a file-by-file
basis, for the duration of the time that the file is open, but no way
to automatically have it included in every file of the project. This
is a major hindrance. It means that every ifdef for every kconfig
option is a grayed out unclickable region, rendering most things
useless. Developers: any interest in fixing this? I spoke to a few of
you in IRC several months ago about this, and there was interest, but
it seems to have evaporated.

So, anyway, if you think it would be cool to be able to say, "Qt
Creator is used for Linux Kernel Development!", then maybe we can work
together to actually get things working properly. It's already 85%
there, and the remaining chunk seems well within reach.

Not only that, but if Qt Creator becomes generally usable for ordinary
C projects, it would most likely become a regular tool during my
professional activities, namely, auditing large code bases for
vulnerabilities and improving the security of systems.

Let me know if you are interested in assisting with this.

Thanks,
Jason



[1] https://www.wireguard.io/
[2] https://data.zx2c4.com/qt-creator-wireguard-development.png
