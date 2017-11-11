Return-Path: tomli@tomli.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 447d0663
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 08:12:48 +0000 (UTC)
Received: from tomli.me (tomli.me [153.92.126.73])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95907aea
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 08:12:48 +0000 (UTC)
Received: from tomli.me (localhost [127.0.0.1])
 by tomli.me (OpenSMTPD) with ESMTP id 139197f8
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 08:16:29 +0000 (UTC)
Date: Sat, 11 Nov 2017 16:16:24 +0800
From: Tom Li <tomli@tomli.me>
To: wireguard@lists.zx2c4.com
Subject: Re: imer_setup() is not compatible with PaX's RAP
Message-ID: <20171111081624.GA5763@localhost.localdomain>
References: <20171111080920.GA5705@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171111080920.GA5705@localhost.localdomain>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Oops, s/imer/timer, and missing reference links.

[1] https://github.com/torvalds/linux/commit/686fef928bba6be13cabe639f154af7d72b63120
[2] https://git.zx2c4.com/WireGuard/commit/?id=7be989478f2fa659b0b6b55dbd72f222b932a5ee

In addition, RAP design presentation.

[3] https://pax.grsecurity.net/docs/PaXTeam-H2HC15-RAP-RIP-ROP.pdf

Regards,
Tom Li
