Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd6e3766
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Dec 2016 13:21:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b76f3009
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Dec 2016 13:21:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dcd98f0
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Dec 2016 13:21:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 14abdadb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Dec 2016 13:21:22 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id a197so61632524wmd.0
 for <wireguard@lists.zx2c4.com>; Mon, 12 Dec 2016 05:27:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <584e92066303c9.06462330@wp.pl>
References: <584e92066303c9.06462330@wp.pl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Dec 2016 14:27:21 +0100
Message-ID: <CAHmME9oKrtYQJ0i4arFg33+027L4e3ctQS=OdW_Vu0NCShThgQ@mail.gmail.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
To: Michal Kowalski <kofec@wp.pl>
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

On Mon, Dec 12, 2016 at 1:03 PM, Michal Kowalski <kofec@wp.pl> wrote:
> Is possible to add/modify version to support IPv4 only ? I would like to disable IPv6 and compile LEDE but than wireguard disappear. It is because of flash size 4MB.

Yes. WireGuard supports this already. You just need to remove the v6
deps from the LEDE wireguard makefile. Not sure why the dependency is
hard coded like this; it shouldn't be.
