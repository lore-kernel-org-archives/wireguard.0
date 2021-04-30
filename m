Return-Path: <SRS0=papb=J3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECB6C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Apr 2021 13:56:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A978061185
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Apr 2021 13:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A978061185
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69eaea99;
	Fri, 30 Apr 2021 13:49:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa555b78
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Apr 2021 13:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619790570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3RAq0qFs9cOTiuxCOTsuJkwMhluyTv1RJ6q4Cz7uZpA=;
 b=CkodrYkgzeNm49SfEKty+kE2y6Jc9JtoeJIFmNSeFAzQo9nVX/97DgSNZDbpsFqtNbmt75
 vST9PVewL7Tnq/3K0uCtQmA+iUsqHvKF0TmNSfOz04QGZ82Ti39ifiJX4LlOKmlxJ/YUyI
 YnfOqhHRLVi30S1FkBDknhXMmfghkiw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 17895c16
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Apr 2021 13:49:30 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id g38so83186477ybi.12
 for <wireguard@lists.zx2c4.com>; Fri, 30 Apr 2021 06:49:30 -0700 (PDT)
X-Gm-Message-State: AOAM531uuAfQ0fjXPwnutfpbAgMt6FiR+GVXWEpftoBFipxApgUBlUOx
 1iGse3Tcdw1Q5wjwljQxsiRFK/1k6AG7s8ZLh0k=
X-Google-Smtp-Source: ABdhPJwb0yHRhgIh3ezhWQBgF+jmm/6+fMyUC2AAJ2G+fWdbiFFjRoFz7b0RmFAjvs+lxenp4K4grNYQOJ+v+3aBYFk=
X-Received: by 2002:a05:6902:501:: with SMTP id
 x1mr6995913ybs.456.1619790569709; 
 Fri, 30 Apr 2021 06:49:29 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSuu24kKAXN18KoHz0Cby0Xn-RGEMjs7GuA97m7=JYRSrbA@mail.gmail.com>
In-Reply-To: <CALaUSuu24kKAXN18KoHz0Cby0Xn-RGEMjs7GuA97m7=JYRSrbA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Apr 2021 15:49:18 +0200
X-Gmail-Original-Message-ID: <CAHmME9omvixbuE0EgKAU-gD-UYwVsxj7keC5+toQRepdSmbXCA@mail.gmail.com>
Message-ID: <CAHmME9omvixbuE0EgKAU-gD-UYwVsxj7keC5+toQRepdSmbXCA@mail.gmail.com>
Subject: Re: Intermittent handshake failures in WireGuard for Windows
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Hi Joshua,

Is it possible that something nasty is happening with UDP
NAT/Conntracking tables on whatever intermediate device?

It might help to take some TCP dumps along the way and see where the
packets are going and whether they're lost past a certain hop.


Jason
