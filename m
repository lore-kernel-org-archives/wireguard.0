Return-Path: 28387a164997@woerm.at
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21254d9f
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Dec 2017 10:35:57 +0000 (UTC)
Received: from mail.c0mm.it (c0mm.it [144.76.78.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95abd889
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Dec 2017 10:35:57 +0000 (UTC)
Received: from [77.118.148.172] (80-110-98-181.cgn.dynamic.surfer.at
 [80.110.98.181]) (Authenticated sender: c@c0mm.it)
 by mail.c0mm.it (Postfix) with ESMTPSA id 40E301FE53
 for <wireguard@lists.zx2c4.com>; Sun, 10 Dec 2017 11:43:14 +0100 (CET)
Subject: Re: LEDE Netflix bypass
To: wireguard@lists.zx2c4.com
References: <CAL++zqyRjyPH0Jm-niSGj2AN3U8y-b5FumR1tVtzzd3UESauAQ@mail.gmail.com>
From: Koala Aloha <28387a164997@woerm.at>
Message-ID: <711f5c99-4e70-82a7-e5e4-bee2a008cb4e@woerm.at>
Date: Sun, 10 Dec 2017 11:43:13 +0100
MIME-Version: 1.0
In-Reply-To: <CAL++zqyRjyPH0Jm-niSGj2AN3U8y-b5FumR1tVtzzd3UESauAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello Daniel (and hi list),

Have you seen the thread 'wireguard bypass question' [0] yet?
I think that might give you some advice on how to proceed with your
configuration.

I guess using a Linux network namespace [1], [2], [3], [4] that never
routes through your VPN, might be a solution for you. This way you won't
have to deal with figuring out which domains/ip netflix might want to
access.

If you don't always want to provide a passphrase or your user shouldn't
have root at all, you can also configure the '/bin/ip netns exec [...]'
command as 'NOPASSWD' your user via. 'visudo' in your 'sudoers.d'.

[0]: https://lists.zx2c4.com/pipermail/wireguard/2017-October/001787.html
[1]:
https://sgros.blogspot.co.nz/2017/04/how-to-run-firefox-in-separate-network.html
[2]:
http://hintcafe.net/post/78293519027/running-a-process-inside-a-network-namespace
[3]: https://blogs.igalia.com/dpino/2016/04/10/network-namespaces/
[4]:
https://github.com/Phaeilo/openvpn-namespace/blob/4bb1935dfc2c3c062b2dd84479f3194d2d8da635/firefox.sh

 - Koala
