Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF594C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:32:35 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4BE61038
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB4BE61038
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcea1398;
	Wed, 22 Sep 2021 19:28:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 250f020b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 19:28:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8331260FE8
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 19:28:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HGs/yvRb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632338929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S3Y/LcLvs9NfSZvWvOuP2IAQfbokDtvkAXgaY58ewHc=;
 b=HGs/yvRbmfzU8laXIesWL++DM/tWXg0t/FN+vXvgM6Xj9KnD0r2GrDpcdXsq9xXoOB+aJ3
 Qbh0ZJaqhb25GwOcb3/Tdx7bbvqFe0S7CsS1ZvQw7IjkkW03HWcqd3ieZ+bVw5h1cvGM1P
 vG6+i8Zns9YbFiVpkfzGDWVhPyht6EQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1a52b99a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 19:28:49 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id f130so13607000qke.6
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 12:28:48 -0700 (PDT)
X-Gm-Message-State: AOAM5317mueXeSk9NY/kwUZqMLk5J6G1b/QYMn51jMhTgmw9S9hTV6ph
 zdRquhAzrvbRu0bQio++OTnnmzkqzY9pzx8Uils=
X-Google-Smtp-Source: ABdhPJwnKMDE0r81RqzSzKAqnDNCiCH+YSlGMeiNRxzqUcWqGVQWomFkvV3gyvlXLPz0v+oiZJRn00LD8XkjfMnecQo=
X-Received: by 2002:a25:d442:: with SMTP id m63mr938544ybf.79.1632338927793;
 Wed, 22 Sep 2021 12:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
In-Reply-To: <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 13:28:36 -0600
X-Gmail-Original-Message-ID: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
Message-ID: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>, 
 Roopesh Chander S <roop@roopc.net>, Miguel Arroz <miguel.arroz@gmail.com>
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

Hi all,

I've got a new build submitted to the App Store, and so now we wait
for Apple's review.

I do not understand the root cause or how it might resolve itself yet,
because I haven't been able to reproduce. But I've removed the
ridiculous code that deletes network profiles when the keychain can't
be opened. My hope is that the open failure is transient, and so this
fix will be sufficient to unwedge it. I guess we'll see...

Jason
