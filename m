Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422BBC2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 16:22:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3C7122314
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 16:22:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="m9lHLk0K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3C7122314
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bed42eed;
	Fri, 3 Jan 2020 16:22:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92214bbe
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 16:22:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f227db7
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 16:22:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3644a54c
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=IcwAUzvcGeus8blnF3pw4aELRPE=; b=m9lHLk
 0KS4LIQj5u/6G4k0+MXANb7Gl7lmyPHjWtRcRIG0SeneM93qCjN182InnwBY2xSa
 owJVWfyPeON91SWQzsrW4ddAdI8QNtKBPWnA9h6E4zkvp76HolCxrOKWUPCFJLWE
 f7bmTPIBbA0/+Z0PzWfyimQPqHIlLvlUA5o3IrGJlHl3BwS1/Fnrh1lvbVMJEZWY
 IA7+mzuAJlzb+LDXQsdiWPb6zIfQHicL0yfyLAxe6eqg9CP73nR7DTjc0QT+5jn6
 QlYGXQWDgD3zED8Zsrbk67x7IIQBhEWsrY8+1ZlH1ivZG5xGjms46GIoi34et5uG
 ySXChdKWC2+8Jl2A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0e6dd228
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 15:23:44 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 77so61707858oty.6
 for <wireguard@lists.zx2c4.com>; Fri, 03 Jan 2020 08:22:22 -0800 (PST)
X-Gm-Message-State: APjAAAVmGnDHeoji9czEfHHruDrorC8e9w1ZHKuPLfEU8/FwWmXMM0DX
 Ia1LGzfUjMN7ymjJv75jYDPun5JGvKeJ+37w53A=
X-Google-Smtp-Source: APXvYqzcd0EE1YWPaxzPLkFZDMm/ZJ1rMiQ7ObgxCRxVFl7w2WE52/8JJcWYygw9Mn2yLnkCWC+f+R6m1XWdOUj/qvE=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr101325787otn.369.1578068542303; 
 Fri, 03 Jan 2020 08:22:22 -0800 (PST)
MIME-Version: 1.0
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
 <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
 <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
 <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
In-Reply-To: <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 3 Jan 2020 17:22:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9qMXKanb2dyQdGYWY=T=TjAGYmhtdAeKDmRzV=6Hdd7ww@mail.gmail.com>
Message-ID: <CAHmME9qMXKanb2dyQdGYWY=T=TjAGYmhtdAeKDmRzV=6Hdd7ww@mail.gmail.com>
Subject: Re: wg-quick: syntax error, unexpected saddr
To: Eddie <stunnel@attglobal.net>
Cc: alvind11@hotmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

We could do something like this:
https://git.zx2c4.com/wireguard-tools/commit/?h=jd/nft-version-detection

But that seems pretty ugly and I think I'd rather not.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
