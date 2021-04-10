Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECF9C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 16:13:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063F2601FF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 16:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063F2601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a07474b9;
	Sat, 10 Apr 2021 16:13:00 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 06d76c76
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Apr 2021 16:12:58 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 4D6DB1E3067;
 Sat, 10 Apr 2021 12:12:57 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 2C7F41E3064;
 Sat, 10 Apr 2021 12:12:57 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: T-Mobile 4G/5G CGNAT vs WireGuard tunnel jitter
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <20210410205951.14f93435@natsu>
Date: Sat, 10 Apr 2021 11:12:56 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <15541873-A1D6-417E-A3B7-121DE0D90F22@lonnie.abelbeck.com>
References: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
 <20210410205951.14f93435@natsu>
To: Roman Mamedov <rm@romanrm.net>
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



> On Apr 10, 2021, at 10:59 AM, Roman Mamedov <rm@romanrm.net> wrote:
>=20
> On Sat, 10 Apr 2021 10:27:23 -0500
> Lonnie Abelbeck <lists@lonnie.abelbeck.com> wrote:
>=20
>> I have been testing the T-Mobile Home Internet (4G/5G fixed wireless) =
service to a Linode VM via WireGuard.
>>=20
>> The TMHI service uses CGNAT plus an additional NAT in their =
modem/gateway with a MTU of 1420, so WireGuard is configured with a 1340 =
MTU.
>=20
> Do they provide IPv6? I see mentions that yes, but with incoming =
connections
> blocked. Might still work for WG.

Hi Roman,

TMHI uses IPv6 for their CGNAT, but AFAIK their current firmware does =
not support IPv6 on the ethernet ports (I disable their WiFi).

But if (when) they support IPv6, establishing the WireGuard tunnel over =
IPv6 would be great, and back to a 1420 MTU for WireGuard.

Lonnie


