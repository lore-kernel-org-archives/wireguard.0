Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2234EC46475
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 15:51:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D1820827
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 15:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="NvbHqgvE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2D1820827
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c799f489;
	Mon, 5 Nov 2018 15:47:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a18ef11
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 15:47:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a9c331d
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 15:47:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ff52e29
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=cR4Ddx+ChjlSxCpd2xZ2+BekNkM=; b=NvbHqg
 vEIl/YPmcja7Zn6jEUKo8i/kx/drrDI9uJ0M8XIy7pieYwKoVlxXwBdG5Hr3q6JR
 6GMG2QypuSgRk0HtoRjIyQIVhm/xxG6AepCCZzJpXoH2AXrET29wcLQ+wRVTIrQc
 FYZqtMcyFeJRSv040BsYcDG63JlK1YtMbvc883xBdIAkI/jJvXeRrfZzZInaqece
 WsvcxRAIUPLEtlqwMlPeWzjnEpjDgGSvqAoXzXlM6rklXZ1WpAxcg++nJM31sdUV
 /YwCq9O9Wfey5GsVRFF+VvRPn7G5dpr1Xl0HOIidOQTz/pWXGPe1Ojh9/Sa2KSE0
 d98QWHDs1xrmVj/g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ff69da0f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 15:47:37 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id q1so8424645otk.0
 for <wireguard@lists.zx2c4.com>; Mon, 05 Nov 2018 07:51:51 -0800 (PST)
X-Gm-Message-State: AGRZ1gIRO+D07o42cJGJXxLhHAdVQcchTWmOgQ4m2L9pJTI2KVEsTsDx
 FSQXAR3AlZKrpTn6jZT2g9fSBZCXOpr5X7dpy6g=
X-Google-Smtp-Source: AJdET5crye9GhctLercDP3P22XJ7Ry7MpEq8OXciLHhSQfn7Qt+hWryo/q/N3mohT+pRJrVQK6JzuWPr4qbk4RGXvk0=
X-Received: by 2002:a9d:14e:: with SMTP id 72mr14242866otu.54.1541433111315;
 Mon, 05 Nov 2018 07:51:51 -0800 (PST)
MIME-Version: 1.0
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
 <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
 <87sh0gdomi.fsf@fifthhorseman.net>
In-Reply-To: <87sh0gdomi.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Nov 2018 16:51:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9pRgYP6hSRVNUDN7pHwNFYdSyN-wZuu0FMW_hzcVoXEYA@mail.gmail.com>
Message-ID: <CAHmME9pRgYP6hSRVNUDN7pHwNFYdSyN-wZuu0FMW_hzcVoXEYA@mail.gmail.com>
Subject: Re: wireguard dkms systemd
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

On Mon, Nov 5, 2018 at 7:47 AM Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
>  * echoing suggestions to stdout to rmmod/modprobe just before actually
>    doing the thing seems like a recipe for it happening twice.  I think
>    i wouldn't make that prompt if the administrator has already asked
>    the system to do the upgrade.

I was just re-reading this and noticed the same. Good point.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
