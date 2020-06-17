Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E005EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:19:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC96207DD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="fOeg/5r1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC96207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2146c64d;
	Wed, 17 Jun 2020 08:00:38 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3956122a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:00:35 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=fOeg/5r1xxmG2DJNLWwdrkaJvFAIGzQ2KUHl7C76RYsbjt5Om89itIkVxMQvV74kdWzTQ8b2FklbIsBp/heuy+eUEc1mJFqIgNMvjd6xWbH8ZQzYo+AwL/Cx627c/qypqcvTAMb63TgjIcvMqMxpD5MnFeVd6Hqe6GXKAZdHdyrZUyjy9NvgEneFJT3Ft7Qtfn6ABFZQ0pSZTAoW3a4v3KtiqTg6oWPSE4Vn5wxO5KB2R6Y/zDJlmOedV9R2n+ZCuhZYU1GHeyzF9ocxkLLN2Qp20QLFIrkSUgQk9alZf3uGWpg+fT2JZZH4TEv/gI4X39oypsauvqSt9/+f419e2w==;
 s=purelymail1; d=msfjarvis.dev; v=1;
 bh=lnWduXYwt2vp8LegPQcTR0fvDmunrwS0pQemXb0IhsM=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 103.46.202.28 (EHLO ryzenbox) ([103.46.202.28])
 by ip-172-30-0-124.ec2.internal (JAMES SMTP Server ) with ESMTPA ID 218061160; 
 Wed, 17 Jun 2020 08:08:16 +0000 (UTC)
Date: Wed, 17 Jun 2020 13:38:12 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: ND <iamlegendwtf@gmail.com>
Cc: "=?utf-8?Q?wireguard=40lists.zx2c4.com?=" <wireguard@lists.zx2c4.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <69EEB742-6322-4BDF-BAA0-1872996E3D9E@getmailspring.com>
In-Reply-To: <CALO3qbuQms7XwmEYr-CpvspZuWzMqcRebfj8CH0zyYk6NmJZBw@mail.gmail.com>
References: <CALO3qbuQms7XwmEYr-CpvspZuWzMqcRebfj8CH0zyYk6NmJZBw@mail.gmail.com>
Subject: Re: Android Kernel Backend Bug
X-Mailer: Mailspring
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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



On Jun 14 2020, at 11:59 pm, ND <iamlegendwtf@gmail.com> wrote:

> I've been trying to report an issue regarding the Android Kernel
> backend on
> irc freenode. I was told to email here.
> 
> The problem:
> On LTE, my LTE carrier assigns two DNS servers, a private 10.x.x.x IP and
> 8.8.8.8.
> When using KERNEL BACKEND, establishing a tunnel doesn't override the
> carrier assigned DNS and DNS resolution goes through 8.8.8.8. All traffic
> still goes through the tunnel but the DNS does not respect the client
> config.
> 
> On Userspace backend, the DNS i set in the client config (10.0.0.1
> i.e. my
> PiHole server) is respected.
>
> I'm on One Plus 6 latest Android Q. I've tried 2 kernels: Cleanslate and
> Radioactive kernel. Both support Wireguard.
> 

I've CC'ed Jason who should have a better idea of what's going wrong
here. I sadly cannot confirm this on my end since I've upgraded to
Android R where Google has continued to butcher the command-line
tooling, thus breaking wg-quick.
