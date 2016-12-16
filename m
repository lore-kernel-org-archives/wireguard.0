Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e3565c2
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 17:39:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ede66067
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 17:39:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a5437ab
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 17:39:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9fb8dd14
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 17:39:15 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id v84so84852692oie.3
 for <wireguard@lists.zx2c4.com>; Fri, 16 Dec 2016 09:45:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pJq2WR-YhFOEwCCkoKgOafkKoiAn_U_Abks-x8aAO1Kw@mail.gmail.com>
References: <584e92066303c9.06462330@wp.pl>
 <CAHmME9oKrtYQJ0i4arFg33+027L4e3ctQS=OdW_Vu0NCShThgQ@mail.gmail.com>
 <B993D7DB-7B6A-40B1-8B53-4F27942A4BA0@danrl.com>
 <CAHmME9pJq2WR-YhFOEwCCkoKgOafkKoiAn_U_Abks-x8aAO1Kw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Dec 2016 18:45:47 +0100
Message-ID: <CAHmME9qLbf2qmcwfRR9tCbj4T3u_h5Ff6gbSJFL5PAVe_BjQUw@mail.gmail.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Michal Kowalski <kofec@wp.pl>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Dan,

I just submitted a pull request to bump the package and add this
conditional: https://github.com/openwrt/packages/pull/3664

Jason
