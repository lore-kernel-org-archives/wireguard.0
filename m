Return-Path: <SRS0=IIoP=SP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A74C10F0E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Apr 2019 00:17:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBE5218AF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Apr 2019 00:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lxPbTd2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBE5218AF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0de7e362;
	Sat, 13 Apr 2019 00:17:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4f5b42f
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Apr 2019 00:17:30 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fab5b4b3
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Apr 2019 00:17:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5999dff
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 23:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=A2K4HPSd3cpTH4KPq8V80AHb1hg=; b=lxPbTd
 2DDyUnAnw4uN66RkQSoSiCpenzuWwiqHCp0+2TjGHoTcnr81aP9ESWqtvVo8AV2s
 NwJnlGoTagmPmnfKdrcqNJkuSRBSxv7CFnIywHgI+elWGi2ISMCPiBkRm+K32CPQ
 HpQXdouZGchIG5tUjr0S3bdrmBt2j/TmmuKMHDUoxHwxkgu6QKulbeJ33RpWxpzu
 Y5wBEAHtq3TzDq7gEkwzRp35QaJ11P09MC13n5zRKjj5WGBQ6xml08ZJ9IjYL4eG
 27spi8+SpKpDwmrU4+PISTw8hWFm2NELSBM0RhXrOhRJU/e08vv7NF4BucjsWDzM
 zySgqnPsSG74KZqA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7fcd6e8d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 23:52:59 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id n187so9419777oih.6
 for <wireguard@lists.zx2c4.com>; Fri, 12 Apr 2019 17:17:29 -0700 (PDT)
X-Gm-Message-State: APjAAAXYzk+K3xPlMJeg8En8YydK8F1r2Z+kuvN74x4CcE4Gk3dGMxre
 1Avee1rqx0VsmCCsy3OS/+8zLwm0lqg76m9JCo8=
X-Google-Smtp-Source: APXvYqywblt7m3C3qkF2aO5HkJsmDiYYbwH4vo6+M2+6lLc4H1HLylgeWL0dFaAGHRxJW5U6LiY4oWxE9scFoeqwiA8=
X-Received: by 2002:aca:e58b:: with SMTP id
 c133mr11717540oih.119.1555114648605; 
 Fri, 12 Apr 2019 17:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <068214E5-B780-4A6C-AE79-BD772177EBCB@gmx.net>
In-Reply-To: <068214E5-B780-4A6C-AE79-BD772177EBCB@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 13 Apr 2019 02:17:16 +0200
X-Gmail-Original-Message-ID: <CAHmME9ojqhKDRGkEqmaP-bCXPjgpjwRKKvQL1Z9Gu+bx018jyQ@mail.gmail.com>
Message-ID: <CAHmME9ojqhKDRGkEqmaP-bCXPjgpjwRKKvQL1Z9Gu+bx018jyQ@mail.gmail.com>
Subject: Re: compile error on WireGuard Kernel/ROM Integration
To: Robert Walli <rwalli@gmx.net>
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

Link to kernel sources?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
