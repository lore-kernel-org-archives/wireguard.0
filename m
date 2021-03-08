Return-Path: <SRS0=uBg8=IG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 705A6C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Mar 2021 09:25:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D5E64ED5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Mar 2021 09:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D5E64ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68d5e5a8;
	Mon, 8 Mar 2021 09:25:44 +0000 (UTC)
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cbc90634
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Mar 2021 09:25:42 +0000 (UTC)
Date: Mon, 08 Mar 2021 09:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1615195541;
 bh=OqGDaDQbG1qlKPrOf/1o2lh5Qz8sKGW3cxzhh+dL/4w=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=R7VI9Ax/eZkmVQlNQ2gCAc6ImPBDO+QGQfzKTnxsP7apS6C7XlwuYovW3e45M0tSN
 JDFcVGM+H1GIk7ji3W9x2Tkih/9qpeqia0c1dAr0Qz82WdC8ew3L013YptpRCM7a+n
 OOwGCiilT+NFq/22JKtptaWzJnv4Lna+9thdB918=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Bradley Saulteaux <bradsoto@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard Windows ARM64 Build 21327
Message-ID: <kvwelbya-mAZJ2wfpt2vqF1O0GE7BwijqjtQjshHnNMooW7y_J8W6BgMKM65sGgZEWZQx7Zr4uejYiDkfL07ckiwZKqt2DR7BNrnJtXUsHs=@protonmail.com>
In-Reply-To: <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
References: <nrcRMSny-jv34qB41pOjVZQJVY7-l1J7yFQ_bO740PasFTOqt9uNp8H8EctftDLEcNgOrxmydh8KJ3ZuTlS3FjmE2abkWJAXhmQTYhtnQlk=@protonmail.com>
 <CAHmME9q5HJ0QJMzqGBPjr-c4YSBcn3=JWjJB6BRAQtvzb02t6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Bradley Saulteaux <bradsoto@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello Jason,

Yes prior to build 21327 the latest version worked.


=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Sunday, March 7, 2021 8:49 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:

> Hi Bradley,
>
> Thanks for the report.
>
> > I'm not expecting my configuration to be supported or stressed over in =
the slightest.
>
> You are in fact very mistaken here. Having everything be broken and
> requiring you to resort to out of date versions is very much something
> that I'll stress over. Let's fix this.
>
> The first thing I'm wondering is:
>
> -   Did v0.3.8 work in builds prior to 21327, or did you never get a
>     chance to test v0.3.8 on other builds?
>
>     Jason
>


