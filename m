Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95833ee5
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:46:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3d78b91
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:46:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c7ba4cd8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:46:56 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id l69so29654261lfg.1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 04:48:07 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jul 2016 13:48:04 +0200
Message-ID: <CAHmME9rzLfAs+rX_a7sH4Mu44FC4=uS=snHL0gr_mfkT1ahoNg@mail.gmail.com>
To: codl <codl@codl.fr>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] WireGuard link detection
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Codl,

CCing the mailing list on this.

On Fri, Jul 15, 2016 at 9:46 AM, codl <codl@codl.fr> wrote:
> Hi Jason,
>
> On Fri, 2016-07-15 at 03:01 +0200, Jason A. Donenfeld wrote:
>> What do you mean exactly by the tunnel going up and down? Like "ip
>> link set wg0 up"? Or something else?
>
> I suppose a better way to put it would be the health of the tunnel: is
> it functional, are packets going through?
>
> My use case is a tunnel initiated from a laptop that's roaming between
> different networks. Some of those networks may have strict firewalls
> that block UDP entirely. In those cases I'd like to automatically
> change some routes and route some things over the public internet
> instead.
>
> I do realise that WireGuard's protocol is very light and that as a
> result there aren't a lot of ways it can tell if a tunnel is healthy,
> but perhaps if a number of handshake attempts have failed a tunnel
> could be considered unhealthy (and wg could run a user-defined
> command), and healthy again on the first successful handshake after
> that (again, running a user-defined command)
>
> --
> codl

In fact, WireGuard internally monitors the handshake, but by default
goes silent when no packets are being sent. However, if the
persistent-keepalive option is used, a session is kept alive always,
with WireGuard aware when it's having difficulty establishing one.

However, as you mentioned, this information isn't communicated to
userspace. Maybe communication of this information is something that
could be exported over NF_LOG? But most likely, it's not really
correct to export it like that.

Traditionally pathological network people invent new protocols to
handle failover like this, such a VRRP. I really doubt you want that
kind of complexity though.

Two things you could do in bash instead is either:
    - Ping every X seconds, and adjust your routing if a ping changes.
    - Use 'ip monitor route' to learn when routes go up and down, and
do a ping at that point.

It's likely you'll need something like the latter, anyway, for
roaming, if you're forwarding all your traffic. I use a script like
this -- https://gist.github.com/zx2c4/1ad796372619ad76cf9526cbf9938973
. Adding ping capabilities to it would be an okay place to start.

Hope this helps,
Jason
