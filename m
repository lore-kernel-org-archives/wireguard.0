Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fef426bb
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 22:55:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94536f7b
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 22:55:30 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 489c525c
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 22:54:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6877bcfb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jun 2018 22:54:16 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id d5-v6so4475544oib.5
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 16:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <Zyl-kt3QbG7oLCUZhxxhzDhpqlU9NadJVHFmhU-p00JflGHZ77zQ2GH6PIrFbW9JDVccVK0vW6S6TBS0zQyhF_JRDjIBLR3yRLxqqLB0Ovk=@shlomisteinberg.com>
In-Reply-To: <Zyl-kt3QbG7oLCUZhxxhzDhpqlU9NadJVHFmhU-p00JflGHZ77zQ2GH6PIrFbW9JDVccVK0vW6S6TBS0zQyhF_JRDjIBLR3yRLxqqLB0Ovk=@shlomisteinberg.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Jun 2018 01:00:12 +0200
Message-ID: <CAHmME9ob6m0xVAJ+WvxxpGonOGO4CZjykCa79dai6Q_raNh8ng@mail.gmail.com>
Subject: Re: wireguard-0.0.20180620: crypto/chacha20poly1305.c not compiling
To: shlomi@shlomisteinberg.com
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

Thanks, fixed:

https://git.zx2c4.com/WireGuard/commit/?id=edc3ebcb7ad8dffe538c1511a42d40392c552590
