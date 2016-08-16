Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ebed3e1
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 01:31:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 922580fc
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 01:31:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 332425a0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Aug 2016 01:31:11 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id i5so135878362wmg.0
 for <wireguard@lists.zx2c4.com>; Mon, 15 Aug 2016 18:36:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <101056cc-e944-a049-f194-c61567a1dcf1@viisauksena.de>
References: <101056cc-e944-a049-f194-c61567a1dcf1@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Aug 2016 03:36:14 +0200
Message-ID: <CAHmME9qaxVFdhNXtkPHgLPqR1_F_+DLsmircQX5O7OAG5YWcJg@mail.gmail.com>
To: jens <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: Matthias Schiffer <mschiffer@universe-factory.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] wireguard comparing to fastd - tests
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Aug 16, 2016 at 12:46 AM, jens <jens@viisauksena.de> wrote:
> method "salsa2012+umac";
> method "null+salsa2012+umac";

If you want to compare the two, you'll need to use a cipher of
equivalent security level. In other words, use salsa20 instead of
salsa2012. Otherwise it's not an accurate comparison.
