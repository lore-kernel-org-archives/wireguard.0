Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37a3200f
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 19:29:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f228ec5b
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 19:29:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df9e5134
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 19:29:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45e6edbf
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 19:29:43 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id d27so15772540ote.11
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 11:36:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171204192752.GB5311@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
 <20171204172937.GA11936@black.transpect.com>
 <CAHmME9oksyuGfxEAxeoSmdwaiYhLZjyVSeZc7LCCYcc3KwnRLg@mail.gmail.com>
 <20171204192752.GB5311@black.transpect.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Dec 2017 20:36:22 +0100
Message-ID: <CAHmME9pGZqiKEnjB+6p1-pC+YjMF3KFLUoPAQfhUaCy+mh5=PQ@mail.gmail.com>
Subject: Re: What are the options for stopping and starting?
To: Whit Blauvelt <whit@transpect.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Dec 4, 2017 at 8:27 PM, Whit Blauvelt <whit@transpect.com> wrote:
> While it's obvious wg-quick is a special purpose script, the precise niche
> it's good for is underspecified; as is the incompatibility of the resulting
> extra lines in the conf files. So if you were going to expand the docs to
> avoid confusing average sysadmins like me, those would be nice things to
> add.

Patches and documentation contributions welcome.

> although wg-quick has some daemonic properties

No, it has exactly zero "daemonic properties". All calls to fork(2)
are quickly followed by either an exec(3) or an _exit(2), and every
child terminates prior to its parent. The parent itself never becomes
a session leader or detaches from its own parent. In other words,
wg-quick is a normal boring bash script.

> It's natural in that metaphor of "service" to ask how to "turn it on" and
> "turn it off." Okay, so "ip link set wg0 down" is the off switch; and "wg
> setconf wg0 wg0.conf" is the on switch?

No. As mentioned before, the reverse of `ip link set wg0 down` is `ip
link set wg0 up`.

> If so, it's just a bit unusual to have the off switch be outside of the
> product (wg), while the on switch is inside it. Each command makes sense;
> having them be so far apart is an unusual placement.

The linux kernel networking stack uses ip(8) and the iproute2 set of
commands as the standard way of configuring the networking state of
the system. The place to complain about this would probably be the
netdev sublist of LKML, but I sincerely doubt you're going to convince
them to change two decades of userspace APIs.

> I respect you're
> adherence to KISS here. Yet an additional option like "wg setconf wg0
> standby" (to set the link down while perserving the options if possible), or
> "wg setconf wg0 off" (to turn it off and lose option settings) would fulfil
> the user's expectation of the on switch and the off switch being found in
> the same place. In a way it simplifies the interface to have features where
> people most naturally look for them.

As has been written prior, `ip link set wg0 up` and `ip link set wg0
down` are what you're looking for.


> Now that I understand it, I've got no problem with it. I'm just pointing out
> that for the next new user, unless the docs further explain this, the same
> confusion could occur.

If you'd like to write an beginner's tutorial to iproute2, and then
add a section on wg(8), be my guest. Probably many people would
benefit.

As was written to you prior, please take additional inquiries to
#wireguard on Freenode where we can help you in real time.

Thanks,
Jason
