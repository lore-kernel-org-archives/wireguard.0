Return-Path: <SRS0=wYVp=MA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A437BC07E96
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jul 2021 05:07:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FCA619A5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jul 2021 05:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FCA619A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d882f9d5;
	Thu, 8 Jul 2021 05:07:46 +0000 (UTC)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [2607:f8b0:4864:20::92e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e5d90ba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Jul 2021 05:07:44 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id g4so1040489uap.5
 for <wireguard@lists.zx2c4.com>; Wed, 07 Jul 2021 22:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=lq08LVIYYze/YEmYMVOxjs/U3LPtsOkFZMAm4EDBq0Q=;
 b=UAjYumqZMQLTQ1s1eXf0DZS9zL9zm7xKxRaowJCkr8a3/NCW6mKYduNTVvFaQfNmGv
 2LxVuOjmlhndTNG+KlMl0ZeTVJI6VQdjXluKp/AB29j185Csil1ASiBB8AiOL2bAJuNQ
 YsKE0aG4Ljyut9HDk3JllVaNyQR5wqK6+wpyTrozO4p8EUapTe4dd/uqjdSj7EyVRnA6
 4qIgBrl9aF9SfjjxebJuezbSNJMqleeDeqHZ57wLhmADqy/BlYceV5NIzjRN+SWZpwzx
 vOPdwuOW2Ga0fAQBufxDe46fpNhRO18l79CswGDSGXED2owimhwBrsB76L6inmGBanpE
 gsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=lq08LVIYYze/YEmYMVOxjs/U3LPtsOkFZMAm4EDBq0Q=;
 b=MJV1C3OSwj4/iXKQLXcZk/5KxgZXo3/CLHAQYHKrcruNEPxc0JVbDWpGfgdXPLxB0C
 SSH1V96cCPXlM8pVOHFAZVq1AiFtjNuq5X7TJsdL0/05r5ixvQ6XZefOC0sP7VoaSj31
 1EL/0veQRKow7pZ7ZJJDUEopoBcku20UNoRSrVxCROh06yI1Rq3xHJF2FWPfCfZRDrzC
 GGgU/puy5WLvaUb8j9fIF9HE3ndAwexzHS/QuTguqylWqEANAuWLelTivrDOHw3dlXPb
 QnR7qgE4vksLWxLGFYnUFpnMJCcBaG1ER7hoHYj2EZc7n/RHkC8ZZagpILCvW6IxV4Fh
 Q2dw==
X-Gm-Message-State: AOAM533x1T7AuQpzUMOPCCW6sO/Khy5mgk98dTZudkDZinRhqhsu+hyi
 BKetSO6tdCIZA/3u1wkqd+am96k7m1ZkxDyPC2ylvJqlIkmv6A==
X-Google-Smtp-Source: ABdhPJyU6i76DWZ+jXi9Mjb9CY8eDEKItQjH1yZEFr/kNIIE/sd6vN4AWDNmwOs8gUXVyqzoL92bpJINeRIFDd+vD08=
X-Received: by 2002:ab0:140e:: with SMTP id b14mr27129500uae.94.1625720863248; 
 Wed, 07 Jul 2021 22:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAAntei-TBN5VUpnHLNExgg_4V80zU+PMAHcjVOqfmDbeJ3G1aA@mail.gmail.com>
In-Reply-To: <CAAntei-TBN5VUpnHLNExgg_4V80zU+PMAHcjVOqfmDbeJ3G1aA@mail.gmail.com>
From: zhengmian hu <huzhengmian@gmail.com>
Date: Thu, 8 Jul 2021 01:07:32 -0400
Message-ID: <CAAntei9qYK-cJgGzj9y0RTSLAqG54EnO2_9GDCpOmA5htNQcdg@mail.gmail.com>
Subject: Re: Wrong route on macOS
To: wireguard@lists.zx2c4.com
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

The macOS version is 11.4 (20F71).
I also found that when the client config contains two peers, one of
them just doesn't work.

zhengmian hu <huzhengmian@gmail.com> =E4=BA=8E2021=E5=B9=B47=E6=9C=888=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=8812:52=E5=86=99=E9=81=93=EF=BC=9A
>
> I expect no data to be sent to the server when I only visit the local
> address. However, this is not true for wireguard on macOS.
>
> Detailed setup:
> App:
> Downloaded from app store. App version: 1.0.13 (24), Go backend
> version: f9b48a96.
>
> Server:
> ```
> [Interface]
> Address =3D 10.110.210.1/24
> SaveConfig =3D true
> ListenPort =3D 51820
> PrivateKey =3D xxxxSERVER_PRIVATExxxx
>
> [Peer]
> PublicKey =3D xxxxCLIENT_PUBLICxxxx
> AllowedIPs =3D 10.110.210.7/32
> Endpoint =3D xxxx
> ```
>
> Client:
> ```
> [Interface]
> PrivateKey =3D xxxxCLIENT_PRIVATExxxx
> Address =3D 10.110.210.7/32
>
> [Peer]
> PublicKey =3D xxxxSERVER_PUBLICxxxx
> AllowedIPs =3D 10.110.210.1/24
> Endpoint =3D xxxSERVER_IPxxx:51820
> PersistentKeepalive =3D 25
> ```
>
> Test:
> ```
> =E2=9D=AF traceroute 10.110.210.7
> traceroute to 10.110.210.7 (10.110.210.7), 64 hops max, 52 byte packets
>  1  10.110.210.1 (10.110.210.1)  22.118 ms  19.846 ms  19.929 ms
>  2  10.110.210.7 (10.110.210.7)  40.627 ms  40.264 ms  43.752 ms
> ```
>
> Route:
> ```
> =E2=9D=AF netstat -rn -f inet
> Routing tables
>
> Internet:
> Destination        Gateway            Flags        Netif Expire
> default            192.168.0.1        UGScg          en0
> default            link#17            UCSIg        utun2
> 10.110.210/24      link#17            UCS          utun2
> 10.110.210.7       10.110.210.7       UH           utun2
> 127                127.0.0.1          UCS            lo0
> 127.0.0.1          127.0.0.1          UH             lo0
> ...
> 255.255.255.255/32 link#17            UCSI         utun2
> ```
>
> Expected behaviour:
> When using `traceroute 10.110.210.7`, the server `10.110.210.1` doesn't s=
how up.
>
> Other:
> I have tried the same configuration on Windows, and it works fine.
