Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1633C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:37:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1927610A0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:37:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1927610A0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b419987;
	Wed, 22 Sep 2021 22:36:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7dc0f824
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:36:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5493261038
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 22:36:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kFJzstbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632350160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdgG5flxBzdTj3WC/XoZAFbNTx9zVP/NCWf44Bb9OJo=;
 b=kFJzstbEWOd368KYtrFmYuOEm2H/l5JVnILmfxgzqD6dJjCHblxsFgcxCqaHHt02xPTxzY
 yRj4oUtN6kNS42eLhbdRxHMEVtI+IgZqbgNuK4w2tFGw2soxQyQjPktRu8RUWoanyi2bIl
 vTgqy8FLq3szVRGA02Q0rm+29RhMx4Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b33c5dbc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:36:00 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id d207so15725106qkg.0
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 15:35:59 -0700 (PDT)
X-Gm-Message-State: AOAM5314JcaionlRea3qPh3S24YWLmcMCHyfWCCV9aZy0ynEPCzdWeFy
 1WC1OWEH4GBlfqRMiVusZ82Bhrmh05W1iELzLbk=
X-Google-Smtp-Source: ABdhPJw1db5RO1T8xW70i9O6g1VPU2ONQD20cdZMNfuRtvdbKFtlXQ+zFguRGk5HEmv+M75DGUnfJYBzqVGf1xukC+E=
X-Received: by 2002:a25:3214:: with SMTP id y20mr1794103yby.416.1632350159017; 
 Wed, 22 Sep 2021 15:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <381D3BFE-1437-40F1-B79B-DAF82DE4F7D8@gmail.com>
In-Reply-To: <381D3BFE-1437-40F1-B79B-DAF82DE4F7D8@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 16:35:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9r0xXq8XYJshVEnx0q8Sim7wuJ8gjy=_EszYf4Z020_Fw@mail.gmail.com>
Message-ID: <CAHmME9r0xXq8XYJshVEnx0q8Sim7wuJ8gjy=_EszYf4Z020_Fw@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Miguel Arroz <miguel.arroz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, 
 Anatoli <me@anatoli.ws>, Roopesh Chander S <roop@roopc.net>
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

Hi Miguel,

On Wed, Sep 22, 2021 at 4:31 PM Miguel Arroz <miguel.arroz@gmail.com> wrote=
:
>   After the update, when I launch the app on the iPad, the row in the tun=
nel list has a red background, and the first time I launched it, the switch=
 started switching very quickly between connected and disconnected. Also, n=
othing at all shows on the right side when I click it (not even the empty s=
ections that were appearing before, it=E2=80=99s just a blank view). The tu=
nnel also got disconnected when I launched the app, and is not connecting a=
ny more.

Is this on a fresh 14->15 transition? Or had you already loaded the
old version on 15?

The row turns red when it can't open the keychain reference. I'm
curious whether that's because it was already deleted stupidly by the
old version of the app during the 14->15 transition, or whether it's
still there, but the new version of the app on 15 is unable to load
it.

Also, what happens if you twiddle the iCloud keychain setting?

Jason
