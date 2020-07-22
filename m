Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1CC9C433E5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:27:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C4D206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IhTW/48s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C4D206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pm.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2deb44a7;
	Fri, 24 Jul 2020 08:04:11 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8eddb199
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jul 2020 23:00:16 +0000 (UTC)
Date: Wed, 22 Jul 2020 23:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
 t=1595460177; bh=MEaXXJzVYVANxROVLkkDfwPtGBwOXRXkX8OtqnWxxi0=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=IhTW/48sBrgTtJwDWZe0wUDFvfII9vIk4LTtQQ/M0fPP4qwNtKVv4DzvZ3gjtpuoF
 C7SbeBgYmu7nMFEhL9eoBSlK7uCSQILAUM+UICip0ktHFCfU3N0w8bmQCnqfgVAOYg
 qXz7JUxinJ+k6lp1Zo84cmiiazz3Js66QUKGYjBGXltwFWqUiUrbMJfYqqSLNo4JPd
 NRP4E+libLDwjtttM2s5nfWEnY4ATGRSBDX5QLL7ZH6pQpknnGzRJI4zksaUgTt9is
 RjYyOVytIWnECVe/w+P3yIK5iGAUZhvwRaWXY52r8X0TDzpB92GcBmml0Ws/T5SYrF
 IFc+0zN1rwpVA==
To: "Florent B." <florent@coppint.com>, wireguard@lists.zx2c4.com
From: Yadunandan Pillai <thesw4rm@pm.me>
Subject: Re: Build fails on Proxmox
Message-ID: <6fcd60db-a14d-bc63-2d35-0186ce1f0af9@pm.me>
In-Reply-To: <e8277a70-7376-1760-b537-78f7f9a748d5@coppint.com>
References: <e8277a70-7376-1760-b537-78f7f9a748d5@coppint.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 24 Jul 2020 10:04:05 +0200
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
Reply-To: Yadunandan Pillai <thesw4rm@pm.me>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Not sure installing WG on Proxmox directly is a good idea. You may be bette=
r off
doing it in a VM.

But that kernel looks a bit older, perhaps upgrading to Proxmox 6.0 which c=
omes
with a kernel from the 5 series will work better?

On 7/22/20 6:19 PM, Florent B. wrote:
> Hi,
>
> I try to install Wireguard on Proxmox servers 5.4 (Debian Stretch),
> running kernel 4.15.18-58 (pve-kernel-4.15.18-30-pve).
>
> I use Wireguard DKMS from buster-backports, version 1.0.20200712.
>
> Build fails on :
>
>  =C2=A0=C2=A0=C2=A0 /var/lib/dkms/wireguard/1.0.20200712/build/socket.c: =
In function
> 'send6':
>  =C2=A0=C2=A0=C2=A0 /var/lib/dkms/wireguard/1.0.20200712/build/socket.c:1=
39:18: error:
> 'const struct ipv6_stub' has no member named 'ipv6_dst_lookup'; did you
> mean =C2=A0=C2=A0=C2=A0 =C2=A0 'ipv6_dst_lookup_flow'?
>  =C2=A0=C2=A0 dst =3D ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), soc=
k, &fl,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~
>  =C2=A0=C2=A0=C2=A0 scripts/Makefile.build:322: recipe for target
> '/var/lib/dkms/wireguard/1.0.20200712/build/socket.o' failed
>
>
> How can I build Wireguard on this platform ?
>
> Thank you.
>
> Florent
>

