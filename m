Return-Path: linux-wireguard@vittgam.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f39f28fe
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 06:19:28 +0000 (UTC)
Received: from mail.vittgam.net (server1.vittgam.net [213.239.197.142])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b470bb6b
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 06:19:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sun, 11 Dec 2016 07:25:19 +0100
From: "Vittorio G (VittGam)" <linux-wireguard@vittgam.net>
To: "Jason A. Donenfeld" <jason@zx2c4.com>
Subject: Re: [PATCH] contrib: Set addrgenmode to none for WireGuard interfaces.
In-Reply-To: <CAHmME9orxv2MJYNr+7fop8SXwXfgayEswB2-t1yBnBKJiPHEQg@mail.gmail.com>
References: <201612101631.uBAGV8fe049290@mail.vittgam.net>
 <CAHmME9orxv2MJYNr+7fop8SXwXfgayEswB2-t1yBnBKJiPHEQg@mail.gmail.com>
Message-ID: <72e2362ff315d4ecc4c38307e0a2d71c@vittgam.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jason,

On 11/12/2016 02:46:47 CET, Jason A. Donenfeld wrote:
> Thanks for bringing my attention to addrgenmode. At first I tried
> fixing this with [1], but this broke tcpdump, so I reverted it with
> [2]. Now, thanks to you, we have [3], which hopefully is the correct
> way to do things and will be part of the next snapshot if it survives
> testing.

Perfect, this seems to be the right way to go indeed! It seems to be
working fine.

By the way, minor nitpick: in [2], the comment now says that
ARPHRD_NONE is virtually the same as itself...

> [1] https://git.zx2c4.com/WireGuard/commit/?id=9f0db72ffcae21a2c6e965f084873a64fea82958
> [2] https://git.zx2c4.com/WireGuard/commit/?id=0311d78316a0544b35705468de1021ff48335142
> [3] https://git.zx2c4.com/WireGuard/commit/?id=40b0e8d5b1669cd4be32965a1a60cbb63562512c

Cheers,
Vittorio
