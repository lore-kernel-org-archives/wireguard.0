Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e75c60fa
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 15:14:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6c32a43
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 15:14:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9c378ec
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 15:14:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5b4c9103
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 15:14:41 +0000 (UTC)
Date: Wed, 15 Nov 2017 16:18:54 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: Blind Operator Mode - A Defensive Rootkit
Message-ID: <20171115151852.GA23957@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

One of the strengths of WireGuard is its visibility. wg(8) is a tiny tool
that's easy to use, and you can configure and reconfigure everything at
runtime, examining the current configuration, and doing other various things.
It works well and for the most part people seem to like it.

It turns out that this strength might actually be a weakness for some. A small
commercial VPN provider approached me recently about the fact they could see
the allowed IPs mapping easily with WireGuard, whereas with OpenVPN it was
hidden deep inside a process they didn't know how to debug. "Great," I
thought. Not so fast. They were concerned that when compelled to retrieve this
kind of information, they would no longer be able to claim, "we don't know
how," since WireGuard makes it so easy. So, they hired me for a day to develop
and open source a small solution for their unique use case and odd scenario.

Before reading further, do you have the same bizarre requirement? Probably
not. In that likely case, please keep reading only under the scope of,
"something somebody else thought they needed, but I don't need myself." In
other words, don't use this code.

Not wanting to hack up WireGuard or add configuration nobs -- or really
compromise any of what the project is about in response to these kinds of
requests -- I thought I'd write a small "defensive rootkit," which most
certainly kills both your kitten and your neighbor's parrot.

It started out by just hooking the Netlink API to zero out the endpoints and
allowedips for each peer. Then I disabled tcpdump. Then I disabled /dev/mem,
/dev/kmem, /dev/port, /proc/kcore, and module loading. Things were looking
fairly clean, until I needed to add compatibility support for old kernels, and
then I reverted to some cthulhu-style x86 opcode parsing and writing to proc
from kernelspace and other atrocities. It seems to work relatively well on
the kernels I've tested, but of course there are no guarantees with this kind
of stuff. In any case, there aren't very many public rootkit examples like
this, so at the very least it might be an aid to a college freshman doing an
assignment for his "Intro to Computer Security" course.

Keep in mind that there are several ways to subvert each and every defense
that this thing introduces. Several ways! All of the defenses! Subverted! For
that reason, you shouldn't use this if you're relying on the impossibility of
subversion. It's only meant as a confinement based on your own lack of
knowledge on how to subvert it. As you learn more, the software becomes less
effective.

If it's of any interest, it's online here:
https://git.zx2c4.com/blind-operator-mode/about/
https://git.zx2c4.com/blind-operator-mode/tree/blind-operator-mode.c
$ git clone https://git.zx2c4.com/blind-operator-mode/

Enjoy! Please don't run this monster at home!

Jason
