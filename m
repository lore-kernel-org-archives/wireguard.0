Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F91C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 13:36:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0212184D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 13:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORoMsBQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0212184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1735ed96;
	Fri, 9 Oct 2020 13:02:57 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f484e30
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 12:58:06 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id q123so6912483pfb.0
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 06:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JV09vvyzCrVB1+0fHJILya23ltcscCUmaq2YwQQjhrc=;
 b=ORoMsBQQj8yJg0BS5aQPqMIhWzfPO6j+vjkSiXoMvGeK6Dx215SwzIcxTLEB+QfdjV
 9HueqNGOWnqMBycjs91xQ+phaqPyvNJ+U6gnHC7rrxLOsSHQQBFtn1wlY9I3bakhSe1h
 ynv5j3rfDRbCIFqNST+X69t+IAFw9H6gualsqUCUhJHngjy4DmE+1UuFb4+BEzdLA3S1
 iWnxYlDNmP7NeP/xKzkGyOAOfTrsYTclbII8wvxFlgItQSuvJ1CNeafoqo45WSey4yxP
 mtMMdert5ut12SbVXR0dUwlTe/gmcklRG6WwopnVIFHzi21P6U/noL282s+3SHZWpShZ
 P3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JV09vvyzCrVB1+0fHJILya23ltcscCUmaq2YwQQjhrc=;
 b=hvMx9mMtsrVmkO4WVvChpPLTm4KgZiclKtjYs2a3oSbYqrgUzx3nIqc2cFWi1Rg4eD
 NNe6AZ0F8HHkZEUwM6tRpqQJwOTEmMh3WXxY0ZTof4KYxXYydyC+N+yNSKzbrkuOOdnJ
 LhA030Mro1wvsTlgryDn5LEKDpZtuyeOa7w+ZR4k78Dq55M/MwuRoa5hjOvUArKoDZHi
 b6dXIT9Bv0w8fc0zYu4NZbX16sArJ/MXLy6A8YLpZ9m+MzcJSFiUJv+P76E1NdM3kxSg
 lQ8PttCWyMRW1fCz9aXD/iFJZmpejy8r2LMH5zO4rk1qXE3201V/HfDBzoeDRSbWYOOI
 E+5A==
X-Gm-Message-State: AOAM531SX2FA+ZWRgUaG8dUZ3WqsCHqWPBlOdYGVb+OHDn1FtN0bpNqE
 eWWwTXGaAJ2NAni48szKgwPvEBi+l/nZ/yoGkpOAnZ4wYdeUjw==
X-Google-Smtp-Source: ABdhPJyOux+qjppDP1eQspeTk0yQKvUBrD2YOP8gU9KpmJ2h2v6Fl0Rbvk2m0F+LnvHj5wpw3bModae6Xzx5sJKTxc8=
X-Received: by 2002:a65:4987:: with SMTP id r7mr3358419pgs.228.1602250258433; 
 Fri, 09 Oct 2020 06:30:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009182214.0169140f@natsu>
In-Reply-To: <20201009182214.0169140f@natsu>
From: Rudi C <rudiwillalwaysloveyou@gmail.com>
Date: Fri, 9 Oct 2020 17:00:31 +0330
Message-ID: <CAE9z9A2kWvroWG7v4iAxnVKxs8ev1eB28E+gMKdyXKBUM5Osdw@mail.gmail.com>
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
To: Roman Mamedov <rm@romanrm.net>
Cc: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 09 Oct 2020 15:02:56 +0200
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

> On Fri, Oct 9, 2020 at 4:52 PM Roman Mamedov <rm@romanrm.net> wrote:
> just install a SOCKS proxy

These simple solutions get blocked by the DPI. (I do have my own VPS.)

> you can try srelay on the local machine and
use the "-J" option, "outbound interface name". But I'm not sure if that would
just work on its own, or also needs some help from ip(6)tables or ip-rule.

Can you give me some pointers to what I should study to grok these? I
know the basic TCP/IP theoretical stuff, but I have almost no
experience in practical networking.
