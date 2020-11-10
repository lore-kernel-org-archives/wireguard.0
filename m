Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D306C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 01:48:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B125206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 01:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B125206A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54fb6e7b;
	Tue, 10 Nov 2020 01:44:37 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d60cc5d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 01:44:35 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 842A91E3057;
 Mon,  9 Nov 2020 20:48:13 -0500 (EST)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 666331E3043;
 Mon,  9 Nov 2020 20:48:13 -0500 (EST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: DNS resolution retries and EAI_NONAME
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <154faa3b-098c-45c2-ab3a-99e2cf9d6754@www.fastmail.com>
Date: Mon, 9 Nov 2020 19:48:12 -0600
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <F98FC70C-2830-4664-8B8F-91D410068166@lonnie.abelbeck.com>
References: <154faa3b-098c-45c2-ab3a-99e2cf9d6754@www.fastmail.com>
To: Zack Elan <wireguard@zackelan.com>
X-Mailer: Apple Mail (2.3445.104.17)
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



> On Nov 3, 2020, at 2:57 AM, Zack Elan <wireguard@zackelan.com> wrote:
>=20
> Short version: if I set WG_ENDPOINT_RESOLUTION_RETRIES=3Dinfinity, I =
would like wg(8) to actually retry infinitely, rather than exiting the =
first time it gets what it assumes to be a permanent failure.
>=20
> Long version:
>=20
> When WG_ENDPOINT_RESOLUTION_RETRIES is set, wg will retry endpoint =
resolution failures...but it special-cases 2 or 3 error response codes =
[0] - EAI_NONAME, EAI_FAIL and (if defined) EAI_NODATA because it =
considers them "permanent" failures that are not worth retrying.
>=20
> I have several Wireguard tunnels that are set to start at boot on a =
NixOS box I host. NixOS sets this variable to infinite for me [1]. =
Despite this, when I reboot that host, I consistently have the tunnels =
fail on startup. They're failing with a error that wg(8) considers =
permanent:

Hi Zack,

Our project reversed the logic to make a DNS failure to be a non-fatal =
'wg' error. [2]

This trivial patch has worked well for our usage.

Lonnie

[2] =
https://raw.githubusercontent.com/astlinux-project/astlinux/master/package=
/wireguard-tools/wireguard-tools-0001-ignore-endpoint-dns-failure.patch


