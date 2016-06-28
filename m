Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48643ff5
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 14:44:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ccb60e3
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 14:44:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb6b38ce
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jun 2016 14:44:26 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h129so13140799lfh.1
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jun 2016 07:47:01 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jun 2016 16:46:58 +0200
Message-ID: <CAHmME9rWDZs5o0QSe-UE=0zB6-QBq0w_EVZ8S14bT-bxG-i0Pg@mail.gmail.com>
To: wireguard@lists.zx2c4.com, noise <noise@moderncrypto.org>
Content-Type: text/plain; charset=UTF-8
Subject: [Wireguard] [ANNOUNCE] WireGuard Launched!
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Folks,

At long last, the WireGuard project is launched! It's been a very long
road, but at this point I feel confident enough in the general design
and protocol that it's time to open this up for more widespread
testing and feedback. I'm quite excited about hearing from you about
it, and I apologize to all of you who had to wait so long since
hearing about the project.

Paper: https://www.wireguard.io/papers/wireguard.pdf
Website: https://www.wireguard.io/
Git repository: https://git.zx2c4.com/WireGuard/
Mailing list: https://lists.zx2c4.com/mailman/listinfo/wireguard

For those who don't know, WireGuard is a next generation kernel-space
VPN, which uses state of the art crypto -- in part based on Noise --
and achieves really nice performance. It's also extremely simple, at
less than 4000 lines of core code, and introduces "crypto key
routing", a super simple correlation between allowed IPs and public
key identities. It should be as simple to setup as SSH's
authorized_keys. I'm cross-posting this to the Noise mailing list,
because that's where much of the crypto discussion for WireGuard has
occurred. (During development, WireGuard actually implemented *every
single solitary* revision of Noise, following every thread of
discussion by an implementation; it's necessary then the first and
oldest implementation of Noise.)

I'm excited to hear your feedback, and to work with you in ironing out
any issues that come up, fine tuning performance, and so forth.

Jason
