Return-Path: <SRS0=jP9u=M6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=BAYES_05,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C47AAC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Aug 2021 21:27:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5887560F0F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Aug 2021 21:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5887560F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lv6.tw
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff427c40;
	Sat, 7 Aug 2021 21:26:59 +0000 (UTC)
Received: from idc.lv6.tw (idc.lv6.tw [2400:8500:1302:810:163:44:165:32])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a213c62
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Aug 2021 14:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lv6.tw;
 s=20170811; h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UsevWT/BYAnp6/kF9oM3xLP7zu82fEM45pLGOMkZt2c=; b=JMNAo07oEC0oc5zc/cA5Yla/BL
 4ej/cXryQneRnqU4FfEKmPVZeuJfvm/Hg4o5FLspmwOgxx9nAvej+WLadMqIrijRSybhmPLZ6tb1Q
 8RfaJmf0jE7R3L6G8GfR64BaDkeWsDHsLHx622lM+w04x8fYM/nYz0QwKftO6jUEbOa3AUPkthctl
 p5SJ1JqUWD9XhRC6MHbD1fxqgl2sZ8Qw7Dv2gAvS2g353phAtYL1Vh5Mi/zT78/0uA//bfXMtQLZE
 arkDTHyhD7GgOL5EzjRIx9YzObywQGWdFJy39ebn3Enh3VGSyqrW5C5nE9cRw7n5EQshLEB5YaWJs
 foJebOMA==;
Received: from mail-vs1-f44.google.com ([209.85.217.44])
 by idc.lv6.tw with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <lsc@lv6.tw>) id 1mCNi8-0002dI-7j
 for wireguard@lists.zx2c4.com; Sat, 07 Aug 2021 23:54:04 +0900
Received: by mail-vs1-f44.google.com with SMTP id s196so2112910vsc.10
 for <wireguard@lists.zx2c4.com>; Sat, 07 Aug 2021 07:54:04 -0700 (PDT)
X-Gm-Message-State: AOAM532pdoVupvOd493PbC/p7Y7X+OzGq1LfTxUGhuGRIedGI8Pm7QWP
 18R3UjZ1yvSLs56ZrKDi3dnNivuGUQRE4x0UV6w=
X-Google-Smtp-Source: ABdhPJy63Pf3/cOYPI3qH89OKE95aYJ4nPlUEUQXbEGaaZlMoFXd5NJeTDQp+nLpuFzxC4UkWuPWLDorirYuK1HXvIM=
X-Received: by 2002:a67:ec88:: with SMTP id h8mr10275056vsp.47.1628348042860; 
 Sat, 07 Aug 2021 07:54:02 -0700 (PDT)
MIME-Version: 1.0
From: SC Lee <lsc@lv6.tw>
Date: Sat, 7 Aug 2021 22:53:52 +0800
X-Gmail-Original-Message-ID: <CALWFNqSFsa4N=1et_YcwekTyi1q6pduR9dg2SGBL-QmyiJWbSA@mail.gmail.com>
Message-ID: <CALWFNqSFsa4N=1et_YcwekTyi1q6pduR9dg2SGBL-QmyiJWbSA@mail.gmail.com>
Subject: wireguard-windows incompatible with Win10 hotspot
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 07 Aug 2021 21:26:57 +0000
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

(This is my first time reporting wireguard issues, please kindly let
me know if this is the wrong place.)

I'm on Windows 10, and had no luck enabling WireGuard tunnels with the
builtin WiFi hotspot feature at the same time.
When I do so the tunnel stops working, and for some reason in Task
Manager I'm seeing hundreds of Mbps of outbound traffic generated on
the wireguard interface (but no actual traffic to the internet). The
tunnel process also takes up a full CPU core seemingly due to the
generated traffic.
Upon switching off the hotspot the tunnel comes back to function.

I wonder if this is a known issue? I believe it's a common use case to
share a VPN tunnel with devices via hotspot.
This seems unrelated to the "kill-switch" feature as it happens with
or without it.
FWIW I also tried both Wintun and WireGuardNT backends, and the same
happened with both.

My environment:
Windows 10 version 20H2 build 19042.1110
wireguard-windows version 0.4.2

Thanks!
