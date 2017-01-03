Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50d9e468
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:43:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7af8b024
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:43:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cbbb961
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:43:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id efc01009
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 21:43:24 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id v84so522726003oie.3
 for <wireguard@lists.zx2c4.com>; Tue, 03 Jan 2017 13:52:17 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 3 Jan 2017 22:52:16 +0100
Message-ID: <CAHmME9q=3bjbDaWY3cYqm69LKhH3wnTdobBZ==qu0=N-T8T3bw@mail.gmail.com>
Subject: wanted: bash completion for wg(8)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

Anybody interested in writing a smart bash completion script for wg(8)?

https://git.zx2c4.com/WireGuard/about/src/tools/wg.8

One that would tab complete peers and key files and such?

Jason
