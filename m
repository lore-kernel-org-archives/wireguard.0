Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90E2C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 14:29:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4448F2072C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 14:29:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="C4NdablU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4448F2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba961010;
	Thu, 21 May 2020 14:14:32 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86f0ad00
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 14:14:31 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=C4NdablUePmmZ7B1oojvI/HifdTLQz7XYy00nkWEdXb5T4R41docNU7GsI0/UPkh+aGqc6Ryi+rmwwaiMblbPzX5+NvFQXXr1X4xSai9dN2cZedr864EXZUf49vb9WKW6LDTFtakPcxdtflqJihDnJ3TKJi/ebPOWkEje3INGKc57Wh76h/w0x2yCOlJus0ioUzkJZdj3bmuMbkJpzpgr47HZUjYYxY0LGv8xhrUL6XSLUbYxESXdyYYEHXu3DtEBajYI5SeycNHedqTtkDKo1/YLALmvkqTlx+lkieDfcoiU+PqNaQisLuZzrON8bfKX9nfIObk+J/fDwk9Gc7LSw==;
 s=purelymail3; d=msfjarvis.dev; v=1;
 bh=MsQ6H36YggNfg/bIcfk9PQGGE46mMNwXQxdMPLGmdrA=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 185.200.118.103 (EHLO ryzenbox) ([185.200.118.103])
 by ip-172-30-0-42.ec2.internal (JAMES SMTP Server ) with ESMTPA ID -96779641; 
 Thu, 21 May 2020 14:28:20 +0000 (UTC)
Date: Thu, 21 May 2020 19:58:17 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Jose Marinez <jedi_papi@yahoo.com>
Cc: "=?utf-8?Q?=22wireguard=40lists.zx2c4.com=22?="
 <wireguard@lists.zx2c4.com>, Mehdi Sadeghi <mx@43.yt>
Message-ID: <F7D8E321-F329-4639-883F-26FB1521ACB3@getmailspring.com>
In-Reply-To: <1797380096.2767339.1590070967097@mail.yahoo.com>
References: <1797380096.2767339.1590070967097@mail.yahoo.com>
Subject: Re: Shouldn't devices tethered to a device using Wireguard
 share the same IP?
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


On May 21 2020, at 7:52 pm, Jose Marinez <jedi_papi@yahoo.com> wrote:

> Thank you so much Harsh. What's the best way to make my kernel
> available to you? Even if you could allow me to push to the repo I
> wouldn't know where to save it.

The repo is maintained on GitHub so you will have to fork the repository
and create a pull request with your changes, help.github.com has very
beginner friendly documentation if this is your first time around this.

The process for adding a kernel is a bit involved and the documentation
isn't quite fleshed out. You can check the steps out here[1] and an
example of adding a new device to the repository here[2].

1: https://github.com/WireGuard/android-wireguard-module-builder#adding-your-phones-kernel
2: https://github.com/WireGuard/android-wireguard-module-builder/pull/3/files

