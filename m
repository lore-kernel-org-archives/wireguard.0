Return-Path: <SRS0=I1qK=KF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C19C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 18:27:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D92613CA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 18:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D92613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4976307c;
	Mon, 10 May 2021 18:27:45 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 10f4c9bb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1620646837;
 bh=cHAbrFY0A8//CXed9ut0AS0i3aEE8bYydKhGuQgfQcg=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To;
 b=FPsM7zXQb1tFRE9u6N1B8Zb2711haC44/AEfUd6IIR6gJIN7LRc15TXwMd3/9/IAu
 KcvHT9RVYCoT+SCHASBY8oF91LKDWlplv8K1xeL49zfakm3i1uDzIx7/rVj4GEI1h8
 QLIaMrV7sWsp+KBWlTAYANGKDl5ZNFzp6YywP3mQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gandalf.arda.local ([93.164.92.87]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MjS9I-1lEBEk3ofC-00kx86 for
 <wireguard@lists.zx2c4.com>; Mon, 10 May 2021 13:40:37 +0200
Date: Mon, 10 May 2021 13:40:36 +0200
From: Kent Friis <leeloored@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Re: mechanism for wintun updates
Message-Id: <20210510134036.ea080143a0cfbe58903c7866@gmx.com>
In-Reply-To: <2b73e539c3f0ae11bb68e2a7410a52b4@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.31; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:GT8F2s7oQ5ZyrT2n9fne577Y3AN2xmvinI5ESGQ2aGsOo6NvFjY
 CdB6K6uvQn4tAVq4yQLdExBaQ4WaYmwCbixTGJBI5UVSQDeOLLbVaqrA5yOFg6f0XJXmUif
 9cYBpeNKkhrzy32cHoWiMaBem0f5ayv2AhylBWScwSGrkjoAAZ7uRVzpgHhoSLWEojCSSEp
 6pnl7ujQhrk5E/QX+/BHA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1agvbe4yOEA=:v+qVMxxwC5x8fWGPeaf+PS
 FwKPF1att9hQ19C5UnE+OgkY/B1b0iWGYqVUpqYhenpAXYs7P/FEQFBMTlfQxTbfWhG8+Otil
 t5ko7LWezpNbGc7C4NQn74jHDUtNIWgRyVMs3qRkw3UGzLh1+uxY2x4dU3ZnAThTowW1TtJmi
 SKY0KEvq0xAM5GcH4aQSNJ8uj6VblTcTgW5P0vHZuUzwSYOXOOS1+wXZOCJiOi+SuJJ/WAqut
 /+lx8nQpOgJlC4yswdxcH/8L8oxkQzwBHMyfcsLtIxAQ30y1hx/VrOi1Fun5iAdfzNkhwvMfa
 MHaE5sP9zjTCCZ1fDtCVbVEIKC30PJNtqaV6pqsLpY9nYL+369/A8i3IeTOdbngmIWBSXKqtH
 G0aIVX5kdSY1ccW50BDoq9+MKjnayA5WhL3omu/AekDmHRiMWwiOYv1zknp7a42ugMsWOy7qR
 RXfkCaoVYPdZwXM4pBgPhaLIdFH9boiW4yPN23Lk13cdWpwS52uoYysxpKuotw4tjV0tyli7+
 9yKStGD2NsNyp7U87ncdTNZ2KvjfkYMMBWypa7aryGZ7dJ1xSJmJ2vUHRLyLXb68hLONu7LuO
 IeF6N0Gi7ZkpRb9Lz8fjephX0dZV1gQqWKI4rmLuDa95SaGcs+YnADUB+JZ4Zj5aCUbihkb1D
 PQYtTvZrgnEaTJhqO2tp2aZ4WF6m2T7LuzS8vhwpM2hV7Boe/yMd6K97SLbzwxHMpQFPNmVj4
 dbeumcLT3bjKTkvGZNxvZl6BxJAqwOQIn5FbXttzd0//TJilgTriES60iUy2nu/qWO3sxSHzW
 L9ufUesxtA4wAK5MfzFlto/tQ5SEd9j4v23R2xBH7bxUzuJAYuNA9aPDAq3/UOFGnjfNBq3UL
 I/Tn0yCe5MAz42CKROw+hOdaTsVmhHkI87qwH0nBNdj8HIx4mmMug37xDNvlduZcvvssGHk3t
 xTRYqS5uktcLvCU59RWuA6/nO+52uvBYVV34PYQJzwMnmVEDPY75Ij+taIanddxSteyvThsBX
 /lS1sSInoTfDDQDXDL8CmDzI6zyIGsMxHy9bO5inCuSp1Yv1L4Gc4wTHbLE3oNXRDDxhq1bqe
 RtC0EiLYvI3Ou+QJJkennGp4bGuZLSJa9q/r8VqYDOnwV8YkgIrfcElPugpX7pmn7FXfEkQfl
 WeVlG5T74FAGG6fcfD3fJji3fqqr13Wro2oqf5kS9WCz7a1/6rChf0utOhI90Wk3yrf2o=
X-Mailman-Approved-At: Mon, 10 May 2021 18:27:40 +0000
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

> I keep looking at the website for the latest wintun release - I see it's
> up to 0.10.5 now (last time I had checked was 0.10.3). Is there some way
> to provide some meta data/link to 'the latest' so that we can monitor
> wintun for updates, try them out and take 'the latest'?

> I don't care what the mechanism is, ideally it is something I could
> automate but even an email to this list that a release was put out would
> be better.

> If something like this exists already I'd love to be educated about it -
> if it's out there I've just not found it yet.

How about RSS?
feed:https://github.com/WireGuard/wintun/tags.atom
