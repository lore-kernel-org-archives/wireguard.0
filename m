Return-Path: jannis@pinterjann.is
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53f4bf04
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 May 2017 01:15:25 +0000 (UTC)
Received: from mail.pinterjann.is (mail.pinterjann.is [37.120.169.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77f266ac
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 May 2017 01:15:25 +0000 (UTC)
Subject: Re: Compatibiliyt issues between 0.0.20170115 and 0.0.20170517
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <16c492cb-af24-e864-cd49-c8c2c5457ee4@pinterjann.is>
 <CAHmME9osBYxRKFwSCroHcpORdCj8d8x1=WrE=6iR0DRofB=rAg@mail.gmail.com>
From: Jannis Pinter <jannis@pinterjann.is>
Message-ID: <b17e4f7a-9ecc-f674-26dd-f16f7c7afedc@pinterjann.is>
Date: Fri, 19 May 2017 09:26:54 +0800
MIME-Version: 1.0
In-Reply-To: <CAHmME9osBYxRKFwSCroHcpORdCj8d8x1=WrE=6iR0DRofB=rAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


Am 19.05.2017 um 02:43 schrieb Jason A. Donenfeld:
> Only use 0.0.20170517.
Thanks! I hoped not up recompile and upgrade my routers firmware, since
I'm currently at the other side of the planet.

Also the new wireguard version is only available for the development
branch of LEDE. The stable branch still runs 0.0.20170115. I'll contact
the LEDE devs regarding that.

> i know we're in early days with wireguard, and there's no guarantee of
> protocol compatibility.  but i wonder whether we should signal
> explicitly when there is an update that requires both sides to upgrade
> at the same time.
>From the user perspective, it would be nice if incompatible versions
were clearly signaled.

Regards,
Jannis
