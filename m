Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c9a9571
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:13:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a932a78
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:13:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 78189552
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Dec 2016 18:13:56 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id g23so138556349wme.1
 for <wireguard@lists.zx2c4.com>; Tue, 06 Dec 2016 10:19:15 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Dec 2016 19:19:14 +0100
Message-ID: <CAHmME9qcOm5Thc1q+DnPWh_orJ3a64gyBGrfnetCrO+Lsc8zGg@mail.gmail.com>
Subject: Re: Kernel Panic
To: Samuel Holland <samuel@sholland.org>
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

Hi Samuel,

Thanks for the stack trace. I'll try to triage this.

I noticed you're using "4.8.11-hardened". What kernel is this
actually? Grsecurity?

Jason
