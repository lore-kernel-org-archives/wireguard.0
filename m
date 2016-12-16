Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7661bc64
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 19:19:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57ad00f8
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 19:19:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2198a8ae
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 19:19:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a881b9c8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Dec 2016 19:19:01 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id v84so87606730oie.3
 for <wireguard@lists.zx2c4.com>; Fri, 16 Dec 2016 11:25:35 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 16 Dec 2016 20:25:34 +0100
Message-ID: <CAHmME9qKNucOvp=aEN_F3g+W7RktjtBoq76iSztLRtZeiQ57iA@mail.gmail.com>
Subject: awesome mips performance
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

Hey guys,

The latest snapshot is broken on big endian. This commit [1] fixes it,
and will be released in the next snapshot shortly. Sorry about that.
Lots of churn with the siphash implementation.

With the recent changes to add alignment in the headers, I now get 60
megabits per second on a super crappy TL-WR841N board (QCA9533)
transmitting over the internet. This is awesome performance -- a good
milestone for little CPUs.

Jason

[1] https://git.zx2c4.com/WireGuard/commit/?id=094e95e736723075d586d7a006c5525f2e3a74d4
