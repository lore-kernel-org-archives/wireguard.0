Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 179b8011
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 10:11:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae66af47
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 10:11:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41c2b97f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 10:11:35 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id l69so23832769lfg.1
 for <wireguard@lists.zx2c4.com>; Wed, 27 Jul 2016 03:14:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Jul 2016 12:14:12 +0200
Message-ID: <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
To: Jens Viisauksena <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jul 27, 2016 at 12:10 PM, Jens Viisauksena <jens@viisauksena.de> wrote:
> the small routers run fastd into the backbone.

Is the performance of wireguard better or worse than fastd?
Theoretically wireguard should be much faster, so if it isn't already
so in practice, I'd like to optimize a bit.
