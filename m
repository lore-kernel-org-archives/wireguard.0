Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F6EC0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 06:47:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFFA22081D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 06:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFFA22081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bd6465d;
	Mon, 5 Nov 2018 06:43:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8eff8a3c
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 06:43:28 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ef4ccd4
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 06:43:28 +0000 (UTC)
Received: from fifthhorseman.net (dhcp-9fe9.meeting.ietf.org [31.133.159.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id EC6AAF99A;
 Mon,  5 Nov 2018 01:47:38 -0500 (EST)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 05EEC201AC; Mon,  5 Nov 2018 13:28:37 +0700 (+07)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: wireguard dkms systemd
In-Reply-To: <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <CALJ2VGaq8AasV99YApW5UWEKK0B-r+uafT7nEjbKARfwADab+A@mail.gmail.com>
 <87o9b5frsn.fsf@fifthhorseman.net>
 <CAHmME9pOqbjbnOKi7NYfCp9yGkfNfBZfVMexZAB3SCtEv4NGSQ@mail.gmail.com>
Date: Mon, 05 Nov 2018 13:28:37 +0700
Message-ID: <87sh0gdomi.fsf@fifthhorseman.net>
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

On Sun 2018-11-04 16:35:07 +0100, Jason A. Donenfeld wrote:
> FWIW, Ubuntu users got confused with reloading the kernel module (let
> alone systemd's view of units), so we wound up adding something a bit
> strange to the postinst:
>
> https://github.com/EggieCode/wireguard-ppa/blob/master/debian/wireguard-dkms.postinst#L36-L72
>
> Not sure that Debian would want to follow suite with such a thing though...

i like some of the ideas there, but i don't think i'd want it as-is, for
at least a few reasons:

 * the administrator's choice mechanism
  (/etc/wireguard/.reload-module-on-update) is rather idiosyncratic.
  Using a single boolean debconf question is probably a better approach.

 * echoing suggestions to stdout to rmmod/modprobe just before actually
   doing the thing seems like a recipe for it happening twice.  I think
   i wouldn't make that prompt if the administrator has already asked
   the system to do the upgrade.

 * i'm leery of the "systemctl daemon-reload" approach in particular, as
   mentioned above.  if lots of packages did that in their postinst
   they'd be interacting weirdly with each other during a multi-package
   upgrade.

thanks for the pointer though!

   --dkg
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
