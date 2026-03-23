Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE456F483E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 18:47:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 830a11ac;
	Mon, 23 Mar 2026 18:39:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 842cc5fc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 18:39:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 64D1140190
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 18:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DDAC2BC9E
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 18:39:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Sgl9cMp6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1774291143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LH/ZiC7z/r6d0LDzDuBo+jZSLEFPWgEUb0y8KPU8Nu0=;
 b=Sgl9cMp6Y6Glq0iXsoE54pO8FkByk+pfmrrfHFGTHrkiQLurXFLw+rZwGzROoUrly2leto
 lR1oNTEJBWoWGkcKzLKqysggeNJoAo/V3jM7kcUC+QNN5rJWlHxbgeTzuhMe2s6EF83v5v
 7rXUNY63iycW8ySogobe2JlRdGaO+0c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id acd6d383
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 18:39:03 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-40438e0cba6so286119fac.1
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 11:39:03 -0700 (PDT)
X-Gm-Message-State: AOJu0YwLHZ4YpA2lWZe6iP79rjQExTS6bTPpowlX1GheUKTujrAbdeRh
 4Tu5qyxdXwsx+Lwp+VopN88e8vGv5YITaCQ7O+oqZSTK2w1/vY1FSCi9vb+fgwhixPxgAW24NK6
 xzrOCTqaNGPLRTCYqYTJGl7FS1i5f+8U=
X-Received: by 2002:a05:6870:2e94:b0:417:5a32:1e81 with SMTP id
 586e51a60fabf-41c10f62036mr8971722fac.17.1774291142391; Mon, 23 Mar 2026
 11:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9q4gC3Ag4hW0ERTkZNi6VMv1-qMExO6+OfOKYZ5rC4mgg@mail.gmail.com>
 <CAH8yC8k1R2L2Wp-oQDyn3L14k0xQwg_jW6oYY+-cOPv9rT0EYg@mail.gmail.com>
In-Reply-To: <CAH8yC8k1R2L2Wp-oQDyn3L14k0xQwg_jW6oYY+-cOPv9rT0EYg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Mar 2026 19:38:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9qKp9tNG9WJZJioLJuhSHEg8rbWoT+5Fa5P0iv334pRKw@mail.gmail.com>
X-Gm-Features: AQROBzCvNh3OFgeXIFBr16_mXrMNFQ8Da5VLW9X0mv19DGjZ3F261dciHbP7pvo
Message-ID: <CAHmME9qKp9tNG9WJZJioLJuhSHEg8rbWoT+5Fa5P0iv334pRKw@mail.gmail.com>
Subject: Re: Sunsetting support for old Windows versions
To: noloader@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Mar 23, 2026 at 7:34=E2=80=AFPM Jeffrey Walton <noloader@gmail.com>=
 wrote:
> WIndows 7 market share dropped to around 1% in January 2026.  I think it =
is a good decision.  Confer, <https://gs.statcounter.com/os-version-market-=
share/windows/desktop/worldwide>.

What do you suppose accounts for that December->January change? Some
large operator enabled a TLS configuration not supported by the OS /
by Chrome 109?
