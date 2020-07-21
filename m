Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF30EC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:12:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 998E020792
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 13:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VfxvjFhS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 998E020792
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ce01558;
	Tue, 21 Jul 2020 12:49:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bda68760
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:49:55 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 431881f5
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=6K6
 YuBSsQNTiPIrGMzDPxq/s5aA=; b=VfxvjFhSkWsYtvUG77RN08R89vHpwMpNhOQ
 LryohaPST29lEAzJlvk9UFVcME5HQfvnF43nFTRAbX02WyyIeGZ+eT4II50kLtPT
 zz7j0LRY7Zx6EnBlrEQscBsV0Qlbm2W0MoV6TP3ZFSGbStHBEF5HQ6v/yJxCeyFz
 hBOopHFsE8nBVpuuqdVr7T39kNTy42cevpPesirwxIxyBe68/DwT2wO0bpoFSIXg
 sfrm6axs7XZ1CKcvhMCEGXeZXvBIozDl30yD42h51ILYVDkWC6Yn6YN0h13FgDxK
 QF0lBcXs0nczIHqdp99AQIE4aTkbOaKFhih7rV8fn2Lckor81HQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ec7e0a7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:49:54 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id r12so16343620ilh.4
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 06:12:26 -0700 (PDT)
X-Gm-Message-State: AOAM533Vw65Etqv50arzzlYLI2qXmCPZ1LKjPCqG+O1BCzsdtdSlk57W
 rvPfBPcyKWJCiZ43oWgL9SH1jYvNe1Qjy6DsZas=
X-Google-Smtp-Source: ABdhPJziKyKbvmNoY47j3D+YeGB7gIpx1ziutdP4PLC20o+Lt6rLD+av6cBfDoVbSFQ+fhpp3Lp18XG/LC+Jn95O/us=
X-Received: by 2002:a92:9ed5:: with SMTP id s82mr28940721ilk.231.1595337145366; 
 Tue, 21 Jul 2020 06:12:25 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Jul 2020 15:12:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
Message-ID: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
Subject: final call for Ubuntu 14.04 WireGuard support
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Jasper Knockaert <jasper@knockaert.nl>, Roman Mamedov <rm@romanrm.net>, 
 Andy Whitcroft <apw@canonical.com>, unit193@ubuntu.com, 
 Joachim Lindenberg <wireguard@lindenberg.one>,
 Daniel Kahn Gillmor <dkg@debian.org>
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

Hi,

As we speak, Canonical is finishing up their support for Ubuntu 16.04.
That means WireGuard will be supported in their kernels and in their
package repositories for Ubuntu 20.04, 19.10, 18.04, and 16.04.

That means our PPA will only contain packages for Ubuntu 14.04.

Ordinary support from Canonical (as well as public kernel sources) for
14.04 was EOL'd April 2019, over one year ago. Although there is
technically support until April 2022, this is something that Canonical
sells commercially, with those updates not released to the public
(afaict). As well, my attempts to fix problems in the 14.04 kernel
have been rejected, e.g.
https://lists.ubuntu.com/archives/kernel-team/2020-May/110084.html .

With our PPA soon only needing to support 14.04, and with Canonical
not really supporting 14.04 for ordinary folks any more, I am leaning
toward dropping our PPA, and 14.04 support with it, and marking our
downstreaming efforts for Ubuntu integration as "complete".

If you _are_ using WireGuard on Ubuntu 14.04 or know somebody who is,
this would be the time to pipe up, so that we don't leave anyone
hanging. Feel free to respond to this thread regarding ongoing
WireGuard+14.04 usage and why updating your operating system isn't
convenient, or send me an email privately if public disclosure of your
infrastructure isn't an option.

Thanks,
Jason
