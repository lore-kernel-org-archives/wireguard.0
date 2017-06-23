Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bd4ba1e
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 18:30:35 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5de68776
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 18:30:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2189b24f
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 18:44:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eccc1ae2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 18:44:08 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id r67so37320902ota.1
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 11:46:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <48D760AA-BFB5-4A3E-B8C8-81E49A65BC5A@veniamworks.com>
References: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
 <CAHmME9rwLqT6Ph_LxYMQLaZw-=f-LTxf7ScnqJ6jbDD+BqN87w@mail.gmail.com>
 <48D760AA-BFB5-4A3E-B8C8-81E49A65BC5A@veniamworks.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 Jun 2017 20:46:35 +0200
Message-ID: <CAHmME9pzg__jT1zaG+ThTsOCgo=DaXC-iV-yJp1O4didhPLubA@mail.gmail.com>
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

I think I've reproduced your problem and fixed it. Does this work for you?

https://git.zx2c4.com/WireGuard/patch/?id=6f6f5b19284fa57c0ec9bf1e2563b963dd82d48c

Alternatively, just try out the latest git master.

Jason
