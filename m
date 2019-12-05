Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2773DC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 15:12:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B1D12464F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 15:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NWmouGfd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B1D12464F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7f741fa;
	Thu, 5 Dec 2019 15:12:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f8dc57f
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 15:12:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f58d1ce3
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 15:12:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e045a42e
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=7YxwM1hgH7JTB0H4XbAO2JgS4dE=; b=NWmouG
 fd0fLdCAxvMddiT9+VtsuyGdMmDPAZVkzdfK0/QjrPW4gs3OMr8GLoHE7eiGnWWr
 rOXvzPYp/9sfab2oXmEMosWA1BTy4EeSR3bEs6Yrj8nCwG9CB+42l7beqGaJrDKv
 Td87fJ80yWq66TLzp3cOMOqLCCWrL9KekujLZY9nCFcL88lI3E7w2lefMHF2/odt
 A0qha61+k4c//oWX57YEomKuiltpfgIzrdmrKw57UUWb3/z4MMRgEAoD70iaSdhB
 rstRhr04YhzF4aTvsBR+z+dtlHST4cF1+Vta/prqxSlSTgOOicEXxRL6lb4YVHCU
 YkywwN4oxAYKPJgA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 99e4efa1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 14:17:09 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id l136so3059072oig.1
 for <wireguard@lists.zx2c4.com>; Thu, 05 Dec 2019 07:12:03 -0800 (PST)
X-Gm-Message-State: APjAAAWa5AuNpogLW4jwFh+ijI0fKfFifLr48/7+jH8nZNQawczAp2hy
 7Gg/cBb2P8AMwAhyTOaaD/2bwq+QPJkxhPRSggg=
X-Google-Smtp-Source: APXvYqy3m8p50JwVlXcjuN3Ep//IPRQlVzqBBU4YEVShaAwXEGj3cgG2iazkdy57RQYJD/+P9FGQWWb1VI7rrkFaMd4=
X-Received: by 2002:a05:6808:687:: with SMTP id
 k7mr7757685oig.115.1575558722611; 
 Thu, 05 Dec 2019 07:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20191204173317.GA24297@wolff.to>
In-Reply-To: <20191204173317.GA24297@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 5 Dec 2019 16:11:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9qgMvsU=eRvSv7qAUiysHKBKYjiQTqU9uuRiyE=+gB4+Q@mail.gmail.com>
Message-ID: <CAHmME9qgMvsU=eRvSv7qAUiysHKBKYjiQTqU9uuRiyE=+gB4+Q@mail.gmail.com>
Subject: Re: ENDPROC and ENTRY changing in 5.5
To: Bruno Wolff III <bruno@wolff.to>
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

Thanks. Fixes for this and two other 5.5 changes are in the master branch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
