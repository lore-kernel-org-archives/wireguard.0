Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32034a67
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:21:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 935436e8
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:21:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40a281e6
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:21:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d037685
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 16:21:43 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id x188so17323391itb.0
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 09:31:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170502172752.4e234cd8@msi.defcon1>
References: <20170502172752.4e234cd8@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 2 May 2017 18:31:14 +0200
Message-ID: <CAHmME9rrgXSW5pbg56JwBXwcfey0MS-fT7zF-+SmiBwCa5a7bg@mail.gmail.com>
Subject: Re: wg-quick can't down my vpn I/F and DNS problem
To: Bzzzz <lazyvirus@gmx.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

If your wg-quick config file is in /etc/wireguard and ends in ".conf"
then you can use `wg-quick down vpnserver`. Otherwise, please specify
the full path when calling wg-quick down.
