Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56681511
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:21:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 638c548a
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:21:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a95e19b1
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:21:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8307b617
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 31 Dec 2016 02:21:57 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id v84so437202722oie.3
 for <wireguard@lists.zx2c4.com>; Fri, 30 Dec 2016 18:30:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b9daea6b-caa1-6778-7236-02efb2288b99@viisauksena.de>
References: <b9daea6b-caa1-6778-7236-02efb2288b99@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 31 Dec 2016 03:30:20 +0100
Message-ID: <CAHmME9oGVxJoXVNBcNchWV0DEVV99Nj8zrrMbRBxj=hdcUhPVQ@mail.gmail.com>
Subject: Re: [fyi] test in the wild (wg + gretap + batman-adv) on tplink842
To: jens <jens@viisauksena.de>
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

Hi Jens,

Great results; thanks for doing the measurements.

It's a shame that gretap&batman-adv have such a performance hit. Have
you been able to do any debugging to find out why this is?

Jason
