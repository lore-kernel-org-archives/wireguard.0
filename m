Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37317c19
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 09:53:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95d3b1e0
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 09:53:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ffd4be68
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 09:53:44 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id q132so151149492lfe.3
 for <wireguard@lists.zx2c4.com>; Wed, 06 Jul 2016 02:53:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160705220336.GA18854@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 Jul 2016 11:53:46 +0200
Message-ID: <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Baptiste,

Cool! Looks very promising. Looking forward to seeing the performance
measures, and then optimizing WireGuard to improve whatever the
results happen to be.

One aspect that contributes to the size of the kernel module is that
it can't be stripped in the same way a userspace binary can, because
it has to be dynamically linked into the kernel.

Jason
