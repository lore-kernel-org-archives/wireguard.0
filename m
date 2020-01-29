Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B3DC33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 08:43:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC6420702
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 08:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vdJwV67N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC6420702
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67f9ca42;
	Wed, 29 Jan 2020 08:43:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 065240bd
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 08:43:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e07adc0
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 08:43:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 977054dd
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 07:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ApTY23Disjf/6tYVRfX6CyonXYQ=; b=vdJwV6
 7NBKPz72NPh/wNvubnj0GRKLwDNKQWWqBHahfyPBf/kOxF+mupstAccGyBjkfDio
 +ZckcPECRy5arQX+N4DnniC/9z+Ar5o79cqioEs44nNkHhMo5azrfaK2JsnTcyVZ
 jIOtMswWtYFEw4Lwa4FH+02Bfv0jKfmqyP7HgRz7a+ZI2UT/V3BSXAs1tgv2onGZ
 aXliBOduRIyRSh1SvCe44IGMGsg32lq+7GEcq7tvqD1zdrCsCwa1JxOS9Mhn0REv
 mC+HjR7TUK9lVAABL+zXezppXk/LenscMw3FXBNN6XZaeqeaJz9mbUvKDO6iOj1O
 6WP2vV8vCnXHs2bA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1469a3c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 07:41:18 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id d3so14520588otp.4
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 00:43:16 -0800 (PST)
X-Gm-Message-State: APjAAAXfBwahnIqwfEq697+LSEpgfncUUePvjJ8beiXYM8w5hP+Pg8zL
 snXCNLzdyACHBTmX6ljvRU82qUL+NXIoXjZk2ro=
X-Google-Smtp-Source: APXvYqytEflXguvCMZY4YPp90cpdg6xxm0oGQ5o2602rfwzxFQcH0a8o9O/DG5ZC1lY/DZOlDlVCpJUig4u8sWImx+0=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr20192398otm.52.1580287395927; 
 Wed, 29 Jan 2020 00:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20200129002159.GA9104@wolff.to>
In-Reply-To: <20200129002159.GA9104@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Jan 2020 09:43:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9po4e8VccZwWmHotBqR=RBbKtwu8uGV7wm2WXz9Rq3f=Q@mail.gmail.com>
Message-ID: <CAHmME9po4e8VccZwWmHotBqR=RBbKtwu8uGV7wm2WXz9Rq3f=Q@mail.gmail.com>
Subject: Re: Wireguard is now in Linus' tree
To: Bruno Wolff III <bruno@wolff.to>
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

Hi Bruno,

Thanks for posting this! Indeed last night I stayed awake as long as I
could, refreshing Linus' git repo on my phone until I was dreaming. I
_think_ I've woken up now, but this might still be a dream...

A big thanks to everybody who's helped the project over the years,
written code, assisted in the IRC channel, asked good questions on the
list and IRC channel, and so forth.

I look forward to start refining some of rougher areas of WireGuard now.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
