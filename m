Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C82CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:57:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75E2C61131
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 75E2C61131
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e48aefd3;
	Wed, 22 Sep 2021 22:56:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d3653d45
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:56:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3EF861131
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 22:56:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QfxnM2iQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632351368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=841tULgvPHKhp/K2/DQo1y6VrVlGzSHJD6J0756Bsno=;
 b=QfxnM2iQQcCnlX4M88EV0vvBlcRQZWOCsnFjljqIn5rIf+BSTSFvyywSrDTQDEgyA7QNF9
 VHWhxnZw1DEQbdZphjhvJfvWrkLiVeYuZtVaaNeo/sGG+LkKorktnmP2UXe1VE7oVjA6iY
 rUGZON3Ss/pblYjKaNiGUlOibz9FgAM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0797b953
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:56:08 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id q81so11833833qke.5
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 15:56:08 -0700 (PDT)
X-Gm-Message-State: AOAM530I3i+ew2F6X6O+gm1IXeQ3SqulhG/TBscStBgiJu6+X5M4pkIr
 7Yt/z4CpLXjwwclEseZS32kvqCFyUapwouZxo1o=
X-Google-Smtp-Source: ABdhPJxSRSlk92UrwkWVdjQOY+QWe0+t/n0/iwm099sz+ESBHjMTNc66IyPWLfjYgyGDtCUDZ1WVXjV+7AYQikMhLHw=
X-Received: by 2002:a5b:783:: with SMTP id b3mr1765179ybq.328.1632351367879;
 Wed, 22 Sep 2021 15:56:07 -0700 (PDT)
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
 <CAHmME9r0xXq8XYJshVEnx0q8Sim7wuJ8gjy=_EszYf4Z020_Fw@mail.gmail.com>
 <b566bf2d-33c0-2e89-1754-a3b4015ff624@attglobal.net>
 <061d9137-a5af-a651-9435-db92dc9f53f9@attglobal.net>
In-Reply-To: <061d9137-a5af-a651-9435-db92dc9f53f9@attglobal.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 16:55:57 -0600
X-Gmail-Original-Message-ID: <CAHmME9pcj3MJtjxm2nVQUANyND5G3YPh_crT2yoPRjy7jGiubg@mail.gmail.com>
Message-ID: <CAHmME9pcj3MJtjxm2nVQUANyND5G3YPh_crT2yoPRjy7jGiubg@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Eddie <stunnel@attglobal.net>
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

On Wed, Sep 22, 2021 at 4:55 PM Eddie <stunnel@attglobal.net> wrote:
> On 9/22/2021 3:45 PM, Eddie wrote:
> > I see the same red backgrounds and empty details pane.
> Which now means I can't delete the broken tunnels.

What happens when you slide the item over to reveal the delete button
and then press it?
