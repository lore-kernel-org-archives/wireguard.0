Return-Path: <SRS0=I9o6=PX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E5CC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Nov 2021 11:14:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 405B7611C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Nov 2021 11:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 405B7611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d56bc0fc;
	Thu, 4 Nov 2021 11:14:19 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b71aea6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Nov 2021 11:14:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id f4so19794438edx.12
 for <wireguard@lists.zx2c4.com>; Thu, 04 Nov 2021 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sMwSedsFGyJ72ib242P0T8cOQK1/jbGteCErWMKQLok=;
 b=GI96V6M2WlZTkr8xV4UqFKkqOuwvkeZdfOiPbncecGTi2itwmwqOc0fY73v6V3QTM1
 3GKXJCczDRz/qboZLCFqzo01hcQ3sy4p1hGEDrgk7VqauE82UK46vWwBV2AiKGyk/1qp
 NAO8gCvHDXowoo8q7duFxtT8I9IxswqYCEUBJl1uGMSwxPyao8hPqXizUxA5yW+WqcNK
 RimZGfdK3maQKsYRFpzz1UIG4Ane5J+bkrikKgiKw3lvs2rVm5IPPWrAQCMiIpYzKG2l
 noIpeTs+zvItJW2dn7kt4nxAzGM1CrC5h8jNjPn0O2ILDTPDhpXqIFuJIoKC1YpRJtsZ
 kjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=sMwSedsFGyJ72ib242P0T8cOQK1/jbGteCErWMKQLok=;
 b=uZNcdwCyPRPUHt8L4GkqhYgNrC6oXOT07tT1l2QH2ikOMl97P2328XEhBOPOXCeBR4
 NYkUnq3hIDbDbYvGMjDohZjx/MxHmp5VEflHhR5QncEUK4nq+dzJvnGPqTbO4Z2ZmYcP
 P1hzLJ9Ik4jgJxc87K5e6zG44zbX2tsrZQtwLF4RTOOLot/LyYLKTBkd6zngvVFFJCqw
 CVdITfvy50YFxQl6Wt23JnEOZwOoRU461bUsDkP4D6htEcjkf76LgTRhZE6wAgTh0IV0
 GAcFNrHUmS1Wu4zSs74tzALIaHxgCCyF6GMv9sFdHLHqcLf67YXrIbFuzMizBMOLRHRF
 GteQ==
X-Gm-Message-State: AOAM531FrlH9KVwaHdN+dvhbCxvKGJCMMnB654D3KYzVRJpMdn94oLJI
 vdjVx6XZ5cgsVcYjFN6ZdlJGqFf8TP5N5A==
X-Google-Smtp-Source: ABdhPJz0kvRvSyFvIEm+rv2mWU2onSID8uk6xF31iYGmQBsciJwqlNUxfNFCHSafFKsCiMB8F8+4TQ==
X-Received: by 2002:a17:906:9f21:: with SMTP id
 fy33mr61885690ejc.567.1636024456489; 
 Thu, 04 Nov 2021 04:14:16 -0700 (PDT)
Received: from smtpclient.apple ([94.198.41.210])
 by smtp.gmail.com with ESMTPSA id bx27sm2664060edb.7.2021.11.04.04.14.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Nov 2021 04:14:16 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Support for M1 MacBook Simulators
From: Igor Bozin <igorbzin@gmail.com>
In-Reply-To: <re37dSyY_rXzrSL5DCMtppy1I37FlAT-pqCZjPdPpw8CHDxX3Nn3xeVECxTBMRFJBk-XEINrSbXY4KvWEtfii8GbwxZPNg7CZgCW-3asMus=@protonmail.ch>
Date: Thu, 4 Nov 2021 12:14:15 +0100
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F19BC44-58DD-4391-AB17-239B4F980816@gmail.com>
References: <18206D0A-EA19-4230-AAEC-8D52BE66A1C7@gmail.com>
 <re37dSyY_rXzrSL5DCMtppy1I37FlAT-pqCZjPdPpw8CHDxX3Nn3xeVECxTBMRFJBk-XEINrSbXY4KvWEtfii8GbwxZPNg7CZgCW-3asMus=@protonmail.ch>
To: Neutron <dotneutron@protonmail.ch>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
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

Hello David and Neutron,

my setup is following: I have added the WG library as a SPM dependency =
to my project and followed all steps as described in the Github readme =
from wireguard:

https://github.com/WireGuard/wireguard-apple

What I am trying to do is to build a framework which has some other =
functionality on top and wrap WG within that framework. I can build just =
fine for iOS arm64 and iPhone simulator x86_64 architectures.

When I try to do the steps you described in the linked message, to build =
a framework for arm64 iPhone simulator, I still get the following error =
when I try to build the project with an arm64 simulator target:

=
/Users/igorbozin/Projects/cyan-internetprotectionsdk-ios/InternetProtectio=
nApp.xcodeproj Building for iOS Simulator, but the linked library =
'libwg-go.a' was built for iOS.


Is there a way to modify the makefile, so I can build a version of =
libwg-go.a for arm64 iPhone simulators?

Best regards,

Igor

> On 29.10.2021, at 17:24, Neutron <dotneutron@protonmail.ch> wrote:
>=20
> Hey Igor,
>=20
> I believe I encountered this in the past.
> https://lists.zx2c4.com/pipermail/wireguard/2021-September/007001.html
>=20
> I'm not sure what your exact setup is since you mentioned it's a =
separate project presumably depending on WireGuardKit, but I can build =
libwg-go for arm64 just fine using the trick I mentioned in the linked =
thread. Just add this flag to Sources/WireGuardKitGo/Makefile.
> GOOS_iphonesimulator :=3D ios
>=20
> Hope it helps.
>=20

