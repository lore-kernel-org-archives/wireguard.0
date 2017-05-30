Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e181113
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 21:06:09 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1429303
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 21:06:09 +0000 (UTC)
Received: from [10.99.0.12] (unknown [38.132.107.154])
 by mail.thalheim.io (Postfix) with ESMTPSA id EED3771B8A
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 21:19:09 +0000 (UTC)
Subject: Re: openresolv dependency
To: wireguard@lists.zx2c4.com
References: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
 <CAHmME9pJEXKRhz8dbY6hrg33Ey-j6zD6O2uu125bMqx_vCKovg@mail.gmail.com>
 <20170522030211.6fb18de8@msi.defcon1>
 <CAHmME9pntk1UvFscCWsryW8eSCqzL66of0_F=H4KE0bmpZwA+Q@mail.gmail.com>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <71eafdde-eadd-e1e6-c5be-fddf8feedba8@higgsboson.tk>
Date: Tue, 30 May 2017 22:18:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9pntk1UvFscCWsryW8eSCqzL66of0_F=H4KE0bmpZwA+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2017-05-22 02:08, Jason A. Donenfeld wrote:
>
>
> On Mon, May 22, 2017 at 3:02 AM, Bzzzz <lazyvirus@gmx.com <mailto:lazyvirus@gmx.com>> wrote:
>
>     On Mon, 22 May 2017 02:41:13 +0200
>     "Jason A. Donenfeld" <Jason@zx2c4.com <mailto:Jason@zx2c4.com>> wrote:
>
>     > https://github.com/EggieCode/wireguard-ppa/issues/19 <https://github.com/EggieCode/wireguard-ppa/issues/19>
>
>     Following your comment, you could flip the resolvconf dependency from
>     a mandatory one to a a recommand or even a suggest, with a few comment
>     lines into the /usr/share/doc/README.Debian file.
>
>
> The problem is that I would like to be able to use the -x and -m switches of resolvconf, which only openresolv has. However, it appears that openresolv does not work very well out of the box on Ubuntu.
>
> So, I'm not quite sure what I can recommend to Ubuntu users as a reliable way of setting a per-interface DNS override. Or even what command I could put in wg-quick to encapsulate that kind of logic.
>
> Any ideas?
>

If I recall correctly ubuntu 16.10+ switched to systemd-resolved, which has a saner way of per-interface DNS server
(I would even say the first true DNS server per-interface resolver implementation at all on linux).
