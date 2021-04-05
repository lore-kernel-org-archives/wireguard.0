Return-Path: <SRS0=ZwbF=JD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54915C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 21:46:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EC2613D2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 21:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66EC2613D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89154283;
	Tue, 6 Apr 2021 21:46:51 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eda27e25
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Apr 2021 05:08:16 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n140so10676745oig.9
 for <wireguard@lists.zx2c4.com>; Sun, 04 Apr 2021 22:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=UGFPkOt4ghQjgYvfVKjGHUJLxKm0ylt8c4oDqbMNkmE=;
 b=iSadgRxLtPfB6kTbSAD2D9GsrpvnisHWP0kXetWCkQCmwqGODm1tFhv0egXSjeEcLV
 LPH7MyfKKndFed8orR7ENFWhzF3c+/2GVYqvw+4isS92jBh7yrIb577u/dHPJ2IwApgu
 MuVlo8h7pEEihHx6uwLX0c2nLSF5K4LJF7UyQHQJ2VKYYcaeRlnM1P1qma2adwZA6tDI
 cYMXAU7hpRn7bcn+YkDzF8kM6dWjJBzGkSS1mEsXEyVz7pxg5ByR4dJRmV91nUqXDe0T
 c71giLhKcJBgL7YQCl1MLgMAjni7RDk1n5MO1nwaPu1xt53vBE1XcBVD/V5AqOCxFFuL
 UYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=UGFPkOt4ghQjgYvfVKjGHUJLxKm0ylt8c4oDqbMNkmE=;
 b=RtdYk24ZLc4oH/Hp60gB2/husTuRkiB64In+kHGeU8Ac6lC4rfBWQaiwl5TlXqaQWz
 log8HOhgh+Xjr4LF6wgKhpqmEYuMx331WQt9b4cf9rVWH4f+KZ+giW4GseQ0pESXoFEd
 p38MWPp9dcgTDHmlrwR+T/tUh7FeVi7bKDj2JvFYBq66hWT8UErsLkOzPXC7t9BpYw2g
 4Cd9gbny4xkvdlOUd7zQSypYTMDrXPlbTmsXY/poSuQFlM62iDzo0Rz6L5pVUBcqOaR3
 P45605dmiW1IHGa4CDAMIZ7/D8iOFkVQwkq7H25NWqnHtNC+ESxEoqThgRdAPua/WNIA
 4Igg==
X-Gm-Message-State: AOAM5333zsH7zksOUV42jPnjgungx0PcH7lhB2WM0VEn7sBR9Mi1NNaG
 xvSm8mIYQJK2BOgnNpuOzov4AF+PfA7szWxr877XtorizbZKIA==
X-Google-Smtp-Source: ABdhPJxexs7/6cB9Dmf9ov1XO2VydkE2zbPZECRDK6LYLtx26Ubri79QmJtzOYyIMjDGKVgaqHNsMJxUDQNkAnVBw6g=
X-Received: by 2002:aca:4e8e:: with SMTP id c136mr17150489oib.97.1617599294855; 
 Sun, 04 Apr 2021 22:08:14 -0700 (PDT)
MIME-Version: 1.0
From: zhengfish <zhengfish@gmail.com>
Date: Mon, 5 Apr 2021 13:07:11 +0800
Message-ID: <CAJ4StijaLgSfQ+3q5k_bSmRDYo-Voayj529DqyOV0X4OR3qzaw@mail.gmail.com>
Subject: [Wintun] Does wintun.dll support IOCP API?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 06 Apr 2021 21:46:47 +0000
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

Hi,
Does wintun.dll support IOCP API?
If yes, how to do it?

I tried to use Wintun.dll with IOCP. And while associating the Wintun
Session handle to IOCP handle, it outputted an error with code 6.

    Context0.Iocp = CreateIoCompletionPort((HANDLE)Session0, hIocp,
(ULONG_PTR)lpPerSessionContext, 0); // To Associate IOCP handle
    if (Context0.Iocp == NULL)
        wprintf(_T("error, CreateIoCompletionPort associate failed...,
GetLastError: %d\n"), GetLastError());
    else
        wprintf(_T("success, CreateIoCompletionPort associate success....\n"));

    ASSERT(Context0.Iocp==hIocp);

I checked this system error code, that means a invalid handle:

    https://docs.microsoft.com/en-us/windows/win32/debug/system-error-codes--0-499-
    ERROR_INVALID_HANDLE 6 (0x6) The handle is invalid.


Thanks.
