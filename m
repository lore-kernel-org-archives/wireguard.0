Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC07C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 16:00:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 574502070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 16:00:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="kdKsU13S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 574502070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0eff4be8;
	Sun, 25 Aug 2019 15:59:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 808ed0d5
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:59:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e262063
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:59:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eefa7b73
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Y1KnNgamOVoBARIqb8WjjYKT8LA=; b=kdKsU1
 3S8CfjoxdZ4TJdpq6Bk1qJuFMjuh2t3nStZ83m/6xg5Gisbap0ys9iD0vCPITnWK
 7Zg/DVhy0loh0pbivBKe5eDDeyRaAPIKB7xFT9DuT0beu1aulQwQ5lgI9aUaj35k
 4dnHYrWkVEZmo+/Tqs6gkKcXZFE7DYxI8nEAdilNIgWn1JD3/wNwL7I1tBD3v6/Y
 FHc0ktU9sbOF0syJapWaxwKGKJs29t6Xc40BB/9KQXsrEehzigqd2cRic3LEz7qS
 yRS5JrVP/GA+yKgkSPDS6ql14IlEYykHQMmw8ZAlfJRFAgZ9O2jEokIW0+tStdyX
 plzIF5zSn6+rO/Lw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 564a9922
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:18:01 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id x20so9134765vsx.13
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:59:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVey3wseEN5mQ+n6gT+fmYcQ+oq3cKMFb06pFGqnFZTM7XTDIc1
 sj2mWXGXim5R097ED94+wg1cjOG34w19xcrNdJY=
X-Google-Smtp-Source: APXvYqwVE3FyFiNoYgJYIN0D8oJic4ecEPpMDnqq2xg4aG8T+8CfqdbUN1HBJuZVQ5KDKi/tN6KgQCEUOglycn7dKKc=
X-Received: by 2002:a05:6102:100f:: with SMTP id
 q15mr8536328vsp.100.1566748789627; 
 Sun, 25 Aug 2019 08:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <f41b1efb-cf2b-f6d5-f962-6f515e044482@mitteilung.com>
In-Reply-To: <f41b1efb-cf2b-f6d5-f962-6f515e044482@mitteilung.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:59:38 -0600
X-Gmail-Original-Message-ID: <CAHmME9pB123mU5+V2U4Gk1LUWUffBcOkxChuEMEwSUxPGWB1LQ@mail.gmail.com>
Message-ID: <CAHmME9pB123mU5+V2U4Gk1LUWUffBcOkxChuEMEwSUxPGWB1LQ@mail.gmail.com>
Subject: Re: Debian 4.9.0.9-amd64 :: DMKS failed
To: Markus Grundmann <markus@mitteilung.com>
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

Addressed with:

https://salsa.debian.org/debian/wireguard/commit/dca2647fa39e037448b450cb82d5d62b13685b25
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=934763
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
