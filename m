Return-Path: konstantin@ltmd.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cac95960
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:00:53 +0000 (UTC)
Received: from mail.ltmd.net (mail.ltmd.net [91.206.132.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da443d45
 for <wireguard@lists.zx2c4.com>; Tue, 8 Aug 2017 22:00:52 +0000 (UTC)
To: wireguard@lists.zx2c4.com
Subject: Re: Latest Gentoo WireGuard Ebuilds Doesn't Work
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 08 Aug 2017 15:22:44 -0700
From: Konstantin <konstantin@ltmd.net>
In-Reply-To: <7849918697a74f47719ca480aa919c15@ltmd.net>
References: <7849918697a74f47719ca480aa919c15@ltmd.net>
Message-ID: <ff2fe3d745cc06d78aa45b9d6a54da2b@ltmd.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2017-08-07 17:17, Konstantin wrote:
> Hi guys,
> 
> I have issues upgrading WireGuard on my Gentoo servers. I tried
> different kernels and latest WireGuard versions without any luck.
> 
> When I type wg command I got only the "interface" portion:
> 
> interface: wg0
>   public key: PUkm5fRn25hbv9Zh2tetny3tV3l9WnbxvIFeZTSd9BM=
>   private key: (hidden)
>   listening port: 58800
> 
> without any peer block below.
> 
> Latest WireGuard version that still works for me was 0.0.20170214 but
> I can't find these sources anymore and I need to upgrade to a new
> kernel.
> 
> According to kernel requirements (here
> https://www.wireguard.com/install/#kernel-requirements
>  ) I understand that need to have a certain options enables.
> 
> My current kernel 4.9.34 config has:
> CONFIG_NET=y
> CONFIG_INET=y
> CONFIG_NET_UDP_TUNNEL=m
> CONFIG_CRYPTO_BLKCIPHER=m
> CONFIG_CRYPTO_BLKCIPHER2=y
> CONFIG_PADATA=y
> 
> Yes, some of these modules are not built-in but I had it the same way
> earlier when it worked with kernel 4.4.39.
> 
> When I'm loading the wireguard.ko module and setting wg interface
> configuration I don't see any error but not even a single packet
> leaves a server interface towards the peer. What am I missing here?
> How can I debug it?
> 
> Thank you.

For the record I want to explain what was the problem and how it was 
solved. I haven't noticed that in the old configuration file the same 
pair of keys were used for both sides. And new WG version doesn't allow 
to use it that way. Obviously it was a wrong configuration which 
apparently works using an old WG version. That's it. Thank you!

-- 
Konstantin
