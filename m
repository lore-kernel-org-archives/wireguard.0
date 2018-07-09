Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37e5ff9a
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jul 2018 19:16:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fc1e0c8
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jul 2018 19:16:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bca1f87b
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jul 2018 19:15:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a94448b8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jul 2018 19:15:00 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id y207-v6so37995303oie.13
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jul 2018 12:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ5iZ8_X4Wk1BeLxdkWYViZRN+biJ--AA2w9CojJcciW_RmrZw@mail.gmail.com>
 <CAHmME9rKJQGJND76mFSFMdKJ+gf_kKQxOyd_rAnrVVUJkEZp5g@mail.gmail.com>
 <CAJ5iZ88Yhz+5oq+BvbCQE8uK79zJ9UJPmtD8Sw-K92_L9afW6g@mail.gmail.com>
In-Reply-To: <CAJ5iZ88Yhz+5oq+BvbCQE8uK79zJ9UJPmtD8Sw-K92_L9afW6g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Jul 2018 21:23:17 +0200
Message-ID: <CAHmME9qioSENBwt+cyehKQmQ4LBXpKnB3JiExdp4r+-KcCe2cA@mail.gmail.com>
Subject: Re: Poor performance under high load
To: maximilian.pudelko@tum.de
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

Hey Max,

Try out 0.0.20180708. I suspect it might show a bit better curve.

Jason
