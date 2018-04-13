Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40e94d44
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:05:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00bc4f88
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 22:05:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c2a8f9a
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:56:21 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e2c4f31f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Apr 2018 21:56:21 +0000 (UTC)
Received: by mail-ot0-f178.google.com with SMTP id a14-v6so11524279otf.6
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 15:19:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <L6Hp1RB--3-0@tutanota.com>
References: <L6Hp1RB--3-0@tutanota.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 00:19:23 +0200
Message-ID: <CAHmME9ohXC6Dm5_JpATiQQhu2pQ0X2_cYCXtDXSUthiiRcdq2A@mail.gmail.com>
Subject: Re: few wg peers over the same port in the main office? Cryptokey
 routing
To: svar@tutanota.com
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

For your use case, I'd suggest you use multiple peers on a single
interface with a single listen port.
