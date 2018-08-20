Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc48afce
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Aug 2018 15:10:01 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 074554f4
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Aug 2018 15:10:01 +0000 (UTC)
Date: Mon, 20 Aug 2018 10:19:15 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Aaron Jones <aaronmdjones@gmail.com>
Subject: Re: Wireguard not building on pre-rc1 4.19 kernels (Fedora)
Message-ID: <20180820151915.GA25379@wolff.to>
References: <20180820044022.GA11783@wolff.to>
 <87586e5d-0ca0-8b93-70b7-340e600f8f1e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <87586e5d-0ca0-8b93-70b7-340e600f8f1e@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Aug 20, 2018 at 14:43:53 +0000,
  Aaron Jones <aaronmdjones@gmail.com> wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA512
>
>This will be because Jason's RNG patch landed in mainline, but the
>kernel version number won't get bumped (so compat.h can use it
>properly) until 4.19 is released.

Thanks. That was enough information to tell me what to do to get it to 
work with a temporary hack. I'm using a successful build as I type this.
