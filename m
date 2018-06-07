Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9198cb01
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 08:18:26 +0000 (UTC)
Received: from rei.romanrm.net (rei.romanrm.net
 [IPv6:2400:8902::f03c:91ff:feca:2647])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6a22f8b
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 08:18:26 +0000 (UTC)
Date: Thu, 7 Jun 2018 13:21:26 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Riccardo Berto <riccardo@rcrdbrt.com>
Subject: Re: [Uber low priority] Linux 4.17.0 on aarch64
Message-ID: <20180607132126.1ceafbfe@natsu>
In-Reply-To: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
References: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
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

On Thu, 07 Jun 2018 09:40:08 +0200
Riccardo Berto <riccardo@rcrdbrt.com> wrote:

> Just want to report that I can't add a wg interface of type wireguard 
> with linux 4.17.0 on aarch64 (Raspberry Pi 3).
> 
> Error message: `RTNETLINK answers: Operation not supported`.
> 
> I'm using ArchLinuxARM. Downgrading to 4.16.x makes the issue dissapear. 
> This is not high-priority so please Jason, if you're reading this 
> message, move this issue further down in your debugging queue as I 
> believe almost nobody is using 4.17.0 on aarch64 right now. Maybe 
> they'll fix the error by themselves in the coming 4.17.x releases.

Did you actually compile the wireguard kernel module? Or rely on mysterious
"them" to do so?

-- 
With respect,
Roman
