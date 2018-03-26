Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7da6c3d4
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:00:28 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dea04a38
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:00:28 +0000 (UTC)
Date: Mon, 26 Mar 2018 21:12:20 +0200
From: Luis Ressel <aranea@aixah.de>
To: Roman Mamedov <rm.wg@romanrm.net>
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180326211220.1c350824@vega.skynet.aixah.de>
In-Reply-To: <20180316142547.2ecb70de@natsu>
References: <20180316142547.2ecb70de@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, 16 Mar 2018 14:25:47 +0500
Roman Mamedov <rm.wg@romanrm.net> wrote:

> What helps, is only reducing MTU of the entire wg0 interface to 1412.
> Then everything works fine. But it doesn't feel optimal to reduce MTU
> of the entire network just because of 1 or 2 hosts. I would rather
> use a couple of those mtu-override routes, if they worked.

Unfortunately, lowering the MTU of the whole tunnel interface is the
only reliable solution right now. Per-peer configurability of MTUs has
been on project TODO for a while, so there will be a better solution
some day. I even started to work on this a few months back, but got
sidetracked.

Cheers,
Luis
