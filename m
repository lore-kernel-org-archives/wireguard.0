Return-Path: mike@pmfarmwald.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9c978ab
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 20:48:41 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f374c8f3
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jul 2018 20:48:41 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id a3-v6so6750333wrt.2
 for <wireguard@lists.zx2c4.com>; Tue, 10 Jul 2018 13:56:05 -0700 (PDT)
From: "mike@farmwald.com" <mike@pmfarmwald.com>
MIME-Version: 1.0
Date: Tue, 10 Jul 2018 13:57:40 -0700
Message-ID: <131640bf823f0fba0adf5985e2e8aa17@mail.gmail.com>
Subject: Wireguard fails on recent updates for OpenWRT on Turris Omnia, but
 same versions work on other (Linksys) routers with same CPU
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Reply-To: mike@farmwald.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I'm not sure how to debug this, but the same wireguard configuration works
on a Linksys with the same CPU.
I realize I'm not posting enough information to help, but I'm hoping
someone else has seen the same problem and can save me time narrowing down
the problem. Since it happens on two different Turris Omnias, I'm guessing
the problem the OpenWRT release for Turris has a problem. I have a third
omnia with a much older version of OpenWRT and hence wireguiard which
seems to work fine.
Otherwise, I'll post more later.
