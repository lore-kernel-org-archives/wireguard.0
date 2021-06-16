Return-Path: <SRS0=+n2a=LK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C9BC48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 16:28:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F7961241
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jun 2021 16:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F7961241
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04809efd;
	Wed, 16 Jun 2021 16:28:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 94ade225
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 16:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623860905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PPAdUUANlijjNjy50HpHew4IoRMhvCzuzKSPoN4P+Nk=;
 b=nh8M2WHzr2b4OyupYcQeoE1Lme4fmiQR0CGzYFsaPUAxK23Q2nLCOg2l7MKMpdL6TUlBeV
 OJjU97UB19TurS1FVPA6UmLHP42gwfHzsQG5vnzAvDtFm4m9MefDEEEFXPMCUbfEk3w2GO
 fXSm2NgLuVlGlnJx+5TUraJMR0U4RoM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c91d9ed7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jun 2021 16:28:24 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id t8so3856703ybt.10
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jun 2021 09:28:24 -0700 (PDT)
X-Gm-Message-State: AOAM533jzkr2kRwR//zzcg97wv2tPyQmvN3s4MrYjdGoHCkc67DVnZfx
 Wv0I0l4lI46OIc3tCRlLoyH4OxFa1tf4qlJ85PA=
X-Google-Smtp-Source: ABdhPJxM0lCucSCdAPTfyfT+q5NinsDm8DgDx6LIihELUi1T0gV6+dA7tajb04Rd9JHncmSdgKIbXSsJgqay6eKdhig=
X-Received: by 2002:a25:660a:: with SMTP id a10mr817897ybc.178.1623860904214; 
 Wed, 16 Jun 2021 09:28:24 -0700 (PDT)
MIME-Version: 1.0
References: <YMn7qQ/7s/CciRNy@makrotopia.org>
In-Reply-To: <YMn7qQ/7s/CciRNy@makrotopia.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Jun 2021 18:28:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
Message-ID: <CAHmME9omR=NXkJj-AJviWhcDDY=X9vQbLxn5WbeamUGhVWHhJw@mail.gmail.com>
Subject: Re: passing-through TOS/DSCP marking
To: daniel@makrotopia.org
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

WireGuard does not copy the inner DSCP mark to the outside, aside from
the ECN bits, in order to avoid a data leak.

Jason
