Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C39DC432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:28:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0186E2068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TlNW0ceJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0186E2068E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98a063d9;
	Wed, 27 Nov 2019 12:27:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dd4aa52
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:27:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 550f6713
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:27:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1ca435c
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=nG5I+C8ijxKXZYQK8OG558fVVfM=; b=TlNW0c
 eJ2+YCu+IVQ1Y44REBlKaaRZf/2adLDGta4Cvltow6tDOiULCg7Itx53UgkgXa3U
 PI1lKcx3i3grXZubvlzN+6hnfwUQXt8do0Qdv2uSZ/aI+o0NfVw4BzBxqX/9Ftsz
 TcGwuP51uFFsDEYQJlaEr0qrmlJYDSKidX+BRiE4NsErMaCAAchMB+1xC0G9Lxnh
 SqY4gDGqGEavLkiNlN3jTNpZXj0P0p87r79aP8PG4Kop0HF3H/nbHij6IUHT7et7
 14kJHBwZdNJokAg6AW6+aY/FP9qG2Obft46Q8VTSoi6cFYUDyBnnTJpg8a3yuEcT
 QHHSK7S9Jv17OJ1g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e56c3df7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:33:56 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id 14so19859337oir.12
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:27:47 -0800 (PST)
X-Gm-Message-State: APjAAAXOTjr2MpvnTBnMglwvr7kWgyfvbNFZj2Du9qyR1uW3Pq4n5fal
 PDa4q5Tu/KwPpznJQFuXq1Wk+tHVkZngyZdCswk=
X-Google-Smtp-Source: APXvYqwfFlzkvbx9331s0xgnxn1mWHpm/EvJSYoTnYjR8hnGx9bHGAygVCZcb8NZQyf0lYvOW+i8VGd97GYKrOsA47c=
X-Received: by 2002:aca:4b88:: with SMTP id y130mr4113650oia.52.1574857666749; 
 Wed, 27 Nov 2019 04:27:46 -0800 (PST)
MIME-Version: 1.0
References: <F4cyz6k03CpTVXGL3ROFHAL3FwuPZg8wyyVKgvCVeufcJMCycqMAlqbnPh2H3EU-GnR3GlAjUMbYlPDirGS3hYoNIhOFfn6vd00_SUvud2A=@protonmail.com>
In-Reply-To: <F4cyz6k03CpTVXGL3ROFHAL3FwuPZg8wyyVKgvCVeufcJMCycqMAlqbnPh2H3EU-GnR3GlAjUMbYlPDirGS3hYoNIhOFfn6vd00_SUvud2A=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:27:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9rsD3K7ac07KfEPav-dOPbET2iUSs9=vq7Fy3R9jw13Yg@mail.gmail.com>
Message-ID: <CAHmME9rsD3K7ac07KfEPav-dOPbET2iUSs9=vq7Fy3R9jw13Yg@mail.gmail.com>
Subject: Re: Status on wg-dynamic?
To: David Weinberger <cubicalpie@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thomas is working on it. He should have something working during the
first week of December.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
