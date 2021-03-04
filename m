Return-Path: <SRS0=j5R+=IC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223F7C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 08:59:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8AF64F11
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Mar 2021 08:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E8AF64F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd8a985c;
	Thu, 4 Mar 2021 08:58:57 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [5.45.107.185])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 342a36fb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Mar 2021 08:58:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPA id C9805E0776
 for <wireguard@lists.zx2c4.com>; Thu,  4 Mar 2021 09:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1614848333;
 h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Sm4+ziKQhjk7pgj19nmdhkGBZh7frFrNNGg+poHzDLM=;
 b=25ug9ySaETk/29bxqH7qeMkX3zGTAVFNG+osD2g3Vt/rA1IT0Z5EKPdGbRthKFStP928ZJ
 kOouIuNhbTgcn19ietS4C/GIMcel854bMt72b5rOlTGOiRjsgfQ+7/qjxwioxW8OUi9mj9
 /co0ZWig2hEoo1wyq1udIXVuF8tbPV8wV/BzNHZdA99LqmLRCRyC/ozGOUo0FdPUEQ/eP3
 8jzHt6MHf4H/nqChgucYXmXBG8U0AT2hma/7EEKjyrMAeMluIOhR4+RV5XB7/7Xaiom4V0
 /VagdnSrsbndvbN5z/sfhqdo09X3bOL4z2Z1Xu05yXQsDp9mr/pg47nEtvt3Sw==
From: "Joachim Lindenberg" <joachim@lindenberg.one>
To: <wireguard@lists.zx2c4.com>
References: <03ff01d70bbb$953d4750$bfb7d5f0$@lindenberg.one>
 <20210302171021.GA65777@chocolatine.org>
In-Reply-To: <20210302171021.GA65777@chocolatine.org>
Subject: AW: best way for redundancy?
Date: Thu, 4 Mar 2021 09:58:53 +0100
Message-ID: <005701d710d4$9a398110$ceac8330$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQF4FSdeDm9qPLT8jXzNLlFCWdnXmQEFKVwDqylPh8A=
Content-Language: en-de
X-Last-TLS-Session-Version: None
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

I probably should share some more details about my use case and also why =
I am hesitating to use OpenBSD/OpnSense etc.
All my VPN-routers are actually virtual machines. One is a virtual =
private server from a hoster that provides an external static IPv4 =
address, the others are Ubuntu VMs running on Hyper-V 2019. When I check =
support of OpenBSD/OpnSense on Hyper-V it looks like this is not really =
granted, basically works, but... and CARP apparently requires special =
configuration and cooperation of network drivers. And then I =
haven=C2=B4t found good documentation on how to configure CARP with =
wireguard.=20

Thus I tried something else... Until this week, the router of one =
network was on a mobile machine, which occasionally was really on the =
road - and the connectivity was of course broken then. There is another =
host available in the same network that can host a VM, but that host is =
not running 7*24 for power and noise reasons. That actually suggested a =
fail over scenario to me. What I configured right now is the following: =
I "partitioned" that network logically into two groups of VPN-clients. =
One group is the host and all VMs on the power-saving-host, the other =
group is the rest. Via DHCP or static routes, each group now uses =
different routers (part of the respective group) for their respective =
wireguard tunnel to the other networks. On the other side of the tunnel, =
network ranges in AllowedIPs are used to address the respective peer (I =
didn=C2=B4t dare to have these overlap so far).

That is not really a general high-availability scenario, as essentially =
I optimized for the expected outages. I am still wondering whether =
wireguard can support a more general approach without the complexity =
introduced by CARP. My gut feeling is that the roaming capabilities of =
wireguard should actually support that very well.

Thanks, Joachim



-----Urspr=C3=BCngliche Nachricht-----
Von: WireGuard <wireguard-bounces@lists.zx2c4.com> Im Auftrag von =
Nicolai
Gesendet: Tuesday, 2 March 2021 18:10
An: wireguard@lists.zx2c4.com
Betreff: Re: best way for redundancy?

On Thu, Feb 25, 2021 at 10:17:06PM +0100, Joachim Lindenberg wrote:

> I do have a wireguard VPN that connects multiple sites. Unfortunately=20
> some routers are not available all the time, causing network =
disruption.
> I'd like to improve connectivity via redundancy, i.e. add multiple=20
> routers that connect the networks.

> What are the options to do that using wireguard? Can I have multiple=20
> peers with different keys and endpoint but same Allowed IPs? Will=20
> wireguard select the one available?

In the future I want a similar setup: multiple routers for each network =
each seamlessly handling WireGuard when necessary.  I haven't put any =
effort into this yet, but my general plan is to use CARP on OpenBSD, =
with WireGuard sharing keys.  (I know you want distinct keys, so I =
waited to respond until others had a chance.)  Anyway the routers in
City1 would share City1Keys, routers in City2 would share City2Keys, =
etc.  When City1Router1 is unavailable, City1Router2 would grab the IP =
address and be able to immediately speak WireGuard to the other =
locations without anyone noticing.

https://www.openbsd.org/faq/pf/carp.html

Nicolai

