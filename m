Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9cf4d4a
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 20:22:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a234efb
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 20:22:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9c2bde4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 20:22:40 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id f6so63536007lfg.0
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 13:25:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160630163226.GJ3952@sliepen.org>
References: <20160630163226.GJ3952@sliepen.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2016 22:25:29 +0200
Message-ID: <CAHmME9pxLWBt+=KMfRrmz==NsOc4VB0Pw2ukPAFoHgHSZEaKCg@mail.gmail.com>
To: Guus Sliepen <guus@tinc-vpn.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Allowing out-of-band communication with peers
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Guus,

I'm thrilled to receive your feedback on WireGuard. As the author of
tinc, you've certainly thought about a lot of these issues before, and
your input is most welcomed.

I had thought about this exact thing a bit ago, and decided to hold
off on it until the core of WireGuard was stabilized. But I suspect
this kind of generic OOB message is something could certainly be
incorporated down the line.

The idea, more specifically, would be that we introduce another packet
type. The format and fields are identical to the ordinary data packets
-- they have a nonce, chacha20 encryption, and the poly1305
authentication tag -- except rather than pass the decrypted payload
off to the rest of the networking stack as an skb, it's passed up to
userspace via a netlink socket. Then, others could build whatever they
wanted on top of WireGuard. I'll certainly consider implementing
something like this. Of course this isn't the sort of thing that
should be added hastily or designed willy-nilly, so I plan to let the
various use cases of WireGuard organically develop first, and then
analyze those.

As for notifications... right now we use ioctl rather than netlink,
for reasons described in [1]. If at some point we move to using
netlink, then we could use the netlink notification infrastructure for
this sort of thing.

Regards,
Jason


[1] lkml.iu.edu/hypermail/linux/kernel/1606.3/02833.html
