Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B5FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Nov 2021 17:34:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6a415c2e;
	Mon, 29 Nov 2021 17:34:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b4b97a0f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Nov 2021 17:34:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13EB6B81260
 for <wireguard@lists.zx2c4.com>; Mon, 29 Nov 2021 17:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B293C53FAD
 for <wireguard@lists.zx2c4.com>; Mon, 29 Nov 2021 17:34:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AkARxMYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638207286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6RuvzvvG9LO5U4JnEl4pA3pCNYbm5GcnQaJFe6u59GU=;
 b=AkARxMYswcUa4KUAXMoCOzyGtpuFgzu3Z6lAJs15MA9qNPVJi/CSQdeNOA78dBxhd86gkh
 6FVabzZA/Bnu4Qm4XiVnipPQSitSMmStTr4NR9bvF1kf87cLWDixBOSxPfq/XHWFW8aI7Z
 6mZSRgEcu7vHcbhIS6CgIZeV+hZ5FEU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 94c8c5ae
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Nov 2021 17:34:46 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id f9so44526313ybq.10
 for <wireguard@lists.zx2c4.com>; Mon, 29 Nov 2021 09:34:46 -0800 (PST)
X-Gm-Message-State: AOAM532tnWTx2mOIKQItmGDApNq83Ts/f/qzCCYEfIViGjzleqlTupoF
 hcQ67IWCzCRVrvKackr8lcv7p3XSqVL2Ytobyzo=
X-Google-Smtp-Source: ABdhPJwPtUIxTo3gZT3VrNo37/XshSDesrIz2rzcKtUz8dHgRjd131kVA2jqli76H6V+rl4iQLh4MyDQc24EOe3MiWo=
X-Received: by 2002:a25:9781:: with SMTP id i1mr8257792ybo.638.1638207285973; 
 Mon, 29 Nov 2021 09:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20211123190331.101346-1-minus@mnus.de>
 <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
 <fef7daf2-adf7-e042-4977-46fda04aa07d@mnus.de>
 <CAHmME9qMLM=HedzvADriiWLZXbo0yLoxt=Nk9B=PGcwY9kn0eg@mail.gmail.com>
 <d3d1d445-128e-9acb-b483-53b675fd9591@mnus.de>
In-Reply-To: <d3d1d445-128e-9acb-b483-53b675fd9591@mnus.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Nov 2021 12:34:34 -0500
X-Gmail-Original-Message-ID: <CAHmME9pAvi3P82yKnpfNXtOdTUxYoZasPGkeLpo3angnh7wFfw@mail.gmail.com>
Message-ID: <CAHmME9pAvi3P82yKnpfNXtOdTUxYoZasPGkeLpo3angnh7wFfw@mail.gmail.com>
Subject: Re: wireguard-go fails to send/receive data
To: minus <minus+lists@mnus.de>
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

Thanks for the script and the report
https://git.zx2c4.com/wireguard-go/commit/?id=2dd424e2d808703339688ff78e32ed30cd0dfe87
