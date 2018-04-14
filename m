Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bee365f
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:24:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d402e009
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:24:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb16261e
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:15:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 223f6245
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:15:43 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id h11-v6so634440oic.3
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 18:38:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316142547.2ecb70de@natsu>
References: <20180316142547.2ecb70de@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 03:38:46 +0200
Message-ID: <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
Subject: Re: Mixed MTU hosts on a network
To: Roman Mamedov <rm.wg@romanrm.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Roman,

I think that your idea of setting a route-based MTU _should_ work, and
it seems like a bug if it isn't working. There are two places in
WireGuard which directly touch the MTU:

1) When we split GSO superpackets up into normal sized packets. This
code is supposed to be aware of the per-route MTU you've set, so it
shouldn't be a problem. This is the call to skb_gso_segment in
device.c.

2) When we pad the packet payload. In this case, we pad it to the
nearest multiple of 16, but we don't let it exceed the device MTU.
This is skb_padding in send.c. This behavior seems like the bug in
your particular case, since what matters here is the route's MTU, not
the device MTU. For full 1412 size packets, the payload is presumably
being padded to 1424, since that's still less than the device MTU. In
order to test this theory, try setting your route MTU, as you've
described in your first email, to 1408 (which is a multiple of 16). If
this works, let me know, as it will be good motivation for fixing
skb_padding. If not, then it means there's a problem elsewhere to
investigate too.

I'm CC'ing Luis on this email, as he was working on the MTU code a while back.

Regards,
Jason
