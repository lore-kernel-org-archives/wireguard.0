Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44f71169
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 21:29:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d05ba121
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 21:29:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 043df751
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 21:27:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a378d3ec
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 21:27:55 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id y10-v6so12104668otg.10
 for <wireguard@lists.zx2c4.com>; Sun, 13 May 2018 14:29:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <22f3ea2f-b76e-e106-3e62-4584241e8d1a@attglobal.net>
References: <22f3ea2f-b76e-e106-3e62-4584241e8d1a@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 13 May 2018 23:29:08 +0200
Message-ID: <CAHmME9q2p8-42t+ORM0MftDcjDvRi2TA0yBELO5gvXjQA08Mbw@mail.gmail.com>
Subject: Re: Procedure for Updating Snapshot
To: stunnel@attglobal.net
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

We only support the most recent RHEL, which means 7.5, not 7.4. The
last snapshot supporting 7.4 is 0.0.20180420. To use future snapshots,
including 0.0.20180513, update to at least 7.5.
