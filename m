Return-Path: <SRS0=IIoP=SP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51635C10F11
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Apr 2019 07:14:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D30420869
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 13 Apr 2019 07:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="kN0qRpZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D30420869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3573a25;
	Sat, 13 Apr 2019 07:14:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3ece3b0
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Apr 2019 07:14:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68f3f049
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Apr 2019 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1555139678;
 bh=5un5ZtP2GzEXSAR34gAM+6JZdnXSdlK9/CnvjpFJFn4=;
 h=X-UI-Sender-Class:Subject:From:In-Reply-To:Date:Cc:References:To;
 b=kN0qRpZlpo/NRk9PMoBSFa8X5kP0Mh7IBf9HGrTJA/PkKKgmBjP5ts0iUlOg0kbB4
 oE08CZ7GY9tXRwJ9CBvX4t8DXHedqrUWlE8qSUbiGPYrJLbTOqsWsfPzh6G+Em664D
 uaz2qB3hpPO2kKgdNaCxYnTEDux/TaHPFdmQz1D0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.20] ([62.47.183.173]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0Lfppu-1gVT3k1Rko-00pKQA; Sat, 13
 Apr 2019 09:14:38 +0200
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: compile error on WireGuard Kernel/ROM Integration
From: Robert Walli <rwalli@gmx.net>
In-Reply-To: <CAHmME9ojqhKDRGkEqmaP-bCXPjgpjwRKKvQL1Z9Gu+bx018jyQ@mail.gmail.com>
Date: Sat, 13 Apr 2019 09:14:36 +0200
Message-Id: <A989EC48-2676-4C2A-8F1E-D9782F8D3B18@gmx.net>
References: <068214E5-B780-4A6C-AE79-BD772177EBCB@gmx.net>
 <CAHmME9ojqhKDRGkEqmaP-bCXPjgpjwRKKvQL1Z9Gu+bx018jyQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.8)
X-Provags-ID: V03:K1:NmYvO4lhAfAhknYGHK6cd05fp3X+5VRkNC5OffmgTxFqz/gBeAV
 NQQd6PLOByaxo2MWrs7LGQ6gNvxPazimJmo2QAWOkg9aDo0PH+LJpRBuFGpi0PikKCtyJ27
 YU0Gui32RxqfHzRbePgXeCJn+I1k4pTRSIzJFkwplIqDp9RlWcBEabhPDqZAc/xxmVqHK+H
 fNPXHo8Hzfiq8XlQI06WQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fP4Qusg0+1I=:T+YsRXMgBZVVdBW66Bs1p2
 76EMR3kMhT//e/dx1/15yqy+lRUSUcFyhvFqZofGmkScT2PuXXJAYTpUdM7SnSxs9vbWLOId8
 b0Gnah7mjALgVuuVNOu5ODBDcT/mCyM+05dAcTP1ui6DA46lo0clt2776cWx4CZfYCisr4RrV
 VAtKFsi9RJ5pxEz2J5+TmUxK5tBV/pAgu67pQztvAVHr8SrVSJWcCmSBUECYWfqNo1FKmqgoa
 FqWGJWSZmbEIgX3VRp4g+WRMglz0gWMyjdLYsvcd9rN7016b1dlG5IeDbSawC7Aq7pnBFlF4n
 JtwB513qVyKpnfGXSg/8ON3cRHRBjU+z3Qv78fmpTDn6bwzh2IieULjIWs3ReiMN/T2iK+HCa
 ZOM1w8MeRy9lUyb5qEEUwb/qkYgNw+qi7ijyKz1ZTGWwg34VjVbVjZo4PVf2p00q0Jqm8a1ep
 GvG5LJEaGSeNqy0Mf8FhxdfXfKrZzOja4JJ2FyBUUFz043fYjvzimVBvfd9utpMWg128reynb
 MckOATIPUQvhRBm/oTS9/PMnKATdsskSZYRT8PNzp+m/JBLdrxO6o4gsIa8zQky4KM5tL617J
 9ZmeywmG620CVGTvi1FV3fDfjGGzn6uGHznKOz4l7wwFaN1ue/9LvUkTn29Aug2HGJdKb5CBg
 UzwVYUceUWXV/H6+kniEZPHqcAn5jMWir0ya7ob7OmInjr9Ntie8gGmVO4MPnGF/oPbI7EZrQ
 Lp8exFiEWmOkx0CqHFRToSwwJC384oGzH14NEA7KcbZtNmOMeX70gYnuPt3mjjSCZQPAmCs72
 5LGOnDXFw+96zUOclMmTpHwwxJBNI/+2dCwI/SiXoy+rTABKEqcryX7ntWGbcDgtqICfmBczg
 gd9hpSp9Z7153a33YTQEorW1NCD1InLt6aBoRV10UmLLwQr4JkCPSd/HMC8v8iqs2vEwkiczZ
 6/n+ZxssbQQ==
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



> On 13.04.2019, at 02:17, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> Link to kernel sources?

Tried diffrent kernels eg.: https://github.com/mobspyguy/android_kernel_samsung_apq8084
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
