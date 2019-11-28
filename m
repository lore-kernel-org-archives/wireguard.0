Return-Path: <SRS0=wroZ=ZU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_SPACE_RATIO,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CA5C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 12:51:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A922176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Nov 2019 12:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NmvNYz4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A922176D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33ade7a2;
	Thu, 28 Nov 2019 12:51:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a9b1206
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 12:51:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b703a8e7
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 12:51:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6750ede
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 11:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=RGw+gIr6JdSvZ8zDo4TjIc0Xf5g=; b=NmvNYz
 4US+8k89zIy4E5ppOu5ZccMQzyXAy3BToZVIE3z417KvJzu6z4ivkPRD0gC/k9jl
 CRmEUBbPXYASe5PF3UAxVA3YqqW65Au3VLOEANpqgvMU3+qTXjZg7N/wTlWNlGEX
 Np3U/wquXt8hfiQAFaWwMaUekmx+VfA0LzZkhLQu9KNGJSv0Pc7hPu4B0ClNWJfl
 Xke5YOEBH65ZFxezt912qkcLuIEGDM7Cdg488BlHqNIf4z1yJkuv0StTtaI/Efgu
 Yb1cNdF9g1o3BFF6LR4tubtCjCMghFBfEmliMJsyDjYj9IJRU8xTembka9JWV8h4
 noDFMyFf7ToWA9Jw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 680dfcff
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Nov 2019 11:57:55 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id 14so23167734oir.12
 for <wireguard@lists.zx2c4.com>; Thu, 28 Nov 2019 04:51:54 -0800 (PST)
X-Gm-Message-State: APjAAAVyFQHTtBvMy9MTrX4z9twFEZVziXYN+2k58dqTtOBne4qevGV0
 TY0md22uZlkUQHcAP53NGT5X1gIcMb4kQiJA9Ok=
X-Google-Smtp-Source: APXvYqwsEmx18MGSY8sCYNiVBSNp1ynYLonNSXP6ALk6YOowkl8usYTEJRnm9ZzcJipE+qCf0IXLvP/C2iapRidapLE=
X-Received: by 2002:a05:6808:906:: with SMTP id
 w6mr7817036oih.122.1574945513899; 
 Thu, 28 Nov 2019 04:51:53 -0800 (PST)
MIME-Version: 1.0
References: <9cefaab6-d3f8-25f0-34da-754e59c7c4d4@med.uni-frankfurt.de>
In-Reply-To: <9cefaab6-d3f8-25f0-34da-754e59c7c4d4@med.uni-frankfurt.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 28 Nov 2019 13:51:42 +0100
X-Gmail-Original-Message-ID: <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
Message-ID: <CAHmME9rV17Y_NE-=OV96FWt6=3fx94D8G4ADcvj9nG7zzHdL4w@mail.gmail.com>
Subject: Re: PostDown 0.0.20191127
To: Thomas Sattler <sattler@med.uni-frankfurt.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks. Fixed this way:
https://git.zx2c4.com/WireGuard/commit/?id=57854fb710160f567cf776b65080a9ce5afdf02c

But: why is your remove_iptables failing in the first place?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
