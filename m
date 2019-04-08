Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7648EC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAB3120830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lj+TE8tj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAB3120830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98553544;
	Mon, 6 May 2019 20:28:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4726bfb3
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 12:30:35 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfe432e1
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 12:30:35 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id a28so9327633lfo.7
 for <wireguard@lists.zx2c4.com>; Mon, 08 Apr 2019 05:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rhI0sN3trUF0MW7b6zRrfBBsYrcoawTw0Hp1lsN7T/M=;
 b=Lj+TE8tj8kyr5+MO85grVfHwO8JdkniUtaacoFb1O4Hw+GYezb0meR7ZkFgz7oYxAL
 87Ks/TKQ5AOhIPi40r67NSwGKO8EpkTt2N2H9PO8bLmBj093p7kSV7Em11PffguFhiGx
 nSiOuiLD/rVEzY65YDv1l1ckneHJaNbbB4sI0sY8RsIwldUyIKGhKDIS52uGrOIbbznv
 /2Mqj/wT4n8qtAptRuCtuZaFFxD6yYeHj4CV5b3NmWkkEzflEeBWLlZTBOQCYdfZwCY3
 oN9NxIybBpJQYXcSNn2etBoLAfzjtFLRfYgym3DizhMfEQGIxJyoXgg0eNfEriiriWUy
 FSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rhI0sN3trUF0MW7b6zRrfBBsYrcoawTw0Hp1lsN7T/M=;
 b=Ud54uOK4kCFOuNxBr3y0OOMX1MP9yCpXfwnfaMNt+fPmihMM9kEBQa4lJ6qfV4QS2P
 OeF6TDMWhh3PTEn+3ukninz/1QhhWkZXkht+AI+zOsFonjG6MEAffwqNnoN57B6rzOs7
 E/tu+uucT7+OaWIlTx6cwE3aTe3IBXoFtYtxc5mvR9lqFJm0oRXNFyzXDtNDxa6i2LQY
 s3FTITy5nzxunotb5jsDOWP8MXDN5SePxlagChftGsSkuuFoTykvIgx7lznoOxTmmLpL
 HIaoBTvQoahIxTRnpcChfeRiOaLG9ScvASqsPG4qCY3JKRgNdL+rYlTcVHGiAfHmbN1o
 NabQ==
X-Gm-Message-State: APjAAAWEZ6qNVE7D5bYPVMtC+WxGlYAbW30M/y8WU8wM5nkFAIdqcweP
 buKe9ly2dYMvFX55nWNaA3xTzqTK0EfnW7YZDTHTH1wI
X-Google-Smtp-Source: APXvYqwTz8b76Mjjp1jHHz8yjMG5euje7vhTxW6e36V/YtcD6WLNC1BrNeX+7I9YWBJOkUPC8h93SKgPyX2DNWEUIEg=
X-Received: by 2002:a19:f010:: with SMTP id p16mr8034984lfc.43.1554726796551; 
 Mon, 08 Apr 2019 05:33:16 -0700 (PDT)
MIME-Version: 1.0
From: Denis Kolegov <d.n.kolegov@gmail.com>
Date: Mon, 8 Apr 2019 19:33:25 +0700
Message-ID: <CACoviyOw7FPD1eNkYv=C7LhpOk43F67MgcLKLyy7cSdUCHPESQ@mail.gmail.com>
Subject: WireGuard private key renewal
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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
Content-Type: multipart/mixed; boundary="===============2739564015423904176=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2739564015423904176==
Content-Type: multipart/alternative; boundary="0000000000006e6b760586040a47"

--0000000000006e6b760586040a47
Content-Type: text/plain; charset="UTF-8"

Hello All.

What is a suggested way to update a WireGuard private key without packet
loss?
There is no packet loss during session key rotation, but is it possible to
update private key (received via oob channel) using existing mechanism?

Thanks.

--0000000000006e6b760586040a47
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"ltr">Hello All.<div><br></div><div>What is a =
suggested way to update a WireGuard private key without packet loss?</div><=
div dir=3D"auto">There is no packet loss during session key rotation, but i=
s it possible to update private key (received via oob channel) using existi=
ng mechanism?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks.</d=
iv></div></div>

--0000000000006e6b760586040a47--

--===============2739564015423904176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2739564015423904176==--
