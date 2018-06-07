Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b33109c
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 07:37:07 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05adcb1d
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 07:37:07 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 07 Jun 2018 09:40:08 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: jason@zx2c4.com
Subject: [Uber low priority] Linux 4.17.0 on aarch64
Message-ID: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Just want to report that I can't add a wg interface of type wireguard 
with linux 4.17.0 on aarch64 (Raspberry Pi 3).

Error message: `RTNETLINK answers: Operation not supported`.

I'm using ArchLinuxARM. Downgrading to 4.16.x makes the issue dissapear. 
This is not high-priority so please Jason, if you're reading this 
message, move this issue further down in your debugging queue as I 
believe almost nobody is using 4.17.0 on aarch64 right now. Maybe 
they'll fix the error by themselves in the coming 4.17.x releases.
