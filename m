Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4BBC6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 22 Sep 2022 11:53:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 068a27b4;
	Thu, 22 Sep 2022 11:43:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a259993a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:43:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31E2B62C8D
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76CBAC433B5
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 11:43:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="OCXp7wTk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1663847004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0o+KCVvyh10DOMoLZdqWSN9tMI8aPgznMRDlAdmm+M4=;
 b=OCXp7wTkaJ2f1uiayi6Z1as0PIxP5LPlrFeTqhLxU7LKhzarK6oo9AmflkqTAFbXcyP4+M
 fG6/wm5RMJVmyMmHCeckQkwqx89Le3NEno9gx9t7L+4sphCbt1JjoaDDUQH8K3Hiyn3caA
 e9OmG+DC36AaEJW8QkD2BqF1u5ghDYQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e2dad91b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2022 11:43:24 +0000 (UTC)
Received: by mail-vk1-f171.google.com with SMTP id s192so4755463vkb.9
 for <wireguard@lists.zx2c4.com>; Thu, 22 Sep 2022 04:43:24 -0700 (PDT)
X-Gm-Message-State: ACrzQf3gQoQLyHeR/Jajrpn0BHeUxm+hBrPppNFIsOkCqoq7jW+Mqtfc
 G56lLpsZBgR9M7qdIISUBQeQuq+zl27mRaNeCFY=
X-Google-Smtp-Source: AMsMyM5bFtOXcxecIDL/J1d7CI3gxYg8n//FZcjl/76ynXU2o1mMcBOoGsal6jIRcedqp0ayiKMc8hY4lxfgT+rsqnY=
X-Received: by 2002:a1f:24b:0:b0:3a3:ad4:a3b2 with SMTP id
 72-20020a1f024b000000b003a30ad4a3b2mr1063747vkc.13.1663847003673; 
 Thu, 22 Sep 2022 04:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <CALDyVtsgMjH1YqrTrosDVU2khC9iEgMgUYDd8D65+h-K54y2fA@mail.gmail.com>
 <CABBZOs=bkOWQv09UQJnf18xVGAq_o6O+Ar+asMKoXtghcQvnog@mail.gmail.com>
 <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
In-Reply-To: <ee65e180-eef5-b882-58ab-8a1188a38a09@ut1.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 22 Sep 2022 13:43:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9rd4g0EkPQqXX9vViHRuU8uaGkENNNa+TsBi3C_QNHbxw@mail.gmail.com>
Message-ID: <CAHmME9rd4g0EkPQqXX9vViHRuU8uaGkENNNa+TsBi3C_QNHbxw@mail.gmail.com>
Subject: Re: MacOS app update needed
To: Bruno <bandry@ut1.org>
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

On Wed, Sep 21, 2022 at 10:22 AM Bruno <bandry@ut1.org> wrote:
>
> Hi,
>
> Windows Client project don't feel alive either. Last commit has 6 months
> and last release is 9 month old.
>
> Same, here https://git.zx2c4.com/wireguard-windows/log/ and here
> https://github.com/WireGuard/wireguard-windows
>
> Version 0.5.3 works well, but I suppose it can be even better!

That seems pretty uncalled for. Folks asking for a wireguard-apple
update have good reason to do so -- there are outstanding bugs and
pull requests. But for wireguard-windows/wireguard-nt? C'mon now --
that's received some *extremely* active development, stabilizing after
nearly weekly updates for some time. Are there outstanding pull
requests for it? So your note here really isn't appreciated. The
WireGuard project doesn't churn out code and updates just for the sake
of writing code and doing updates. Things need to have rationale.
There will be updates to wireguard-windows/wireguard-nt at some point
when development makes sense there. But right now? Is there something
pending? Instead maybe be thankful that that software has reached a
point of stability where project development energies can go into more
pressing tasks, such as wireguard-apple.

Jason
