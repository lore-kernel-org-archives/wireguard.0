Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48135c46
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 17:12:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31f0385e
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 17:12:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d3fd647
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 17:25:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a73f0374
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 17:25:48 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id c189so29096603oia.2
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 10:28:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
References: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Jun 2017 19:28:14 +0200
Message-ID: <CAHmME9rwLqT6Ph_LxYMQLaZw-=f-LTxf7ScnqJ6jbDD+BqN87w@mail.gmail.com>
Subject: Re: Wireguard multihomed roaming performance
To: Tiago Condeixa <tcondeixa@veniamworks.com>
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

Hello Tiago,

WireGuard should do roaming instantly. There should be no delay at
all. If you're experiencing delay, this is a bug that needs
investigating...

What kinds of timeouts are you seeing with the source address change?

Regards,
Jason
