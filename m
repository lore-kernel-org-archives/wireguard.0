Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18AAC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 01:43:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3725123406
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 01:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3725123406
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e7a5241;
	Thu, 17 Dec 2020 01:34:52 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bf88a5b7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 01:34:50 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3085e826
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 01:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VTQptrn2J9t1mcNUDkkkLHAjR64=; b=zdUhK5
 n2FGPXk/Wqjpt+/s8Vhdm+inF5ooz2yzlmOdCrrBgoz3z9gJr5kPKUUKdwuJLhUX
 QIf8MkQjp2V16f2wtwV8bLNXxLSKWYcw5GjHkish8danEllc3spQAAyIIe1z9sAM
 FeyNJ6+a2Wdx0clPOHYeqAeI6rmK5S8l0aoKO4LtuoNCiS5lxR8+ts81cyfX9IBw
 /K0zfDt6MbMgE13gEy6q5GLTvA8P6OncH9VsWS0sV60zwuk+0ybtj0Y59FdetJkh
 251+pf9zpaeFfhMe8xGzFDq4blJO673ZNkaA4s/+dzIYrXkY332V8yxSA5KvdshC
 bCps3e8q3NAXfkvA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a12ed914
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 01:35:34 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id x2so24345098ybt.11
 for <wireguard@lists.zx2c4.com>; Wed, 16 Dec 2020 17:43:15 -0800 (PST)
X-Gm-Message-State: AOAM533y08SXFHEbs/014WWE9gNVLGLQL7Bs5IVkT8n0nDpz54aR07ss
 D5c7BTsXVDLIPq26GzO0FVjGv+3jsVV3q7lR3ag=
X-Google-Smtp-Source: ABdhPJwCW206ScJZ27tiyOHMIPBrtcO7z3uMs3UbGbaNGsXFbbSeoeBy2VgcGZPxEVTjsBWK+Ozsdk6J6UcjCzzkPnk=
X-Received: by 2002:a25:2cd6:: with SMTP id
 s205mr52889108ybs.279.1608169395122; 
 Wed, 16 Dec 2020 17:43:15 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:6c2:b029:30:3e8e:4ce2 with HTTP; Wed, 16 Dec 2020
 17:43:14 -0800 (PST)
In-Reply-To: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 17 Dec 2020 02:43:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
Message-ID: <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: Glenn Schmidt <glenn@glenn.id.au>
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

I'm really very sorry about this regression. I fixed it earlier today
already here: https://git.zx2c4.com/wireguard-apple/commit/?id=20bdf46792905de8862ae7641e50e0f9f99ec946
but now we're stuck having to wait for Apple's review of the fix. This
is as frustrating for me as it is for you.

As a temporary work around, try adding a DNS server to the [Interface] section :

    [Interface]
    DNS = 8.8.8.8

Let me know if that gets things working again.
