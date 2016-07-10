Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4256ee8d
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Jul 2016 17:52:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a5204eb
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Jul 2016 17:52:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf6456c3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Jul 2016 17:52:18 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q132so56296256lfe.3
 for <wireguard@lists.zx2c4.com>; Sun, 10 Jul 2016 10:52:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160710172105.GD5844@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
 <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
 <20160710172105.GD5844@lud.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 10 Jul 2016 19:52:51 +0200
Message-ID: <CAHmME9o1H==cE9ykCifLuLNZN5bprdQjGND3+T_PzPWsz6pQQA@mail.gmail.com>
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

Ahh, position independence, right. Okay, I'll look into getting LTO
working, which will certainly have good results.
