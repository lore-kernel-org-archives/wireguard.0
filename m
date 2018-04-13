Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 888851c1
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:10:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e201e192
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:10:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ad62e11
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:02:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 68aee04b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:02:01 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id v64-v6so11509171otb.13
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 15:25:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 00:25:03 +0200
Message-ID: <CAHmME9oL_VU3xXtvxs2pLF+UvfLpZWHEEO7ec_=ev3-SZ6KQpQ@mail.gmail.com>
Subject: Re: wg-ip,
 a tool to assign automatic ip addresses to wireguard interfaces
To: Christophe-Marie Duquesne <chmd@chmd.fr>
Content-Type: text/plain; charset="UTF-8"
Cc: gruetzkopf <martin@gruetzkopf.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Chirstophe,

Thanks for writing this. Very cool work. As part of GSoC this summer,
Martin (CC'd) is going to be working on a dynamic provisioning
protocol over IPv6. One of the things we'll be investigating is
whether it's best to derive a v6 address from a public key or whether
it's best to make these separate/unrelated and share them alongside
the public key. While the former is much more elegant, a significant
problem is choosing the right behavior and assessing the security
concerns with collisions. Do let me know if you'd like to join in the
fun in trying to work out those problems. It looks to me like you've
already begun with this nice tool here.

Jason
