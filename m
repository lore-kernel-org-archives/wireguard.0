Return-Path: <SRS0=uW9L=64=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CEBC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 May 2020 09:15:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 774AB20675
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 May 2020 09:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 774AB20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 978fd71c;
	Thu, 14 May 2020 09:01:31 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ca2b3fdf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 May 2020 09:01:29 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id F08B940384;
 Thu, 14 May 2020 09:15:08 +0000 (UTC)
Date: Thu, 14 May 2020 14:15:08 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Mike O'Connor <mike@pineview.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Significant Dropped Packets on WG interface
Message-ID: <20200514141508.294bf88c@natsu>
In-Reply-To: <21e7d9c5-1d0d-efc0-e698-f59325960df1@pineview.net>
References: <21e7d9c5-1d0d-efc0-e698-f59325960df1@pineview.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 14 May 2020 16:35:30 +0930
Mike O'Connor <mike@pineview.net> wrote:

> Hi All
>=20
> For the last few weeks my Wireguard link which I use to as my default
> gateway has been having issues with TCP connections stalling.
>=20
> I've been trying to work out what is wrong. I just noticed that the
> Wireguard link has dropped packets at both ends.
>=20
> wg-p2p=C2=A0=C2=A0=C2=A0 Link encap:UNSPEC=C2=A0 HWaddr
> 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet addr:104.127.=
123.10=C2=A0 P-t-P:103.127.123.10=C2=A0
> Mask:255.255.255.248
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet6 addr: 2506:c=
500:ff4:1::ab/64 Scope:Global
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet6 addr: fe80::=
e6/64 Scope:Link
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UP POINTOPOINT RUN=
NING NOARP=C2=A0 MTU:1500=C2=A0 Metric:1

Reduce MTU of the WG interfaces to accomodate for overhead. See=20
https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg01856.html for
calculations of by how much.

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet6 addr: 2506:c=
500:ff4:1::aa/64 Scope:Global

I wonder what's this IP range, is this some VPN service? Squatting on
unassigned IPs within 2000::/3 seems like a very bad practice. If they want=
ed
an imaginary GUA for their NAT66, I'd suggest something like 66::/16 instea=
d.

--=20
With respect,
Roman
