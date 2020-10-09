Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8541C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 13:47:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0224D22265
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 13:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnxQ0egq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0224D22265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8585e2ae;
	Fri, 9 Oct 2020 13:13:55 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [2607:f8b0:4864:20::530])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fefee96a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 13:13:53 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id o25so7231726pgm.0
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U+99zEMvcI+Ujd9x8bvpxkjllo7xUuiMF4Uer+68JCs=;
 b=bnxQ0egqRJ41UuD28eSqFBYqtV2UHy/uMvLbTyhA5nw3qmAWeYNhUXoV9FwcVia3JI
 tNyNjZ6nyTFuHJmpZ36CHUUyy6jAB1hz634mgtk3oCgy2Vvqi1EBxoATCN15qgVLmfeK
 IrWndWT3K4oZZYnAUHES/eYLjhffJhG+G8CShyd1hOHdqOp77TSvzMhRFyNZf/freRxS
 Cp3birsnWO6jEpMG0uIA8nlPdyNP0FtgkV//2x5XhLtQWwjUgxJl16ZJtZnmIejZlYJi
 GT1eNSPe2UE6YSgK2cvJFyXQGY/PJCN61ElB8xdV19mQpCCL6O+/hXj15e/y66twf99m
 4h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U+99zEMvcI+Ujd9x8bvpxkjllo7xUuiMF4Uer+68JCs=;
 b=Lf0oOslRDL9hUJ/41jux+jJb4woSSsnDQ0azAGhEt4MaPZvGxS7v8ZBFcxHsn8OuPe
 2WhxqRrK12CuHuukWjofu1GcD00sgV9M02U9/VvzCXxMpYse3jzTx9WIgWPdexeOMoRG
 9Wcc1pYiLMreIYmd3jB+OEkT09foQU48GN5P0SlGW4Uq54SC7eGc8HQjCbYBqYAsaqo0
 g/x+tyfQeX+QBsNNaFcRwupFx39xA7OenfCphdO8f5VDzgnoJqRo9QhojZCMPwHCkOqD
 8i87l8XtrUVwHRmX3N7T5RTMReOdBlYjjQr8ZYCAqgj4jRNAWezk1A00VCjoLqIbSExr
 XW4A==
X-Gm-Message-State: AOAM533eoLaoeZNYsFMdHsudLfn+1rAkRGo94Q+2PAc9rJ+qG4RgOPyF
 L5uIdxTtNbbD+j4pu4Wa0Za8McpULxmNVBc9+kAaoNgCtPDrHg==
X-Google-Smtp-Source: ABdhPJzd4ShJb695mWVpbkzsE9vVaRhrXum5OxLLC3d6qP7fY7zMolW5zaW5N4sGrQlVHYqQe0/fBqadwayiO9qA99s=
X-Received: by 2002:a63:544a:: with SMTP id e10mr3412837pgm.284.1602251205362; 
 Fri, 09 Oct 2020 06:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAE9z9A0H8t3op=ewTCUhZXeOoprWEquiiH77mUN_C8EMvwiF2w@mail.gmail.com>
 <20201009182214.0169140f@natsu>
 <CAE9z9A2kWvroWG7v4iAxnVKxs8ev1eB28E+gMKdyXKBUM5Osdw@mail.gmail.com>
 <20201009183446.06f7fe0a@natsu>
In-Reply-To: <20201009183446.06f7fe0a@natsu>
From: Rudi C <rudiwillalwaysloveyou@gmail.com>
Date: Fri, 9 Oct 2020 17:16:18 +0330
Message-ID: <CAE9z9A3wG8e8djm7Og=+y7QBW6oqunM1Ln+DKHLA5isyWS-88w@mail.gmail.com>
Subject: Re: [FR] How can I expose the wireguard tunnel as a socks5 proxy on
 the client?
To: Roman Mamedov <rm@romanrm.net>
Cc: wireguard@lists.zx2c4.com
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

> On Fri, Oct 9, 2020 at 5:04 PM Roman Mamedov <rm@romanrm.net> wrote:
> Seems like you misunderstand what I mean. If you use the in-VPN (internal) IP
> of your VPS, all communication with the SOCKS proxy installed on the VPS will
> happen via the WireGuard tunnel. No DPI can look into that.

You're right! Some questions:
1. What should I do client-side so that wireguard only covers my VPS's
IP (and does not otherwise route traffic)? Will `AllowedIPs =
SERVER_IP/32` do it?
2. How do I get the in-VPN IP of the server? Is it `Address` in `[Interface]`?
3. I use ufw for the firewall on the server. Will ufw block my local
machine? If not, with what IP should I set ufw rules? (My local
machine doesn't have a static IP.) Of course, I could alternatively
expose the socks proxy to the world with a password; How secure will
that be?
