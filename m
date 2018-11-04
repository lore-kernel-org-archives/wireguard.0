Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E66C6786F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 03:25:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD222081F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 03:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD222081F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4d9ea34;
	Sun, 4 Nov 2018 03:21:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5d6c874
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 03:21:01 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e60ce8d
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 03:21:01 +0000 (UTC)
Received: from fifthhorseman.net (dhcp-97d4.meeting.ietf.org [31.133.151.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id DA502F99A;
 Sat,  3 Nov 2018 23:25:02 -0400 (EDT)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id 00C4520900; Sun,  4 Nov 2018 10:22:52 +0700 (+07)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
Subject: Re: wireguard dkms systemd
In-Reply-To: <ee072fa1-7052-3ce6-ddac-a431c080f382@urlichs.de>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
 <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
 <87pnvnmvsc.fsf@fifthhorseman.net>
 <ee072fa1-7052-3ce6-ddac-a431c080f382@urlichs.de>
Date: Sun, 04 Nov 2018 10:22:52 +0700
Message-ID: <87pnvlfrw3.fsf@fifthhorseman.net>
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

On Sat 2018-11-03 12:54:24 +0100, Matthias Urlichs wrote:
> On 02.11.18 14:52, Daniel Kahn Gillmor wrote:
>> "systemctl daemon-reload" in postinst
>
> Looks like the perfect usecase for a dpkg trigger.

it might be a reasonable use case -- it'd be worth talking with the
systemd maintainers in your preferred distribution about that if you
care about it.

     --dkg
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
