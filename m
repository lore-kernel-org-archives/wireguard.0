Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e42ab3f
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 17:39:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4604e31
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 17:39:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb7c9ed8
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 17:38:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aed0b561
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jul 2018 17:38:45 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id v8-v6so18498529oie.5
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jul 2018 10:46:42 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Jul 2018 19:46:31 +0200
Message-ID: <CAHmME9pZZeQautpRT99R-gC9sxjsodgJK_1SLHd0mwU3hCsf_A@mail.gmail.com>
Subject: "Exclude Private IPs" in Android App
To: Eric Kuck <eric@bluelinelabs.com>
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

Hey Eric,

While you're iterating on the "Excluded Applications" feature, what
would you think of also taking a stab at the "Exclude Private IPs"
feature? It's kind of in the same ballpark and works over the same
code you're currently playing with.

First some background: Some people don't want packets intended for
their local network to go through a tunnel. On desktop linux's
wg-quick(8), this is the default with some very clever use of
ip-rule(8)'s suppress_prefixlength parameter. It works perfectly 100%
of the time, without any need for heuristics. I've written to the
folks I know working on Android's networking stack to allow for the
same kind of clever thing, but if that happens, it'd of course be
quite a ways off. So in the meantime, rather than introducing a switch
called "exclude local networks", which would have all sorts of races
with detecting local networks and making decisions about network types
and such, plus the need to toggle VpnService in a racy way, etc, I
have a much cleaner idea: "Exclude Private IPs".

"Exclude Private IPs" works in the most dumb and straightforward way
possible, that is guaranteed to not fail. We add a checkbox underneath
"AllowedIPs". The checkbox is visible if "0.0.0.0/0" or ${MAGICRANGE}
is included in the AllowedIPs; otherwise it is hidden. When the
checkbox is checked, it replaces 0.0.0.0/0 with ${MAGICRANGE}. When
the checkbox is unchecked, it replaces (after sorting) ${MAGICRANGE}
with "0.0.0.0/0". ${MAGICRANGE} is defined to be  0.0.0.0/0 modulo
RFC1918:
"0.0.0.0/5,8.0.0.0/7,11.0.0.0/8,12.0.0.0/6,16.0.0.0/4,32.0.0.0/3,64.0.0.0/2=
,128.0.0.0/3,160.0.0.0/5,168.0.0.0/6,172.0.0.0/12,172.32.0.0/11,172.64.0.0/=
10,172.128.0.0/9,173.0.0.0/8,174.0.0.0/7,176.0.0.0/4,192.0.0.0/9,192.128.0.=
0/11,192.160.0.0/13,192.169.0.0/16,192.170.0.0/15,192.172.0.0/14,192.176.0.=
0/12,192.192.0.0/10,193.0.0.0/8,194.0.0.0/7,196.0.0.0/6,200.0.0.0/5,208.0.0=
.0/4"

I think this approach will be simple and consistent, and implementing
this as a static modification of AllowedIPs rather than runtime set
subtraction makes it more obvious what's going on.

What do you think of that idea?

Jason
