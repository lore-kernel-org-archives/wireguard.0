Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E28C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:22:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00C020989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:22:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPH78sZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00C020989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7a5af0a;
	Thu, 6 Dec 2018 23:08:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0a4b9f9
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Nov 2018 00:09:01 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9f8b3ac
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Nov 2018 00:09:01 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id b85so7415996pfc.3
 for <wireguard@lists.zx2c4.com>; Mon, 26 Nov 2018 16:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Rd8PX6D5bb1x7NdLDdhKXNxAsOdUZAXNmhJRO94elbA=;
 b=ZPH78sZHu+Z3c/utkht9xeaxW6feteLyIDqWOeX5SVXUOQNvx8QdeFd907EE23Q9TM
 AD6jzWYuml8umTP1lAL9CaOCedsy2nDsEol/kIQ65I8s1WAXB6uUBMCF7xVrH8dRrih8
 j4iptEYTIlk8E+N3Q55s3uBFmZjfVDu0ovzz4xSYn43aCdfEB/hLZmcTX9sMKHebGAuh
 XkL/rYb3WtUW3ZEf/ItJS9jbSkV1mB4Xwnuvnv9kvoUT9KlfVERgw8e5ntHt28d7EzF1
 Uy31m6lILXu9AF/Z+l+ASTfPd6oSDPkmYLksC2+ztW3yS9Bl2/oCoxndQ6PKpp8k4FRC
 l1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Rd8PX6D5bb1x7NdLDdhKXNxAsOdUZAXNmhJRO94elbA=;
 b=lNJ4rEzyDUZ23ulCVRNwPn59+RE5AWgnloSe4VOY7pUqbRNge2mowmhtHQ+XgvwUG+
 ycXFRMcvpE/EGD3FBOOFtEO5UWky3VYOlPmTQLIz2SQplR5hxqgPtE/TNzuDJRX3/WG+
 HpCBp5j3i8//6C5o8q1xXW+mYYNoWlnYWfCRdIRaYkSYuhsdcnZ7D2e63HXZMnrb7Aga
 P5oAqA2IwxpZtUbn+sIL8OLorDmWVQRqEMHj4dZw7nIuvMsHmnqUnb59JaaXMa88E3HQ
 tjFPe1DcXzt00Axe+I630rpMYl8gXIBT00GV8gcbOxspN4edzmy4iK16kZqW0ilriD5s
 VdDA==
X-Gm-Message-State: AA+aEWbNlacSpNslmiig/QlupG6QQvyyKldH1e6whhUqXzR/a2G4m5HE
 0agoTbdoONPb/TbHh7blXiSnO9LlVZDo0OGwCmDHEpoZ5Rc=
X-Google-Smtp-Source: AFSGD/XOZ+wAdfCPIdb8NXetRQOE2wAP0XZMZfAXSBOZJXkQ+J5q1L7LinVIcUkMc3X2zZtURYzcbj4FryoAh5YM8XQ=
X-Received: by 2002:a63:6dc8:: with SMTP id
 i191mr26166004pgc.215.1543277756513; 
 Mon, 26 Nov 2018 16:15:56 -0800 (PST)
MIME-Version: 1.0
From: Svet Bajlekov <tomatoman@gmail.com>
Date: Tue, 27 Nov 2018 00:15:45 +0000
Message-ID: <CAKsyV3EivKOY_Gu2OkWvz6d2ZtBHW-S6-WxA0jK63gG8BV-Bgg@mail.gmail.com>
Subject: wireguard-go: custom socket dir through environment variable
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:08:53 +0100
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
Content-Type: multipart/mixed; boundary="===============8403302066241303995=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8403302066241303995==
Content-Type: multipart/alternative; boundary="00000000000077843f057b9a5a84"

--00000000000077843f057b9a5a84
Content-Type: text/plain; charset="UTF-8"

Greetings,
In the userspace implementation, would there be any interest in making the
socket directory (/var/run/wireguard) customizable via an environment
variable?

My use case for this is that I'd like to install and use WireGuard as a
snapcraft package*, and the respective confinement restricts access to
/var/run. Either way, having the ability to customize the path seems like
sensible functionality.

The code change itself is of course pretty simple. I had a go at it here (
https://github.com/WireGuard/wireguard-go/compare/master...svet-b:0.0.20181018)
where an optional WG_SOCKET_DIR variable is introduced - and what I did
works, though I have to admit that it's the first time I've ever written
anything in go, so what I did is pretty ugly. Therefore I figured I'd reach
out on this mailing list rather than submit a pull request.

Thanks, and keep up the great project!
Svet

*Yes, I understand that running the userspace implementation in Linux is
not exactly ideal. I'm doing it on devices where I can't install kernel
modules, and where squeezing out performance is not that important.

--00000000000077843f057b9a5a84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Greetings,<div>In the userspace implement=
ation, would there be any interest in making the socket directory (/var/run=
/wireguard) customizable via an environment variable?</div><div><br></div><=
div>My use case for this is that I&#39;d like to install and use WireGuard =
as a snapcraft package*, and the respective confinement restricts access to=
 /var/run. Either way, having the ability to customize the path seems like =
sensible functionality.<br></div><div><br></div><div>The code change itself=
 is of course pretty simple. I had a go at it here (<a href=3D"https://gith=
ub.com/WireGuard/wireguard-go/compare/master...svet-b:0.0.20181018">https:/=
/github.com/WireGuard/wireguard-go/compare/master...svet-b:0.0.20181018</a>=
) where an optional WG_SOCKET_DIR variable is introduced - and what I did w=
orks, though I have to admit that it&#39;s the first time I&#39;ve ever wri=
tten anything in go, so what I did is pretty ugly. Therefore I figured I&#3=
9;d reach out on this mailing list rather than submit a pull request.</div>=
<div><br></div><div>Thanks, and keep up the great project!</div><div>Svet</=
div><div><br></div><div>*Yes, I understand that running the userspace imple=
mentation in Linux is not exactly ideal. I&#39;m doing it on devices where =
I can&#39;t install kernel modules, and where squeezing out performance is =
not that important.</div></div></div>

--00000000000077843f057b9a5a84--

--===============8403302066241303995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8403302066241303995==--
