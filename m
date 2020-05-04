Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BODY_SINGLE_URI,
	BODY_SINGLE_WORD,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 472AEC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:08:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D836320658
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:08:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="I1ECKa9W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D836320658
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc6be3c6;
	Mon, 4 May 2020 10:53:40 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 755b6ed7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 10:53:37 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5513c173
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 10:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=mb+JLfO8l3VlbP0d9kGWMhMFBjU=; b=I1ECKa
 9W84ccE9qL4+PJtQA0ZO+egq6RtOGzYHcUl6wlNeMFh5bZWARQa7HUHbS5vIeDQp
 h18/OM7NuiqJPjfc+S7Ckc+E+s/b6cpM67DEI9zdOMcQvhFBT0TAEnIKc5f0ECzP
 5VGmVAAzp7/bntoJC36Jls/4hBVVIi97aqUNwoJ1eW6E+ZCuA7ZMllaf6JW6+JWc
 ATt+gV+0G4bN8RNO1XIGmTDV1o742Um34H/auV/F48BlUqBbDtJQJUvt6KLocn4F
 QBVgiz/s4Y3bu7///cIAOl1Cj2ZvpCm9AzWhImQAd4FopKxr/wtvRBRanq4bV7Ln
 3tzIoljIENmLaOeQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cf25c0a0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 10:53:37 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id d7so6907581ioq.5
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 04:06:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuaMwwqPMFOcIM05ho7xoKmELejtZxdtI/D5SCWcmjQSWB28ThB8
 EKkPe/uaFwYK6TPZL9qrD6XeCkczJOpwoa7iGOc=
X-Google-Smtp-Source: APiQypIF5x0LaJkGCe/mwv6fRE+pp7vHcoFj26FcJevHzzQiNYPaWHBA81KgPVn5p5Z/Pf3aISVv3IUbuu9ZmAgVFs0=
X-Received: by 2002:a05:6602:21d3:: with SMTP id
 c19mr14674888ioc.29.1588590361191; 
 Mon, 04 May 2020 04:06:01 -0700 (PDT)
MIME-Version: 1.0
References: <d70eb47c-717a-4d11-28ab-e133e38444e7@jzdm.de>
In-Reply-To: <d70eb47c-717a-4d11-28ab-e133e38444e7@jzdm.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 May 2020 05:05:50 -0600
X-Gmail-Original-Message-ID: <CAHmME9rBgi6jqR4tuoP5Rq8eGDvWSrWNAftkT9qaeNoatDXdzQ@mail.gmail.com>
Message-ID: <CAHmME9rBgi6jqR4tuoP5Rq8eGDvWSrWNAftkT9qaeNoatDXdzQ@mail.gmail.com>
Subject: Re: EdgeRouter binaries
To: "Johannes Z. D. Mieth" <wgmailinglist.all@jzdm.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

https://github.com/WireGuard/wireguard-vyatta-ubnt/releases
