Return-Path: <SRS0=N2iy=RG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C068AC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Mar 2019 15:30:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EBCC20857
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Mar 2019 15:30:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VO/LGy6P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EBCC20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d067fac;
	Sun, 3 Mar 2019 15:20:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60a16d8c
 for <wireguard@lists.zx2c4.com>; Sun, 3 Mar 2019 15:20:10 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4def7359
 for <wireguard@lists.zx2c4.com>; Sun, 3 Mar 2019 15:20:10 +0000 (UTC)
Date: Sun, 03 Mar 2019 15:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1551627014;
 bh=hziT3RZrfEKSS0zDgJ1Fhe6fjuNesEgUXzSeH6+f7es=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:Feedback-ID:
 From;
 b=VO/LGy6P793AGDlzKUe8oQovD5eoi4Q3oHHfLM5nnTL3ZccX1lwim8Q8klxsFGXXu
 c7g1PDqZ90c+0lz+mfRWJS3mMxhD5EYx7dUbj3gtD1mWlYCNCSN0Nxeg0zorQV+QOm
 8xvLL8QNJBhIvu8vDRdFufcCBsafeX0hPot9ODns=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: kolargol <kolargol@protonmail.com>
Subject: Re: iOS WG Battery Life
Message-ID: <4XNSL3x5-sa87nwSeyuursmJhUSP47KlBZtZMKKZ2xeCLmWAAG1o-sP_6J7TUcfustGCSPack_u_6C1ase8n_ZuUqPA-FhqbfnBoEjMGEqg=@protonmail.com>
In-Reply-To: <58158D37-9937-4BA2-B89B-A63DF8BA03A1@pcfreak.de>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
 <1cY0xL4k2A_qU-I2aF2Oz5uEt2LP_i6oCVA5H5rAsRet4lY1MU8GkCQWOXy8OYSZKGtprlH3lZorUozIOKChzb201YR8fdcMDsp5OS9zT1E=@protonmail.com>
 <EA2CDA40-8988-4C4F-B848-B2F7C6D8716C@lonnie.abelbeck.com>
 <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
 <58158D37-9937-4BA2-B89B-A63DF8BA03A1@pcfreak.de>
Feedback-ID: BeuBiSQcqsr-Krwtcv9IekhH3G8BPby93wz9So6BEG3RLXEAsJdmMzmwNOSrHC8ToF3fQqLPAjlqXY7tyhxFEQ==:Ext:ProtonMail
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kolargol <kolargol@protonmail.com>
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

> what about uninstalling all vpns and try over night?

i will test that as well.

Meanwhile wile plumbing over iOS I have found possible reason of thos. Seems like Wireguard suffers from thread management problems:

Event:           wakeups
Action taken:    none
Wakeups:         45001 wakeups over the last 61 seconds (743 wakeups per second average), exceeding limit of 150 wakeups per second over 300 seconds
Wakeups limit:   45000
Limit duration:  300s
Wakeups caused:  45001
Duration:        30.33s
Steps:           2

quite a lot? bad for battery - there are multiple crashes due to this limit on my iOS. I can send full crash log to developers (just ping me).

Other then that i installde debug profiles for VPN and Networking on iOS, will try to dig tomorrow after another night test.

thanks,
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
