Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EA1C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 13:24:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 003CA204FD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 003CA204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab6e0c33;
	Thu, 14 Mar 2019 13:12:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6444bf82
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 13:12:42 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:851d::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a6f7c5c
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 13:12:42 +0000 (UTC)
Received: from p508bc35c.dip0.t-ipconnect.de ([80.139.195.92]
 helo=deneb.skynet.aixah.de); authenticated
 by wp260.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 id 1h4QLB-0004MC-H4; Thu, 14 Mar 2019 14:24:09 +0100
Received: by deneb.skynet.aixah.de (Postfix, from userid 1005)
 id 11FB4C04A1; Thu, 14 Mar 2019 14:24:09 +0100 (CET)
Date: Thu, 14 Mar 2019 14:24:09 +0100
From: Luis Ressel <aranea@aixah.de>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] net/netfilter/nf_nat_core.h was removed by
 d2c5c103b1337f590b7edf1509a6e294bdf22402
Message-ID: <20190314132409.ubkqxeyebirsx75n@deneb.skynet.aixah.de>
Mail-Followup-To: wireguard@lists.zx2c4.com
References: <20190314052150.9968-1-bruno@wolff.to>
 <20190314053402.GA10226@wolff.to>
 <20190314071024.i2iz6l4rc3jnlzaq@yavin>
 <20190314124134.GB20943@wolff.to>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190314124134.GB20943@wolff.to>
User-Agent: NeoMutt/20180716
X-bounce-key: webpack.hosteurope.de;aranea@aixah.de;1552569852;e3017575;
X-HE-SMSGID: 1h4QLB-0004MC-H4
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

On Thu, Mar 14, 2019 at 07:41:34AM -0500, Bruno Wolff III wrote:
> On Thu, Mar 14, 2019 at 18:10:24 +1100,
>  Aleksa Sarai <cyphar@cyphar.com> wrote:
> 
> > You're also missing a Signed-off-by:, but I'm not sure if WireGuard
> > contributions require those (you can add them with `git commit -s`).

Yes, it is indeed neccessary to sign off all contributions to wireguard.

> Can you set up your config to do that automatically or are you supposed to
> do that manually for each commit to make sure you really mean it?

Yes and no. There's no way to make git append the s-o-b line to all
commit messages, but if you enable the format.signOff config option,
it will at least add the line when you invoke git format-patch or git
send-email.

Cheers,
Luis
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
