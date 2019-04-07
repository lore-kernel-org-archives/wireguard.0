Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE15C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652422087F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDWbfkhG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652422087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6e91b4a;
	Mon, 6 May 2019 20:31:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9e1b45c
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 09:33:48 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19aeae63
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 09:33:48 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id w5so12146123qtb.11
 for <wireguard@lists.zx2c4.com>; Sun, 07 Apr 2019 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=g9iwPR73VYR+kpbTmZZ0z0kx2EvAxo3KhNVA+Uqf5n4=;
 b=KDWbfkhGQak0c0/FVmXe+zrUAWOd27IV71EH6EUg4Xjv2fwPxjkqnyDU0xC6OTgtfq
 s6W2HMt6pL7gedlMh6aEHdUyQhhh1oI8ovSMYghIJrEEvFeZBrgqKhFS7mdS7c/kUDNB
 zCYMuJzS0lJYl2HSvuvu6tB1wKSJYtJFVcLpyavw9+FuezSWpME3ADkDhWiO6ErK6PR4
 Dp77Crrq0EaEGQOQ/1NTWOBR1TNVMh3T+8/ZBiNgTUFSfIfN8kHB+spFZ3DOzgFBB7BQ
 K511b8umbZl45XkcddBwSZRW8VAeSdnT5W69OPW1FpBWQX6kI0nZ24721KyeJfqVcXhG
 pBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=g9iwPR73VYR+kpbTmZZ0z0kx2EvAxo3KhNVA+Uqf5n4=;
 b=nTtvVhxI0agA3TUOLoIdo/R6S9IwXoaSvStz0ru8IQjI7GCWu5CKdtD4SObZ0ckxon
 KEpOpn0MCErt4K+DZat/X1Izl0oZQJyrerMNFZpWN+AmbvW4Q9d+STHksumiNzl6gvi1
 Y1NG8zPQX1edy0KGyuw19grxhFSCcnPrZ1vxrFFUjFjNZnE1jVvrW1kmrOxUAiTLPeML
 Nrr5qLyGSsz6E0hP9vCp9MlRwfpoDqdBu2BreSgY/YqCWkq/oWlJeMwGskFrCot8nN1q
 gIGEd+v+OymzC/BwzfQKKqr3eyPqqWtefqe9DenAxIg3MrnrHBwJkjyz9u3Dh11Fjx8h
 hRNA==
X-Gm-Message-State: APjAAAXMSGJAiSFeofw4nFN4Zw7FGHXzmBBIx0HfTT7XxwjrmjZ7vhbi
 c/Q4goSEHGwJ02IZokVeOzUs94Xx6rd+xd/7Ub9d/nq4Bs0=
X-Google-Smtp-Source: APXvYqyCAbX+q4qIa3rfg99iAlKWtU5uzOTVGWQJ5ukPJV7LAguZai8Iojkkgrh2oBPzqwm7f9V5iwWw8MCjyPPR8Is=
X-Received: by 2002:aed:35b0:: with SMTP id c45mr19146086qte.144.1554629782671; 
 Sun, 07 Apr 2019 02:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <bf1d3b6ac8dc6a31c82042b363db3bf3@wpkg.org>
In-Reply-To: <bf1d3b6ac8dc6a31c82042b363db3bf3@wpkg.org>
From: StarBrilliant <b13253@gmail.com>
Date: Sun, 7 Apr 2019 17:35:46 +0800
Message-ID: <CA+7UkwLb5rLprqTiW+g-7VbDXP0sEgtrg7EdV+vHn9zJHqek9A@mail.gmail.com>
Subject: Re: mesh VPN with wireguard?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:31:03 +0200
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

Hi Tomasz,

You might want to try my VWGen project:
https://github.com/m13253/VxWireguard-Generator
The program can generate configuration files for your network and run
VXLAN over Wireguard mesh.

Best regards,
StarBrilliant


On Sat, Apr 6, 2019 at 7:54 PM Tomasz Chmielewski <mangoo@wpkg.org> wrote:
>
> Does Wireguard allow to set up mesh VPN with "relative ease"?
>
> Say, we have 10 servers with public IPs, we want them all to create a
> VPN network with private subnet 10.11.12.0/24, and have all 10 servers
> communicate directly with each other.
> Then a year later, expand it to 100 servers.
>
> Something in the line of: https://www.tinc-vpn.org/
>
>
> Tomasz Chmielewski
> https://lxadm.com
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
