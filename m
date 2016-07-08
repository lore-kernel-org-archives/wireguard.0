Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27c2a9e0
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:49:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82c9257e
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:49:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 58d5f5f0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 17:49:10 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id h129so32243107lfh.1
 for <wireguard@lists.zx2c4.com>; Fri, 08 Jul 2016 10:49:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3b339d53-2fa0-6ed6-575b-7239c91e6a36@viisauksena.de>
References: <3b339d53-2fa0-6ed6-575b-7239c91e6a36@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Jul 2016 19:49:25 +0200
Message-ID: <CAHmME9q-ZnU6-LdLoyB90dKBByN8kH+5L3PJUfQWvdG4Ad4A6g@mail.gmail.com>
To: jens <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] openwrt package - kernel >4.1 vs freifunk gluon
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jens,

I probably could port this to earlier kernels. I did this at some
point. But meh, I'd rather not. See if you can upgrade your own
kernel. It'll be better for things in the long run.

Jason
