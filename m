Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B6FC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:18:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46ED42070A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSjMhZvA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46ED42070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53ec996c;
	Wed, 27 Nov 2019 09:18:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b168f50c
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 Oct 2019 07:18:33 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 971f44bc
 for <wireguard@lists.zx2c4.com>;
 Thu, 31 Oct 2019 07:18:33 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id z6so4520557otb.2
 for <wireguard@lists.zx2c4.com>; Thu, 31 Oct 2019 00:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=t5rl8+HJ0YHKKZRPdG1kuTisEYgaQM2bcP3YUdR31mE=;
 b=SSjMhZvA/nvH3bnMh59o+jdiAlPp/V12egmpID16LZuQI28WTS9Y/jg0fGGADZnGA1
 Nss8GYFx+V9HqsVbj2ImcPEUjPKio9ogfpHhE/lV+gQDMV0hH2AxXlSHFLRQP4WVYW13
 lKQijC8P3mKFLQk5o7udI+sTtp84fW7c5l2ZV2QCNwh29rUGJu/TAKPDFWH98F17KM/s
 ZffsDh/oC2o7xPSABPBmt/1qK+BS9uTdGBMbYzrh4mGX0Wt7UYHb7deS0mZ6b8RLzY0k
 UcjvW9gvL1TmwDEIZ80ZqYG8iTckaru5xuhAeVPVs3KzToI159KQfdoMV4Kb4hIMcGVY
 sDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t5rl8+HJ0YHKKZRPdG1kuTisEYgaQM2bcP3YUdR31mE=;
 b=CGTGsxyJx4TpdtKce1nSNtp5QqiQkmqWM545LLvsb/kzWwV5VeUoMtFeyIuzL/IxB5
 KXPPMHRKA86jJYegSSLC8hCBIApsAHjxHxlOSZnZxIqex4LTLvY7vdBlV6Q5DsUiygRf
 BwgsgeoL5EwptWfZIlJeVNK9njLj7xXmjEoxtZp4UyLi1W18gMn2Pcn7xxDKO1uCY1PF
 VABvwbADej0Uwda+D4IyUFXhuz3c7So7h2MrlC6FmNxye9AdfSZgsiD1gS5qAqiQ5FqP
 5gFqAtFWX8r6QRvalvUQm26OxtFJwQvpZCkSKzk8MmF/0FDPv02d9N+5U05n31A2IaTm
 izFw==
X-Gm-Message-State: APjAAAXZnxMcGTw/Pz8ov5U5BmQeBmM35/I5132Srgc53AYVjb+69+/I
 LU5rNFGYV0swyQaFIRdgJzMBLHdyv9EuU6FJyOG0PCHQQzkUHQ==
X-Google-Smtp-Source: APXvYqyqGnV2woN0sYV8moy06cx7nbonDlwU56419RDELycoK09/D/28hxpPmAYdoDGHXQSIKv1lu+8+qFO5Pi9Nazo=
X-Received: by 2002:a9d:2dc1:: with SMTP id g59mr3207139otb.59.1572506312590; 
 Thu, 31 Oct 2019 00:18:32 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBTYWduZXM=?= <frederic.sagnes@gmail.com>
Date: Thu, 31 Oct 2019 07:18:20 +0000
Message-ID: <CADWmdDc8o3Wuidwbk5-acTVGAWShHjMUm5nizBmrY=zpEHnq6w@mail.gmail.com>
Subject: Wireguard iOS: runtime hardening prevents simulator builds from
 running
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:18:08 +0100
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
Content-Type: multipart/mixed; boundary="===============7383612937524693406=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7383612937524693406==
Content-Type: multipart/alternative; boundary="0000000000002b4a1305962fa8ae"

--0000000000002b4a1305962fa8ae
Content-Type: text/plain; charset="UTF-8"

Hi everyone!

Jason and I spent a bit of time trying to figure out a crash when starting
the app on the simulator, which we then figured out was caused by having
the hardened runtime option turned on for iOS targets which is only meant
for macOS targets. Could we merge rc/disable-hardening into master to fix
the issue for future contributors?

Thanks,

Fred

--0000000000002b4a1305962fa8ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone!</div><div><br></div><div>Jason and I spe=
nt a bit of time trying to figure out a crash when starting the app on the =
simulator, which we then figured out was caused by having the hardened runt=
ime option turned on for iOS targets which is only meant for macOS targets.=
 Could we merge rc/disable-hardening into master to fix the issue for futur=
e contributors?</div><div><br></div><div>Thanks,</div><div><br></div><div>F=
red</div></div>

--0000000000002b4a1305962fa8ae--

--===============7383612937524693406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7383612937524693406==--
