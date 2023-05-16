Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E80EB64DC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Jun 2023 14:48:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id adb0e30f;
	Mon, 26 Jun 2023 14:43:15 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0bca6d2e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 May 2023 13:07:03 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965d2749e2eso2145505666b.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 May 2023 06:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20221208; t=1684242423; x=1686834423;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aKWWZum/oG7GXYM66c79qPNCotQM6ALvce7AnXpbxOY=;
 b=J8gz/LajoJsZc0V+KzuIbVGhydfQCQPn+7AslhXlyuw8tsJIw/J8piCTAEfYxn7d1W
 0z7nyVe3FaJ5e7EPWmiMHJS2eye7uc+t3ezixqbrrQURr/E7kVfIkLjwWnYRctnZBSpm
 0DurKA0cd2OKYeLDrXGz6X9OkNaIchdEgUv7hgFaUgZEHCMzB7xrVR2MmYHh7nBfCHKt
 /t8ERnierf4sDhO1pMSARZMTw17DoLV6JIhQwIkiYxM8C/26ryOb86zkBkLrC1GYk2fe
 3usL+ogn1VBlMA5kFWeSbzPrJ28efeGdJGqdxF46unzhnSpVgJxO3h8GxeH0fo7K3pxy
 VxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684242423; x=1686834423;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aKWWZum/oG7GXYM66c79qPNCotQM6ALvce7AnXpbxOY=;
 b=kM7756mK/xeE/g1iYRe2yAwBIStpaNkFlUzS6fdtM3cFdlZPaU2saXoUAnB2n5ALnH
 xD8poqXv+pfRBbHpTp5iuZrP5i1Bn6hpqd+bUUKdNc1QbWbRRLsX9+6LAKDypkI7MEXt
 p31j+tjScNZk78CVVF37S0FOAaIRddCKBqYv/H9Tgy0wIx57PyRIGdtOA2R8L9ymVe2a
 Hq8dqHcgVrXeBy3VezJdia5H/RtkHkFJ417z89qeACGLSvOZjSMeH//apNGfgV2MTP4v
 CVGR1uvpRIuzueySYeogli9fM1zOLelReRU98vKggEwlMKqJjng9QKq2kxtycYEGIyVJ
 1/DQ==
X-Gm-Message-State: AC+VfDzTxOxBHvlSuB3E8IUk5d8mkB1MNo5QFNiBYw8PhddU94sxevcg
 vvywkmsjihv/AhRWtFKfavRdOV51Q1te0QFduo1D3JtjMm0=
X-Google-Smtp-Source: ACHHUZ55SBZ0YM71iLuAY7ierYER5O4zhExD73UBPG7pKjbOSnwhnV1nuiJURgZcR+bhS8mJqIbnMxs2bJQrk5oDnNs=
X-Received: by 2002:a17:906:dac1:b0:961:8fcd:53cc with SMTP id
 xi1-20020a170906dac100b009618fcd53ccmr32902410ejb.42.1684242422735; Tue, 16
 May 2023 06:07:02 -0700 (PDT)
MIME-Version: 1.0
From: Anton <jnashicq@googlemail.com>
Date: Tue, 16 May 2023 17:06:25 +0400
Message-ID: <CAG_zMNLf17Pqzef2wpkp_SPqbi+9X6ipx0=p1mO93prDPBZkbQ@mail.gmail.com>
Subject: Possible race condition in Wireguard-go
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 26 Jun 2023 14:43:07 +0000
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

Hello all

I've found a possible race condition resulting in a panic in wireguard-go.
It happens when a client session disconnects, not often - once in a
few days with a few (5-10) sessions running.
The app I'm working on is based on wireguard-go/tun/netstack/tun.go code.

The problem reveals itself as a panic (see below).
It happens when peer.RoutineSequentialReceiver() go-routine does a
(*tun.Device).Write(), which calls gvisor (*Endpoint).InjectInbound(),
but endpoint could have been made nil to this point of time, b/c
tun.stack.RemoveNIC(1) called from tunDev.Close() assigns nil to
endpoint.

A possible solution:
https://github.com/mysteriumnetwork/wireguard-go/pull/6/files

If I move
> device.tun.device.Close()

below the
> device.RemoveAllPeers()

thus making peer-related operations to finish before the
device.tun.device.Close(), then crash doesn't happen.

By now the code has been running for a week.
I'll test it for another week or two.


Trace:

> 2023-05-04T00:34:10.000 INF services\wireguard\service\service.go:162 > C=
leaning up session 7f100e49-6517-4141-be66-1ac7c47ed5e8
> DEBUG: (myst) 2023/05/04 00:34:10 Device closing
> 2023-05-04T00:34:10.000 INF services\wireguard\service\stats_publisher.go=
:65 > Stopped publishing statistics for session 7f100e49-6517-4141-be66-1ac=
7c47ed5e8
> DEBUG: (myst) 2023/05/04 00:34:10 peer(/Zbg=E2=80=A6wTzA) - Routine: sequ=
ential receiver - stopped
> panic: runtime error: invalid memory address or nil pointer dereference
> [signal 0xc0000005 code=3D0x0 addr=3D0x20 pc=3D0x7ff62082c781]

> goroutine 485845 [running]:
> gvisor.dev/gvisor/pkg/tcpip/link/channel.(*Endpoint).InjectInbound(...)
>         C:/Users/user/go/pkg/mod/gvisor.dev/gvisor@v0.0.0-20221203005347-=
703fd9b7fbc0/pkg/tcpip/link/channel/channel.go:194
> github.com/mysteriumnetwork/node/services/wireguard/endpoint/netstack-pro=
vider.(*netTun).Write(0xc002211600, {0xc0020348a0?, 0x1, 0xc0015ac810?}, 0x=
10)
>         C:/Users/user/src/node/services/wireguard/endpoint/netstack-provi=
der/netstack.go:164 +0x141
> golang.zx2c4.com/wireguard/device.(*Peer).RoutineSequentialReceiver(0xc00=
1229c00, 0x1)
>         C:/Users/user/go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.0-202303=
25221338-052af4a8072b/device/receive.go:513 +0x23a
> created by golang.zx2c4.com/wireguard/device.(*Peer).Start
>         C:/Users/user/go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.0-202303=
25221338-052af4a8072b/device/peer.go:199 +0x2e5


A link to related code:

https://github.com/mysteriumnetwork/node/blob/5c109f64858da7c0c0add4e2dd7ce=
9e4e46c99e1/services/wireguard/endpoint/netstack-provider/netstack.go#L164


--
regards,
  Anton
