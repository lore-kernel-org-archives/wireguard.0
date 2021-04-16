Return-Path: <SRS0=Vhpd=JN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039F2C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 13:56:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55E4610E6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Apr 2021 13:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C55E4610E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69804ae3;
	Fri, 16 Apr 2021 13:56:13 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7813f635
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 13:56:06 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id E995C1E305B;
 Fri, 16 Apr 2021 09:56:04 -0400 (EDT)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id C28281E304D;
 Fri, 16 Apr 2021 09:56:04 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: T-Mobile 4G/5G CGNAT vs WireGuard tunnel jitter
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <15541873-A1D6-417E-A3B7-121DE0D90F22@lonnie.abelbeck.com>
Date: Fri, 16 Apr 2021 08:56:04 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A40CD39D-BBF3-463D-9C7A-96A620AC6E91@lonnie.abelbeck.com>
References: <0BDB7408-22AC-4643-975E-1B5AC3AFADD9@lonnie.abelbeck.com>
 <20210410205951.14f93435@natsu>
 <15541873-A1D6-417E-A3B7-121DE0D90F22@lonnie.abelbeck.com>
To: Roman Mamedov <rm@romanrm.net>,
 Mo Balaa <buddybalaa@gmail.com>
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



> On Apr 10, 2021, at 11:12 AM, Lonnie Abelbeck =
<lists@lonnie.abelbeck.com> wrote:
>=20
>> On Apr 10, 2021, at 10:59 AM, Roman Mamedov <rm@romanrm.net> wrote:
>>=20
>> On Sat, 10 Apr 2021 10:27:23 -0500
>> Lonnie Abelbeck <lists@lonnie.abelbeck.com> wrote:
>>=20
>>> I have been testing the T-Mobile Home Internet (4G/5G fixed =
wireless) service to a Linode VM via WireGuard.
>>>=20
>>> The TMHI service uses CGNAT plus an additional NAT in their =
modem/gateway with a MTU of 1420, so WireGuard is configured with a 1340 =
MTU.
>>=20
>> Do they provide IPv6? I see mentions that yes, but with incoming =
connections
>> blocked. Might still work for WG.
>=20
> Hi Roman,
>=20
> TMHI uses IPv6 for their CGNAT, but AFAIK their current firmware does =
not support IPv6 on the ethernet ports (I disable their WiFi).
>=20
> But if (when) they support IPv6, establishing the WireGuard tunnel =
over IPv6 would be great, and back to a 1420 MTU for WireGuard.

A quick update, TMHI does support IPv6 via DHCPv6, but sadly has the =
same MTU (1420) as IPv4 has, and IPv6 is firewalled inbound (as Roman =
said).

I now have the WireGuard transport endpoints using IPv6 over TMHI, but =
the jitter with low bitrate traffic still occurs as with the IPv4 =
transport endpoint setup.  Other than that, it works quite well.

Lonnie

