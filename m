Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DEEC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 05:54:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64059208DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 05:54:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rlCmqjIM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64059208DB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34902c01;
	Thu, 18 Jun 2020 05:35:43 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 30b65c45
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 05:35:41 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69846939
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 05:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=CfdK7EqPJfkVcG/PsqUclwPWrx4=; b=rlCmqj
 IM2bDcy0kc8ApyNe7MP37KOZ2e55+8jOC65cIX+WlBl/ddq3vwxDkjfq7Ka+dDdb
 UU5gc53scGSqR11H5sjKj3pFsolAKp3jYy9BVX6w5dTXzYiL3581nuWv+y9qyd/6
 +oLcIqpaGRxracL+L2Re7Wa1VuAiTaDEFZNhNHySdTr3Y40inGdTB6RTow0T9f9X
 ylq0a7aXyXYVFUos1h1fx1fD89QdJYBJHcMJxEGUEX1lgmHg81g0RUyWQEG6X+LN
 Gzv+k4v6PvLMmI1x3Zeh7sy2nTLQ6FSPtFPXN97mGQIp2u/F0lFHvN7Bm2ULXu4f
 5qZLol66ohaQgQUw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c0b36f8d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 05:35:41 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id j19so4606575ilk.9
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 22:53:52 -0700 (PDT)
X-Gm-Message-State: AOAM532zaetQ3Ojknh6+OmUZ5WZF4DkD3TRKpri/Txt2Nqe5TNzjhoXT
 5kB2sch1C6xqHr2ffECb7GKPZtOzkR+2s7WJWCc=
X-Google-Smtp-Source: ABdhPJzSCz/XLCY5Ru4Lvq98YVjDFC8/9BKPnQK3ADW8N1+AaN4Xa8j9s8/hOde2hTg/9qBguRxJIaXFWZaeccdyat4=
X-Received: by 2002:a92:cf4d:: with SMTP id c13mr2496745ilr.207.1592459631488; 
 Wed, 17 Jun 2020 22:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <1592249458.376720421@webmail.emailsrvr.com>
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
 <1592454690.22771558@webmail.emailsrvr.com>
In-Reply-To: <1592454690.22771558@webmail.emailsrvr.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 23:53:40 -0600
X-Gmail-Original-Message-ID: <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
Message-ID: <CAHmME9qyk41mAvSiEePmZDrmmsBwOVSejg8q+oXV7nb=Jo1SAQ@mail.gmail.com>
Subject: Re: Kernel Panic after updating Kernel
To: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 ElRepo <contact@elrepo.org>
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

Hmm, still not able to reproduce.

Are you sure you're running the latest up to date module? Try
uninstalling kmod-wireguard and reinstalling?

What driver is your ethernet NIC using?
