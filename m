Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68B1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 01:34:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC86461130
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 01:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC86461130
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 07799c24;
	Thu, 23 Sep 2021 01:34:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62f6187b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 01:34:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCBA1611CA
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 01:34:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pCQKqXMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632360875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3HL83HwSoAWLz7V+Uqx5wwxRHg0+6vFhXaJxClDwVjQ=;
 b=pCQKqXMH4J5P8Uj/hcsSG2fYGGjixNMkX/mrwCAQyOEK3Fps2H+sucbQnDKVktf3ZuPb/W
 HdL7sdqVNL8hox+cN8bbr55ddYZb2GhVtBcuVIodajSGrzwC8g8E5WiQT2sbQSr0o2dSiS
 i51rUSROzO7MfMtAm8Tfh8SYM4L1SnU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 967d2381
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 01:34:35 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id b65so16244172qkc.13
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 18:34:34 -0700 (PDT)
X-Gm-Message-State: AOAM533UEErOy7ph2b38CSG/IJsAsDZU53+Msm8M4KSUK09KlPxaKIzo
 h8mSA/QucFkhTLgK54nK9VwfJlXFdlJi3MONU7k=
X-Google-Smtp-Source: ABdhPJwbjmfgU4jZPi32SK43JXy+g1setGbYCF5RIizX+6MYzLrN63TFe15wjeAco53lDtX57yhbrIVb9ywIk4KAZ0c=
X-Received: by 2002:a25:854c:: with SMTP id f12mr1866708ybn.95.1632360873409; 
 Wed, 22 Sep 2021 18:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
In-Reply-To: <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 19:34:22 -0600
X-Gmail-Original-Message-ID: <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
Message-ID: <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>, 
 Roopesh Chander S <roop@roopc.net>, Miguel Arroz <miguel.arroz@gmail.com>,
 Alan Graham <alan@meshify.app>, oss@jacobwilder.org
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

Hey folks,

Small update: I've managed to update a fresh 14 device to 15 using the
latest build, and things are broken still.

On the plus side:
- The new build no longer deletes VPN profiles when the corresponding
keychain references are unresolvable, so if there's any chance of
recovery in a next build, it won't ruin those chances.
- Now that I can reproduce it, I can hammer away at trying to fix this directly.

On the minus side:
- The fact that a keychain reference goes stale during an update from
14 to 15 sounds solidly like an Apple bug, rather than any sort of API
misuse.
- I'm skeptical that there'll be a workaround, and if there is, it
will probably be pretty ugly.

If anyone knows the SecItem APIs well, the file in question is:
https://git.zx2c4.com/wireguard-apple/tree/Sources/Shared/Keychain.swift

So, I guess I'll jump into this in full force now. Here we go...

Jason
