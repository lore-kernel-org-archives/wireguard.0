Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B43C04AAE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B079206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qPlspUPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B079206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e619fda;
	Mon, 6 May 2019 20:33:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 974f25c0
 for <wireguard@lists.zx2c4.com>; Sat, 4 May 2019 00:14:34 +0000 (UTC)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3231af60
 for <wireguard@lists.zx2c4.com>; Sat, 4 May 2019 00:14:33 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id ck18so3460257plb.1
 for <wireguard@lists.zx2c4.com>; Fri, 03 May 2019 17:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=tmGBrscLCFwFWVxU9N9IV1BgYbM7bx3Y6fYMj0CFmJ0=;
 b=qPlspUPGu6Idrp0OJ++VU62wrBmsyuXRCNnn1TIhCUnwiRH1B4Y5vJGH0JuaNnRw/O
 +Z3ZQQG9lxDhbe3CoKFOHua24B5pmnq2Jn+U/H4Xa7JeEgQL96IFezYUU1LkHvfVFtng
 RHjygLx2i43oHm60HQosXh3LGrO/QVOfWPMPhE4abZY/Y2IaZVwUnq3o1RgsY0Jmf0Bc
 TjeEAEWg6yy8uz3J18BfNGCtPoEIGwmrkUhdzpz/nMYHeB+P2eeFcqUycdJJBxdu9oH1
 swshQ8e91g1ASjxiO80TEM2DyqHRbn9mwdPWplEnlR402TIzWVTOAGPPrJUGta0htwt7
 fJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=tmGBrscLCFwFWVxU9N9IV1BgYbM7bx3Y6fYMj0CFmJ0=;
 b=OkcHIhXJnwif31tywI14f4vPGBynCgk3RG0PAMIUsFvFHUWKiELWxjo6LOOwHNxFx/
 qTui+p/65GbR8hxLVhs+T+U66BBukndLEe8mrz7Ui33IZAkDkUlX/rLLphPeCxdBMioU
 qpsbrInjgOeqE1sjRNH4H8Wk4i5ZtqTx11WDINHLYn2LxV0cfktJgkl3QXViM/pIe6QB
 jFQQGBBuzmzYxfO8b5cswht5Ad6wUY/p7WjYZEwocgbIrzr70WREeuPbb0rCHTlISQUX
 JuuF6tDsP4lK7ePgIcs6kz8MrLQE++BQUrXJs1zMDF1T9k6C/JStAYKgk5P3PAlMSB33
 lA1w==
X-Gm-Message-State: APjAAAVbtTIjndkpTLrJDpNpu52AuRG601obUopoKQIkNnr+wSrjrV/t
 EdHnRRfmZUm3YS5W27h+NnV09+JA
X-Google-Smtp-Source: APXvYqyIzCLCsXXq3YjQ9DiLEDtrf+wnRFRDKEL8/7mQE8wEe9yuGV0TMT574RXecse3g+ND8+BhSw==
X-Received: by 2002:a17:902:a503:: with SMTP id
 s3mr14229524plq.16.1556928872713; 
 Fri, 03 May 2019 17:14:32 -0700 (PDT)
Received: from an2.getcooperation.com (c-73-240-223-176.hsd1.or.comcast.net.
 [73.240.223.176])
 by smtp.gmail.com with ESMTPSA id y6sm4020454pfm.160.2019.05.03.17.14.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 17:14:31 -0700 (PDT)
From: PAUL DEBRUICKER <pdebruic@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: can't add configuration to macos client app
Message-Id: <4C0BCCEB-EFAD-4CE3-8453-4EE9B7486470@gmail.com>
Date: Fri, 3 May 2019 17:14:29 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.8)
X-Mailman-Approved-At: Mon, 06 May 2019 22:33:15 +0200
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

Using the latest version of the app store app I cannot add a configuration.   


The log shows:

2019-05-03 16:25:25.507584: [APP] App version: 0.0.20190423 (8); Go backend version: 0.0.20190409
2019-05-03 16:25:36.639313: [APP] App version: 0.0.20190423 (8); Go backend version: 0.0.20190409
2019-05-03 17:03:18.721424: [APP] Unable to add config to keychain: -25293
2019-05-03 17:03:18.721688: [APP] Add: Saving configuration failed: Error Domain=NEVPNErrorDomain Code=1 "Missing protocol or protocol has invalid type" UserInfo={NSLocalizedDescription=Missing protocol or protocol has invalid type}



Adding an empty tunnel, naming it, then saving it, fails. 

Adding a  [Peer] to the new empty tunnel and saving it fails

Importing a configuration from a file fails.  

In each instance the UI reports 

"Unable to create tunnel

The configuration is invalid"

IS anyone else seeing this? 

Reinstalling didn't help. What else should I try?  


Thanks


Paul
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
