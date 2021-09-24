Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51ABC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 00:24:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1951F61090
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 00:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1951F61090
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6879909;
	Fri, 24 Sep 2021 00:24:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab994a6d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 00:23:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0337E61090
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 00:23:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jin7FqBW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632443035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7+HmNTgUNcz3a7lFlXU1WJB5RZ3ePHcVo1mX2gR74dQ=;
 b=jin7FqBWzhfnsSmiy9uGTOfpd2LuHL63J4X4aL5RwG6JJPnkclkoS2R96jdAWux6GFQqbe
 qyyix78ygetEUCIOQ+y5XezN7HQE6/xaAIzeH2mD2h5ZZB5waiwPGxikijkWmZqsorBRKu
 mwra3CsINgv1uvv6uKPToDhGOzWsLEo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id de7d4b4f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 00:23:55 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id i12so2065046ybq.9
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 17:23:55 -0700 (PDT)
X-Gm-Message-State: AOAM533bbGQAqdqjxwWdbrhl0YXAnkh3DWiTZMtc6zVUK8UMH847iq5S
 aTJBpsK8ea9/iYNc8L+4egCb+rqVFSdkcT0fZzE=
X-Google-Smtp-Source: ABdhPJyE3+i1s7H7CU7SZdVNsHGTitbWeUCzwLEv3zADsCnJSh3XsTxmXyKBF0LCwcyAPjdfwNTv195eJ1lFOZPjMpI=
X-Received: by 2002:a5b:783:: with SMTP id b3mr8483729ybq.328.1632443034707;
 Thu, 23 Sep 2021 17:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAKF6ahaqcCYg5zrnM=uRzdmgLhui5CD-JhaiXvsMrOGkSbdF0g@mail.gmail.com>
In-Reply-To: <CAKF6ahaqcCYg5zrnM=uRzdmgLhui5CD-JhaiXvsMrOGkSbdF0g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Sep 2021 18:23:43 -0600
X-Gmail-Original-Message-ID: <CAHmME9rWeCxtCjPZ4c2+xzC_JipJzCAggKD-vDXiAswt_zjVCA@mail.gmail.com>
Message-ID: <CAHmME9rWeCxtCjPZ4c2+xzC_JipJzCAggKD-vDXiAswt_zjVCA@mail.gmail.com>
Subject: Re: wireguard-apple: overriding on-demand status
To: =?UTF-8?Q?Maciej_Le=C5=9Bniewski?= <leshniack@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Sep 23, 2021 at 6:22 PM Maciej Le=C5=9Bniewski <leshniack@gmail.com=
> wrote:
> Question: What if I'd like to override the exclusions and enable my
> tunnel in on-demand mode just for a while (wireguard-apple
> v1.0.14-25)? Do I have to edit the tunnel profile?

Yes. That's how these APIs work.
