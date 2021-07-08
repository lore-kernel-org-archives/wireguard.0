Return-Path: <SRS0=wYVp=MA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6B6C07E96
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jul 2021 04:55:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 999A161CD6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jul 2021 04:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 999A161CD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6550631;
	Thu, 8 Jul 2021 04:53:03 +0000 (UTC)
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com
 [2607:f8b0:4864:20::930])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68879cdb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Jul 2021 04:53:01 +0000 (UTC)
Received: by mail-ua1-x930.google.com with SMTP id n61so1748334uan.2
 for <wireguard@lists.zx2c4.com>; Wed, 07 Jul 2021 21:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=P5xPXfhVOLo1LUeT7IHjSVhtpKfYms9Yf9vikyjUHl4=;
 b=HGRkBAzRND7BpEiMkffIKzTsS5+B/jzl8K/s0fLLnnsV9rLvBdJTL4Hr+OcXQ8PhLU
 SjtA78Em0lcfOGo2JMksNspx2WwQfM32Jf+mLmdZWVw5MPHDYoD9dUvj08Xyf4ZIx1zx
 MEHvPzXZvKOFd4M8+TdY3uPnarjAyCoO/F5HqrqGvIomppeCh7Hj2MAT0bkv9xTIyMSv
 RNZjr37PN4pArhiuV+vDFzjdnbYd+GLM/jlXWwWiTguNCGSsF3YFUP5lW2i/s7TRbmxG
 3a0RAOeNSTwSJGILNRT1P6iiihjpCXoMAaBVtMKlX4lPRlvNSJlQbfe1gZ85hi6NXT0O
 7P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=P5xPXfhVOLo1LUeT7IHjSVhtpKfYms9Yf9vikyjUHl4=;
 b=d/JV5SD49Mi4EvnsPj+hPcU+0yLEdwhWozM4MWnigP4+tRxYgow21uhKpZAlCRGjlr
 B1Lm6/tJsZrma4/F9ge8Y+fZUCNHgjsgirAs5PnIquzTAUfHjTPNfwbzlc+hoX1gQHB6
 n+4NTKECpbpXmFiPEcS1ykFJHxbxgB8l7b7F0nWSAZK+ezEQDrc07lGVbZjuOp3/bebM
 qgBC42ZYhBXoNspKZz4exaBIva+WMSUemUiRd44OlZuYg1saxYLbUgMjHW47vrzHMBOm
 fgVybTVe+X+1vYbOSNNNNP71wya2alIK7ic+WMXwxZSFGYe01yKe7l0cwNm01PxcKVUM
 agvQ==
X-Gm-Message-State: AOAM530RfznWXem83nvsNrzxKRl/nJujHPLVprSaQM5TAvReIcMsCqM3
 FpE3NR9MpMf4u+dx12Sc5YMmPPIl3+nKD7tmf0fXqjML8LW8Iw==
X-Google-Smtp-Source: ABdhPJx2I4srR2cIrnQHclbe+HQYnXp/GVR5AhpyLzsvzHLGHWEc+kVB3MFzByUWetS8Gt5zT5sPgRhyvNoKPTLBRAY=
X-Received: by 2002:ab0:48d1:: with SMTP id y17mr27250712uac.96.1625719980654; 
 Wed, 07 Jul 2021 21:53:00 -0700 (PDT)
MIME-Version: 1.0
From: zhengmian hu <huzhengmian@gmail.com>
Date: Thu, 8 Jul 2021 00:52:50 -0400
Message-ID: <CAAntei-TBN5VUpnHLNExgg_4V80zU+PMAHcjVOqfmDbeJ3G1aA@mail.gmail.com>
Subject: Wrong route on macOS
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

I expect no data to be sent to the server when I only visit the local
address. However, this is not true for wireguard on macOS.

Detailed setup:
App:
Downloaded from app store. App version: 1.0.13 (24), Go backend
version: f9b48a96.

Server:
```
[Interface]
Address =3D 10.110.210.1/24
SaveConfig =3D true
ListenPort =3D 51820
PrivateKey =3D xxxxSERVER_PRIVATExxxx

[Peer]
PublicKey =3D xxxxCLIENT_PUBLICxxxx
AllowedIPs =3D 10.110.210.7/32
Endpoint =3D xxxx
```

Client:
```
[Interface]
PrivateKey =3D xxxxCLIENT_PRIVATExxxx
Address =3D 10.110.210.7/32

[Peer]
PublicKey =3D xxxxSERVER_PUBLICxxxx
AllowedIPs =3D 10.110.210.1/24
Endpoint =3D xxxSERVER_IPxxx:51820
PersistentKeepalive =3D 25
```

Test:
```
=E2=9D=AF traceroute 10.110.210.7
traceroute to 10.110.210.7 (10.110.210.7), 64 hops max, 52 byte packets
 1  10.110.210.1 (10.110.210.1)  22.118 ms  19.846 ms  19.929 ms
 2  10.110.210.7 (10.110.210.7)  40.627 ms  40.264 ms  43.752 ms
```

Route:
```
=E2=9D=AF netstat -rn -f inet
Routing tables

Internet:
Destination        Gateway            Flags        Netif Expire
default            192.168.0.1        UGScg          en0
default            link#17            UCSIg        utun2
10.110.210/24      link#17            UCS          utun2
10.110.210.7       10.110.210.7       UH           utun2
127                127.0.0.1          UCS            lo0
127.0.0.1          127.0.0.1          UH             lo0
...
255.255.255.255/32 link#17            UCSI         utun2
```

Expected behaviour:
When using `traceroute 10.110.210.7`, the server `10.110.210.1` doesn't sho=
w up.

Other:
I have tried the same configuration on Windows, and it works fine.
