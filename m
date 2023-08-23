Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB97C3DA66
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 19:02:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29bd1fea;
	Wed, 23 Aug 2023 19:02:08 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b3ccccd8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 19:02:06 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2bcc331f942so1928871fa.0
 for <wireguard@lists.zx2c4.com>; Wed, 23 Aug 2023 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692817325; x=1693422125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6AqwDDeg4x5Kaq/Cjpy0zQfYDndzy1lfMtgpx208iY8=;
 b=aLnfWTyJh8mgKQZ5UzYdDEAprrXv4XdiMAtki+0rs4+sZhDhdYKmtwV001crsRGmbn
 n++GXiehysrzxDGfQ6/C4boGxw1VhL7wCtRYMVR0tMjwThmv2ENBMUEAPMF60bEz8A2x
 dv6i2aqQedWC5Oxq159M8E7cVU3ETXsGT7cZCzQgGamNLI2cmSgdFLA1CbOanF2BbFMP
 JX8Da1gb+ebmcdcl5JPewVeHvI9h8MpaRM8FLcu/LcQfi/APbYZOM1viveb+z1LiM0Bu
 pWYblZsxnbikciQC5Im9T//Dw8qgvc2NF3OLguS0oD/p+yGo1/CSObrFTZDjsh+VHMBp
 Agtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692817325; x=1693422125;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6AqwDDeg4x5Kaq/Cjpy0zQfYDndzy1lfMtgpx208iY8=;
 b=kOHvBJVN3QnDYLKJmdsvYXCPycST9Y/A3RJVs8gERLlLkF4w/PJuZTrDW9qzGvcg0/
 jpBMshHyz7UCVJSxdS//6QF7DfYazodepnONH5BOBx5L3iWanDeAvthb0z/A/clS2OWV
 6Cd4vZMAy9R8KeDjVqtfUdQ/FCR4rL+8hzC0/KII8XtTZL3PzP1nW5N+ViPuOy4wK2hY
 Q+E1IhOWXF4zCCrpZIKbITdjP03Dqy4R8WqYqxrSvjnbseldWobaN48ABujaowb5msaO
 Ua+uWz/hSL+JJE2Vp/pqlBDLEj1ex2b6feiQv/iKrm4vIzlcBj956PZlexH06k32s27c
 yNUw==
X-Gm-Message-State: AOJu0YzvWkDQwT0wmaw5a6wse+V5ZJRdvUAFyap+nuulHPo9cMn/rman
 pADojnlKLVSdOQjb+kJx/zjThU7DZzVzY8w1iYikTSHUD05fDw==
X-Google-Smtp-Source: AGHT+IEpNmvAytiP3h+3WCZlCyWMuB7qL0KzbBiMkz4RtyuvZ25sM2xNTSzbKcSP/AN3V8v4onNv7cusaSAlgU30Bu4=
X-Received: by 2002:a2e:9dd3:0:b0:2bc:bae4:a933 with SMTP id
 x19-20020a2e9dd3000000b002bcbae4a933mr3900254ljj.17.1692817325122; Wed, 23
 Aug 2023 12:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
 <20230823165840.7bf3b910@parrot>
 <20230823171451.ld2fwslkl6blv6y2@House.clients.dxld.at>
In-Reply-To: <20230823171451.ld2fwslkl6blv6y2@House.clients.dxld.at>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 23 Aug 2023 16:01:53 -0300
Message-ID: <CAJq09z7Mm30aa5CTM0d+Vjb+KV9r+1uQbrGd6ZY-qB09Ng_0xw@mail.gmail.com>
Subject: Re: IPv6 and PPPoE with MSSFIX
To: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: =?UTF-8?B?TWFyZWsgS8O8dGhl?= <m-k-mailling-list@mk16.de>, 
 wireguard@lists.zx2c4.com
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

> Hi,

Hi Daniel,

> On Wed, Aug 23, 2023 at 04:58:40PM +0200, Marek K=C3=BCthe wrote:
> > PPPoE adds 8 bytes of overhead so that an MTU of 1432 can be used. I
> > also have to do this at home with my DSL line for example.
> > The MTU should be set on each side (on both peers) for this to work.
>
> Oh, I just realized I used the 1432 MTU in my earlier reply based on
> Marek's math but since Luiz's underlay network is IPv6 this is not actual=
ly
> correct. MTU=3D1440 is only correct on top of IPv4, for IPv6 the "optimal=
"
> MTU is 1420 so with PPPoE involved that's MTU=3D1412.
>
>   1500 Ethernet payload
>    -40 IPv6 header
>     -8 UDP header
>    -32 Wg header
>     -8 PPPoE
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   1412 wg tunnel MTU

In my case, the PPPoE interface got MTU=3D1480. They might be stacking
something else on top of it or PPPoE might have optional fields. I
read somewhere that PPPoE might use either 8 or 20 bytes, but I'm not
an expert on PPPoE. If I don't control both sides, I would use 1400 by
default.

> --Daniel
