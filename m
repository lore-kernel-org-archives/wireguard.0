Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA18C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 18:38:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 787BE2222C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 18:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2dfiDVT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 787BE2222C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 735170e3;
	Tue, 17 Nov 2020 18:33:49 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 65376a80
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 18:33:46 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id d142so4217359wmd.4
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 10:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:disposition-notification-to:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=cpQty0s7H9M0g7XhUD+ApKkaW+snYUCjAoaI8eIBDbw=;
 b=Z2dfiDVTkRUQmxpFDutUNo5KBe6CDFLH4OkrrVu7nOVQbXzahjAkrkukOB3KtySFaR
 uq3OsivCAzMySz7kRmSmKj7IG2T1mfnj7uCYqDhQ2JoL3XaUOOc/5d9qk6hgQ7VniGda
 voqphyWeaKotfyDka8J6t8slAJd4/L+RmmydI3RMVrtV6RrnQ6kfZU5ts8glYwNdj2Iz
 oNyh/9BDV7ueDrfJzmbns2CvCVPivYz0jh9tRWCWeQpl8w2bNUpoYc9O+La3tDFfxskD
 HrCu79L6aJWf9ouI8FtrL4DrbaQA3AruIOzr7SUGL6abxec+SEFhbqdbJTLbTeEiBOWN
 ZG3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id
 :disposition-notification-to:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=cpQty0s7H9M0g7XhUD+ApKkaW+snYUCjAoaI8eIBDbw=;
 b=WfIbuyEz8JIyEsVH9x+07eJNU4VFZZ7bqd+xZvoe/4t3HCSP+OH3erNEOtQMpM6AUx
 pJTM115GljBX4Kvhtz1/yTdZpi0EB8lmpr0fxLn71jdsG6xz37h+WTYuV1zf3crhYdSu
 DAhC2MEAsBB9Van6lQ3+SknFtOAoGPsJAbUORJBX2TH5UoYk8RnDn4/43otHkkTbdeo1
 FKx4T0DMkI8V08T0HBiQ6vGetn5C9c0JnPFMbr4nqrOhTD9pTTjCpZo7EJV9KJAOGw7Z
 moV6IcZ84eBYbluqssSkRKHAwGlNPgrgPMZWXOiYiFbxgguYdnmyGb/Q4fITVY7RIf8z
 p/rA==
X-Gm-Message-State: AOAM530h2XhEY05JnsF5XlqHCTLPwqxwfm1+fKVQS3YaveVJ7Uv3kbX2
 Sq4cruoV3GdnmTyhmCGVZryNuUME28glLw==
X-Google-Smtp-Source: ABdhPJwYPR2JSvD1H5rlfvgP3AJ9GpxiVZG9JeuG7Tc8tIiInpWrYsquGvxVguwssQlMu2KfRrvsAg==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr471997wmj.126.1605638302785; 
 Tue, 17 Nov 2020 10:38:22 -0800 (PST)
Received: from ?IPv6:2a02:8010:66b7:dddd:393e:9068:4286:e7fd?
 ([2a02:8010:66b7:dddd:393e:9068:4286:e7fd])
 by smtp.gmail.com with ESMTPSA id k20sm4748781wmi.15.2020.11.17.10.38.22
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 10:38:22 -0800 (PST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Brian Gregory <bdgregory@gmail.com>
Subject: Wireguard client 0.2.1 on Windows 7.
Message-ID: <28bb854e-da5f-34dd-5c20-37b7517b7861@gmail.com>
Date: Tue, 17 Nov 2020 18:38:21 +0000
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

What changed that the new version of Wireguard client now requires 
KB2921916 on Windows 7 when the previous version didn't?

Both my Windows 7 systems are saying KB2921916 isn't applicable to my 
computer but the new Wireguard client won't install.

Must I force install KB2921916 or is the installer perhaps just not 
recognising that KB2921916 has been superseded by something else?

-- 
Brian Gregory.
bdgregory@gmail.com
www.Brian-Gregory.me.uk
(Home)

