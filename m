Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcd3bb91
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 22:58:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17a71b4c
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 22:58:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4844294
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 23:17:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4cc2abfc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 23:17:42 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g71so15958485ioe.5
 for <wireguard@lists.zx2c4.com>; Sat, 05 Aug 2017 16:20:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <trinity-7bfdb88a-30b2-44a2-8dd9-06c245b8a247-1501949046979@3capp-mailcom-lxa11>
References: <trinity-7bfdb88a-30b2-44a2-8dd9-06c245b8a247-1501949046979@3capp-mailcom-lxa11>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Aug 2017 01:20:09 +0200
Message-ID: <CAHmME9pah4FSAJo4TGTvTRamqyk1cZxA_FFWWx9co-mewBoj6w@mail.gmail.com>
Subject: Re: net-2-host configuration
To: Mail Mail <snakker@mail.com>
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

In site A, put wg0 on a different subnet as eth0, and then enable
packet forwarding.

Alternatively, if you'd like to keep it on the same subnet, assign the
B peer at site A an allowed IPs inside the subnet with a /32, and then
enable proxy_arp.
