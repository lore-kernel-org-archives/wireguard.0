Return-Path: k@vodka.home.kg
Received: from mail.kotidze.in (mail.kotidze.in [91.92.66.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d6181f3
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 08:05:41 +0000 (UTC)
Received: from private.domain by mail.kotidze.in with [XMail 1.27 ESMTP Server]
 id <S19CF> for <wireguard@lists.zx2c4.com> from <k@vodka.home.kg>;
 Sun, 6 Nov 2016 11:07:15 +0300
Date: Sun, 6 Nov 2016 11:07:07 +0300
From: k@vodka.home.kg
Message-ID: <1289478110.20161106110707@vodka.home.kg>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <25241985.20161106100258@vodka.home.kg>
References: <25241985.20161106100258@vodka.home.kg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: Re: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> <4>[13905.634933] Process  (pid: 41189632, threadinfo=82bca000, task=810000ce, tls=8100cea5)

> Likely caused by memory corruption.

Look  at  pid  value.  Its defenitly not valid pid. Task structure was
corrupted.
