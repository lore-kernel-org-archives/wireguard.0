Return-Path: <SRS0=ZlE4=N7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFCEC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 09:21:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAE84610FF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Sep 2021 09:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAE84610FF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffb2ea3e;
	Thu, 9 Sep 2021 09:21:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4b95847
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 09:21:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86EE1610FF
 for <wireguard@lists.zx2c4.com>; Thu,  9 Sep 2021 09:21:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="NMmn3s+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631179275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HCRJmG5r4k5OscJPmayEtTUs7NTlzAQXj8g0IULyjYc=;
 b=NMmn3s+37QkhLLdp9D8/j6JS1KfJYpPYpezcZrdhYakuI++rj5qAwts/5IZolv1M2ZTKjd
 Qv7ihZnJyE1DsxIrC/Lh5CzaZLgUu+dl2cUB8quv469wgbUdGMhSnRRCzpfxPTD6KH9Ao/
 fZqsYmRYAl55BaGil80D6OZCSKtVO2I=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a5e5b65
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Sep 2021 09:21:15 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id r4so2547312ybp.4
 for <wireguard@lists.zx2c4.com>; Thu, 09 Sep 2021 02:21:15 -0700 (PDT)
X-Gm-Message-State: AOAM532+NxJZQFe4yB8P07MlKxUIeEA7kaKYnH7z8bbiZPhgC0ObVxyg
 52/AEpEB6T/PDGfHu3xrE4rF83hmEEMPXjPCjjU=
X-Google-Smtp-Source: ABdhPJy/zpMzXfaIjLqfV6eNwSfDCbkrTmA1SNvMG7YumL7QlpOkbXBURTHdQCjzkdqrHP+orzT93HHxZSUl9JF8nGA=
X-Received: by 2002:a25:664c:: with SMTP id z12mr2709011ybm.62.1631179274924; 
 Thu, 09 Sep 2021 02:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210806044315.169657-1-someguy@effective-light.com>
 <OD24ZQ.IQOQXX8U0YST@effective-light.com>
 <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
 <OD95ZQ.FW5WHNPSV04F@effective-light.com>
 <5daec7ab-a97d-819e-56cd-c45176d355ee@gmail.com>
 <CAHmME9qEAUXtZSd70sO8OzBk6Rmnib07VEbPm6GWhugE_ghdyA@mail.gmail.com>
 <044be90d-1caf-08a2-3389-d60010986b16@gmail.com>
 <CAHmME9pJQ8cgOhHPZU+3o9nMgoMe_OrWg+gkY34iOMAd-AZHCQ@mail.gmail.com>
 <3329757c-b2b9-113d-b6e4-fc28f86cd704@gmail.com>
 <CAHmME9osjYgu-0CbEvpNK-Vj6CWg8njraAdegefeG1NrJUETfA@mail.gmail.com>
 <eaef596b-c75d-3f42-f43a-fa80cc98d732@gmail.com>
In-Reply-To: <eaef596b-c75d-3f42-f43a-fa80cc98d732@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 9 Sep 2021 11:21:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9qUkyAYCHqeQn=ku70uWJYaL7Oi5A9ZGQ_x1aokVLPi3w@mail.gmail.com>
Message-ID: <CAHmME9qUkyAYCHqeQn=ku70uWJYaL7Oi5A9ZGQ_x1aokVLPi3w@mail.gmail.com>
Subject: Re: Issues with latest Windows build
To: Peter Whisker <peter.whisker@gmail.com>
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

On Thu, Sep 9, 2021 at 10:37 AM Peter Whisker <peter.whisker@gmail.com> wrote:
>
> Here is the [...]

Thanks for the info, Peter. Fixed here: https://w-g.pw/l/S_Ts
I'll have a new build up sometime soonish.

Jason
