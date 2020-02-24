Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13024C35DEE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:52:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DC920838
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DC920838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc1b9aaf;
	Tue, 25 Feb 2020 00:43:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45f07b1b
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 19:24:45 +0000 (UTC)
Received: from claranet-outbound-smtp02.uk.clara.net
 (claranet-outbound-smtp02.uk.clara.net [195.8.89.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39246fcd
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 19:24:44 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:38472 helo=[172.16.2.123])
 by relay02.mail.eu.clara.net (relay.clara.net [81.171.239.32]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 id 1j6JOh-0004Pc-9A  for wireguard@lists.zx2c4.com
 (return-path <barry@barrys-emacs.org>); Mon, 24 Feb 2020 19:28:08 +0000
From: Barry Scott <barry@barrys-emacs.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH] wg show: Add json output
Date: Mon, 24 Feb 2020 19:28:07 +0000
References: <20200217035701.28261-1-matt@oliver.net.au>
 <CAEQe3e=JMOwASvDGuC00uiYdTY_VaU0PnB285pU715i7g4uRaA@mail.gmail.com>
 <6631a080206c608c7b92cffab3f739c66a1ff1e8.camel@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <6631a080206c608c7b92cffab3f739c66a1ff1e8.camel@gmail.com>
Message-Id: <219C0F7A-E7F7-46BD-9E38-09D620299053@barrys-emacs.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Tue, 25 Feb 2020 01:43:43 +0100
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



> On 23 Feb 2020, at 12:45, Arti Zirk <arti.zirk@gmail.com> wrote:
> 
> On E, 2020-02-17 at 15:47 +1100, Matthew Oliver wrote:
>> Someone asked about this in the IRC channel, so quickly wrote up a
>> patch to add it. No pressure if you do/don't want to merge it :)
> 
> If you have wireguard-tools package installed then it should be
> possible to use the incldued wg-json script to do the same
> 
>  sudo /usr/share/wireguard-tools/examples/json/wg-json

When I built my tools in python on top of the wg command I was
please to see a machine interface, but find the \t separated list
of values odd to find in a modern app.

I think it would be a good addition to have the JSON output
without the need to use a contrib script. Many text commands
output in JSON or XML for ease of interfacing.

The JSON would also provide a nice way to add more attributes
in the future.

Barry

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
