Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26612d21
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 17:52:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98246e2c
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 17:52:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e1c5cfe
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 17:51:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 752e782a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 17:51:04 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id 188-v6so16819375oid.12
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 10:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ5iZ8_X4Wk1BeLxdkWYViZRN+biJ--AA2w9CojJcciW_RmrZw@mail.gmail.com>
In-Reply-To: <CAJ5iZ8_X4Wk1BeLxdkWYViZRN+biJ--AA2w9CojJcciW_RmrZw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 26 Jun 2018 19:57:39 +0200
Message-ID: <CAHmME9rKJQGJND76mFSFMdKJ+gf_kKQxOyd_rAnrVVUJkEZp5g@mail.gmail.com>
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

Hi Max,

Thanks for doing this test; that's super useful. What you're
describing is definitely not expected behavior. Think you could try
the same test with 0.0.20180620 and 0.0.20180625? In particular, I'm
interested to know whether a performance _regression_ introduced in
0.0.20180620 actually results in the correct behavior.

Meanwhile, we (CC'd) have been working on implementing a lockfree
queue structure, but we haven't seen any configurations yet where this
actually results in a performance improvement.

Care to share your benchmark scripts? Sounds like this could be really
useful for directing our optimizations.

Jason
