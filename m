Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F18C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:02:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CD92068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 11:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="Tv299tBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CD92068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a453cda9;
	Wed, 6 May 2020 10:49:09 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e51359d4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 10:49:05 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=Tv299tBp69XypKFFNnhj5kXd7cRbjcZpMnRfiUB7XHQKRF+AbAJmZRs1bamKQlc/kTOk28scHSjXKqF1JgQoUvo+WM+HKEBWpE+dbbokENT1pQlp4TUouZiPg0hzThbcmujILlG8qvAORuLzgvgFHjdjXDAqIK/8y5eZhhlMESTXz6PIPogyAnXmsh7MZ0ROuvBAeV96YeIixuKK2jYMUr8nEF3g4JbawKSYF4JQCptQ9QoTXv4KO+BZDXaB+9iO4ym7HTR2Nal7IuX27oUsYq/1T1+Z3ZXYpopsx46K2lO5CyxqInzwVcTqvS2+nWt/qJ83Rr5SeJMYy8g+y/vEKA==;
 s=purelymail1; d=msfjarvis.dev; v=1;
 bh=H4E1Mw3JIwjwKuGAk3vnT6HjIcUv4f4Fm8GhtHrinww=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 185.232.22.61 (EHLO ryzenbox) ([185.232.22.61])
 by ip-172-30-0-42.ec2.internal (JAMES SMTP Server ) with ESMTPA ID -68324214; 
 Wed, 06 May 2020 11:01:35 +0000 (UTC)
Date: Wed, 6 May 2020 16:31:31 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Dark Shadow <shadowofdarkness@gmail.com>
Cc: "=?utf-8?Q?wireguard=40lists.zx2c4.com?=" <wireguard@lists.zx2c4.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <FC124C86-7CBB-4856-BB9D-3EE3E4E550C1@getmailspring.com>
In-Reply-To: <CAMXzSMozuS_dSpODmp3LzAmoetr9jKXUZpbQthx5P9YXk-xGAw@mail.gmail.com>
References: <CAMXzSMozuS_dSpODmp3LzAmoetr9jKXUZpbQthx5P9YXk-xGAw@mail.gmail.com>
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



On Apr 19 2020, at 9:01 pm, Dark Shadow <shadowofdarkness@gmail.com> wrote:

> I set up Wireguard and had it working fine when manually starting the
> connection.
> After that I wanted to have it be always on so that it would auto
> connect when turning the phone on but I found that it would say it was
> connected but no data would transfer.
> Manually turning it off and on again would fix the connection
> 
> If I change the server address to a IP address everything works
> correctly and the connection just works after turning on the phone.
> 
> I assume this is a bug that can hopefully be fixed as I would prefer
> to use the dyndns address in the settings.
>

Hm, that's pretty unexpected. Are you using the Go userspace backend or
the kernel module? The settings page will show that at the top if you're
unsure. I've Cc'ed Jason in case this is a problem lower down in the
stack.
