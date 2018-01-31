Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1e95f19
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 14:18:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 511a3de9
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 14:18:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73c28265
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 14:09:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d937c934
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Jan 2018 14:09:44 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id p36so13512583otd.10
 for <wireguard@lists.zx2c4.com>; Wed, 31 Jan 2018 06:23:42 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACwd1hYUb0aGFOQoDY30a0Gsu2E-OaSHF0319x-kGbTSwov9Hg@mail.gmail.com>
References: <CACwd1hYUb0aGFOQoDY30a0Gsu2E-OaSHF0319x-kGbTSwov9Hg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 31 Jan 2018 15:23:41 +0100
Message-ID: <CAHmME9qShRtUKG0yrSe3fcH_1QLw7K80nsO6L9-u6ObBMW7gOw@mail.gmail.com>
Subject: Re: Wireguard backport to 2.6.3x kernels
To: John Wayne <matrixman3077@gmail.com>
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

Hi Igor,

It's certainly possible to backport. At the moment I'm focused on
moving the project forward with other tasks, so it's not a good use of
my time, but if you'd like to give this a stab, I'd happily take
non-invasive patches that only touch the compat/ directory. Just keep
in mind that you'll need to support all kernels in between your target
and the current minimum.

Regards,
Jason
