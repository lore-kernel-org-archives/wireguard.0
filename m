Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b81a14e0
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 22:02:43 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 012d76e9
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 22:02:43 +0000 (UTC)
Subject: Re: centos 6 build error
References: <9fe139f0-a635-76ef-90b0-56b1a968c565@createc.ro>
 <CAHmME9qJR-Y6gwULoGfBcORwcDthut37yVeiX_bFBKzHzHpu3A@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <20471f2b-0bf3-33c0-712a-3d9e20611982@createc.ro>
Date: Tue, 3 Jan 2017 00:11:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9qJR-Y6gwULoGfBcORwcDthut37yVeiX_bFBKzHzHpu3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 02.01.2017 23:42, Jason A. Donenfeld wrote:
> Your compiler is ancient.
>
> Either update your compiler, or just remove lines 343 & 350 (which are
> no-ops anyway).
>
> Jason

thanks!

I used the devtoolset-2 from scientific linux CERN and now I have this:

wireguard: loading out-of-tree module taints kernel.
wireguard: Unknown symbol __fentry__ (err 0)

and it seems that I have more work to do so I'll try without those lines

http://unix.stackexchange.com/questions/259591/linux-kernel-missing-fentry-symbol

the kernel is 4.9.0-1.el6.elrepo.x86_64

regards
