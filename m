Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1045EC31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:20:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80DB5213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80DB5213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=crfreenet.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c54b773;
	Tue, 18 Jun 2019 15:19:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efd0e319
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 21:58:02 +0000 (UTC)
Received: from mail.crfreenet.org (varda.crfreenet.org [81.92.145.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40ba7881
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jun 2019 21:58:01 +0000 (UTC)
Received: from feanor (feanor-poda.crfreenet.org [164.215.121.182])
 by mail.crfreenet.org (Postfix) with ESMTP id B49C25FE21;
 Fri,  7 Jun 2019 23:57:59 +0200 (CEST)
Date: Fri, 7 Jun 2019 23:57:59 +0200
From: Ondrej Zajicek <santiago@crfreenet.org>
To: Janne =?iso-8859-1?B?SGXf?= <janne@hess.ooo>
Subject: Re: Introduce Wireguard support to bird
Message-ID: <20190607215759.GC20970@feanor.crfreenet.org>
References: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <524c0c7c670e5525c2911bdde2b1211a@hess.ooo>
X-Operating-System: Debian GNU/Linux
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:19:58 +0200
Cc: bird-users@network.cz, wireguard@lists.zx2c4.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, Jun 07, 2019 at 06:21:42PM +0000, Janne He=DF wrote:
> Hey everyone,
> =

> as advertised, I have completed the Wireguard support.
> You might see that I am not really a C expert, but I hope the code is goo=
d enough.
> If you need me to change anything or have additional questions, just let =
me know.

Hi

Could you explain what the Wireguard support broadly does (compared to
regular route update)?

-- =

Elen sila lumenn' omentielvo

Ondrej 'Santiago' Zajicek (email: santiago@crfreenet.org)
OpenPGP encrypted e-mails preferred (KeyID 0x11DEADC3, wwwkeys.pgp.net)
"To err is human -- to blame it on a computer is even more so."
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
