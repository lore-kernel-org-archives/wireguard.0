Return-Path: <SRS0=erT1=NE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9933FC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 22:21:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5585610CF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Aug 2021 22:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5585610CF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2661388f;
	Fri, 13 Aug 2021 22:20:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8dcf7480
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628893207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1Pchjdo1YOmT2H5olhuKg9I98ZoJHmBN4i/PRN87Wvk=;
 b=Er6t0JyAZ5+EJgd2qEAkbNhmWnx6k+bu54PrNkS0ac2Ln5p/M/L7URHUFo1AMLpCZ9dObM
 MJ9zHqO7LPD5tT/CfMAIiZX2rBV2FcKuBXCMoerYWVm6bBDkd3fl/+X4lDkaiLLZHuHiRs
 yjpUThPJmr4Bx6+zxeLOPJp1tGWmPeE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d74c308f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Aug 2021 22:20:07 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 202so348860ybc.0
 for <wireguard@lists.zx2c4.com>; Fri, 13 Aug 2021 15:20:07 -0700 (PDT)
X-Gm-Message-State: AOAM5326dzU4cJhcVJYN+Fl+1muPRLlW71q5T9vuI4zfQH37SELoZDt4
 I+SFKi/sk0MT7sgZk9YKRge+BggHxTzqrVD/YOM=
X-Google-Smtp-Source: ABdhPJwGllOInTYRy+yqISTgyHnwZAMBg0GvXH8SLRAgTzCECg4OwOaPtMclrMb4CayGJXbU/x5XEkY/b3OtzXZJ6rU=
X-Received: by 2002:a25:8445:: with SMTP id r5mr6186699ybm.20.1628893206634;
 Fri, 13 Aug 2021 15:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <e3f36b3e-5337-0d04-6c8a-9ce1bb6c234e@web.de>
In-Reply-To: <e3f36b3e-5337-0d04-6c8a-9ce1bb6c234e@web.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Aug 2021 00:19:55 +0200
X-Gmail-Original-Message-ID: <CAHmME9pPK5v24XHUe8z8Ddc5a3hsamg_xKwdKJLgjPpoTVVi7A@mail.gmail.com>
Message-ID: <CAHmME9pPK5v24XHUe8z8Ddc5a3hsamg_xKwdKJLgjPpoTVVi7A@mail.gmail.com>
Subject: Re: Problem using "WireGuardSetConfiguration" for Wireguard-NT with
 heap allocated configuration
To: =?UTF-8?B?THVrYXMgTMO8ZGtl?= <lukasluedke@web.de>
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

Hi Lukas,

This appears to be a C pointer snafu, with this line in the code you sent:

> if (!WireGuardSetConfiguration(Adapter, (WIREGUARD_INTERFACE*)&(buffer), sizeof(struct t))) {

The issue is that `buffer` is already a pointer to the malloc'd
memory, so passing &buffer is actually the address of the pointer that
points to the memory you want. The reason why the example.c code
passes "&thing" and not "thing" is because thing is on the stack. But
in your case, `buffer` is on the heap, so it's already a pointer. The
second thing that stands out is `sizeof(struct t)` might not be what
you want. Instead try providing as length the same length that you
passed to the malloc call -- sizeof(iface)+sizeof(peer).

Hope that helps.

Jason
