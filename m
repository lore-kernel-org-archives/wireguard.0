Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99af917f
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 16:07:46 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [IPv6:2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7b6990b
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Jul 2018 16:07:46 +0000 (UTC)
Date: Fri, 13 Jul 2018 21:15:26 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Subject: Re: receive: use gro call instead of plain call
Message-ID: <20180713211526.5ead23b8@natsu>
In-Reply-To: <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
References: <CAHmME9rP8fE7U9VxLauQ_Ee-w6ox-DAAFkvAOjx52bxGT58w4w@mail.gmail.com>
 <580E3DE0-4D06-46C5-A972-96C1F687A7B7@abelbeck.com>
 <F0797C8C-D288-4531-A21F-4FD38764544A@lonnie.abelbeck.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, 13 Jul 2018 08:49:45 -0500
Lonnie Abelbeck <lists@lonnie.abelbeck.com> wrote:

> For certain lower-end x86 boxes I test, I noticed WG 0.0.20180708 w/NAPI actually slowed down receive performance.
> 
> Jason recently added "receive: use gro call instead of plain call" [1] commit, which made a big performance improvement.

Yes I'm also seeing about 20% higher performance with this patch (from 1.3-1.4
to 1.6 Gbit on same-host VMs). This is awesome!

...and... if I switch TCP Congestion Control from bbr to illinois on sender, I
now get 2.0 Gbit. WTF. :)

Lonnie, which one do you use on your hosts? Try with illinois (it was the best
choice among all of them from my tests before bbr) and bbr (this one tends to
get a bit lower speeds overall, but ramps up so much faster at the start).

-- 
With respect,
Roman
