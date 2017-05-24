Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e9578d0
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:57:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d81b566
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 01:57:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 396fb5d9
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 02:09:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8069d6da
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 02:09:06 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id l18so224678115oig.2
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2017 19:09:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170524040825.2087168f@msi.defcon1>
References: <20170524034606.54078c3c@msi.defcon1>
 <CAHmME9rQoSrRsVWzOMWbc4FMrHG1+jWj4VM7C7tQQE9c9P0ooA@mail.gmail.com>
 <20170524040825.2087168f@msi.defcon1>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 24 May 2017 04:09:52 +0200
Message-ID: <CAHmME9pgWYO8J8-eqy=Ciz+hsOi-=89bj1qf42rXieALm5G5gg@mail.gmail.com>
Subject: Re: What has changed in the configuration file?
To: Bzzzz <lazyvirus@gmx.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

As mentioned in the snapshot changelog email, PresharedKey is now a
property of the Peer, not the Interface.

If you have lots of random questions like this, feel free to find me
on IRC -- #wireguard on Freenode.

Jason
