Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f366365
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 01:41:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8c913b6
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 01:41:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82d1b044
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 01:40:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8a568530
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 01:40:59 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id t196so24007702lff.3
 for <wireguard@lists.zx2c4.com>; Sat, 10 Dec 2016 17:46:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201612101631.uBAGV8fe049290@mail.vittgam.net>
References: <201612101631.uBAGV8fe049290@mail.vittgam.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 11 Dec 2016 02:46:47 +0100
Message-ID: <CAHmME9orxv2MJYNr+7fop8SXwXfgayEswB2-t1yBnBKJiPHEQg@mail.gmail.com>
Subject: Re: [PATCH] contrib: Set addrgenmode to none for WireGuard interfaces.
To: "Vittorio Gambaletta (VittGam)" <linux-wireguard@vittgam.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Vittorio,

Thanks for bringing my attention to addrgenmode. At first I tried
fixing this with [1], but this broke tcpdump, so I reverted it with
[2]. Now, thanks to you, we have [3], which hopefully is the correct
way to do things and will be part of the next snapshot if it survives
testing.

Regards,
Jason

[1] https://git.zx2c4.com/WireGuard/commit/?id=9f0db72ffcae21a2c6e965f084873a64fea82958
[2] https://git.zx2c4.com/WireGuard/commit/?id=0311d78316a0544b35705468de1021ff48335142
[3] https://git.zx2c4.com/WireGuard/commit/?id=40b0e8d5b1669cd4be32965a1a60cbb63562512c
