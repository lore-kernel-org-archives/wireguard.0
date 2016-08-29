Return-Path: dave.taht@gmail.com
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
 [209.85.214.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 285a376f
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 21:04:28 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id g62so6191948ith.1
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 14:11:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qE0FAq5=8rOoYDS+89gOPJo4Us76+e9sndU1LLrqu__A@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
 <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
 <CAA93jw77n=zkgyney+=hJZDs-56YAeA7bZvfeoh7eedB=zw0ag@mail.gmail.com>
 <CAHmME9qE0FAq5=8rOoYDS+89gOPJo4Us76+e9sndU1LLrqu__A@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 29 Aug 2016 14:11:16 -0700
Message-ID: <CAA93jw7Ndd8UVHT8RzzA35me9bdfhSCA=d1qYVgLbHtAeAtB9A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

well, you should see ect(3) if you pound the network interface. Things
like tcp small queues get in the way so you won't see it with a simple
single flow test against cake/codel/etc.

something like 4 netperfs will do it.

Since you are so fast at getting code running, I think you'll like
flent as a test tool. It's pretty easy to install:

sudo apt-get install python-matplotlib python-qt4 netperf fping # some
distros don't include netperf tho

# you only need netperf's netserver running on the clients

git clone https://github.com/tohojo/flent.git

cd flent; sudo make install
netserver -N # wherever you have targets

It has a zillion tests, lets you plot the results, over time, etc,
etc. The rrul test, in particular, would be a good stress test of your
code. You can see usage of flent (formerly known as netperf-wrapper)
all over the web now....

example test script (with a title of what I'm testing now)

#!/bin/sh

for i in 1 2 4 8 12 16 24;
do
flent -t "unencrypted-ht40-$i-flows-osx-ether" -H 192.168.1.201 -l 30
--test-parameter=upload_streams=$i tcp_nup
flent -t "unencrypted-ht40-$i-flows-osx-ether" -H 192.168.1.201 -l 30
--test-parameter=download_streams=$i tcp_ndown
done

flent -t "unencrypted-ht40-$i-flows-osx-ether" -H 192.168.1.201 -l 30 rrul_be
flent -t "unencrypted-ht40-$i-flows-osx-ether" -H 192.168.1.201 -l 30 rrul

flent-gui *.gz

# Anyway, I'll join you in irc to look over what you doing.....
