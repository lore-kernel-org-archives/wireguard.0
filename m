Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdbdc3f0
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:50:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8bc8baf
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:50:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 113a7d81
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 23:50:53 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id q132so124685589lfe.3
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 16:54:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
References: <20160704225300.GC9424@c3po>
 <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
 <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 01:54:13 +0200
Message-ID: <CAHmME9ruAPJsRjvsm_+iPUBzD+z85N+4pdw25KhM9FpG0ygMCA@mail.gmail.com>
To: Jens Viisauksena <viisauksena@posteo.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Jens,

He sent me another message offlist, so I replied offlist. I suspect,
from the dmesg he sent, that it actually might be an issue with
CONFIG_MODVERSIONS, so I suggested disabling this option, as a test.

Jason
