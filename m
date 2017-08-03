Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f272b6ed
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 12:38:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cda83174
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 12:38:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8085255e
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 12:57:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b7f8c64d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 12:57:03 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id j32so6686599iod.0
 for <wireguard@lists.zx2c4.com>; Thu, 03 Aug 2017 05:59:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 3 Aug 2017 14:59:10 +0200
Message-ID: <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
Subject: Re: Multihomed server issue
To: Wang Jian <larkwang@gmail.com>
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

Hi Wang,

I understand your inquiry and I see what you're trying to accomplish
with your use of ip rule and fwmark. However, *WireGuard already does
this automatically*. We _do_ support reply-to-sender. We _do_
supported multihomed servers. You wrote, "But I do wish that server
can deduce public address which the client connects to, and use the
public address to response to the client, then the configuration will
be simple and straightforward." WireGuard _does_ do this.

To demonstrate that, I've added a more explicit test of this to the test suite:
https://git.zx2c4.com/WireGuard/commit/?id=bf44c07a805a5e40408059ac60dfc526196a3797

If this is not working for you, then you're either doing something
wrong, or you've uncovered a bug in either WireGuard or the kernel. In
case it's the latter, would you send me a patch for netns.sh that
demonstrated the problem in a clear way?

Thanks,
Jason
