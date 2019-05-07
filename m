Return-Path: <SRS0=Fp2b=TH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC41C004C9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 May 2019 12:35:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D2E1206A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 May 2019 12:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcYLzN5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D2E1206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16a04066;
	Tue, 7 May 2019 12:35:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6482095
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 12:35:15 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ae95131
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 12:35:15 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d12so1623620wrm.8
 for <wireguard@lists.zx2c4.com>; Tue, 07 May 2019 05:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=bdw8ppXIWY3OWfRvpf5yLH4no275J2mUc8sEC9KCfow=;
 b=hcYLzN5Jfdt2ij2P3ux69uC1x3igznd/gVAfSBEcqZsq71JZaBjjmvs/VYlPASO1v8
 yvBe7eHcfjVF7zbjzLSOgCWYcRjVYCUfnoL5P0uM9L5b59P+AGOX0yy1r0mlIdf2ruWx
 MwEy5O9wcL3WRKSm+4S2OiPAnfnO8g3f4QTat2Tmyc4RyNbG3gk/HFWODmi3NjSQp3RK
 rye++otxAUjqE+bjziCEHgbZrl0/sGGg8GylnbaJ2hysTys+hbZXgFvF3N6REGPF8jgJ
 UOvOOVRSNUyMXjwyhniNPcdlHZ/VnU6DvvASePVO0JoY77/qMaJSTBkRRCu48IGxpnT4
 NDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=bdw8ppXIWY3OWfRvpf5yLH4no275J2mUc8sEC9KCfow=;
 b=LdPua7rF8dZQveuojjEmwq2tzZxuZgfPvhR9RNWVN9LvmWuU01+acIGuVGAEjO/10C
 rYZsoaPZA9H0m59GppephJf5feMS0sd3rCJlrkNVZClx34Wpl1LQ5a/5IMAf01mZedPP
 73A0YdI8WpG1nGFmaJBdunxjGra8zCc4yjxgBTXDcV1t1bz5gc9NGOX3DXTAS0tIe6CW
 YOMVu45wveW56nRpIgDd66eVG2ULFFRV/r+As84g6UKq8Gu5z471uxXzNnYeHQ/nhB6t
 70YiMxBEhl+b1OiW0zS3Xtk00scp1bTcRs/1RnNP+d0TpF9OgEO4pZwBAxaIXJjrhY/g
 qbJQ==
X-Gm-Message-State: APjAAAXOSxIO4WsMMM5ehX0cR2Hli4rIL/jNtJMUU7z2CJC9jfraroJl
 a78rXjXdu/vsChF/7pVx1jl0NN76MAA=
X-Google-Smtp-Source: APXvYqz2r02gS+0KrNF1SaNl7Fn48MTk7aFADul50H18MOgCo/TuD2+1LUgBg2IARwq/ZETrQeFWig==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr21542633wrv.104.1557232514448; 
 Tue, 07 May 2019 05:35:14 -0700 (PDT)
Received: from hal.home ([188.25.254.132])
 by smtp.gmail.com with ESMTPSA id m17sm7033527wmi.27.2019.05.07.05.35.13
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 05:35:13 -0700 (PDT)
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: wg-quick conf file :: add include keyword
Message-ID: <294893af-d702-c755-003d-3e64a063c902@gmail.com>
Date: Tue, 7 May 2019 15:35:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi! Would be possible to add the include keyword?
something like :
include full_path_to_dir/*.conf
or
include dir/*.conf
where dir would be search for in the location of the configuration file.

This, together with a pair of systemd .path and .service
files would allow dynamical addition and removal of peers (and other 
settings)

Thank you!
Adrian
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
