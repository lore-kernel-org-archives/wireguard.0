Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c08ce24
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 21:08:23 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dd155ba
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Jun 2017 21:08:22 +0000 (UTC)
Subject: Re: fix centos 6 compile
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <8cfef683-d9e1-fb6b-704c-f0c938c84c5b@createc.ro>
 <72b8742f-c5e7-557e-a45c-3b0b99efaf47@createc.ro>
 <CAHmME9pW9Ritr6D1kQRS6F__mXcmko_c5+MkXMrkbuOnUvKR=Q@mail.gmail.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <7fd07a69-8c02-e055-d68c-e1310900bb49@createc.ro>
Date: Wed, 28 Jun 2017 00:24:54 +0300
MIME-Version: 1.0
In-Reply-To: <CAHmME9pW9Ritr6D1kQRS6F__mXcmko_c5+MkXMrkbuOnUvKR=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 27.06.2017 23:59, Jason A. Donenfeld wrote:
> Isn't EL6 still on 2.6.32, which is far away from the 3.10 that
> WireGuard requires? In that case you'll be running with a custom
> kernel. Why can't you just update your gcc from the same external
> repo, at the same time?
>
> I just backported to EL7.3 and felt nauseous the whole time. Not sure
> I have the stomach for EL6...

the elrepo kernel for centos 6 is mainline or LT

the kernel is compiled with gcc 4.4.7 and won't run modules compiled 
with newer gcc, the patch is only for older gcc support, not for kernel, 
I don't think that  anyone will complain updating to kernel 4.4+ on el6

the old approach was to compile the module with gcc 4.4.7 commenting the 
two lines in socket.c and after that to build the wg tools with gcc 4.8 
but with this patch the compile is straightforward

regards
