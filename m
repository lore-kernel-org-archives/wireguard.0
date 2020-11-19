Return-Path: <SRS0=vJ13=EZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F6D0C63697
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 17:51:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AA022202
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 17:51:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tiHepLTG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79AA022202
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e988dfda;
	Thu, 19 Nov 2020 17:46:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 16edee08
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 17:46:28 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 574343f2
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 17:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=shZfpruDy7Xw9DsPtmDdV2Xupn8=; b=tiHepL
 TGCeiEvRgk0WwTFxKALCOM5HRgtvxWjtPeZddljuzzngja7M4HPxAu11GjsuuLQ0
 Sab4NZYQDDUASvzg6N+xJAfBHESSyK0LJcCKavHcRg+MPubvuJEFmqerDJDAGJ+i
 zFNfPV8OIHHbVnAemihM7Z+26BC7TM4zBbJGXGYWXcYEXdDfytoTsrFOejlN10fR
 UjlbUlDDjMDjpe2ez+gLmgmbC7n4rydrml/FSl4N2ki412zYuA5XPKsSUAzfv95P
 2L/0GF+auMNKgCgxLP91y/2t2BpGBH93y1mltBe4LYI4ZaR5M5tkBsjw5kanW8zC
 y2ETiVX89qVa89Vw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2b56be13
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 17:47:14 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id g15so6000925ybq.6
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 09:51:22 -0800 (PST)
X-Gm-Message-State: AOAM530p+CZ9WUVtuMVbPOIe6yX3MxJXcNTkRdq9Tv8KRVPithmL51GM
 CcauS0aZ28pE5j2/Y0274GAfpQL4NWaTR+/SZlQ=
X-Google-Smtp-Source: ABdhPJw+t3ZirUeIsm6pO2PdHB6Em7S7kQ3HBGWGn1QIpx5iVw1KutoP2H8EDZQwnM8hN/n80I45VPRE58pzNhuBh6g=
X-Received: by 2002:a25:df05:: with SMTP id w5mr21726162ybg.20.1605808281632; 
 Thu, 19 Nov 2020 09:51:21 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:474a:b029:2b:bd99:a3dd with HTTP; Thu, 19 Nov 2020
 09:51:21 -0800 (PST)
In-Reply-To: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
References: <bc1cd9b4-daac-4877-65a6-3fcf2ceeb980@53c70r.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Nov 2020 18:51:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9puzYsBqZqOkJG73YhoQ-isgzca-XDX59icsOVjfg7brw@mail.gmail.com>
Message-ID: <CAHmME9puzYsBqZqOkJG73YhoQ-isgzca-XDX59icsOVjfg7brw@mail.gmail.com>
Subject: Re: Progress on resolvectl DNS fail
To: Silvan Nagl <mail@53c70r.de>
Cc: wireguard@lists.zx2c4.com
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

As of a few minutes ago, things seem to be moving in a good direction:
https://github.com/systemd/systemd/issues/17529#issuecomment-730522444
