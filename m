Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dccf9252
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 17:27:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf316217
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 17:27:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3dcab91
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 17:27:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 86c0dd17
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 17:27:27 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id g104so11222588otg.7
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 09:32:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALpTdx=DQVHGQZf3phSTL=tbXNSpo+PvAQMsx1r3xDdCSj-txQ@mail.gmail.com>
References: <CALpTdxnL6akts71rb4yg+wisxqqs0U2wXPE5c12J9yMHVL6wGw@mail.gmail.com>
 <CAHmME9pokFyve7=UueDYYPvCU4LK-eQ4f0=GdZ7AocR6=BHGbQ@mail.gmail.com>
 <CAHmME9q6K_yBMMrrSMvMJmTxtn0miyugOrR1FuUwe22wnsjVXQ@mail.gmail.com>
 <CALpTdx=DQVHGQZf3phSTL=tbXNSpo+PvAQMsx1r3xDdCSj-txQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 18:32:27 +0100
Message-ID: <CAHmME9qwThA=9QAkhwZowZAUOweDd6OEW+OLhGKzisq63b95Ew@mail.gmail.com>
Subject: Re: new bug on armhf
To: =?UTF-8?B?0KDQvtC80LDQvSDQk9Cw0LLRgNC40LvQvtCy?= <kogeler@gmail.com>
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

Hi Roman,

Great to hear. In the process of debugging this today, I managed to
find this kernel bug, in case you're curious:

http://lists.infradead.org/pipermail/linux-arm-kernel/2017-November/543183.html

THUMB2_KERNEL is still a bit flaky I guess.

Jason
