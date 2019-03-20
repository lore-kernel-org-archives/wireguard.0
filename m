Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DA5C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:55:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ECBA218B0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ai/JhTmk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ECBA218B0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dadd7bd;
	Wed, 20 Mar 2019 22:55:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f31c31a
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:55:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db523c61
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:55:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 691c14aa
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=C1ZWtRY8QRv2dGY6bvA55DbcQJI=; b=Ai/JhT
 mk/uthpYziZGPdAJdUCzonv2M/EE9WCj53KNCGaYTsicrnNo28gqJrRE0HSMoVA/
 hcSfBojGqPeq/go3EVyuX5Ze94Wodp/DqbtP+b6DVToHz+G8t/TRuEdq1yQFm7FE
 q5AF6/RSJVDBDDAVMTddHYQM8xpkA2SlhyFmajvkuV2UhqINZQEJ5MQk4e7c7nYp
 A8Bu6agmjxoqhfdIaZxNLP1Qwi5d4h7vMQs/bevfV4wHYfCzjxVtdxJz7FsPIAvE
 X4CzrxJnjn+pl1YiKjMkWp9pk/UpnepZwQvDSwizFZwCT2a5lVOwOzI5sTYAE2rp
 T3aGAYGwcfeGPgGA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d1c26169
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:33:51 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id q24so3799410otk.0
 for <wireguard@lists.zx2c4.com>; Wed, 20 Mar 2019 15:55:24 -0700 (PDT)
X-Gm-Message-State: APjAAAU3l9jc4DrlOe0XnGXMkIWNHyFB78DK/yMRDvFH/ayygqwBtNXr
 8U0RtjrovDSG0fZKJRLx+Wsfn1RqBoYkUNGVcdE=
X-Google-Smtp-Source: APXvYqxG8w8O76GoxysXuSVg1+7kopDjZNyyRA/gHmOe8CwPu9bdeuZ7WMwffOBok249CqN3I9h87QywacTMewOinQw=
X-Received: by 2002:a9d:7645:: with SMTP id o5mr430011otl.225.1553122523552;
 Wed, 20 Mar 2019 15:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190314115612.2412-1-mail@colinfinck.de>
In-Reply-To: <20190314115612.2412-1-mail@colinfinck.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Mar 2019 16:55:12 -0600
X-Gmail-Original-Message-ID: <CAHmME9prfELb2_V+aPfPyUkNv_eKcmt3K_s5HA9RCaDbH-YaHQ@mail.gmail.com>
Message-ID: <CAHmME9prfELb2_V+aPfPyUkNv_eKcmt3K_s5HA9RCaDbH-YaHQ@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: Unset the DNS first,
 then delete the WireGuard interface.
To: Colin Finck <mail@colinfinck.de>
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

Hey Colin,

On Wed, Mar 20, 2019 at 4:46 PM Colin Finck <mail@colinfinck.de> wrote:
>
> This prevents an "Unknown interface 'wg0': No such device" error on the command line.

Your patch seems basic and reasonable enough. However, I don't know
how to reproduce the error you're getting. Usually resolvconf doesn't
care if the interface is there or not. What OS/configuration is this
for you?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
