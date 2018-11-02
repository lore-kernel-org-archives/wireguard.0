Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DATE_IN_PAST_06_12,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B076C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 23:01:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB242082D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 23:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB242082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98d4d2dd;
	Fri, 2 Nov 2018 22:57:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f394c66a
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 22:57:34 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [IPv6:2001:470:1:116::7])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9cbbbfe
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 22:57:34 +0000 (UTC)
Received: from fifthhorseman.net (unknown [161.30.112.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 7CFE4F99B;
 Fri,  2 Nov 2018 19:01:27 -0400 (EDT)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 6739820323; Fri,  2 Nov 2018 14:52:19 +0100 (CET)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Lucian Cristian <luci@powerneth.ro>
Subject: Re: wireguard dkms systemd
In-Reply-To: <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
Date: Fri, 02 Nov 2018 09:52:19 -0400
Message-ID: <87pnvnmvsc.fsf@fifthhorseman.net>
MIME-Version: 1.0
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

On Sun 2018-10-21 18:49:19 +0300, Lucian Cristian wrote:
> is an annoyance to restart it manually, if you are inside the vpn, you 
> can't do it, I thought that there is a restart script at package update..

as a packager (debian, not ubuntu, but priniciples might be similar
across operating systems), i'm very leery to automatically restart
services during an upgrade, particularly when those services might
affect the connectivity of the system administrator who is doing the
upgrade.

that means i'm unlikely automatically restart network interfaces in a
package's postinst (post-installation script).  And, since another
package could also be in the process of updating systemd units, i'm also
unlikely to automatically issue a "systemctl daemon-reload" in postinst.

if you want "systemd daemon-reload" to happen after successful package
installation, that would probably be a job for the package manager
itself (in debian and ubuntu, that's probably apt (or maybe dpkg)), or
for hooks/triggers associated with package management.

If anyone has a robust/reliable solution that's not likely to cause the
kinds of problems i'm concerned about, i'd love to hear it.

      --dkg
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
