Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dd2b5f5
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 18:17:02 +0000 (UTC)
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
 [209.85.217.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f1b6124
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 18:17:02 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id q25so9997387uah.1
 for <wireguard@lists.zx2c4.com>; Thu, 03 Aug 2017 11:38:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
 <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
 <CAHmME9rJ7BiinhPRhOqzAjZJEdc=wKzdk80Dvi=xQnP2fu_eqw@mail.gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Fri, 4 Aug 2017 02:38:13 +0800
Message-ID: <CAF75rJDj79FU7GMa1DKxPNZ9V2dSW0+rFUDQjmEJ_z3ZDeuuGA@mail.gmail.com>
Subject: Re: Multihomed server issue
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

2017-08-03 20:59 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hi Wang,
>
> I understand your inquiry and I see what you're trying to accomplish
> with your use of ip rule and fwmark. However, *WireGuard already does
> this automatically*. We _do_ support reply-to-sender. We _do_
> supported multihomed servers. You wrote, "But I do wish that server
> can deduce public address which the client connects to, and use the
> public address to response to the client, then the configuration will
> be simple and straightforward." WireGuard _does_ do this.
>
> To demonstrate that, I've added a more explicit test of this to the test suite:
> https://git.zx2c4.com/WireGuard/commit/?id=bf44c07a805a5e40408059ac60dfc526196a3797
>
> If this is not working for you, then you're either doing something
> wrong, or you've uncovered a bug in either WireGuard or the kernel. In
> case it's the latter, would you send me a patch for netns.sh that
> demonstrated the problem in a clear way?

Your test case is straightforward. And I am confident that you're right in this
kind of setup.

But there's significant difference. In your test case, the endpoint
addresses are configured
directly on attached link. In my case, the wireguard server's endpoint
address is configured on
dummy interface, not attached link.

I reproduce the problem while using tcpdump to get some clues,

1. server can receives client's packet
2. server 'wg' output shows client's endpoint addr:port correctly
3. tcpdump on client only captures outgoing request packets, no
response from server
4. tcpdump on server only captures incoming request packets, no
response (on all physical interfaces)

I was wrong. Response is not routed via default gateway, or other
interfaces. There is NO response at all.
Very sorry for misleading.

I am not familiar with test in namespace. I will look into it.
Hopefully I can come back
with a patch.
