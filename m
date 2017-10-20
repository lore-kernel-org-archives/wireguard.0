Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 600b1244
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:01:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74b7d0bb
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:01:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7cb9c79
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:01:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b77eb74e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Oct 2017 18:01:44 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id w197so21298799oif.6
 for <wireguard@lists.zx2c4.com>; Fri, 20 Oct 2017 11:02:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171020173941.GA23750@wolff.to>
References: <20171020173941.GA23750@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Oct 2017 20:02:43 +0200
Message-ID: <CAHmME9rf2+S_pJqpGPPq+BXzMWTVyF92W2bVT904teHhVhJHoQ@mail.gmail.com>
Subject: Re: crypto routing with subnets?
To: Bruno Wolff III <bruno@wolff.to>
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

Hi Bruno,

Fortunately the inquires of this email are things that you could
figure out simply by trying, so if you want to learn-by-doing, you can
stop reading here and finish reading afterward.

Here are the solutions:

1. A peer is its public key, which means you can't have two different
peers with the same key, since they'd be the same peer. In essence
you're asking for a==a&&a!=a, which is always false.

2. Traffic will always go to the most specific route, which means the
/32 will take precedence over the /16.

Jason
