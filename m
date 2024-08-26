Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D0DC5472F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2024 08:47:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f43cb5a;
	Mon, 26 Aug 2024 08:38:41 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [2001:4b98:dc4:8::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 348b52ae
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2024 07:36:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 465B4FF809;
 Mon, 26 Aug 2024 07:36:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1siUHZ-00Fm9e-0C;
 Mon, 26 Aug 2024 09:36:57 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: wireguard-tools-1.0.20210914.tar.xz hash changed
References: <87a5h6e4fk.fsf@dell.be.48ers.dk>
Date: Mon, 26 Aug 2024 09:36:57 +0200
In-Reply-To: <87a5h6e4fk.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Wed, 21 Aug 2024 09:11:11 +0200")
Message-ID: <87y14jbuqu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hello Jason,

Was this change done on purpose?

 > Hi Jason,
 > Did you recently upgrade xz on git.zx2c4.com? I see that the hash of
 > wireguard-tools-1.0.20210914.tar.xz changed:

 > http://autobuild.buildroot.org/results/d63b8f5b14487f6d79c9779bb7fe4829fae0653b/build-end.log

 > We have a backup of the original file on sources.buildroot.net:

 > mkdir a b
 > wget -q -P a
 > https://git.zx2c4.com/wireguard-tools/snapshot/wireguard-tools-1.0.20210914.tar.xz
 > wget -q -P b https://sources.buildroot.net/wireguard-tools/wireguard-tools-1.0.20210914.tar.xz

 > sha256sum */*
 > 942ed32d1d6631932c82ff86c91ae8428d4c90bfec231a14ebdf6c29f068e60b
 > a/wireguard-tools-1.0.20210914.tar.xz
 > 97ff31489217bb265b7ae850d3d0f335ab07d2652ba1feec88b734bc96bd05ac
 > b/wireguard-tools-1.0.20210914.tar.xz

 > The uncompressed tarball is identical:

 > unxz */*xz
 > sha256sum */*tar
 > 22d6d0b12ec69be002313a89dbe2c08c07d48c5b93af528189ceab351b3b718d
 > a/wireguard-tools-1.0.20210914.tar
 > 22d6d0b12ec69be002313a89dbe2c08c07d48c5b93af528189ceab351b3b718d
 > b/wireguard-tools-1.0.20210914.tar

 > It would be great if we could have a bit-identical .tar.xz.

 > -- 
 > Bye, Peter Korsgaard

-- 
Bye, Peter Korsgaard
