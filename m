Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A20FC0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 03:25:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD16A2081F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 03:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD16A2081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cd1eb5c;
	Sun, 4 Nov 2018 03:21:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 669b4755
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 03:21:02 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53bb5f57
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 03:21:01 +0000 (UTC)
Received: from fifthhorseman.net (unknown
 [IPv6:2001:67c:1232:144:93d0:9674:49b5:185e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 0E8C3F99E;
 Sat,  3 Nov 2018 23:25:04 -0400 (EDT)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 5F00220986; Sun,  4 Nov 2018 10:24:56 +0700 (+07)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Reuben Martin <reuben.m.work@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wireguard dkms systemd
In-Reply-To: <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
Date: Sun, 04 Nov 2018 10:24:56 +0700
Message-ID: <87o9b5frsn.fsf@fifthhorseman.net>
MIME-Version: 1.0
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

On Fri 2018-11-02 18:27:55 -0500, Reuben Martin wrote:
> All this discussion about service management kinda misses the
> point. You're swapping out a kernel module. There will always be
> risk. Changing service management procedures won't mitigate that. If
> you do not have a means to connect outside of the VPN connection, and
> the module (or service) fail, you're SOL.

I think you're saying that such a migration is complicated,
idiosyncratic, and might fail -- so we should automate it and let the
admin pick up the pieces if it breaks.

I think i agree that it's complicated, idiosyncratic, and might fail --
by my conclusion is that we *shouldn't* automate it on behalf of the
local admin, but rather let them plan their own migration.  *shrug*

Again, if you have a suggestion for how to reduce the risk, i'm all
ears, but i'm not about to encourage automated breakage in the package
management.

        --dkg
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
