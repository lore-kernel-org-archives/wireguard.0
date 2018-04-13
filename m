Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75cd7a76
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:40:15 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39fa5e28
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:40:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fc3b571
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:31:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3821535
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:31:23 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id f63-v6so9667176oic.4
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 14:54:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Apr 2018 23:54:25 +0200
Message-ID: <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
Subject: Re: Re: Troubleshooting WireGuard connections
To: Riccardo Berto <riccardo@rcrdbrt.com>
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

When you type "wg", does it show you a "latest handshake"? If not,
perhaps they're not even communicating at all. For this, you could
look for udp packets on port 21 and see what's up.

Also, you might simplify things a bit by:
- Removing all mentions of Endpoint on the server, since the server
will learn these from roaming
- Removing all mentions of Port on the clients, since these can be
randomly selected
