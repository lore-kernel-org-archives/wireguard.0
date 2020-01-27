Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6C4C33CB3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:34:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1695721739
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1695721739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72d759b0;
	Tue, 28 Jan 2020 10:34:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53e793d7
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jan 2020 21:45:23 +0000 (UTC)
Received: from claranet-outbound-smtp08.uk.clara.net
 (claranet-outbound-smtp08.uk.clara.net [195.8.89.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43d2e3b8
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jan 2020 21:45:23 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:25813 helo=[172.16.2.123])
 by relay08.mail.eu.clara.net (relay.clara.net [81.171.239.38]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) id 1iwCC8-0005N2-So 
 (return-path <barry@barrys-emacs.org>); Mon, 27 Jan 2020 21:45:21 +0000
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: wireguard-hosts file
From: Barry Scott <barry@barrys-emacs.org>
In-Reply-To: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
Date: Mon, 27 Jan 2020 21:45:20 +0000
Message-Id: <8BABCA2C-771B-41F7-BEC0-ADF779C6A8FB@barrys-emacs.org>
References: <674aac2b-1b4c-022c-0e4d-596529dce78f@viisauksena.de>
To: jens <jens@viisauksena.de>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:34:47 +0100
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



> On 24 Jan 2020, at 16:01, jens <jens@viisauksena.de> wrote:
> 
> i really would love to have a feature like wireguard-hosts file.
> whereas wg command would print given "name" instead of key - so the
> output would be more meaningfull
> We have some wireguard running in server like infrastructure, where one
> server serves dozens of "clients"
> 
> so instead of
> peer: l9FxaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaU=
> we would have something alike
> peer: superhero downtown
> 
> some of you may be familar with batman-adv layer2 routing protocol,
> there they also have a batctl which is working pretty similar to wg tool.
> there you can add a bat-hosts file which is doing the job, which totaly
> works likes any hosts file
> a normal hosts file maps ip to name,
> a bat-hosts file maps mac addresses to name,
> a wg-hosts file would map keys to name.
> 
> i found the sources for bat-hosts ( .c .h .sample ) here
> https://downloads.open-mesh.org/batman/releases/batman-adv-2019.5/batctl-2019.5.tar.gz
> 
> is this something maybe usefull to other also?
> is there a chance to have this implemented by default?

I thought about this problem as well. I was thinking along the lines
of having a user-defined string field that could be used as the
friendly client name instead of the client public key.

But since I concluded that I needed my own tooling on top of
what wireguard provides at the server end. At that point
I can replace the wg command with my own that does what
I want.

I use the client public key as the key into my client database.

I have a python script that added clients to the database,
generates a new server wg0.conf and a wg0.conf for each client.
It takes care of allocating the next free IP address in the VPN pool
for example.

Another python script takes the output of "wg show wg0 dump" and
the database to create a status output that uses the client names.

Barry



> 
> thx for answers.
> fuzzle
> 
> -- 
> make the world nicer, please use PGP encryption
> <0x507EB93F6F6DEE01.asc>_______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
