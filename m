Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c68d3193
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 22:19:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b033037b
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 22:19:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3eac045
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 22:18:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7da2170e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Jun 2018 22:18:40 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id w9-v6so14719777otj.7
 for <wireguard@lists.zx2c4.com>; Sat, 16 Jun 2018 15:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <5301fd31-01bb-3434-b8d2-837ffbaa04fe@53c70r.de>
In-Reply-To: <5301fd31-01bb-3434-b8d2-837ffbaa04fe@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 17 Jun 2018 00:24:01 +0200
Message-ID: <CAHmME9r5b_UQ67C9NgvOHOjBkMehO3fcVXRuTpak+RMDHdGw_w@mail.gmail.com>
Subject: Re: CentOS improper mount labeling on SELinux enabled systems
To: mail@53c70r.de, Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>
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

Hi Silvan,

Thanks for the report. I've fixed this here:

https://git.zx2c4.com/WireGuard/commit/?id=3a6e441000cdf0aaeb6f48135139c48af7319626

Your distro will have to pick up the changes for merging into their
wg-quick(8). I've CC'd Joe and Martin, for them to review this.

Regards,
Jason
