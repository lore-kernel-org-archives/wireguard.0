Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045F2C7113B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 23:31:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59f2b257;
	Wed, 23 Aug 2023 23:31:48 +0000 (UTC)
Received: from mail-il1-x162.google.com (mail-il1-x162.google.com
 [2607:f8b0:4864:20::162])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 47c319fe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 20:47:41 +0000 (UTC)
Received: by mail-il1-x162.google.com with SMTP id
 e9e14a558f8ab-34b4b2608e3so19396705ab.3
 for <wireguard@lists.zx2c4.com>; Wed, 23 Aug 2023 13:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692823660; x=1693428460;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EeUMBL8J2+MKiX6cdx35XzWLRbrmjHX99nubGCiUCek=;
 b=UaJJbAuGFp30BAuGALrc3LxEjMSalWSSPNIrM5S3AW4hdwzUJGhkjIUjMqaoASXET1
 o+tmYf+YR47QogMkYkMntH2eomIDxXCcRwLJ0r+crf+Rf5RAgrRS3CwQGiC+xlrQRAaM
 9Sg9J1wkGqB3CevASnX7hJmFbfBz7ikDRrqtfByJ+4x01yuu6Wzt4Wu7dOc5nH8i33J8
 qRHAWNA7F1RW5dCYb2/D8sV1Afg5n3HoyZKAV9okCybGc88enwLDBSH87A2CZvhI1eHz
 L/odHcZZNY6WK4aE43Y7GOy3DJfHJnxtw+9i40AFtWjA/M6zR5OMhiZc8OQfOec+N66n
 sgKQ==
X-Gm-Message-State: AOJu0Yz/1CywTRLETMEEOYS3ng1fUPqOfxBnm/nIoqur+2UWVbnHZQ2O
 65T0BTaKd0V9APVSjSuRBKInhsxE4z++liHfl6yscQiQX+8tqUOv7/aZnFn8
X-Google-Smtp-Source: AGHT+IFw9AngzB0bXLnIu1AFdQgMUbVBU22Glj4pZ0R/xFexBe4sSBhKmTvT6o7d/Oxfe18/iOSqgzBdyALl
X-Received: by 2002:a92:cd86:0:b0:33a:a6de:65be with SMTP id
 r6-20020a92cd86000000b0033aa6de65bemr4184697ilb.21.1692823659699; 
 Wed, 23 Aug 2023 13:47:39 -0700 (PDT)
Received: from restore.menlosecurity.com ([13.56.32.44])
 by smtp-relay.gmail.com with ESMTPS id
 x18-20020a92de12000000b0034992fd508csm621754ilm.38.2023.08.23.13.47.39
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Aug 2023 13:47:39 -0700 (PDT)
X-Relaying-Domain: menlosecurity.com
Received: from safemail-prod-02900067cr-re.menlosecurity.com (13.56.32.45)
 by restore.menlosecurity.com (13.56.32.44)
 with SMTP id 4b1a5040-41f6-11ee-b71d-1b6a3dac80bd;
 Wed, 23 Aug 2023 20:47:39 GMT
Received: from mail-pj1-f70.google.com (209.85.216.70)
 by safemail-prod-02900067cr-re.menlosecurity.com (13.56.32.45)
 with SMTP id 4b1a5040-41f6-11ee-b71d-1b6a3dac80bd;
 Wed, 23 Aug 2023 20:47:39 GMT
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-26d50941f68so6989041a91.1
 for <wireguard@lists.zx2c4.com>; Wed, 23 Aug 2023 13:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=menlosecurity.com; s=google; t=1692823657; x=1693428457;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EeUMBL8J2+MKiX6cdx35XzWLRbrmjHX99nubGCiUCek=;
 b=JGLOKF8/ku7+6Cf5YTYXznilZcQumfSSkh7ev5oJ96LxlpR/GudRjnkKVZuV8T/Se8
 ZM7+KHoYtyAbfASjufz8eYtRqKcDK6qoEeAxERiHBF+n7vrqtPe4Pb8/i8Ssc3fS4PjJ
 frH0nyJSxxQd/+0qNnq5zAGZ/s7Pkh4mlHibo=
X-Received: by 2002:a17:90a:f3d5:b0:263:f630:228f with SMTP id
 ha21-20020a17090af3d500b00263f630228fmr13004221pjb.23.1692823656731; 
 Wed, 23 Aug 2023 13:47:36 -0700 (PDT)
X-Received: by 2002:a17:90a:f3d5:b0:263:f630:228f with SMTP id
 ha21-20020a17090af3d500b00263f630228fmr13004207pjb.23.1692823656420; Wed, 23
 Aug 2023 13:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
 <20230823165840.7bf3b910@parrot>
 <20230823171451.ld2fwslkl6blv6y2@House.clients.dxld.at>
 <CAJq09z7Mm30aa5CTM0d+Vjb+KV9r+1uQbrGd6ZY-qB09Ng_0xw@mail.gmail.com>
In-Reply-To: <CAJq09z7Mm30aa5CTM0d+Vjb+KV9r+1uQbrGd6ZY-qB09Ng_0xw@mail.gmail.com>
From: Hugo Slabbert <hugo.slabbert@menlosecurity.com>
Date: Wed, 23 Aug 2023 13:47:25 -0700
Message-ID: <CAOx9P4_HZeioFjGSb0hqFNEdk8dci+q6x=j7L9QGMoX-seUKdQ@mail.gmail.com>
Subject: Re: IPv6 and PPPoE with MSSFIX
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, 
 =?UTF-8?B?TWFyZWsgS8O8dGhl?= <m-k-mailling-list@mk16.de>, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 23 Aug 2023 23:31:43 +0000
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

> In my case, the PPPoE interface got MTU=3D1480. They might be stacking
> something else on top of it or PPPoE might have optional fields. I
> read somewhere that PPPoE might use either 8 or 20 bytes, but I'm not
> an expert on PPPoE.

For ref, an L2TP + PPPoE stack isn't too uncommon, and gives you 20
bytes overhead from the 12 bytes L2TP + 8 bytes PPPoE.


On Wed, Aug 23, 2023 at 12:02=E2=80=AFPM Luiz Angelo Daros de Luca
<luizluca@gmail.com> wrote:
>
> > Hi,
>
> Hi Daniel,
>
> > On Wed, Aug 23, 2023 at 04:58:40PM +0200, Marek K=C3=BCthe wrote:
> > > PPPoE adds 8 bytes of overhead so that an MTU of 1432 can be used. I
> > > also have to do this at home with my DSL line for example.
> > > The MTU should be set on each side (on both peers) for this to work.
> >
> > Oh, I just realized I used the 1432 MTU in my earlier reply based on
> > Marek's math but since Luiz's underlay network is IPv6 this is not actu=
ally
> > correct. MTU=3D1440 is only correct on top of IPv4, for IPv6 the "optim=
al"
> > MTU is 1420 so with PPPoE involved that's MTU=3D1412.
> >
> >   1500 Ethernet payload
> >    -40 IPv6 header
> >     -8 UDP header
> >    -32 Wg header
> >     -8 PPPoE
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >   1412 wg tunnel MTU
>
> In my case, the PPPoE interface got MTU=3D1480. They might be stacking
> something else on top of it or PPPoE might have optional fields. I
> read somewhere that PPPoE might use either 8 or 20 bytes, but I'm not
> an expert on PPPoE. If I don't control both sides, I would use 1400 by
> default.
>
> > --Daniel
