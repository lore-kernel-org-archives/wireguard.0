Return-Path: <SRS0=OwtD=PT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C159C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 08:09:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C8720872
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 08:09:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH7OUh/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C8720872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09867b43;
	Fri, 11 Jan 2019 08:05:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e9fa90c
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 00:11:16 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75d455e3
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 00:11:16 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id f23so11712649edb.3
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jan 2019 16:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Oaqvs03ke7XIfHxwTHMrGZUcBnBoUwM42ON3/K9ca6o=;
 b=YH7OUh/+mJ7FdQHEEu0hb3uZXhdQBUIx3f6Ku8B9RyFg9mJxuGuW7/JCmDgwdSiquY
 broSB3n51XBMCHEvRdeggoKksjbwMQl+Y/4xwJHF49FxnkxJ3Q9ha58mvzBtgCZmgSFJ
 dZGdyd0c4E+KmhI1tLuk38diio8rW1z7hB7rtJ3AH3KB0kD9Ahx+kdy8Zqfi7veK1nvm
 GGvl13c0DEMGwIbYWeHSLuEG2Y5ipIF4VmLvD3aRyM7XYT6ul+TtqJjwgGpeMhNz4Yiy
 fBiHoCOmvy6NV0m/hLwU2SwY2/hLWu+CsWJ4BTXexG23nLODlJIlRHo1pGG+eDNEsPhc
 aZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Oaqvs03ke7XIfHxwTHMrGZUcBnBoUwM42ON3/K9ca6o=;
 b=KMiZzzHZei87AYTW+eeMJIaim3a40j8cCdDE5BZanM0xdlIzb3NgC86vlslu+tNf9y
 l5c/afgfp4gdl1THUGsyZZbPB9LONcPWFQFI6yDWuAtvTvi1riyViHnehFYx4MmS7SPA
 HuQqw+BKI4R7JBj7wALBuhw51eEX0M4NRwTe7n6+yod2f+F/fHjJ4ABfjC1/SgqP12ER
 zcenDOZN1fkRi9wY0bLon1wV76neFzOs8Z8ct0QiY/o8uKZH+UaVFjGOUSrrMwYZwuYM
 SmTePHpO0mMRekvh7TtfdVMaOEDmeCUBUE8fkyWRCbxLSswnLYbNB9Bp34cW5LSet4dI
 1aEQ==
X-Gm-Message-State: AJcUukfzB1P2wpgN/LwhlnGh9tvn6YYapZ3wZDTAN+Vrki7kpWED+sjg
 PehK0DpZhS2FbzrHPMNJTSswFa2MpENUOnutS0K/cw==
X-Google-Smtp-Source: ALg8bN6EOdDhlTdWFoZ4TsByyni6YIOCsOV57qM31z4WxUdrO3vPic6djiq5a1a14k8iLNEhcx+EKqoTgO4nDWE5mos=
X-Received: by 2002:a50:c252:: with SMTP id t18mr11182194edf.57.1547165681209; 
 Thu, 10 Jan 2019 16:14:41 -0800 (PST)
MIME-Version: 1.0
From: John Accoun <jsonacc@gmail.com>
Date: Fri, 11 Jan 2019 01:14:30 +0100
Message-ID: <CALLpx3RrfNM7Brf0m-9eEMbRiHneUWK00fNorUAn948asC6jSg@mail.gmail.com>
Subject: how would one go about building an admin frontend?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 11 Jan 2019 09:05:47 +0100
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
Content-Type: multipart/mixed; boundary="===============4552530294836652529=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4552530294836652529==
Content-Type: multipart/alternative; boundary="000000000000d653e3057f2394a4"

--000000000000d653e3057f2394a4
Content-Type: text/plain; charset="UTF-8"

I need to provision a large number of linux devices on multiple locations
and put them all on a VPN.
Configuring each device manually is too tedious. I was thinking of spinning
up a server with a small HTTP api to exchange keys and configure wireguard
on both sides. Then each device would call this server to register itself.
And while I am a it I thought I could throw together a minimal admin ui
that I could use for example to manually remove peers.

I red the 'Web App provisioning Server' which I believe describes a
possible solution for this use case. But I am confused with the whole data
storage thing. Where do configuarations live? Are the configuration files
at /etc/whireguard/ the source of truth? If I edit these when is the list
of peers refreshed?

The above mentioned document suggests shelling out to command line tools.
Is this the recommended way. Does a general purpose library for managing
wireguard config exist?

--000000000000d653e3057f2394a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I need to provision a large number of linux devices on mul=
tiple locations and put them all on a VPN.<div>Configuring each device manu=
ally is too tedious. I was thinking of spinning up a server with a small HT=
TP api to exchange keys and configure wireguard on both sides. Then each de=
vice would call this server to register itself. And while I am a it I thoug=
ht I could throw together a minimal admin ui that I could use for example t=
o manually remove peers.</div><div><br></div><div>I red the &#39;Web App pr=
ovisioning Server&#39; which I believe describes a possible solution for th=
is use case. But I am confused with the whole data storage thing. Where do =
configuarations live? Are the configuration files at /etc/whireguard/ the s=
ource of truth? If I edit these when is the list of peers refreshed?</div><=
div><br></div><div>The above mentioned document suggests shelling out to co=
mmand line tools. Is this the recommended way. Does a general purpose libra=
ry for managing wireguard config exist?</div></div>

--000000000000d653e3057f2394a4--

--===============4552530294836652529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4552530294836652529==--
