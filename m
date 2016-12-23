Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5681f279
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:15:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ab31d5d
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:15:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92fdbcbe
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:15:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bab8b963
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Dec 2016 20:15:27 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id 3so97316641oih.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 Dec 2016 12:22:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAA93jw4AvTav-6Wt40ghvSX22VdE0icTMHhWyKQnOBHLdRt2DA@mail.gmail.com>
References: <ffffffffac503169@frisell.zx2c4.com>
 <CAA93jw4AvTav-6Wt40ghvSX22VdE0icTMHhWyKQnOBHLdRt2DA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Dec 2016 21:22:54 +0100
Message-ID: <CAHmME9r6N3s=GtAzV5gWDH-HjTvU2mjCrEyZxBxJ_RDX_PvWhw@mail.gmail.com>
Subject: Re: [ANNOUNCE] Snapshot `0.0.20161223` Available
To: Dave Taht <dave.taht@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Dec 23, 2016 at 9:19 PM, Dave Taht <dave.taht@gmail.com> wrote:
> I still don't understand what the change to AI_ADDRCONFIG means/does.
>
> Are you saying fe80:: addresses are useful?

This is just on the tools. Sometimes people like to specify IP
addresses in their config files for endpoints of peers:

[Peer]
PublicKey=ABCDE
Endpoint=[2607:5300:61:14f::c05f:543]:24444

And then they like to call `wg setconf` early on in their init scripts
to parse the config file and setup the interface.

I pass all endpoints to getaddrinfo, regardless of whether or not its
an IP or a hostname, since getaddrinfo is good at deciding what's what
and what to do. The problem before was that getaddrinfo would refuse
to parse v6 addresses if there wasn't an interface with a v6 address.
Removing AI_ADDRCONFIG fixes that.

https://git.zx2c4.com/WireGuard/commit/?id=bfe364e18364cdd9a1cb6fa545a3240c93a33c83
