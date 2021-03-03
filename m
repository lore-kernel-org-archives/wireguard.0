Return-Path: <SRS0=MYpk=IB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E989C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 10:54:46 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A2E64EDF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 10:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A2E64EDF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 938e4e2a;
	Wed, 3 Mar 2021 10:54:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 44e00502
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Mar 2021 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614768875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lEjBlPIZAdHchkPJouURew8uqqG13t4HBdAb2nPy8Q8=;
 b=LVKSpKRVYfYxz+X3U+Q8YvyyT/PIB9IzANLJKRRWOsaq5xw8n9AS9yqaPpjUes6Z7opP+W
 lSJk4lbPY9cbxKrtaMCAUe5niPfvW89qSDAAf5sOnthMUXxLupwsKzO2OPmtTY3Yz2kQSC
 vQI8lkK+HfmKpZ8Fo+he6EP3EdVbPsM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e25c26f4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Mar 2021 10:54:35 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id u75so24029639ybi.10
 for <wireguard@lists.zx2c4.com>; Wed, 03 Mar 2021 02:54:35 -0800 (PST)
X-Gm-Message-State: AOAM533hMJSl75DGg8am2520z2F2lxCbwHtzxoXyY+lI84THwgHtLJ/I
 +bvCf4okvA+N0dTLbWENdZZLvt0Ptd+rsdzlgbo=
X-Google-Smtp-Source: ABdhPJzAIvHiE98fU5o4ETaZS0/6ykuXhDlwzlRraTeY5yrNNlP/lxme4uVF0pDiuNbVj/bAfOzjQA7Ej0GIRMFvgfo=
X-Received: by 2002:a25:8c2:: with SMTP id 185mr39517455ybi.20.1614768875172; 
 Wed, 03 Mar 2021 02:54:35 -0800 (PST)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
In-Reply-To: <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 3 Mar 2021 11:54:23 +0100
X-Gmail-Original-Message-ID: <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
Message-ID: <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Peter,

I had a strange idea for how to fix this without requiring
recompilation or removal of that code.

1) Enable DangerousScriptExecution:
https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution

2) Add a PostUp line to your [Interface] section:

PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0

3) Try it and tell me if it works?

Regards,
Jason
