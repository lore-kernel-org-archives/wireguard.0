Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14BF6C47257
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A946206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jikken.de header.i=@jikken.de header.b="pOQHJx3N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A946206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=jikken.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90d033d9;
	Wed, 6 May 2020 10:37:35 +0000 (UTC)
Received: from shinsetsu.jikken.de (shinsetsu.caesia.net [92.60.39.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 96c5392b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jikken.de;
 s=Mv0BmWWr5KBeokdR; t=1588603857;
 bh=gNHDwiUiupCUpztTiOqwluCf83JQPPEaGXYrnblOYqY=;
 h=Date:From:To:Subject:References:In-Reply-To;
 b=pOQHJx3N8rGQ0hQakPlEFKXS01I34dC1m9O7Pgf9uOMa4xzu/CTDQyDb3cCW+oYSc
 OJvS6yCNe+f892bV6tELQyxCckKKj5Tr9+YqIQMChXDLNo59prjFN7ZgMcrzIwKRFc
 A8XCZ/srXJJ2chZaztWX6jJi+ETVS9KBbu18A2Ok=
Date: Mon, 4 May 2020 16:50:55 +0200
From: inrin@jikken.de
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Newbie - WireGuard per systemd on Debian Buster
Message-ID: <20200504145055.yuuxcshoe5f2ly6v@nisshoku.local>
Mail-Followup-To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
X-Mailman-Approved-At: Wed, 06 May 2020 12:37:33 +0200
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

Hi
On Thu, Apr 16, 2020 at 06:23:01PM +0200, Hans Kraus wrote:
>I'm a newbie to wireguard and trying to install a working environment,
>starting with one server and one client. First I used the example in
><https://github.com/pirate/wireguard-docs/tree/master/example-simple-client-to-server>
>and got it working.
>
>To get a more persistent installation I followed the example in
><https://wiki.debian.org/Wireguard>, with one server and one client,
>"Step 2 - Alternative C - systemd". My server has a fixed ip4 address,
>my client(s) get their addresses via DHCP (home network and road
>warrior). My two "/etc/systemd/network" files on my server are:
>
>/etc/systemd/network/wg0.netdev
>---------------------------------------------
>[NetDev]
>Name=wg0
>Kind=wireguard
>Description=Wireguard kraush
>
>[WireGuard]
>PrivateKey=<private key server>
At least on current systemd (245.5) It is called: ``PrivateKeyFile''.
Please not the "File" part.

Please look up under ``man systemd.netdev'' if it is also ``PrivateKeyFile''
Btw. you could use wg-quick Service with normal WG-config .

Greetings
Inrin
