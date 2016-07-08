Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d59f02f
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 10:26:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7acabd22
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 10:26:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4238c7d0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 10:26:40 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id q132so26764459lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 03:26:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
References: <CAHQn_MAD4WvhueAEVR255SarPnJtfvYjREA7MFdsaJrz97EEBw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 12:26:56 +0200
Message-ID: <CAHmME9pc0JgTgCTQ6FT5ChvB+0mv8nDLA57iis9c2FA7MPSV-g@mail.gmail.com>
To: Bin Jin <bjin@ctrl-d.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Options to obfuscate WireGuard traffic?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Bin,

This is something I've thought about quite a bit. As a security
researcher I've done some research on network exfiltration from
rootkits, so here the indistinguishability attribute is interesting
too.

Generally speaking, WireGuard does _not_ aim to evade DPS,
unfortunately. There are several things that prevent this from
occurring:

a) The first byte, which is a fixed `type` value.
b) The fact that `mac2` is most often all zeros.
c) The fixed length of handshake messages.
d) The unencrypted ephemeral public key.

> The sender/receiver index,
> timestamp and counter fields also have obvious pattern.

These are not actually problems. The sender/receiver indices are
random 32-bit numbers and cannot be predicted. The timestamp is not
sent in the clear, but rather is encrypted and therefore requires the
private key of the receiver to see that it's a timestamp.


Let's go through one by one with these problems. The easiest one, (b),
could be fixed by just filling `mac2` with random data when not in
use. The hardest one, (d), is not a problem, I don't think, because
these public keys are still uniformly distributed. The amount of
public keys that would have to be collected in order to not rule out
false positives is way too big, I suspect. So, not a problem in the
end.

(a) and (c) are the tricky ones. There are a few ways to fix this. The
first is: live with (c), get rid of (a), and then make transport
messages larger, so that the type can be inferred from the length.
This might not work well with sophisticated DPS though. Alternatively,
(a) could be removed, (c) could be made random, and a different
(random) UDP port could be used. Here, though, a sophisticated DPS
could observe timings between different UDP ports on the same host.
Another approach would be moving to only PSK, and eschewing the
handshake; this seems to be what Shadowsocks chose to do. What else
could be done for (a) and (c)? Interesting discussion to be had about
these...


> widely used tunnelling program, Shadowsocks[1],

Looking at this briefly, it looks like authentication was added on as
an afterthought to Shadowsocks, and unfortunately uses HMAC-SHA1. It's
too bad they didn't use an AEAD from the start.

> I understand that it's not flexible to make major changes to the
> protocol at this moment, as it's approaching to be finalized. Not
> mention that such change will most likely hurt the performance badly.
> I just want to know if it's flexible to extend the protocol in the
> future. For example, add an option (disabled by default) to use
> another pre-shared key to symmetrically encrypt the whole packet?

Actually there's already a PSK mode. I suppose it's possible to
leverage this to add an obfuscation layer. This is likely the most
robust way of doing things, in fact. I'll give this some more thought,
but it's kind of unlikely that I'll incorporate this into the
codebase.

Regards,
Jason
