Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A004C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:49:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96F2C21872
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96F2C21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antun.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afc24e3f;
	Wed, 17 Jul 2019 20:44:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f883db3f
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Jul 2019 21:03:21 +0000 (UTC)
Received: from costela.net (costela.net [IPv6:2a01:7e00::f03c:91ff:fe96:79e6])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 113781ee
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Jul 2019 21:03:21 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46]) by costela.net (Postfix) with ESMTPSA id 0BA81E75E
 for <wireguard@lists.zx2c4.com>; Sun, 14 Jul 2019 23:03:18 +0200 (CEST)
Received: by mail-io1-f46.google.com with SMTP id i10so30954520iol.13
 for <wireguard@lists.zx2c4.com>; Sun, 14 Jul 2019 14:03:19 -0700 (PDT)
X-Gm-Message-State: APjAAAXMSgU2YXhTcY7BRqjLiUvgY2Pb0RheULSvecJtVQG8FiNE5siy
 R2miQQ6pjV80FntMUkYt6yTVlf7gw+Ej93QSohA=
X-Google-Smtp-Source: APXvYqy6P4Rql8w2aqP2yNFXjt4aD/UERRKqY5RT2ea7pHVbHEELoqI3GW4lZqmEMP605y/4/IHjYZELXBNB0Zqa4ZI=
X-Received: by 2002:a6b:c9d8:: with SMTP id
 z207mr20823691iof.184.1563138198555; 
 Sun, 14 Jul 2019 14:03:18 -0700 (PDT)
MIME-Version: 1.0
From: Leo Antunes <leo@antun.es>
Date: Sun, 14 Jul 2019 23:03:07 +0200
X-Gmail-Original-Message-ID: <CAMsOGpvAWaWyUvTe3QKPi-FffXQ-TLb_8SG+QEL8wSUsfsvqmA@mail.gmail.com>
Message-ID: <CAMsOGpvAWaWyUvTe3QKPi-FffXQ-TLb_8SG+QEL8wSUsfsvqmA@mail.gmail.com>
Subject: Mesh building tool
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:44:13 +0200
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
Content-Type: multipart/mixed; boundary="===============1984879892546409247=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1984879892546409247==
Content-Type: multipart/alternative; boundary="0000000000000f4f78058daa7923"

--0000000000000f4f78058daa7923
Content-Type: text/plain; charset="UTF-8"

Hi folks!

Just a short shameless plug about a little trinket I've been working on,
which creates and manages a mesh network on top of wireguard:
https://github.com/costela/wesher

It doesn't hold up to the same security standards as wireguard itself (as
mentioned in the README), but it's hopefully still useful for some use
cases.

Issues, PRs and constructive criticism welcome! :)

Cheers,
Leo Antunes

--0000000000000f4f78058daa7923
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hi folks!</div><div><br></div><div>Just a short shameless plug about a little trinket I&#39;ve been working on, which creates and 
manages a mesh network on top of wireguard:</div><div><a href="https://github.com/costela/wesher" target="_blank">https://github.com/costela/wesher</a></div><div><br></div><div>It
 doesn&#39;t hold up to the same security standards as wireguard itself (as 
mentioned in the README), but it&#39;s hopefully still useful for some use cases.</div><div><br></div><div>Issues, PRs and constructive criticism welcome! :)</div><div><br></div>Cheers,<div>Leo Antunes</div></div>

--0000000000000f4f78058daa7923--

--===============1984879892546409247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1984879892546409247==--
