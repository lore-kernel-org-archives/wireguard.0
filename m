Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EECEB64DD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 21 Jul 2023 13:47:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d47d5a9;
	Fri, 21 Jul 2023 13:47:26 +0000 (UTC)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 775896db
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2023 13:47:24 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b7441bfa9eso25315921fa.0
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jul 2023 06:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689947244; x=1690552044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rJob3KAh3U6fuAyLfYE0XzFL7dZg1FsUf8WW64l/f30=;
 b=b/Y1Xz7N2bj7THm4kwHWZO0PV9h8UxYg4zhHy/lU6Q3QkCZS3SrTDfarBm6TytNK9u
 k5oG6OpUzjbnWcgKWHniUf+dOLFwS+otQ80zX3HPEe3aM6PFDXjFTg3738Azz0lWJYpE
 FFuvE8frrmjli1xHC/GLkNz3BacSjLojfBtCA/Lt052wLom7bznd4AdQzVWa+lIjpMSp
 Fer1Zq2FoTuu4l1XVkJG1J5F/cduWtfFmvLC2YvyyAQOMRJHm2yvjJxskmkbY/JgsYHI
 TGZ1k1/SQkZPyeHKfnHkIEFsHX8VJDIDnvPx9nmyGBEOlnakmjmq886T6gynYdL97WSY
 hyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689947244; x=1690552044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rJob3KAh3U6fuAyLfYE0XzFL7dZg1FsUf8WW64l/f30=;
 b=PH7F4s6AR4wiMtf8NgbDLMsGOoeHeDKRcp7ZJdr6MFJxE4hxuyuoLPuLfyZHL02QKG
 qdFpSXR6GwMmhiwwLqv83IGzrlxfBgeuTs1/u8de9w/PhDJpP/Aps0mINorcEqCH9n4w
 DYTmPmckjI/Ws/dh0Ae5BU3J7qwaBeoI9SXk8bFDAhwp1jR666xAgnfG7VKuc8NwH2x7
 RuMQZ331SirvZtI8A6BUTfnDBhIwPL+Pb+TUhfbAAk5lDUjL44QpMKfnPHG/e95J8HNU
 p30EHJe/9HUm+fuC98+F58U654HqTYx8GsR/CpnX0BRCb2/3pmGgemZDcrS9riRDtBAi
 UWEw==
X-Gm-Message-State: ABy/qLbmKvYmgEyJnkazU9M8Dvl5Q7dulZXz89yuGarUz/WfYOCvJwwC
 Jt1DLi2YWQXl7sUNUREyjqrPsBvaNrdjajYWDcIqw3PdAlk=
X-Google-Smtp-Source: APBJJlFbB4ku4HK5pTy9V0cgR2IuxVVhbBXJgnl/ePjkkN2suzvxrlBMjPWtkiNpPTeMIg+egUeACLIqHM6+GN2AOio=
X-Received: by 2002:a2e:9802:0:b0:2b6:f85a:20af with SMTP id
 a2-20020a2e9802000000b002b6f85a20afmr765816ljj.4.1689947243635; Fri, 21 Jul
 2023 06:47:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230721000643.44y5pd7sfcjzhbjw@House.clients.dxld.at>
 <87351h4rp7.fsf@ungleich.ch>
In-Reply-To: <87351h4rp7.fsf@ungleich.ch>
From: John Lauro <johnalauro@gmail.com>
Date: Fri, 21 Jul 2023 09:47:11 -0400
Message-ID: <CADGd2Dpxst52_OxMJBO19Qn11hrgxsXVaNnryb9YryipLvX8Gg@mail.gmail.com>
Subject: Re: Wg source address is too sticky for multihomed systems aka
 multiple endpoints redux
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, 
 wireguard@lists.zx2c4.com, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset="UTF-8"
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

I have a lots of multihomed routers setup for vpn site to site and
running bgp over the vpn mesh.

First, make sure these are all 0 as are multihomed.
cat $( find /proc/sys/net/ipv4 -name rp_filter )

The other thing I do is I run a different wireguard interface and peer
on a different port and interface.

With bgp on top, one multihomed router to another multihomed router
just ends up being multiple links it can route over and let linux/bgp
decide which ones to use and automatically fail over if one path goes
down.

That said, I don't have any NAT and both ends have fixed IPs, although
they are multihomed.

Can you create a separate wireguard interface for each physical
interface (I suggest a different port too).  Separate wireguard
interfaces should keep WG from having issues, and of course disabling
rp_filter to keep linux from having issues.


On Fri, Jul 21, 2023 at 4:05=E2=80=AFAM Nico Schottelius
<nico.schottelius@ungleich.ch> wrote:
>
>
> Good morning,
>
> Daniel Gr=C3=B6ber <dxld@darkboxed.org> writes:
> > [...]
> > I have a multihomed router [...]
>
> following up the thread from February, we migrated away from wireguard
> to openvpn on systems that have are multi homed.
>
> The main reason for that is the following type of connection to a high
> probability fails to work:
>
> 1) device -> [NAT/FIREWALL] -> multi homed server [IP A]
> 2) multi homed server [IP B] -- blocked by firewall as it does not match
> table entry
>
> This always happens when the server has as an asymmetric route back to
> the originating device, which really depends on the routing tables
> or routing policy present on the multi homed server.
>
> I'm a big fan of simplicity, but without an equivalent of openvpn's
> "local" statement, wireguard is deemed to be unusable in many network
> scenarios.
>
> Best regards,
>
> Nico
>
>
> --
> Sustainable and modern Infrastructures by ungleich.ch
