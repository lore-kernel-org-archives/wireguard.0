Return-Path: <SRS0=sMiv=TO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CADC04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 19:47:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF83520873
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 May 2019 19:47:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRYwsUGK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF83520873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 364df7c0;
	Tue, 14 May 2019 19:47:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd0c9405
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 19:47:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6a1cc4b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 May 2019 19:47:01 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B94520873;
 Tue, 14 May 2019 19:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557863220;
 bh=XzcgNz0gv5pUB+2SrhSRy72UV4w9vNv15T8LSTI4T5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bRYwsUGKU1xF+iO0WyBuwCYgUDZvCw2H3PMnRttk89Zu+6lfyrUJDJ+VSrNwn1qNz
 tNRd8SFPfw/Lyk9enKq1YbI2tWgDihCsDmY1OhcoH8wYP3317Wq+NPPb+LER2m17Gk
 uc0nPt/woUmmiSTq/yjecP9QbbHH2JQqZuF8vQU8=
Date: Tue, 14 May 2019 21:46:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: Re: Add Wireguard to Linux staging tree
Message-ID: <20190514194658.GB22244@kroah.com>
References: <9b657152-e9c9-5254-ea3e-0ff4c452fc36@bartschnet.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b657152-e9c9-5254-ea3e-0ff4c452fc36@bartschnet.de>
User-Agent: Mutt/1.11.4 (2019-03-13)
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

On Tue, May 14, 2019 at 11:11:52AM +0200, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> Hi,
> 
> it seems activities adding Wireguard to the Linux kernel have stopped
> because of lack of audits and cryptographic weakness tests.

That is not why it has stopped.

> I suggest to offer adding Zinc/Wireguard to the Linux kernel staging
> tree to make it easily available for testing and auditing.

It's easy to test and audit today, adding it to staging is not going to
help that out any, sorry.

thanks,

greg k-h
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
