Return-Path: samuel@sholland.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed690268
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 06:11:03 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <1e33f311-9d18-6822-cf9e-e3d93da0af21@sholland.org>
 <CAHmME9qPjvK_nKA1X8atuAOEskifyk41Mo9OvDxoUwFp9KoCJw@mail.gmail.com>
 <CAHmME9pidMFxVh9CaVWS0PHyyzzNZrNAqdBT43Mmk80WzU00+g@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b63711bd-0e64-767e-4b8e-310a7e2c6285@sholland.org>
Date: Wed, 2 Nov 2016 01:12:07 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9pidMFxVh9CaVWS0PHyyzzNZrNAqdBT43Mmk80WzU00+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Kernel warning from WireGuard module
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

On 11/02/2016 12:39 AM, Jason A. Donenfeld wrote:
> I believe it's fixed now with the current commits in master. I'll tag
> a new snapshot if the problems go away.

Great. I don't think it caused any noticeable side-effects; I just saw
the warning.

> My question still stands, though -- is this issue repeatable, or was
> it a one-off event?

It was just something I happened to notice in dmesg. I don't know if it
has happened before because I only recently started logging kernel
messages to disk on that machine. I do note that the warning is
WARN_ON_ONCE, so it will only show up in logs once per boot.

> Thanks,
 > Jason

Thanks,
Samuel
