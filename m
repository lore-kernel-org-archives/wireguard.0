Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDF0C2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:57:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033A6217F4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 15:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="u9RLOkZu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 033A6217F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebdace90;
	Fri, 3 Jan 2020 15:56:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a9e0027
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:56:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 802851ee
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:56:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fd07719
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 14:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=T3h3YpDZXBxjEmTVg45SD1t/AjM=; b=u9RLOk
 ZuiCWWXGnFbQWiF9TeXVeb4XWRJCD+57tqCKJNY8ShVBrJEWbKqD9e4R5rhD7m7e
 AoWNl0rBNsiaJ81kVvLajZdgzaGC50H3XV6e2Fpn/kjntKh02StWFFlQvaPLLUUn
 aGZQz3roFaT2pgcW2kUn96H7NXpRMfyRGjt87I0R6X219VEDuXhU/P5SNRr5jNIi
 QbMDE694lHcga9o2DBEUOxIvgkKqzUpe4c699CNUP0ib12FCs8J9/k+QPAeNy8k7
 ASvknFyxiZ3cPCE1gKBxnB/fgrOShsd1TWBEydbKvE/VS5TeuOJV/1LMzJqkw4Iw
 VXbwyAATQ4qtd6pQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3bace3d4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 14:57:33 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id a15so61665776otf.1
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 07:56:11 -0800 (PST)
X-Gm-Message-State: APjAAAUkBZ9eLTEEXwPQ3mdYbImsumHjOcMHj4zNiL1noFHnQDYnN2PC
 dkahm4upcf0y4IUbA7+FahV6yaHnCkf/UGVadT0=
X-Google-Smtp-Source: APXvYqzd4jo6dRM51Zivw5nV0+kHoY/jug6AYu/qvPQQQj3itwMzg86PeI8yDtOkvseHudVphEpnXxXAsuL6/pGXTDA=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr85174919otm.52.1578066971047; 
 Fri, 03 Jan 2020 07:56:11 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce0Ruqyrei0OykZ-d-gK97TGTq4wMPy2OrrVeUEbvm=sjA@mail.gmail.com>
In-Reply-To: <CAPRZce0Ruqyrei0OykZ-d-gK97TGTq4wMPy2OrrVeUEbvm=sjA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 16:56:00 +0100
X-Gmail-Original-Message-ID: <CAHmME9pNoKwUpWg1QhH9+EKYGXBT7MODbP-nD22cV3Nd7kZMjw@mail.gmail.com>
Message-ID: <CAHmME9pNoKwUpWg1QhH9+EKYGXBT7MODbP-nD22cV3Nd7kZMjw@mail.gmail.com>
Subject: Re: Installing Wireguard on Windows 10 on Arm; "wintun" device
To: Edward Vielmetti <edward.vielmetti@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Wintun supports the arm64 kernel. Go supports an arm userland. Ideally
these should match, but they don't right now. It should be possible to
get arm userland talking to the arm64 kernel with some careful struct
poking, but it doesn't sound too pleasant. The best thing to do would
be to get Microsoft and/or Google to port Go to arm64.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
