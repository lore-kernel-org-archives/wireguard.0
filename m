Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7b29223
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Nov 2016 14:34:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db79e544
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Nov 2016 14:34:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6ba92ba5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Nov 2016 14:34:41 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id o141so30807789lff.1
 for <wireguard@lists.zx2c4.com>; Sat, 12 Nov 2016 06:37:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9p08K4M-+qvRO1kJiTScj66QDmFofu6d6nNK6eANTnYZA@mail.gmail.com>
References: <CAHmME9qr1v2pt6Ct8gy8vmQ4=z_yDyQQim0SJCnXRYT0SHNQUw@mail.gmail.com>
 <20161111070445.GB10286@c3po>
 <CAHmME9p08K4M-+qvRO1kJiTScj66QDmFofu6d6nNK6eANTnYZA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 12 Nov 2016 15:36:59 +0100
Message-ID: <CAHmME9rdAOep+EUQDoK3nxBaM6VqrU99=v=LvrBhy5m46oOw6w@mail.gmail.com>
To: n3ph <n3ph@terminal21.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT/MIPS Improvements
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

Small update on the OOM issue. With LEDE devices that only have
32megs, if you run iperf3 on the device itself, eventually iperf3 will
use tons of memory in trying to use different sized buffers, that the
device will OOM and kill init. However, if you use packet forwarding
and put iperf3 on a different device -- more closely resembling the
actual workload of a router -- there is no OOM, and memory usage stays
stable overtime, indicating there isn't a memory leak or anything of
that nature in WireGuard. So, I think at this point WireGuard is quite
stable on LEDE.

Looking forward to hearing your feedback on the matter.

Regards,
Jason
