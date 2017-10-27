Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c86a092
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 13:21:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4047179
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 13:21:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cf8f121
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 13:21:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ac650de8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 13:21:04 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m198so10835690oig.5
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 06:22:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171027100758.ovqslypy4wexa3bw@gmx.de>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <20171027100758.ovqslypy4wexa3bw@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 15:22:54 +0200
Message-ID: <CAHmME9qR9zaxcDhpCSyeQCq_1C6pyHviBaPrA9+rPLGdVfi1Lw@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Martin Hauke <mardnh@gmx.de>
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

Hi Martin,

Specifically what I'm asking you is: would you be willing to ship the
hatchet as a _patch_ to wg(8) just for your OpenSUSE package?

Jason
