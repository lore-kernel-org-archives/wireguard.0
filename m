Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E015C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:00:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 585FC61153
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 19:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 585FC61153
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b594b32;
	Wed, 22 Sep 2021 18:58:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5c5dcb4a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 18:58:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02CDE61153
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 18:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Op+ZjyyN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632337088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+4hGDQN5vKna3djYJO/H1OvWibFOO0pgjxJZuSlp+CQ=;
 b=Op+ZjyyNdQh7lj5E+ru0kLFycPTOhYzWHXt/FNaHpsNKPzBMi2rncd+cm+RbozoGY8s6R0
 G1mfdjy0YOFAsIs3bxxTRkiCuTul5YQ4SmXoFowaL8XQsHEd6KPmaX6LWC7nweoJu5kM9D
 pkuOkCB3c4Vsh69bm08GU7Vjk3ck+B8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 96ba7c78
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 18:58:08 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f130so13278264qke.6
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 11:58:08 -0700 (PDT)
X-Gm-Message-State: AOAM533Z3P7MjVawTK/Um78/aJjlRR0l2HuRBTubtgOmsadjnktZTzjx
 8ygCLiY+bESVEIowivM8Qy+NkrM6cbG0g0jKLo8=
X-Google-Smtp-Source: ABdhPJy6kQtG4nSShHhWPeLIztG53buQl9DJe3mOHmiiNpFXwZPrNJdJVVNDQutDkdU7/lVB50pOSBEpQgEJWVd7i/g=
X-Received: by 2002:a25:d442:: with SMTP id m63mr790198ybf.79.1632337088175;
 Wed, 22 Sep 2021 11:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9pgz6PiXdFqcRw90EafHK-Jq9RfcgLUZaJ1ARrtdnjG0w@mail.gmail.com>
 <ddf37ac0-0d04-ad84-73c7-b334655c066c@physik.uni-bonn.de>
In-Reply-To: <ddf37ac0-0d04-ad84-73c7-b334655c066c@physik.uni-bonn.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 12:57:57 -0600
X-Gmail-Original-Message-ID: <CAHmME9rP1a5XPtHp10_M5=w_ozGysOPYAk-PJ5hhZUCRXCJmQg@mail.gmail.com>
Message-ID: <CAHmME9rP1a5XPtHp10_M5=w_ozGysOPYAk-PJ5hhZUCRXCJmQg@mail.gmail.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
To: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>
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

Hi Oliver,

Could you send the wireguard application log, as well as any other
logs you find? Also \windows\inf\setupapi.*.log would help.

Jason
