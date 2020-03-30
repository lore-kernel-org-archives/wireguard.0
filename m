Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C2AC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:31:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD4820735
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:31:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h9SUww1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAD4820735
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1055649;
	Mon, 30 Mar 2020 02:14:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 425da9d9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:14:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ab758c7
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=EW+zoFAToHd+L6htIE/q17PyknE=; b=h9SUww
 1clcmazYj92uA0HczgTJY5TEnXiHFFPBiq6S4HfsOQAmkB1+3bEP4/fPNdSj3875
 v52ifwz1EV4VlbjZAls3Kumq73j4z0LkHHCmyh0HB6ZwNkWd0wHJGsiGxHg1zV6F
 SATO3uk1B+3LRS9THvYx8DgmleNF1345WZXMw4ll+cN9qSupRbl0aJzPKMxpcEQj
 z2pyzTpintM4Xk0i6MnyDAB7KD6rr3k1poATqhe01RR7UozAFpjEndz/+m4YY90o
 ijxh72lq/o336zeFwdO+dNOgMOaGye2+V0j2bsyAVsTI5lRiWw/m8nvMc1dcMWjJ
 lsVySEQ3ohVrgP3g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41d86771
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:14:36 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id p13so14312183ilp.3
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 19:22:26 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1o1puPdu4wr2irDMD4MJVy2bOVhsobDi1RH0n29BfVhUuwdTPq
 5f+dvbcAFLtfB1AK8/5FdPjDBAXrCuhrYdjPqFM=
X-Google-Smtp-Source: ADFU+vuv9HOFWG2cDpoHRF9XaOOPIh6f2ThZbWtzL8Mlo4OYg/rilRdIcFSgqiSzzY5LKlSbmr2gWOVgoOjFAZpvNXg=
X-Received: by 2002:a92:358b:: with SMTP id c11mr8683379ilf.64.1585534945853; 
 Sun, 29 Mar 2020 19:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <F77DB7FE-175E-48E4-A071-FF86D290B494@mail.ch>
 <CAA2ss9EE35hYqjOC_uY9REe-Mp0D04bPH9Ldg0wConQs8VG24A@mail.gmail.com>
 <0f81834c-6f8a-57a9-1376-e6c310aa9c5e@johnnyutahh.com>
In-Reply-To: <0f81834c-6f8a-57a9-1376-e6c310aa9c5e@johnnyutahh.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Mar 2020 20:22:14 -0600
X-Gmail-Original-Message-ID: <CAHmME9qc7UcJJhD=0_3bMkXGXvyxLW=SnyFcz6RmMvS2sRMCJA@mail.gmail.com>
Message-ID: <CAHmME9qc7UcJJhD=0_3bMkXGXvyxLW=SnyFcz6RmMvS2sRMCJA@mail.gmail.com>
Subject: Re: WireGuard for macOS
To: Johnny Utahh <mailman-wireguard.com@johnnyutahh.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eiji Tanioka <tanioka404@gmail.com>, tormen@mail.ch
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

On Sun, Mar 29, 2020 at 8:21 PM Johnny Utahh
<mailman-wireguard.com@johnnyutahh.com> wrote:
>
> The macOS wireguard-tools command line does not seem to work
> concurrently with the GUI app, at least on my system

They're separate implementations, and we can't link them due to macOS
sandboxing.
