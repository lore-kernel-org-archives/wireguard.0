Return-Path: <SRS0=sRyP=OU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D68C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 01:48:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C721A20672
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Dec 2018 01:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="rn5pTxLb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C721A20672
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11fa2f84;
	Tue, 11 Dec 2018 01:39:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87a0a998
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 01:39:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5c757e6
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 01:39:22 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 069f1004
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 01:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=23xY9vMt6hy9EvdsR6IyXnzq9ok=; b=rn5pTx
 LbZTJBDEQhkcpDP7tPKomrvnjWb4iWkihuQJRBJrt+yD3j3c6tpj0veq76hBZlE/
 r2iVXOk+OxZCqUFCNlg43LWgakcdRmCY+iXA2ht93CkVrBToJN8Z65cf0ltJ4kwn
 zeYc9/8tv3FneBtb5oUeTTZ7tsmepNWRcDsq7LS3oc4EMdLuti7EH8jVVa1a27rm
 dUaURqXl+RQHn04c5eZmT3Sj5MKKTo0f5INwwlaYGHeVGkQl7IbEaS+5K+IAKQP5
 zpbdm4Wxl5GKBdqlNqQKIqTuF4S31jXUZUL/LVGum/JU5JN5F/Akkbzf5jExniqD
 ejVpQBccq6mXMDlw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5836f3cb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Dec 2018 01:39:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id a77so10737389oii.5
 for <wireguard@lists.zx2c4.com>; Mon, 10 Dec 2018 17:48:06 -0800 (PST)
X-Gm-Message-State: AA+aEWY5fhuQN6bmnvSffoHQMcSDoYDqb4Fk3RaIO/PZ7+5Dz/XUQQrB
 CqZ6re5H9eRsEfec4hLMR+t5C8/gC4pFjnIJyAA=
X-Google-Smtp-Source: AFSGD/WQAdju2rapQw+tCYlxMeItpIMvfBtTOpu/c99KuOgaxiQwu+EqAmGalAaAXsNS9PfcjRyHW1Moz/Ajc7/8cxk=
X-Received: by 2002:aca:c186:: with SMTP id r128mr268825oif.52.1544492885626; 
 Mon, 10 Dec 2018 17:48:05 -0800 (PST)
MIME-Version: 1.0
References: <CALv=V9Gv6apdWJ9P-80zf9bgByd=c3QqPhRHuw6o0_OaH0=W6g@mail.gmail.com>
 <CAHmME9rQPtrSuqHmtRVTGj4N38P806Sph0=q8vXRF8tu8uruiQ@mail.gmail.com>
 <CAHmME9qh+3sR-YL0OVJ4+t+qmutU0j=mJM==5L3QQAZ5Ux4mJA@mail.gmail.com>
In-Reply-To: <CAHmME9qh+3sR-YL0OVJ4+t+qmutU0j=mJM==5L3QQAZ5Ux4mJA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 11 Dec 2018 02:47:54 +0100
X-Gmail-Original-Message-ID: <CAHmME9qVH0sZyEbSuE3mXJ12Lz8zJMPZ43ZRDYQA6n4CmjADrg@mail.gmail.com>
Message-ID: <CAHmME9qVH0sZyEbSuE3mXJ12Lz8zJMPZ43ZRDYQA6n4CmjADrg@mail.gmail.com>
Subject: Re: wireguard-go on android crashes due seccomp enforcement of
 sys_inotify_init
To: bdd@mindcast.org
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

Hi Berk,

The fixed version should now be rolling out on the Play Store,
probably available within an hour, and eventually in F-Droid too
whenever their build infra kicks in. Thanks again for reporting the
bug.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
