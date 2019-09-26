Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B40FC43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:06:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 228C820674
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:06:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ceegeebee-com.20150623.gappssmtp.com header.i=@ceegeebee-com.20150623.gappssmtp.com header.b="ot+inF7M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 228C820674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ceegeebee.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 644e5ad8;
	Wed, 27 Nov 2019 09:05:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b9de253
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 02:35:24 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e827d67
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 02:35:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id y19so835928wrd.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 19:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ceegeebee-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=IA+/ugeMEEHx8b4Y1AoIKK1MI7HpWkQPlX4NsHwQLlU=;
 b=ot+inF7MpoZoR3wCfkfNlGeQ1vjj3NNZyPxqTQOvIroPUV2l4Qh3iGS+er0qNTeAj9
 hu/1T5LTfBjgJv5+5Os9zvGOxc6vZF3YvZYKfLOskpfiXVcc3JChWYg/gIeDULL4vZ8A
 eDwzLNP81l+m/toRHBa0ETKUtMIsysKBJHWszgPlWffleMOj1MIBdw7bX7wbqwTdTrQS
 EMsoCd1dWoe9HyA7e5aCEFRf9Z0l2t4jpkMHpg5DZu5Uwnn2hRnvXtvWY/uZsq4GY970
 VIkk4m4R5KcMIEqSCvj8ZiZ88qcMwZJmdu34yhefOd3cpNpAjgycNrMvZaolx/p+Ctui
 D21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IA+/ugeMEEHx8b4Y1AoIKK1MI7HpWkQPlX4NsHwQLlU=;
 b=QVvL1egy7wFb9L7BgAn/j7fJffpS/ovkZM/aXYgGTHGKeWf3Zne09f867PxkqtyNq0
 yH/1toUu/FAmJp5RCUPM+/YLVGj9ZJ8XhLkaz6nNSSqVE+hpOurXulySLyzBH2TUqTzx
 cW0eZvBC6EkqpOHzkByrlcVV9f1AThQgz9Dlult5CJ+ZxQ4xXzvrHJtKcUHR+oHOSWZ4
 B9acKRx+/aKHFmv+kF1g2DcqnK9yHzjcQuNU7SPAjBYskbthxeOVKZWTT9OBEC/yHWv+
 GLJ3q7HHW/tWx3ZtRPzA9wBXTQWZbdJKsnao9i3NOMDNPCk0FOJO3Zivylbp0WFVSaL2
 lNOw==
X-Gm-Message-State: APjAAAXca98bJM4OY92Wcut+nv6AAzN37GkK42HunGtKq5QGTnqDN4RF
 OmavdAiOKhUweGUNCqXSZ5N0CXdOhOYWjr5XPqty//lSg6k=
X-Google-Smtp-Source: APXvYqyoiPwt+QvRzkqa1jCmIoIhiV1CtixS8H8zMgAy4PvD/fqxn82yr061TX6z6Hf4hSaHIvJWycjRoh1F5mGXzMY=
X-Received: by 2002:a5d:428c:: with SMTP id k12mr956826wrq.196.1569465322057; 
 Wed, 25 Sep 2019 19:35:22 -0700 (PDT)
MIME-Version: 1.0
From: Chris Bennett <chris@ceegeebee.com>
Date: Thu, 26 Sep 2019 12:05:10 +0930
Message-ID: <CABPTpJBGQcze6b3_tJij8Ysp8zwb_4fyQAEv_fy4Bx9YpVcpRw@mail.gmail.com>
Subject: Wireguard for Windows - local administrator necessary?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:05:45 +0100
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
Content-Type: multipart/mixed; boundary="===============3565331813576000315=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3565331813576000315==
Content-Type: multipart/alternative; boundary="00000000000002665105936b9f5d"

--00000000000002665105936b9f5d
Content-Type: text/plain; charset="UTF-8"

Hi there,

I've been experimenting with the use of the Windows Wireguard agent for
corporate VPN access.  It's been working really well!

However I've found the logged in user needs local Administrator access to
activate and de-activate a tunnel.  Is there any way around this?  Is it in
the roadmap to remove this requirement?

Thanks!

Chris

--00000000000002665105936b9f5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div><br></div><div>I&#39;ve been experimenting w=
ith the use of the Windows Wireguard agent for corporate VPN access.=C2=A0 =
It&#39;s been working really well!</div><div><br></div><div>However I&#39;v=
e found the logged in user needs local Administrator access to activate and=
 de-activate a tunnel.=C2=A0 Is there any way around this?=C2=A0 Is it in t=
he roadmap to remove this requirement?=C2=A0=C2=A0</div><div><br></div><div=
>Thanks!</div><div><br></div><div>Chris</div></div>

--00000000000002665105936b9f5d--

--===============3565331813576000315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3565331813576000315==--
