Return-Path: yuanchaosun@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c4c8e9d
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 14:48:07 +0000 (UTC)
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
 [209.85.160.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 771d9743
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Nov 2017 14:48:07 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id g2so42249pli.8
 for <wireguard@lists.zx2c4.com>; Tue, 28 Nov 2017 06:54:01 -0800 (PST)
Return-Path: <yuanchaosun@gmail.com>
From: Yuanchao Sun <yuanchaosun@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
Subject: Re: [PATCH 1/1] tools: remove '\n' in fscanf format-string
In-Reply-To: <CAHmME9pUk6pdp5VtGKaebAB70mcz+D_nW8E1vCRhm-jQzm6Bjw@mail.gmail.com>
Date: Tue, 28 Nov 2017 22:53:54 +0800
Message-Id: <739926D8-0CAD-48C9-9BCF-6CA91986E715@gmail.com>
References: <20171128074947.2212-1-yuanchao.sun@gmail.com>
 <20171128074947.2212-2-yuanchao.sun@gmail.com>
 <CAHmME9pUk6pdp5VtGKaebAB70mcz+D_nW8E1vCRhm-jQzm6Bjw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Yuanchao Sun <yuanchaosun@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

> Thanks for the patch. In the future, please include your Signed-off-by
> line and include the explanation in the body of the commit where it
> will be recorded in the future.

Sure. This is my first time using git send-email ... I just followed the =
steps
from a quick guide. I will figure out how to add the Signed-off-by line
the next time.

>=20
> I'm not sure this patch is correct. The /xplatform spec mandates an
> empty line. This patch enforces that. What is the purpose of removing
> that requirement?
>=20
> Also, I'm curious to learn what you're doing with this API at this =
early stage.

I'm trying to implement a userspace client using rust (does not work =
properly
for now ;/ ).

But I found fscanf does not return after reading a complete response =
(b"errno=3D0\n\n").
After searching, it seems '\n' in format string does not mean newline =
but any whitespaces.
fscanf hangs until a extra non-whitespace character.
So I fix this problem by removing the trailing '\n's in format string.

Yuanchao
