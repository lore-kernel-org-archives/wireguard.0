Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 853f2201
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 17:23:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9d1f4df
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 17:23:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90a66145
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 17:23:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7bc5ec6e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 17:23:15 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id h6so6885533oia.10
 for <wireguard@lists.zx2c4.com>; Thu, 26 Oct 2017 10:24:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 19:24:58 +0200
Message-ID: <CAHmME9oSB-wS7eatR3aDtzNLo3Fqe1ksg4si2Q9-XM1FGF3Aeg@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Joe Doss <joe@solidadmin.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Max Moser <e1326252@student.tuwien.ac.at>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Joe,

Indeed you're right. A systemd-networkd integration is in progress. A
student (CCd) has several times promised to write a networkmanager
plugin, but has continually flaked out, so still no progress there. If
somebody else on this list is interested in doing that, that'd be
nice.

Jason
