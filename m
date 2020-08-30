Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA76C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 08:56:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F3F2076D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 08:56:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bukn-net.20150623.gappssmtp.com header.i=@bukn-net.20150623.gappssmtp.com header.b="H9FLlr9F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F3F2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bukn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73ccf1ed;
	Sun, 30 Aug 2020 08:28:44 +0000 (UTC)
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a51571c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 08:28:42 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id 185so1608814oie.11
 for <wireguard@lists.zx2c4.com>; Sun, 30 Aug 2020 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bukn-net.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:references:in-reply-to:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NaTAQjoeQIDvOP8KdwInma9knOKsLj9A/dr0/IBjd1A=;
 b=H9FLlr9F8oSsXdfb5XVdv9wFudnVbagJrQPHl9rpq6/YSgZ47nmyjJte5sz4nzUrEY
 mLemYy10cFu4W6oerde6y4Awmdd7gCXrCxWYTYOC9Mk5KP7SXZS/uCYYguMpf1uVMWNZ
 Re89WVPxThBW1ek6rcx76nyVXGKyCKdvqy6pgIKZoBJi38q9f6bTuqmTplPgCJ8Njr1y
 t6WPfkUkEgxPckhN0lj4CfIYxC1qRXBMXGsTdh/ZRO3bApljjpZHCtqZf/GEG2lqTFAb
 znyoGi5oSa3rxvtJD+DHqL/iDGBy1uceCq6BPH+v/MOuddrRjkVlKsJMgSUEe8Ad+hdE
 6y/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:references:in-reply-to:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NaTAQjoeQIDvOP8KdwInma9knOKsLj9A/dr0/IBjd1A=;
 b=mzMJMrVa1xvL6D3LuwY1V6ej3yLJFxcghou9NgWjrLcf9UUyexoVoOBWFYdyHpK0lc
 a2F/L0ISuy61ulm4V++8dr+6DgX2NAjqPKhQFE57BOIAFBdR7oGJvA/e7QNQvNDT/5p0
 1gBhRAPsSu739hyzShdwaOJt1GxkSDNCCtzeS3QhBAaxqU/9A4UhP60zwyNULGiuarao
 v1mChZww8QY05mzfqnh8dI0MqEfGcuB5g72B9QYxIqN0oyjC7BM2hcv4BM1MNRvoot1k
 lBt1+ad0RSBl23uonl4wzt93sSUkSDeZ+Wt+tgp1he5U2uru32etDqvvR/XNyOOpdPtx
 0QIg==
X-Gm-Message-State: AOAM533FM90wquZq+TyyNV8mJxJj7RwNnYExXlK4M/QteJPZTEtUNaPx
 qmDhN6jQ9NJ1gNjUHUfUeoQHkMW8EkvSudEf9O+fAA==
X-Google-Smtp-Source: ABdhPJx2/5vGKqFyWaq9Jtv+Q6E2P6yAUqMohs0LgzGv2G1ZltTvl2HtOlKyfwrm3/F0a6B1UBZI1Dl0QrMDmHIg24U=
X-Received: by 2002:a05:6808:8e5:: with SMTP id d5mr786573oic.64.1598777783724; 
 Sun, 30 Aug 2020 01:56:23 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Sun, 30 Aug 2020 01:56:22 -0700
From: Aaron Bolton <aaron@bukn.net>
Mime-Version: 1.0 (1.0)
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
In-Reply-To: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
Date: Sun, 30 Aug 2020 01:56:22 -0700
Message-ID: <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
Subject: Re: AllowedIPs
To: Eric Light <eric@ericlight.com>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Yes, this does thanks

I plan on using Quagga for BGP over WireGuard tunnels so I guess I
need to avoid wg-quick if that makes changes to the routing table and
firewall as I want to manage those my self

> On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
>
> =EF=BB=BFI believe it's both, in a way.
>
> As far as wg is concerned, the AllowedIPs is effectively an ACL.  Any tra=
ffic hitting your wireguard interface from an IP not within the AllowedIPs =
will either be dropped on decryption, or won't even be decrypted.  (It's on=
e of these, but I can't remember which)
>
> On top of that, wg-quick interprets the AllowedIPs string and does other =
things, such as adding appropriate network routing (the second part of your=
 guess), as well as modifying any client firewall rules to permit the traff=
ic.
>
> Hope this helps  :)
>
> E
>
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>
>> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
>> I=E2=80=99m trying to understand AllowedIPs better is it effectively a A=
CL
>> that day what is allowed down the tunnel or is it mechanism to
>> configure what addresses get routed down the tunnel?
>>
>> Thanks in advance
>>
