Return-Path: <SRS0=fSJ2=JR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C37C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Apr 2021 04:52:27 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85AF613AE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 Apr 2021 04:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85AF613AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=crfreenet.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55cb0ff5;
	Tue, 20 Apr 2021 04:52:23 +0000 (UTC)
Received: from mail.crfreenet.org (varda.crfreenet.org [185.133.240.16])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0350db21
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 13:04:06 +0000 (UTC)
Received: from feanor (slizka.chapadla.cz [93.99.228.74])
 by mail.crfreenet.org (Postfix) with ESMTP id A41E6112A90;
 Mon, 19 Apr 2021 15:04:04 +0200 (CEST)
Date: Mon, 19 Apr 2021 15:03:54 +0200
From: Ondrej Zajicek <santiago@crfreenet.org>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>
Cc: bird-users@network.cz, wireguard@lists.zx2c4.com,
 Stefan Haller <stefan.haller@stha.de>
Subject: Re: [PATCH] babel: Drop check for IF_MULTICAST interface flag
Message-ID: <YH1/umkXjyZ0AjqO@feanor.crfreenet.org>
References: <20210415134450.197661-1-toke@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210415134450.197661-1-toke@toke.dk>
X-Operating-System: Debian GNU/Linux
X-Mailman-Approved-At: Tue, 20 Apr 2021 04:52:21 +0000
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

On Thu, Apr 15, 2021 at 03:44:50PM +0200, Toke H=F8iland-J=F8rgensen wrote:
> The babel protocol code was checking interfaces for the IF_MULTICAST flag
> and refusing to run if this isn't present. However, there are cases where
> this flag doesn't correspond to the actual capability of sending multicast
> packets. For instance, Wireguard interfaces on FreeBSD doesn't set the
> required flags, but Babel will run just fine over such an interface given
> the right configuration.

Hi

Is there a reason why to disregard the IF_MULTICAST flag? This seems to me
more like a bug in FreeBSD Wireguard implementation that should be fixed
there. Is this flag properly checked on Linux, or is there some reason why
the flag is missing?

Routing protocols in BIRD generally follow this flag (and perhaps use it
to switch to unicast-only mode), so i do not see why Babel should behave
differently.

--=20
Elen sila lumenn' omentielvo

Ondrej 'Santiago' Zajicek (email: santiago@crfreenet.org)
OpenPGP encrypted e-mails preferred (KeyID 0x11DEADC3, wwwkeys.pgp.net)
"To err is human -- to blame it on a computer is even more so."
