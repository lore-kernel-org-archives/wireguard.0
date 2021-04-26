Return-Path: <SRS0=YTSi=JX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A18C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Apr 2021 18:56:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10A5261154
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Apr 2021 18:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10A5261154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f74cd37;
	Mon, 26 Apr 2021 18:56:15 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1a5ee4d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Apr 2021 05:34:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id zg3so906239ejb.8
 for <wireguard@lists.zx2c4.com>; Sun, 25 Apr 2021 22:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=1SKKNQ+3tIQbPMUEGLmPnmDdH+yP1p7yuiZRhZ/Crdk=;
 b=Mhi5S22rbTS2ONZQ0ULxGOs7ov5+nUZkU+VNrZy4V3IxLMB+l8fuEnBp/OoxT1xxpZ
 PPjH81SjQKF7bCGFn3xqKE1av+EXb4K/uMPBdJPIMcocICbRQT9YjzYm2ZE7HeQYMfqc
 /Tg1pujTRQlxjSvhxJTe8lP2N1gLvxmOku1o3aQzQ+Ka/gRke8181piPVhy8HFCiyEc2
 BGCPEh9FsneHAxOq4mdY0o+qQm/WNvAlERwdtFXv5fFGDHKhCwq11TLWNTxdS/A70D1V
 nrJ3yz196ErRcORKu5keIZWXYnnZneUJS1i1Yusx6OVeEb5IcLf6wpII7fTKcdR0Q5Zg
 0sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=1SKKNQ+3tIQbPMUEGLmPnmDdH+yP1p7yuiZRhZ/Crdk=;
 b=hU7XvICAo45f8iaonJJwCygvD1sO6p/rLJ6wFvUltKQEihzbPQJ2YWxJr5iGewjnmG
 8mxfOnaIR2V+l18MvSKvsQxu0oNDDWKyf1/4wk8RFzn2vcGmX7sdUp1838WefAOhHZa/
 FAsDCq93tXHNA/cGyyRGojD1WfIgjV2l/eNuty8azUL2CK7LesB4EcQ4D3GEMH/PU7iW
 8vZQNzBtU7dd8XHeaLPd4pLkFU5+Fb/EE5xWn6HIe1+T2k2M6OrFLd5O3erUazy03LRc
 UQcnCEDzZISfDbLZxr7ofuDwbskdRIFRH2RwlPaZC+eoK3PcXvz7w5MG5N3KpUrMexsd
 L3WQ==
X-Gm-Message-State: AOAM532S57R/QfYSPsCop+ksx2tITJe19YvjR9r1yzLZg+10k/JKzbw4
 9aYgwYeV6X6rcKcfzrnqWZurgatod6rlOHqBwNlcvEpLK5M=
X-Google-Smtp-Source: ABdhPJxZ3+4GSNgM728bHVbYMF8ZX79Seg/YDZ8xzar0aSxA+M0258dDqpsUSSqbpp40O8a53MD0yFsNpo+jVpVPvzA=
X-Received: by 2002:a17:906:254f:: with SMTP id
 j15mr16828503ejb.344.1619415271936; 
 Sun, 25 Apr 2021 22:34:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSAzkKgZS_-tRkbo10gZ3CrTfNPfBUuBUwY4bMY+W0Ynj_pNg@mail.gmail.com>
In-Reply-To: <CAOSAzkKgZS_-tRkbo10gZ3CrTfNPfBUuBUwY4bMY+W0Ynj_pNg@mail.gmail.com>
From: Johnathan Clarke <johnathanclarke@gmail.com>
Date: Mon, 26 Apr 2021 15:34:07 +1000
Message-ID: <CAOSAzkJJiv6uqVgdPqCYpGqabti3bmDrBU1gAX8Oy7ZqikuYNw@mail.gmail.com>
Subject: Fwd: Error when connecting from windows client
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 26 Apr 2021 18:56:14 +0000
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

Hi Everyone,
i am getting an error unable to create wintun interface my Google Fu
has not given me many results that look like they have an answer i
need.
Where should the WinTun files be located? should i replace them with
the files from the wintun project page
https://www.wintun.net/

is there away to re register the Tun Device?

2021-04-26 14:45:33.377930: [TUN] [Home] Starting WireGuard/0.3.11
(Windows 10.0.21364; amd64)
2021-04-26 14:45:33.378484: [TUN] [Home] Watching network interfaces
2021-04-26 14:45:33.382398: [TUN] [Home] Resolving DNS names
2021-04-26 14:45:33.382398: [TUN] [Home] Creating Wintun interface
2021-04-26 14:45:33.519928: [TUN] [Home] [Wintun] CreateAdapter:
Creating adapter
2021-04-26 14:45:33.828328: [TUN] [Home] [Wintun] SelectDriver: Using
existing driver 0.10
2021-04-26 14:45:34.289159: [TUN] [Home] [Wintun] CreateAdapter:
Failed to setup adapter (status: 0x0): The operation completed
successfully. (Code 0x00000000)
2021-04-26 14:45:34.289159: [TUN] [Home] [Wintun] OpenDeviceObject:
Failed to connect to adapter ROOT\NET\0000 associated instance : The
system cannot find the path specified. (Code 0x00000003)
2021-04-26 14:45:34.289159: [TUN] [Home] [Wintun] WintunStartSession:
Failed to open adapter device object
2021-04-26 14:45:34.383133: [TUN] [Home] Unable to create Wintun
interface: Error starting session: The system cannot find the path
specified.
2021-04-26 14:45:34.386136: [TUN] [Home] Shutting down
-- 
--Johnno
