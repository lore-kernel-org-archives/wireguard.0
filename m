Return-Path: <SRS0=4Jqt=NO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F1FC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Aug 2021 22:09:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7731661076
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Aug 2021 22:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7731661076
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f016b66;
	Mon, 23 Aug 2021 22:07:04 +0000 (UTC)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cd57ddf
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Aug 2021 10:21:43 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id s11so16233126pgr.11
 for <wireguard@lists.zx2c4.com>; Mon, 23 Aug 2021 03:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MK26oFstHHgLL+/6jevGswt5GangBxZQJtjKGeVyU1I=;
 b=qKl2taKHz3NrVQTdiwT9T9RSGJ1cSO5uV7zNWGYQ9HgG/jnsEss0odOy9PBC0aCzur
 HGPNFgt9uFQjVuncyvLvJQq/mFKzosuEV8f2njMtIHJelS9Nw7aCUUKPXNd2JWWOwiHv
 iDMingiBvTSuDssRi298JavqPQITHv1IBkMyacjXXmitYqEhojnZNZ0MLqIsxYaUjjpZ
 n4Eu+dpwevilIOiCpAOdDlUM1tuOz9jWBab4hRPDeeumVihghezCf2u2zf0pvfTUtOo0
 LwD++BQ7spCA5g2rYQ+1BxucGHdzHDNQMp+koUkwmaD3fWV23rLVE+jwj0ExjP5tQiGe
 goWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MK26oFstHHgLL+/6jevGswt5GangBxZQJtjKGeVyU1I=;
 b=ZI5Ws0eHtMhszBmuT/xdXmC207ASg1U9wBwmxaD0LbhBPzul30R0Bn4IbwrHPxxgyB
 cHidlRKx+1cRskS0ciTy12D3HgVVdDYgHcStgFLkW9oIWNy92beBpLg7GhQrjQLP0Cwr
 DHR2kB7mwoBp8hFsLnuNQtpsFZcJ8gpOKjscTaSkdM0jHptsbsgUCajbju0L/GbllzQw
 I8Hfi7o4gNGy/+nMu3cpwJfrfvwI3vq4pW7cesxb6mIUWoZWYxGuXxQm6ZpnInzX4+E+
 +hffEL5juSV0zPmyTcK4SpN3R8Mk9HAIr6dn9pXiXi/UWHd/H7mOFAqGZY25tEf0AvOF
 kjXg==
X-Gm-Message-State: AOAM533NDaeGUm1JdafSmxwN2maVG2qj7mOoq7NwtwJijO5VXU68BpKN
 7rteFTBevcIV0V0O63IruNO5Yb2pVCnxZj2p3/I2ax/oNfVhzlPs
X-Google-Smtp-Source: ABdhPJyA55c+OlsPdqoop7Ue/3UDUswuclZo9U3qgEOmuuxvzU2aJy/I95NrMPMK8z/j1RTYWSysUxRzmdq7CX+qqYQ=
X-Received: by 2002:a63:1914:: with SMTP id z20mr31102076pgl.87.1629714101453; 
 Mon, 23 Aug 2021 03:21:41 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?David_L=C3=B6nnhager?= <dv.lnh.d@gmail.com>
Date: Mon, 23 Aug 2021 12:21:30 +0200
Message-ID: <CAFiEPQu-w-ZX-TMiriGpK2h4_WSGs+5mzq_5PbhbjK1yyncCbA@mail.gmail.com>
Subject: WireGuardNT: Tunnels cannot be "nested"
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 23 Aug 2021 22:07:03 +0000
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

Hello,

I'm trying to connect to one peer/endpoint via another peer. Using
wireguard-go, or using WireGuard in the Linux kernel, this could be
accomplished with a configuration kind of like this one:

[Peer]
Endpoint = A:51820
AllowedIPs = B/32
[Peer]
Endpoint = B:51820
AllowedIPs = 0.0.0.0/0

When I try this setup with WireGuardNT (0.4), it seems as if B is
being connected to directly (outside of any tunnel), even if I route
"B" through the WireGuard interface.

Are routes using the interface being ignored
(https://git.zx2c4.com/wireguard-nt/tree/driver/socket.c#n213), and is
this the reason why the above no longer seems to work?

Is there any chance that this will change?

Thank you,
David
