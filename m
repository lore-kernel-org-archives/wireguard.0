Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF8EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 14:01:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D3A860230
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 14:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D3A860230
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb7e9486;
	Wed, 22 Sep 2021 13:59:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9b5fb9bf
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 13:59:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A44D6120F
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 13:59:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="U7SIMeUp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632319164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G2c8985asDk2bvFnNF0Tg5nBbA/U6LmumBedx3fCYCY=;
 b=U7SIMeUpyQaG2CoH7M+PpuTENiXTEcUK1XvvUT6mj0RSzET7qg0MCzqOfgQ1IupNQpgC9g
 rIHRDAuDNGVG0e4Nch+mf5V7fX1z+6gKf9Oe4eQ5dJ7chZexojrFe8DWv5abLk6bMqCX+9
 CmzU9sSL8tXkNxotTVFmav0Xq9XPKyA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3c70324
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 13:59:24 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id 194so9632161qkj.11
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 06:59:24 -0700 (PDT)
X-Gm-Message-State: AOAM53187nMuwn4uD0YS8Q+2paj83ABYFZ6hKGKBageIZIU1qIMNHBWN
 lC915ZeOC+/5RUnG/wbWcr060m0jKEwrVmwDMs0=
X-Google-Smtp-Source: ABdhPJz9/sK4XniNH4bNLTBlAaJx4qRUpcLvZSmZz1WpDV5t5jMT0x+jyBRpdAfwtprOhK8yyXkfKEzeCWUf6Id9d5I=
X-Received: by 2002:a25:3214:: with SMTP id y20mr45318852yby.416.1632319163057; 
 Wed, 22 Sep 2021 06:59:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:61c1:b0:fa:e5:57f7 with HTTP; Wed, 22 Sep 2021
 06:59:22 -0700 (PDT)
In-Reply-To: <CAMaqUZ2dTaOJ3oPex0pQxBM9njHA7rW5Hb69MvG645n+ya_jhQ@mail.gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <CAHmME9p1GcTVfFNH67o1xKxTw6VF=ioqBOAnWjES4Hn15GE2JA@mail.gmail.com>
 <CAMaqUZ2dTaOJ3oPex0pQxBM9njHA7rW5Hb69MvG645n+ya_jhQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 07:59:22 -0600
X-Gmail-Original-Message-ID: <CAHmME9pVUPkbaGDFjxJdUhFqatv7hxkyyOQ7W26LkLnyJqUebA@mail.gmail.com>
Message-ID: <CAHmME9pVUPkbaGDFjxJdUhFqatv7hxkyyOQ7W26LkLnyJqUebA@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Reid Rankin <reidrankin@gmail.com>
Cc: Anatoli <me@anatoli.ws>, Eddie <stunnel@attglobal.net>,
 patate.cosmique@pm.me, Roopesh Chander S <roop@roopc.net>,
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

Hi Reid,

Thanks for the confirmation. Do you think you (and whoever else is
experiencing this) could send me the logs from the app? You can send
them off list if you're worried about private data in there.

Thanks,
Jason
