Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b6009de
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:44:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f40259f4
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:44:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a464b4d
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:44:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2fc96b1b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Jan 2017 10:44:56 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id u143so86415601oif.3
 for <wireguard@lists.zx2c4.com>; Sun, 15 Jan 2017 02:55:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <F343B5F3-4A99-4F0D-B5BE-DBDC0CDECE09@danrl.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
 <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
 <CANA3KFWZP9XmCyWNnb19ywGRa8q57OUNt=42G1yjqkvLYc1kPw@mail.gmail.com>
 <CAHmME9qG4KnuFOCVi6w8fUJ9DVDL9_XjZnWxWPQGQaaPz6UTQw@mail.gmail.com>
 <CANA3KFUyf6NP9hu5i0rWfaKq7a27NQhWg4z-LE2SnTHTrbKM9g@mail.gmail.com>
 <F343B5F3-4A99-4F0D-B5BE-DBDC0CDECE09@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 15 Jan 2017 11:55:16 +0100
Message-ID: <CAHmME9rzi6W0m7_aLx4jTDCW2hFhEtkdWiMOQ6SNenrc8uEVyA@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Peter Dolding <oiaohm@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Jan 15, 2017 at 9:39 AM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
> Although I see the problem and ran into it myself, I would like to see a =
solution outside the
> wireguard code. Like the one Jason proposed or even a new approach. I am =
afraid that
> network layers problems (legacy IP and especially NAT) are about to uglif=
y yet another
> beautiful protocol.

Yea -- worry not. I'm not going to add big cludges into core
WireGuard. I would like to provide some useful facilities for people
to do interesting composable solutions to disgusting networking
problems. But I think this solution space is more in the realm of
"API" than "protocol".

I could also imagine people making "wireguard UDP proxy daemons" --
little programs that listen on 127.0.0.1:xxxxx and then forward
packets to some dynamically learned MySQL-connected ASN1-parsed IP
while doing things like "if multiple packets that start with a 0x1 and
are 148 bytes long are sent in a row, the server has probably changed
IPs and we should get STUNed again".

Or, maybe this kind of proxy is objectionable and people would prefer
to use netlink notification for connectivity events instead.

Either way, there's plenty of room for building terrible things _on
top of_, rather than inside of, wireguard.

> My concerns expressed and all that said, I would love to see some code or=
 PoC. Code and pcaps are king :)

:) As the Reverend Doctor Pastor says, PoC||GTFO.

> Wireguards roaming feature tool care of the sites where even the ipv6 pre=
fix changes from time to time.

Or when your laptop or cellphone is moving around between IP addresses
frequently.
