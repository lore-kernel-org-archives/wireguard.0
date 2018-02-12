Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 120fad29
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 00:16:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53898852
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 00:16:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 630c5136
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 00:07:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1db6348
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 00:07:57 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id u6so9928734oiv.9
 for <wireguard@lists.zx2c4.com>; Sun, 11 Feb 2018 16:23:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180211184312.GD12558@lud.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Feb 2018 01:23:19 +0100
Message-ID: <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Baptiste,

Thanks for the detailed report. Graphs like that are quite helpful.
I'm just back from a long weekend, so sorry for not having a chance to
look at this sooner.

I'm first curious about the basic "control group" issue Daniel
mentioned -- it's probably important to isolate if it's the new kernel
or the new module, or some complex interaction of the two.

Secondly, I'm wondering if you tend to do, "anything strange". For
example -- are you setting up and taking down the device often in an
automated way? Or reconfiguring the interface (via wg(8), for example)
often in an automated way? Or is the sustained day-in-day-out workload
that leads to this graph simply forwarding and encrypting/decrypting
packets as usual? If it's the latter, does this device tend to encrypt
or decrypt more, or both equally? In either case, I'm not sure too
much has changed between those version spans you gave, with regards to
the general packet encryption/decryption path, so I suspect this bug
will take some hunting to track down.

Thanks again for the report. Let me know about the kernel version situation.

Jason
