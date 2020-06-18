Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202EAC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:55:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33F220786
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 19:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew1P0cks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B33F220786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3b53489;
	Thu, 18 Jun 2020 19:36:52 +0000 (UTC)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [2607:f8b0:4864:20::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81ae21b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 06:42:52 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id a21so4151940oic.8
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 00:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3I7l5WSYGtrK5Eqp3eZDz6VQspsgDAbpIYuBfSj7mko=;
 b=Ew1P0cks21LCbZ+2j7HgsJI0eT4FhbDygfZiR6dBQIUzvl6S+KZCAuxvNq4eBLJJOs
 mCHd/y2l/d/E4ay7JaH0+7Ic/gPu7HXQuh7v1Xfrn1IhhMOdDxsRKcRTzVE4Vjo3qEq4
 YlVgKJATbMIAfn676A5ZkjKQMLPEt84xvTanmmDygqiNCUcW4A4jbrZvqzZdJKGJXBR1
 BqMlU+yf1rIhvn6RWHh8kX6KLtFFzkrz4khlVhSTLPrpA7lS/tSKSGl5NHNkh5pTZkRs
 DkbCGqWwAfoijYZ5NPkourrjqGk7WOlEzE9UEFm+EVrB551tqSZ2WxIzlZ1eUjkWhsgb
 /kcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3I7l5WSYGtrK5Eqp3eZDz6VQspsgDAbpIYuBfSj7mko=;
 b=k5uGYPQ8g689k7g2d6I9ZcVOOKEDKJMc6YX0ds54fDXoy+rwaR8uUk3F6NZQFaGkXV
 v/xEARlOcembY4IwJ/cU8aWZc+hnuiQ0nHzpYRYuzmIXELWb5WAfqGQp3y4TDYvaMCiM
 LxwFnmU12Xhn57gI6CUrskZ7j1+Qia6XtCeiJiCn11//cq4GVYqaAPef7sW3fCP3rJra
 y1pKnauqm+eBT3zcWNDWgTDLW2C8NLpvwEiFXnQLcY5tnHxu/21r5XUqma7pNPevDztf
 jr9T7M5clMWMy6o345dbXDnlS7gCvcB2P2BL/PozI/p+XkgG4F9GNmLPooKuqAErGadH
 WAhw==
X-Gm-Message-State: AOAM532iNuFjLXb28txHvRFueE//hvDhn7n0FJA/AhSdHG6TZu+VHLla
 vHrphUSOwfvnVGfe7qMQ48C28Ohaln9C3nkvM/hbevnNOgA=
X-Google-Smtp-Source: ABdhPJzWOmbJ8q5H58OTb2Gb2w5KesEmvNi8qXXrOr0H5dvXRqX4gqF+mfQjaY3zsUUY3ct0zJ0aJkpNY1+8bzatuzw=
X-Received: by 2002:aca:ef57:: with SMTP id n84mr1798778oih.0.1592463661939;
 Thu, 18 Jun 2020 00:01:01 -0700 (PDT)
MIME-Version: 1.0
From: john walker <john.lou.walker@gmail.com>
Date: Thu, 18 Jun 2020 02:00:50 -0500
Message-ID: <CAPV7Z3z48_g-eRW6DVwiPQbyf8xu0C5bLRruzovdQXMDsq=S8Q@mail.gmail.com>
Subject: Wireguard Identity Rotation
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 18 Jun 2020 21:36:45 +0200
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

I'm looking for a nice way to rotate keypairs with Wireguard. How much time
do you have to update the initiator and responder with new keypairs before
handshakes fail?

If I understood the whitepaper correctly, sessions aren't immediately invalid
when you change a peers identity. Instead, you have up to 5 minutes to update
both sides, or else the session keys are exhausted. Is this correct?

Thanks,
John
