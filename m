Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bd32171
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:30:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33d8571c
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:30:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6124ba9
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:44:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 298ccce7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:44:16 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id r103so119445125wrb.0
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jul 2017 19:48:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9u2stOgn=tRTn6LXDQrCSL2zcf_CZC83cy6Zs3FJ9x3kg@mail.gmail.com>
References: <CAA8CD9u2stOgn=tRTn6LXDQrCSL2zcf_CZC83cy6Zs3FJ9x3kg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 04:48:46 +0200
Message-ID: <CAHmME9oRBP0RML_F=L9BXuHBNRx5MXTUQj=Pt2F+HG=tfqs9tw@mail.gmail.com>
Subject: Re: Some information on usage of wire-guard on low constraint devices.
To: sg5414@rit.edu
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

On Sun, Jul 9, 2017 at 5:30 AM, Sahil Gupta <sg5414@rit.edu> wrote:
> 1. I am new to wireguard. How can I contribute to its development. Or modify
> code etc.

$ git clone https://git.zx2c4.com/WireGuard/

> 2. Is it possible to use wireguard beside IP base systems? Like what about
> if it will be deployed over zigbee protocol running devices?

WireGuard is for IP. You could repurpose the protocol for a different
layer 2 if you wanted. I'd recommend you take a look at Noise, more
generally, though.
https://noiseprotocol.org/

> 3. Is it possible to run it on sensor motes?

Yes.

> 4. Is it possible to code this pacakage in android

Yes.
