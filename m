Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AB7C35666
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 15:47:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6716206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 15:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Q2/KAHWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6716206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc6253ab;
	Sun, 23 Feb 2020 15:43:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c45845f
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:43:29 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97954d5f
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:43:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30dad55d
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=PyyuFUvURAuxC9SB1s3slARRAjk=; b=Q2/KAH
 WxpCIA/znXV4RmQof6dRdiNZYkXG8zGqjGkZmqT8N/OlOPN15/k5+wjfR6zCrwR7
 8tusOAcE0DfAfPwckbE2gGyVz5Ih7uEHmXI5KRQyfsjs2XMeiQiQ9acxtOaTdcX1
 6RtNQeNbXQ58qcUITA2AVeXrVSS9ISYr0Zd7r4B7Az399X8xOeSQE5+tLbji+f19
 WM9PmKCAAIRFTeedr/lHrJ0FMIgjSxL4xwWPPXmPruSETmUvuRNH8W4t6nyc1rj1
 Rl2oAe53E0PzKJWT9cbBY2AhE8JYimfzFCNe+SSiirOx6hjcjBvsMBNHjhQ6TdGo
 fJ1IjlU1yDzU3hag==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a39947d3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 15:43:29 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id c16so6656626oic.3
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 07:46:45 -0800 (PST)
X-Gm-Message-State: APjAAAVfYunOwk64ADEsrgTXtIvruP/DV8gRYzFy/nAfYzXTAHIKjJav
 3J8IaouOF+CPHkKH1YUA9KfKlo+q4Uv7fjpbOYI=
X-Google-Smtp-Source: APXvYqw9Pq2950x5kiMawHSkpjvpWpkaJVANwskJcSnmBsWONRYcbHHtW3Wy+dAI5/J7psYZvcOtR7i3owUzK35YdHw=
X-Received: by 2002:a05:6808:4cc:: with SMTP id
 a12mr10010946oie.115.1582472805137; 
 Sun, 23 Feb 2020 07:46:45 -0800 (PST)
MIME-Version: 1.0
References: <0fbfcb28-47c3-5aa0-1699-e3bcd7ca7f6d@kent-dobias.com>
In-Reply-To: <0fbfcb28-47c3-5aa0-1699-e3bcd7ca7f6d@kent-dobias.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 16:46:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9oLgtcW5+fCGqQzEh3UdCP8K86YyE3dwk366iOCZGK9Uw@mail.gmail.com>
Message-ID: <CAHmME9oLgtcW5+fCGqQzEh3UdCP8K86YyE3dwk366iOCZGK9Uw@mail.gmail.com>
Subject: Re: DKMS build problem on Pinephone with UBports (xenial)
To: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
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

Looks like the tools in the headers package were built for the wrong
arch. Might want to ask the distro package maintainer.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
