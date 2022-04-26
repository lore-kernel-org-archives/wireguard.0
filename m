Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E6BC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Apr 2022 14:41:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4e427f9f;
	Sat, 30 Apr 2022 14:39:46 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0396385b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Apr 2022 11:20:07 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id c12so29870767plr.6
 for <wireguard@lists.zx2c4.com>; Tue, 26 Apr 2022 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=twopicode.com.au; s=google;
 h=from:to:subject:date:message-id:mime-version;
 bh=/fNnBAWoae57JbW+knqruZTob8nFTc16EQhnCv2Ln7Y=;
 b=bsmar1kjx8osIK2NQq8dwRPfxHXplGA/ka0mxhGf4erVZfKosHE6t4JBaEL4pZF/Ld
 1hX993i5qOKmMAQenUZ5zW/UZNlOAxCWSR9d6DN7MTTRmcAglUkGHmsUppmXZ63QxwtR
 EdspCDyJLCgcZN+KWUG23Go4+1XOZH5RFHRCgaosII0Bql+GvilpJOwc27kV7l1FO3LN
 mwrwHIh/6o0/miCLb9Gg0Vab00aya58Fbtdc6rSi5JcVDxaV0u0Liqn2rSPh7X/U1jeY
 dz3gB8tAC+6tn43Hk5gT56sdr9VkNn8XVhASZGQbOpOO6ckLPVhfmFgvaXT+5eQPMSyi
 67ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
 bh=/fNnBAWoae57JbW+knqruZTob8nFTc16EQhnCv2Ln7Y=;
 b=cSI7SjztlnLU4h4Q4lggw3txeEZOJtGALi5Rsnsp1Y4g5L7n/HgV4Tmk9iWBbNG0I4
 GFqXUnGcwt7Ckq54MjK/CKjGo6GuJUVU9hqeyN0xwkTWdzPpIEryFNyuvYM19GuPiMJs
 BzL707E3Pk01o5Kbq5KmkCA5zM01fKsiSDj6aWN0Zn2bYPmmNil/0p6w/3e0BorWjXx2
 Ty7xFwOrhaFviLk8bhyjp7jGvtex7K2j3npDte/4jtuaAM173YVWifWeNyqnBoe2kfya
 wVETs3jIYhqJ7vXH3zWrcWRm/VMAkSICq1Mno4T0DuCQf5JX75MthySX0+a+tb3L66ra
 quOQ==
X-Gm-Message-State: AOAM531jhDL3F+sDQmZh1MwbWoHCUbOfy3/oJ/3/jaRqWYKuTM+WYDGO
 hQt0cE588lEcCf2XJKgcXECYmDxwW/WmSRjBVmE=
X-Google-Smtp-Source: ABdhPJzu2csFQJrxZ6+6aX6jPsYeCVJF7ryUnDTnbQ04JAYQH3iTaN1buFA4UjxD0N/g59AsXTGj0g==
X-Received: by 2002:a17:90b:3809:b0:1d2:ab07:484a with SMTP id
 mq9-20020a17090b380900b001d2ab07484amr37090555pjb.236.1650972005697; 
 Tue, 26 Apr 2022 04:20:05 -0700 (PDT)
Received: from [10.0.0.24] ([101.180.69.32]) by smtp.gmail.com with ESMTPSA id
 y198-20020a62cecf000000b0050d436ad942sm6359040pfg.16.2022.04.26.04.20.04
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 26 Apr 2022 04:20:05 -0700 (PDT)
From: "James Rickett" <jrickett@twopicode.com.au>
To: wireguard@lists.zx2c4.com
Subject: iOS Per-app VPN
Date: Tue, 26 Apr 2022 21:20:01 +1000
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <36BB837F-F667-4DD7-A410-042E923C4914@twopicode.com.au>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; markup=markdown
X-Mailman-Approved-At: Sat, 30 Apr 2022 14:39:45 +0000
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

Hello,

I'm developing an iOS app to be used as a per-app VPN. When opening an 
app that I've designated to use the VPN, the VPN connects, but internet 
does not work.

If I change the configuration payload type back to 
"com.apple.vpn.managed" to work as a normal VPN, it works, so I believe 
the rest of details are correct.

The only thing I've got to go on at the moment is I noticed this message 
pop up in the logs a number of times: "[NET] Received a packet with 
unknown IP version". Not sure if this is part of the problem or not.

Any assistance would be much appreciated!

Thanks,

James
