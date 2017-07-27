Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4fe280e
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 16:11:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6477cacc
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 16:11:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 066a4465
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 16:30:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 63d949b4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 16:30:07 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id v205so68640697itf.1
 for <wireguard@lists.zx2c4.com>; Thu, 27 Jul 2017 09:31:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <807226423.1208180.1501049606445@mail.yahoo.com>
References: <807226423.1208180.1501049606445.ref@mail.yahoo.com>
 <807226423.1208180.1501049606445@mail.yahoo.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 27 Jul 2017 18:31:22 +0200
Message-ID: <CAHmME9oggvZM7x__B_AC+b=nv_D9+ibzwFXf_hdioTnngWaU3A@mail.gmail.com>
Subject: Re: Android wg binary
To: Jose Marinez <jedi_papi@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard Mailing List <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jose,

I usually build it statically against musl, rather than messing with
bionic, but it should build against bionic too.

Jason
