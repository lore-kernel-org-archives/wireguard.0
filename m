Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DE1C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:06:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 891F724181
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:06:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PAfTaH3q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 891F724181
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60c0897c;
	Tue, 17 Nov 2020 21:01:16 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d16ea909
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:01:13 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e125542e
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=DqeCcsdKbozMD1Vq7Sd75yAQvOc=; b=PAfTaH
 3qDozWkNbYB8dr5GWoWIq36ww+u12w6GC8V5RWAUlZUo7gSzsro+o749IFqyvAqt
 9nZZ39xAOwPMyNqkoQBAYu+g3p9JHrL2/C75GUn9nffRdlG1TiJOp/whFhN2euc4
 2zbMURia4I0fAuscldG6A8JWLnWFp/ra2VG5UsUOgEGHMEC5WY6r9CE+A4pWfkWS
 5cgtBrdlKJ9OXonfTtosYqpD1JSTRT65Muzo5y0W/+oTe1K3akXLdyDabcgSfWrN
 6FBVITHVvSWt0+hTW83BFXN1Ad9qnd0BY7kSe9lUfonqL8+tMzXnnrtRfNgRbC9M
 M8XB/lUBy2zSXAVQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33374d8c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:01:59 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id 2so20245907ybc.12
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:05:52 -0800 (PST)
X-Gm-Message-State: AOAM533dP93TRoRwf4rTCDS0Qth7GoF3ua7xRgxRAP7W1T0q8WLVXMAX
 vHRU6UPwt80Hq256EWLfEEOWiflHqyw0bc3H4OQ=
X-Google-Smtp-Source: ABdhPJzfnsHrZIuWcUFbEG/oCjtVaUgs9VbQiq3ucWqXzh7owGeih0W/V9uYjY/m4gMcOCe9rPIemczXYJ/Y8nSC8Xo=
X-Received: by 2002:a25:481:: with SMTP id 123mr1542474ybe.123.1605647152359; 
 Tue, 17 Nov 2020 13:05:52 -0800 (PST)
MIME-Version: 1.0
References: <28bb854e-da5f-34dd-5c20-37b7517b7861@gmail.com>
In-Reply-To: <28bb854e-da5f-34dd-5c20-37b7517b7861@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 22:05:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9q3PPtjFwX5tJ_PwvekajC++Kn_ejdkxCBc=iaOHTgBpg@mail.gmail.com>
Message-ID: <CAHmME9q3PPtjFwX5tJ_PwvekajC++Kn_ejdkxCBc=iaOHTgBpg@mail.gmail.com>
Subject: Re: Wireguard client 0.2.1 on Windows 7.
To: bdgregory@gmail.com
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Brian,

Rats. Can you check if you already have KB2921916 installed? Can you
type at the command prompt:

    wmic qfe > sendtojason.txt

And then send me the "sendtojason.txt" file?

Is there anything unusual about your system? Which service pack? Which build?

I'm interested in learning whether:
- The detection logic for the KB we have is wrong; or
- There are some Windows 7 configs for which the KB isn't applicable; or
- If there's some way to lodge your system into this state, which we
should correct; or
- Something else?

Jason
