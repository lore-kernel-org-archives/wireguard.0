Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2816fefc
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 14:58:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef8fd28a
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 14:58:29 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0Llm5o-1ded6m2mmm-00ZP20 for
 <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 17:08:00 +0200
Date: Tue, 2 May 2017 17:07:59 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Doc enhancement
Message-ID: <20170502170759.63a4b750@msi.defcon1>
In-Reply-To: <21b8fecd-119c-be0f-0f21-a4f03e2cb4a4@york.ac.uk>
References: <20170502165145.2bf33eef@msi.defcon1>
 <21b8fecd-119c-be0f-0f21-a4f03e2cb4a4@york.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, 2 May 2017 15:57:49 +0100
Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk> wrote:

No, I mean e.g.: 10.11.12.1/24

at first, I thought it was a typo and added 2 'Address' lines in the
configuration file, one for the wg0 IP and one for the segment; but I
was wrong as the above notation is the way to go.
However, it is not publicized anywhere, so it took me 'some' time to
figure this out.

> Do you mean 192.168.88.0/24 ? That's the standard annotation for IP
> subnets (e.g. 10.0.0.0/16, 192.168.0.0/24, 8.8.8.8/32).
