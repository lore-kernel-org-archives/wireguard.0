Return-Path: <SRS0=gfF6=ID=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C24C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Mar 2021 21:37:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F2D7650A6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Mar 2021 21:37:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F2D7650A6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c67a177a;
	Fri, 5 Mar 2021 21:37:38 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b9271a3b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Mar 2021 21:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614980253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=PPoGkFx+XYBEenNuY1mNLX4Y0GjVO57Lg+s2F7DHHE64dojV7wmDUYaFLkGyKB+MHXwyK8
 nLhRPWP26UIm09SKhTlUT1YLns5kSgKVdYb6PQMH/ZwQShtZ3McCEM+MyVJh724CLetc6e
 rpYFi/ZPBqfRZk5Nk7oelx9zS+nf/Bw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f4383664
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Mar 2021 21:37:32 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id x19so3479522ybe.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Mar 2021 13:37:32 -0800 (PST)
X-Gm-Message-State: AOAM533Ro/wgz4J5tiTBXK9QotMFkF2Uxs2zVNsjeK/KtO0gCcbSQ5rl
 /KtjWvijjAcTyWYCunHHhtXGnB//KvewEWqPitw=
X-Google-Smtp-Source: ABdhPJz/OYelVenlJOsSdIM00gUd5OMzoZNd99zWrYXW6aGjL1+Np4duKpnpT60YC71XvCpRP/4n+J7fI3TJdCVJguQ=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr15375154ybb.49.1614980252284; 
 Fri, 05 Mar 2021 13:37:32 -0800 (PST)
MIME-Version: 1.0
References: <20200514093520.10370-1-fe@dev.tdt.de>
In-Reply-To: <20200514093520.10370-1-fe@dev.tdt.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 5 Mar 2021 14:37:21 -0700
X-Gmail-Original-Message-ID: <CAHmME9oduEULEHT3kEy_ZNNNTtv8DKztn4XRc7HaLSe3GXKuvw@mail.gmail.com>
Message-ID: <CAHmME9oduEULEHT3kEy_ZNNNTtv8DKztn4XRc7HaLSe3GXKuvw@mail.gmail.com>
Subject: Re: [PATCH] wireguard-tools: fix version indicator
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Applied, thanks.
