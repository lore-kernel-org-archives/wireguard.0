Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d825d420
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 12:12:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aba2df05
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 12:12:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d0846d34
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 12:12:13 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id i5so163476573wmg.0
 for <wireguard@lists.zx2c4.com>; Tue, 16 Aug 2016 05:17:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oi=gbw67aVhW-UXNe0uBpth1EG9ekoKv9M9GTke4UaFw@mail.gmail.com>
References: <101056cc-e944-a049-f194-c61567a1dcf1@viisauksena.de>
 <CAHmME9qaxVFdhNXtkPHgLPqR1_F_+DLsmircQX5O7OAG5YWcJg@mail.gmail.com>
 <382aed3a-349c-d518-16ae-3fdd8b1127f8@viisauksena.de>
 <CAHmME9oi=gbw67aVhW-UXNe0uBpth1EG9ekoKv9M9GTke4UaFw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Aug 2016 14:17:19 +0200
Message-ID: <CAHmME9ooEnf4ZsyciTQShzN2S6+0btpnW61FBTQzfJHZjCVLcw@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Matthias Schiffer <mschiffer@universe-factory.net>, n3ph <n3ph@terminal21.de>,
 jens <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] wireguard comparing to fastd - tests
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> ---------- Forwarded message ----------
> From: jens <jens@viisauksena.de>
>
> thx, thats true ... we were mostly interested in comparing speed in
> similar setups that we would deploy.
> But you ' re right - reducing workload from 20 to 12 in cypher make
> them not directly comparable


Alternatively, you could pretty easily tweak wireguard to use
chacha20/12 by changing "for (i = 0; i < 20; i += 2) {" to "for (i =
0; i < 12; i += 2) {" in src/crypto/chacha20poly1305.c.

Would be interested in fair side-by-side benchmarks of the two.
