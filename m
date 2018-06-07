Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd86d647
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 09:23:33 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6eb8fe4
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jun 2018 09:23:33 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 07 Jun 2018 11:26:32 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: Roman Mamedov <rm@romanrm.net>
Subject: Re: [Uber low priority] Linux 4.17.0 on aarch64
In-Reply-To: <20180607132126.1ceafbfe@natsu>
References: <47fd3645299195a9d127bcf718543389@rcrdbrt.com>
 <20180607132126.1ceafbfe@natsu>
Message-ID: <f324276874bdee86aea4518e16ca34f3@rcrdbrt.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2018-06-07 10:21, Roman Mamedov wrote:
> On Thu, 07 Jun 2018 09:40:08 +0200
> Riccardo Berto <riccardo@rcrdbrt.com> wrote:
> 
>> Just want to report that I can't add a wg interface of type wireguard
>> with linux 4.17.0 on aarch64 (Raspberry Pi 3).
>> 
>> Error message: `RTNETLINK answers: Operation not supported`.
>> 
>> I'm using ArchLinuxARM. Downgrading to 4.16.x makes the issue 
>> dissapear.
>> This is not high-priority so please Jason, if you're reading this
>> message, move this issue further down in your debugging queue as I
>> believe almost nobody is using 4.17.0 on aarch64 right now. Maybe
>> they'll fix the error by themselves in the coming 4.17.x releases.
> 
> Did you actually compile the wireguard kernel module? Or rely on 
> mysterious
> "them" to do so?

I compiled it through a dkms hook of pacman, the ArchLinuxARM pkg 
manager. It runs everytime there is a new kernel installation, being it 
an upgrade or a downgrade.

Those mysterious and shady "them" are the mainline patch submitters LOL
