Return-Path: <SRS0=I1qK=KF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A62C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 18:16:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93F7A611F0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 May 2021 18:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93F7A611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=crfreenet.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 558684f3;
	Mon, 10 May 2021 18:16:06 +0000 (UTC)
Received: from mail.crfreenet.org (varda.crfreenet.org [185.133.240.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b4a1c75
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 May 2021 18:16:04 +0000 (UTC)
Received: from feanor (unknown [164.215.121.182])
 by mail.crfreenet.org (Postfix) with ESMTP id 524E111CBB2;
 Mon, 10 May 2021 20:16:03 +0200 (CEST)
Date: Mon, 10 May 2021 20:16:02 +0200
From: Ondrej Zajicek <santiago@crfreenet.org>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: bird-users@network.cz, wireguard@lists.zx2c4.com,
 Stefan Haller <stefan.haller@stha.de>
Subject: Re: [PATCH] sysdep/bsd: propagate OS-level IFF_MULTICAST to internal
 IF_MULTICAST flag
Message-ID: <YJl4Yt/LooknGdtk@feanor.crfreenet.org>
References: <20210419222653.55983-1-toke@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210419222653.55983-1-toke@toke.dk>
X-Operating-System: Debian GNU/Linux
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

On Tue, Apr 20, 2021 at 12:26:53AM +0200, Toke H=F8iland-J=F8rgensen wrote:
> The BSD code did not propagate the OS-level IFF_MULTICAST flag to the
> Bird-internal IF_MULTICAST flag, which causes problems with Wireguard
> interfaces on FreeBSD. The Linux sysdep code does propagate the flag
> already, so just copy over the same check and flag update.

Thanks, merged.

--=20
Elen sila lumenn' omentielvo

Ondrej 'Santiago' Zajicek (email: santiago@crfreenet.org)
OpenPGP encrypted e-mails preferred (KeyID 0x11DEADC3, wwwkeys.pgp.net)
"To err is human -- to blame it on a computer is even more so."
