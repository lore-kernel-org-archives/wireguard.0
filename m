Return-Path: <SRS0=Bwq/=XV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF82CC4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Sep 2019 18:56:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CC8222C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Sep 2019 18:56:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7Fs7vmv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CC8222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 670f9d2f;
	Thu, 26 Sep 2019 18:55:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36bbf08f
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 18:55:51 +0000 (UTC)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bbd3ee3
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Sep 2019 18:55:50 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q10so9418896iop.2
 for <wireguard@lists.zx2c4.com>; Thu, 26 Sep 2019 11:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=LWva5hfypDCbjy+14C+6o3Yn2ijz1scAbkZO5YPHMG4=;
 b=C7Fs7vmvDvOA4oz0uXIMXaZDhtgtJjaxnQrNNU+RH8P8NYArz7OuJ3N32O1BjkvZK8
 DeJT4lnfUMhFLlgGe1yrPXiSmiiwF0N+PzgU0dgvLQD6yfq+kSN07lzI02XwcJPanvaJ
 46NPHNULh+hbdzhymMPKc6hhsIMkSEc9AjMwSY4e4eRxUUL4ds2y+uvJy3FkNNLj7VrT
 2U4CCh0b69RDz+9f8cd9Le2uaP0q74P8ghUeLksvLb8yJtn20HBRmLneidxWRRl2ZUoN
 4xaPrz39v9FqQmGbAC2QodcsbcZDVxVtBXQdoePRt7DKUjqLTy2glvnkXCVfl6bL4nRT
 i5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LWva5hfypDCbjy+14C+6o3Yn2ijz1scAbkZO5YPHMG4=;
 b=Z718X8rIOeKFX93rL17r7mLBPytK8dlK77cwxmp5YsmeZnCi08/WtDhuYP5fsSKXul
 dW+Kr7KRjuILBtYiocoHeg4JQEfw8angxiJBj7QUXImMZfznSe+aQpxWfqapG6fcjac+
 06u58zQeJpl5SypLfaZAaF1uy6EdpGYbBLOfBKWJ4WEAPRFgUHutnziumHYtobOvYnbQ
 CfNIBz3n8pHQJnILcejmrCtPAfsI1h6iKRT3QsLHTA6BXwA+JNn92dv+J0QlvR4QecV3
 Im20dphX2kelucSjTC0/y4yCqe1JTvk2twhapm1GqD3PocBpWXGtjNGYoT8UhM7Ho9hR
 oD0Q==
X-Gm-Message-State: APjAAAVKuZEcJSTXk1QdaQ7ghYy0uR0JVeQE/9TsO0UnopyKrxH5cJPR
 eADwYMUrbtY2EHu6lDKPzS1UsIJX4ug=
X-Google-Smtp-Source: APXvYqwoUx1X6mnE6xQhlcZXkO/I9M48ckifQtmndmRuIbJSU4HLXrMvyXGOJ4qj15J00kYkylWTcg==
X-Received: by 2002:a02:25ca:: with SMTP id g193mr4880898jag.105.1569524149889; 
 Thu, 26 Sep 2019 11:55:49 -0700 (PDT)
Received: from ?IPv6:2600:6c4a:787f:d200:c922:1fee:23fe:4c60?
 ([2600:6c4a:787f:d200:c922:1fee:23fe:4c60])
 by smtp.gmail.com with ESMTPSA id o16sm61530ilf.80.2019.09.26.11.55.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Sep 2019 11:55:49 -0700 (PDT)
Subject: Re: DNS search domain support in wg-quick
From: Matt Layher <mdlayher@gmail.com>
To: wireguard@lists.zx2c4.com
References: <0b3ec078-48df-472d-8754-c667e300bb90@gmail.com>
Message-ID: <93aa6178-59ba-1921-7e5e-392ebbabe23a@gmail.com>
Date: Thu, 26 Sep 2019 14:55:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0b3ec078-48df-472d-8754-c667e300bb90@gmail.com>
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

I probably should have tried this sooner, but yep, the PostUp works by 
stealing what wg-quick is doing with resolvconf, and if you also also 
set DNS nameservers in the same statement:

PostUp = echo -e "nameserver 192.168.1.1 fd00::1\nsearch lan.example.com 
lan.ipv4.example.com lan.ipv6.example.com" | resolvconf -a tun.%i -m 0 -x

- Matt

On 2019-09-26 2:40 p.m., Matt Layher wrote:
> I would like to add DNS search domain support to wg-quick and I have a 
> working patch for Linux. It would look something like:
>
> [Interface]
> Address = fe80::2/128
> PrivateKey = (redacted)
> DNS = 192.168.1.1, fd00::1
> DNSSearch = lan.example.com, lan.ipv4.example.com, lan.ipv6.example.com
>
> I have a few questions to ask:
>
> 1) Is this something that we would like to have upstream? It appears 
> it can also be done manually with a PostUp directive, but this also 
> seems to wipe out the configuration set by the DNS key under the 
> Interface section.
>
> 2) What is the policy for adding features like this across multiple 
> platforms? It should be straightforward to port the change from Linux 
> to FreeBSD and OpenBSD, but I'm unsure about Darwin and Android. 
> Darwin appears to have a networksetup flag to do the trick, but the 
> Android C changes would require much more scrutiny.
>
> Thanks for your time,
> Matt
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
