Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1640C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 09:18:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E415217D4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 09:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkR18axf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E415217D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd864367;
	Thu, 24 Jan 2019 09:13:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe2eee95
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 09:13:27 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cffb2c31
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 09:13:27 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id r24so1857004wmh.0
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jan 2019 01:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:date:subject:message-id
 :to; bh=51h8kW3m2gVzz13HiY/O8FFQoVX3QBYozqWdHxoSjQ8=;
 b=WkR18axfgW/HdjJXtdNWq7zxHEjMrpCMEmEJu0XogQ3fkUESJILoYjuHfbo7n4lSwa
 ZJSNZF1OPSKROZ2MxR/Hc8ULjTnEtAxS3pZTRvB9YHwLNyxWtNu09Cv/MgCCrLsvbFuH
 KZhnTz0It0qIpd4BOnpM+hveQ/Jmme2NC76M1Jg+SYsmjQdHdk/IsBR7CdnCEBncMSDp
 rz+icnguIUv5tEjkmpMS3Sw7VYPj0xQx7PDpyd73QRaeVDF3qqEWNR2A8IVpMotpuh6h
 9jZBDP8Amczyg1LxAxVOfDR8mt2+mOklmhHdJTESkE5ho8crfnr6ODzTDQcPOOId/E8p
 o/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
 :subject:message-id:to;
 bh=51h8kW3m2gVzz13HiY/O8FFQoVX3QBYozqWdHxoSjQ8=;
 b=quPkVprlnb3i5DKZIDBn7Kw7cpxhJ/hisvaU9paKWkcvZcbak1l3dEm51nBgD3HKcc
 lQNupyboPH/oElJfUTYlhrt5fbaLEY0hdYeuUctFD8h58Zv42w5rRp5kNzpp55CDncLi
 qYLIlY5CVYcQfzNtmK4iVG+/D38pxCL4EcRVo+p6j8WYpI6gxCKmw7RzGA1+XOhvWM20
 f3k0f6JTqKmqu2UyIXxU7TZ8Eh9DR5ETdg5a4LaeoWsP/55uawlRKorcoT4bGlQZ7yU7
 IR+/mdXt5b5rRZV029w1OXmMm4c63hbwCywv5NPpZ7umX595aRZbgSOY/rl9r2skH5Uq
 h+mg==
X-Gm-Message-State: AJcUukc2qlITOeJxwI6iQ2TR2wHRQV4WE6OjlfARb2Rpd2l211CHIzkF
 biYcFCBvRb6IpWBimEp4NFKCQ1rq
X-Google-Smtp-Source: ALg8bN6q0aM5eP1MgzMRoN5+QTAxAWLFjO4BnepGo7sgAQRKXO5etyNtk409197nKRDje7Ms8gme4w==
X-Received: by 2002:a1c:8089:: with SMTP id b131mr1775050wmd.141.1548321515854; 
 Thu, 24 Jan 2019 01:18:35 -0800 (PST)
Received: from [100.66.95.253] ([87.196.81.39])
 by smtp.gmail.com with ESMTPSA id g188sm77985733wmf.32.2019.01.24.01.18.34
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Jan 2019 01:18:34 -0800 (PST)
From: Henrique Carrega <hcarrega@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 24 Jan 2019 09:18:33 +0000
Subject: =?utf-8?Q?Rohde_&_Schwarz_Adds_Emerging_WireGuard_VPN_Protocol_t?=
 =?utf-8?Q?o_its_Deep_Packet_Inspection_=28DPI=29_Software_Library,_R?=
 =?utf-8?Q?&S=C2=AE_PACE_2?=
Message-Id: <168C4A39-3DFB-4AD8-839B-BA7C4D8D8F40@gmail.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (16D5039a)
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
Content-Type: multipart/mixed; boundary="===============6435052941139279528=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============6435052941139279528==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-03E149BF-6C24-422C-8124-4798428F9398
Content-Transfer-Encoding: 7bit


--Apple-Mail-03E149BF-6C24-422C-8124-4798428F9398
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



https://www.businesswire.com/news/home/20190123005355/en/Rohde-Schwarz-Adds-=
Emerging-WireGuard-VPN-Protocol=20

Can any expert advise on this matter ?=

--Apple-Mail-03E149BF-6C24-422C-8124-4798428F9398
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head><meta http-equiv="content-type" content="text/html; charset=utf-8"></head><body dir="auto"><br><br><div dir="ltr"><a href="https://www.businesswire.com/news/home/20190123005355/en/Rohde-Schwarz-Adds-Emerging-WireGuard-VPN-Protocol">https://www.businesswire.com/news/home/20190123005355/en/Rohde-Schwarz-Adds-Emerging-WireGuard-VPN-Protocol</a>&nbsp;</div><div dir="ltr"><br></div><div dir="ltr">Can any expert advise on this matter ?</div></body></html>
--Apple-Mail-03E149BF-6C24-422C-8124-4798428F9398--

--===============6435052941139279528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6435052941139279528==--
