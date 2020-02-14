Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB2BC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:18:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B6E2187F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="go+MdGYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B6E2187F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ead684d3;
	Fri, 14 Feb 2020 11:15:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cedf9aa
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 11:15:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d4781a2
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 11:15:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4ed835d
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Km0mEaCtTkIhkUW1To+LzmY1EnI=; b=go+MdG
 YVW06qmW8HK57YeHgf3fe/50YFRGQkv/p3489c0HVN4WpEy+JhqOgdGK+GEgGooy
 UZGCF7w3OjwvHt49zdDfq0NTl/R3NYjjINhtIclmPHpgyDptem91h6A/DWofIMEF
 CvjclAQ5FxtMwLWjg9QivZl50ElGR4QoT5HII/n5oCfGTvspRTbUA9lsnjbteF3Z
 Gcbj1Aom7SZnq3Y8I9Y4IJDet6QhbU+qU8UssC3WiUjS3ytIBoQa0T+G/4/AAp24
 AB6m7FAkP4wprwKbtnH9QD2HCnf4V/4ZCgImUugWymuL/drk84XzSR8skpfVOIeJ
 Mx4rmqjvyLAOHkGA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19d8321c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 11:15:54 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id g64so8756615otb.13
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2020 03:17:59 -0800 (PST)
X-Gm-Message-State: APjAAAVLlIuPI5cUDpsDo4x/z5pYkT6yGnxYh6X8QqryX/mfPU7bOD+l
 RsHpUjES2Bes+2dL++4hi19gSgLaw65DFriMq/I=
X-Google-Smtp-Source: APXvYqzrWn1tlIPgg1gwxOBbz5C4jH95hQE5pBYiKO9jKwkj1faOrlfjqud5biAPNs99S/lK2W/PliBAsmShblJBN6g=
X-Received: by 2002:a9d:811:: with SMTP id 17mr1887350oty.369.1581679079197;
 Fri, 14 Feb 2020 03:17:59 -0800 (PST)
MIME-Version: 1.0
References: <20200207200035.69579-1-hristo@venev.name>
 <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
 <410e641d5f7398078e8b1ea47652f34618ac26ef.camel@venev.name>
In-Reply-To: <410e641d5f7398078e8b1ea47652f34618ac26ef.camel@venev.name>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 14 Feb 2020 12:17:48 +0100
X-Gmail-Original-Message-ID: <CAHmME9prE9oe4DX7dH6=UpnbBSE8yk6WN5epWxw7UuD_w7a+pQ@mail.gmail.com>
Message-ID: <CAHmME9prE9oe4DX7dH6=UpnbBSE8yk6WN5epWxw7UuD_w7a+pQ@mail.gmail.com>
Subject: Re: [PATCH] Implement reading keys from stdin.
To: Hristo Venev <hristo@venev.name>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Feb 9, 2020 at 1:15 AM Hristo Venev <hristo@venev.name> wrote:
>
> On Sat, 2020-02-08 at 23:20 +0100, Jason A. Donenfeld wrote:
> > Trying to get a handle on the use case for this.
>
> I am working on a program [1] that configures a WireGuard interface by
> invoking `wg`. Generally there are multiple peers, and some of them may
> have preshared keys.
>
> Currently the most reasonable way to pass keys is to write each one to
> a temporary file. I think passing all of them over stdin is nicer.

Except the command line arguments have length limits you'll hit
anyway. Wouldn't the better way to do this be passing a config file to
`wg setconf wg0 /dev/stdin`?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
