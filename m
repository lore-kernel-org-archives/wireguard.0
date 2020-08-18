Return-Path: <SRS0=FBn0=B4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A67C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 07:44:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC0C207FB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Aug 2020 07:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WA7dWTpF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC0C207FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4632e5f;
	Tue, 18 Aug 2020 07:17:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2befe376
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Aug 2020 07:17:33 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11a6c17c
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Aug 2020 07:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ObVcXbP/0+NjR4C1G6KHfdaBpTo=; b=WA7dWT
 pFLz6f/vnT4suQBWWO89G6TJPcexYF6x22VB826PP986TkDtIvgcs6Vn4SeMoNI9
 bCPLpQuyVE0CAnEgn7tIDPczHrWpgQ/opjwv5QfVhTpDZnUYHfr1ySgRgw6dznAb
 ghclDvZs79yWwtOCM1x6W3PuYbHAdYfCpXMF7VIVfO0TjmFEJwc3zudezAHR0c1X
 X7ypJTIblc+XT5MiMG40ooqiWOYpLzvWD7ZBa24km4TxLELAFmUZhhED/OzmHbaF
 lcfIdIbsViZVWc96sFLzgJXQXLNOZhScG/qZbpmX6DV4KdlAK0dTuAHMPDWPWeGI
 iapIx90/gLcLaUQg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5d4e6cc8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Aug 2020 07:17:32 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id k4so16806734ilr.12
 for <wireguard@lists.zx2c4.com>; Tue, 18 Aug 2020 00:43:41 -0700 (PDT)
X-Gm-Message-State: AOAM532ylFc8Yx9BIEB7W3+JuiusfhrLWKHYpTBGhCbLj282rP7juJAg
 s39oc4OmI/MS2rv56WhxcJCxV/GB+rQHnPIhlzI=
X-Google-Smtp-Source: ABdhPJy1H3+JJlbOkBA8K4yYHjsl+/xJ3bzUAhWSb/2AVDeaTYFAoa0HEmWCua+lZQebyvoeZohQmOE162YOxkgOeUQ=
X-Received: by 2002:a92:b74a:: with SMTP id c10mr17313161ilm.231.1597736620742; 
 Tue, 18 Aug 2020 00:43:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAARAvpL1PDSm5T_5pE5qUP9b+bMeUi9Td57op9t+OoSLvo9L2A@mail.gmail.com>
In-Reply-To: <CAARAvpL1PDSm5T_5pE5qUP9b+bMeUi9Td57op9t+OoSLvo9L2A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Aug 2020 09:43:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9qobq9ZhyOGm5WaTTXA0i=k=_w0L+7LWCPcjUye5idJYA@mail.gmail.com>
Message-ID: <CAHmME9qobq9ZhyOGm5WaTTXA0i=k=_w0L+7LWCPcjUye5idJYA@mail.gmail.com>
Subject: Re: WireGuard on Windows: Unable to create Wintun interface: Error
 registering rings: Error listing NDIS interfaces: no interfaces found
To: Ferad Zyulkyarov <feradz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Simon Rozman <simon@rozman.si>
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

Hopefully this addresses your issue:
https://git.zx2c4.com/wireguard-windows/commit/?id=86cf5c84384bde2b4147fc5eedee24937729a101
