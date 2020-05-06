Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C062C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:18:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B60CC20663
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="DKi0VhbN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B60CC20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff9dedeb;
	Wed, 6 May 2020 11:05:18 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 079148ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 11:05:15 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=DKi0VhbNyn84AnPdujqlq5ovStf5bMyPWGQGbg3WOrRH1pxI96qz8W6gBo60gRR3ynXlpqjrwu5GxnBrA2A8fYhi5w9dabjbtLXKq/IztNQ2OKT74FD6pSc6wvDdNVE8cPU6QY13C8AwGJhpI4piYxnhdRWITPtzg/ZQ8VCkCrKizAXrocxLQX18W+ffQnobm/cMb5eGL/uYO0199qCvWO6vkrSfQaCUZota3aG/YIqPciRyFTLJm0oEoxaqoLmUD1/NKMDtlwILofCsE+Fm1MsWP5BYzdmV0I7KH16CqEj0ggvDo135ZCBqHP4Y7jg1Su5BWtuHTfoCNe/YFhLq4Q==;
 s=purelymail1; d=msfjarvis.dev; v=1;
 bh=2ZQocoLhmKE2XCGgy/DjO5LUNpxeAcbkTaMxaVctsms=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 185.232.22.61 (EHLO ryzenbox) ([185.232.22.61])
 by ip-172-30-0-208.ec2.internal (JAMES SMTP Server ) with ESMTPA ID 1440886017;
 Wed, 06 May 2020 11:17:46 +0000 (UTC)
Date: Wed, 6 May 2020 16:47:42 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: "=?utf-8?Q?=22Jason_A._Donenfeld=22?=" <Jason@zx2c4.com>
Cc: Dark Shadow <shadowofdarkness@gmail.com>, 
 "=?utf-8?Q?=22wireguard=40lists.zx2c4.com=22?=" <wireguard@lists.zx2c4.com>
Message-ID: <0ACB265E-535A-4C3F-A4F5-B630D834F790@getmailspring.com>
In-Reply-To: <CAHmME9oSaG3UWzs19D+-V82LJpQtJfVmsGmOu-stFHngAmm02g@mail.gmail.com>
References: <CAHmME9oSaG3UWzs19D+-V82LJpQtJfVmsGmOu-stFHngAmm02g@mail.gmail.com>
Subject: Re: Android client fails to auto start connection if using a
 DDNS address as endpoint
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



On May 6 2020, at 4:33 pm, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Looks like we don't have any retry logic for DNS resolution for the
> case in which there's temporarily no Internet:
> 
> https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/com/wireguard/config/InetEndpoint.java#n91
> 

What do we want to do here, then? Deferring config resolution feels
suboptimal. Deferring tunnel restoration on boot until we have a
connection looks like a semi-reasonable solution.
