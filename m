Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF463C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:00:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E012360D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 10:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E012360D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glenn.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed4e0410;
	Thu, 17 Dec 2020 09:51:58 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fbe8ba23
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 02:00:59 +0000 (UTC)
Date: Thu, 17 Dec 2020 02:09:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=glenn.id.au;
 s=protonmail; t=1608170964;
 bh=Xxx50Aj3z4k1dzts9jYF5JMmObwMC7HWY5rim/JHuT4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=PYcPzKHxVvIDi0JxUa+Q9Zc4pFWXHzCpyU+l+FKHus4D4jOTo8MIKZ9M00b0vn+Ml
 qDt7/qqtCpaZUpJVMZ7ntYHZSrA1UX/C+YT31XwruN3YufEvB27Coo3N2ZPUh7Hg5E
 4fjOez6IjOCmrLoygfxQpXH3Zr69SQXMEBzEga3GTBUD7nwAqPPvXhzx5C+aUFWXea
 XCTWU5yppCx+6crdHQ2amalF4goZU0mh92QRdDTxzl3YQKuX9hEb5Ro5YaSVwWWLgh
 n0du7+UsSkW7zFORjKFnqNIhUIv/lfW+97sU5QvBfR6jgJVhnHiF4B0zM3sZdSHmsw
 T2dOXorPoG0NQ==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Glenn Schmidt <glenn@glenn.id.au>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
Message-ID: <3244C61D-AAE4-4DBD-96FA-8CEA31C83399@glenn.id.au>
In-Reply-To: <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
 <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Dec 2020 10:51:56 +0100
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
Reply-To: Glenn Schmidt <glenn@glenn.id.au>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Yes that got it working; thanks for your help.


> On 17 Dec 2020, at 12:43 pm, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
>=20
> I'm really very sorry about this regression. I fixed it earlier today
> already here: https://git.zx2c4.com/wireguard-apple/commit/?id=3D20bdf467=
92905de8862ae7641e50e0f9f99ec946
> but now we're stuck having to wait for Apple's review of the fix. This
> is as frustrating for me as it is for you.
>=20
> As a temporary work around, try adding a DNS server to the [Interface] se=
ction :
>=20
>    [Interface]
>    DNS =3D 8.8.8.8
>=20
> Let me know if that gets things working again.


