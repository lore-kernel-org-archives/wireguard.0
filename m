Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79604C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 05:00:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB15F2082D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 05:00:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fQwv8U90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB15F2082D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1ac0a96;
	Fri, 7 Dec 2018 04:52:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54ac186c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:52:39 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bd0332c
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:52:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0864d689
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=kHuw/7cx/pWmGvnR9hK+UsAgR0Q=; b=fQwv8U
 90fis+fcoNSZwqOpNP8BTpT7f7GWLwCMjdIJA0Kxk+Tz05DFacc6n20hTm2Dm3iv
 wDGu6We0s2j4Iihc0gDMwtuHQkdl3lWf00SrGmQKA2O/7otGuXzGVxA2JFw2TR5+
 /nXozUZ5AxVW5XdajWHvWZoOIKmq3sccQYgIw11x698QXV8AkKxqj7t9JIUotGjS
 WhEwmS2/XNrap5MVSqdoONafsf0+DOp/4sPfpI0Wmn9Uhuz+ihb+UgwlDeFZHlnD
 OLtuDklvuljOOQh0ctlAHA7pqFazlTbxjXueuugZFPYaO0Hj4qRxTkKwbfqsir2v
 A9n0sdJLo3aFfH5g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 585c3b14
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:52:38 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id m6so2418032oig.11
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 21:00:53 -0800 (PST)
X-Gm-Message-State: AA+aEWbxb6tGndgdhkpTqR+mANtYAvZyKDSU2gzDJXBZfNidypy0S19t
 EVONlwad4MRSzD9o5FqrrV1yc4V8uLOT+tzgVVQ=
X-Google-Smtp-Source: AFSGD/XiTsjBo+T/Rd4y56wdXw5E6qsMefawOHFXJh3v/mYaliY6rCPlK5VYMBkPHXYBXNMXNSas6RzXodvxDB4eV/c=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr465394oia.278.1544158852439; 
 Thu, 06 Dec 2018 21:00:52 -0800 (PST)
MIME-Version: 1.0
References: <CAH-tXsAsoyn+ye8cyC5Y5RGKBoExLGGY6NFKpG8GSGpHtkdDmw@mail.gmail.com>
In-Reply-To: <CAH-tXsAsoyn+ye8cyC5Y5RGKBoExLGGY6NFKpG8GSGpHtkdDmw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Dec 2018 06:00:41 +0100
X-Gmail-Original-Message-ID: <CAHmME9qq1D-J3d-jbkgJCkiwBrxhxgXL+n3qhcY45K1X==7wUQ@mail.gmail.com>
Message-ID: <CAHmME9qq1D-J3d-jbkgJCkiwBrxhxgXL+n3qhcY45K1X==7wUQ@mail.gmail.com>
Subject: Re: Minor differences in config parsing, wg-quick and Android
To: Jaseem Abid <jaseemabid@gmail.com>
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

We'll have this fixed shortly. Thanks for pointing it out.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
