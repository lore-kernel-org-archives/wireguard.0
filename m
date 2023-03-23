Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDECEC74A5B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Mar 2023 17:01:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d16ebd57;
	Thu, 23 Mar 2023 17:01:07 +0000 (UTC)
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [2001:4860:4864:20::30])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8703c815
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2023 17:00:31 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-177b78067ffso23327347fac.7
 for <wireguard@lists.zx2c4.com>; Thu, 23 Mar 2023 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tailscale.com; s=google; t=1679590829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2uMlkG7Q9xqveusXyUVIh+J9XUZnPS3/LX+G+W38l4=;
 b=EUovIZ02pXDOWvmLFXAW4R/JoTXsVpT0RNTnOBN6PubizJwPgl7F5F0sOUz3GE3507
 SdEXc7B3SgrzC7aJcEQEzLVel3ypw2SF7E4DkHYrNYQ782yLrh05TpxPj0ntkSxLLspT
 e6n9sTkx+apTUEg5rW6NE2Nd2+iwFbmte8j3OnPCkKYwsCCQOkMTBV9oYLEgEMEhfVJ0
 dv3OyZk4atlXlkaZWPvwYT0N0S/PU3JtUhAO9bbKmJC7lU8/EDy2YfmsuocVPCUGrrwe
 abpRzQv5X8WuzIwHron1PdxcmusDhPyyJSFpYTX3SWBME5/nUpJM3+C0tPpbbQDYLqs3
 LRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679590829;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2uMlkG7Q9xqveusXyUVIh+J9XUZnPS3/LX+G+W38l4=;
 b=iwVYPiV5WfUTDZF4e4jpMVlw8agvkqJWGOllCOUx3VKYJkpYHzFtymoxSLwRv2l4F5
 KGUtXI3ivoq8c0Mv0Ad6/Utp1/njMndotYhmK1VSFMB3Fy+ZPcM+OotJRA03HJu4ftFP
 76mhncXztAiCaUnwj4gFYITX8eSVJxRYUkuV0MiiurcOQgKBEkv7L+N/OQqXAS+TIP5G
 8uY+e4oSJIAZcNtSC5FpU9DRTMPvB4aVp8PG76qXpU3CtVC75Ebnqf8qQWIFIz6d9JeQ
 fLhXm60Mzuf45SgfaMVhbKgN4zb4pKqhdUMlpWyIF/d5aOcB7kvjJavNqWlBW/vLeJTP
 Tn3A==
X-Gm-Message-State: AAQBX9cRL/dDv+Fuod3K8NuUiF33eoY8M1W1wv5N8QWG3YORLHaufwnE
 ziLN+/dvp6w5/a4ODfuxGcWChVxs3Pd521YMyNe+I6Wle09FHNXJmSg=
X-Google-Smtp-Source: AKy350Y5C1c9zOhn3HgdY6CkaEFkSnn+v7e6RZd9J0Wgf2VnvxG2Eu4WKiUNGmUUixf8FP8QR10dZMLr+r/zrFwsg7c=
X-Received: by 2002:a05:6870:55:b0:177:c436:feb8 with SMTP id
 21-20020a056870005500b00177c436feb8mr21910oaz.4.1679590829685; Thu, 23 Mar
 2023 10:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <ac87f86f-6837-4e0e-ec34-1df35f52540e@lv6.tw>
In-Reply-To: <ac87f86f-6837-4e0e-ec34-1df35f52540e@lv6.tw>
From: Jordan Whited <jordan@tailscale.com>
Date: Thu, 23 Mar 2023 10:00:19 -0700
Message-ID: <CABprzAaZC86FosOK7A__LB7LzULLYv=-y539y5VHacttYJwSmg@mail.gmail.com>
Subject: Re: wireguard-go: data race introduced in recent commit 9e2f386
To: lsc <lsc@lv6.tw>
Cc: wireguard@lists.zx2c4.com, james@tailscale.com, Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 23 Mar 2023 17:01:06 +0000
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

SC, thank you for reporting. Do you happen to have a stack trace from
one of the panics?

On Thu, Mar 23, 2023 at 2:01=E2=80=AFAM lsc <lsc@lv6.tw> wrote:
>
> Hi,
>
> Not sure if this is the correct place for bug reports, hope it's okay :)
>
> I found my wireguard-go server (built from current ToT 1417a47) always
> panicking when I ran speedtest on a client via the server. I rebuilt the
> server with data race detector (`go build -race`) and got the following
> trace:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> WARNING: DATA RACE
> Read at 0x00c00043b2f8 by goroutine 49:
>    golang.zx2c4.com/wireguard/conn.setSrcControl()
>        /home/lsc36/wireguard-go/conn/sticky_linux.go:76 +0x8c
>    golang.zx2c4.com/wireguard/conn.(*StdNetBind).send4()
>        /home/lsc36/wireguard-go/conn/bind_std.go:346 +0x174
>    golang.zx2c4.com/wireguard/conn.(*StdNetBind).Send()
>        /home/lsc36/wireguard-go/conn/bind_std.go:332 +0x1d4
>    golang.zx2c4.com/wireguard/device.(*Peer).SendBuffers()
>        /home/lsc36/wireguard-go/device/peer.go:126 +0x18c
>    golang.zx2c4.com/wireguard/device.(*Peer).RoutineSequentialSender()
>        /home/lsc36/wireguard-go/device/send.go:519 +0x458
>    golang.zx2c4.com/wireguard/device.(*Peer).Start.func2()
>        /home/lsc36/wireguard-go/device/peer.go:198 +0x40
>
> Previous write at 0x00c00043b2f8 by goroutine 47:
>    golang.zx2c4.com/wireguard/conn.(*StdNetEndpoint).ClearSrc()
>        /home/lsc36/wireguard-go/conn/bind_std.go:100 +0x48
>    golang.zx2c4.com/wireguard/conn.getSrcFromControl()
>        /home/lsc36/wireguard-go/conn/sticky_linux.go:18 +0x3c
>    golang.zx2c4.com/wireguard/conn.(*StdNetBind).makeReceiveIPv4.func1()
>        /home/lsc36/wireguard-go/conn/bind_std.go:232 +0x350
>    golang.zx2c4.com/wireguard/device.(*Device).RoutineReceiveIncoming()
>        /home/lsc36/wireguard-go/device/receive.go:107 +0x3ac
>    golang.zx2c4.com/wireguard/device.(*Device).BindUpdate.func3()
>        /home/lsc36/wireguard-go/device/device.go:530 +0x4c
>
> Goroutine 49 (running) created at:
>    golang.zx2c4.com/wireguard/device.(*Peer).Start()
>        /home/lsc36/wireguard-go/device/peer.go:198 +0x300
>    golang.zx2c4.com/wireguard/device.(*ipcSetPeer).handlePostConfig()
>        /home/lsc36/wireguard-go/device/uapi.go:268 +0x164
>    golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation()
>        /home/lsc36/wireguard-go/device/uapi.go:160 +0x35c
>    golang.zx2c4.com/wireguard/device.(*Device).IpcHandle()
>        /home/lsc36/wireguard-go/device/uapi.go:428 +0x248
>    main.main.func4.1()
>        /home/lsc36/wireguard-go/main.go:245 +0x4c
>
> Goroutine 47 (running) created at:
>    golang.zx2c4.com/wireguard/device.(*Device).BindUpdate()
>        /home/lsc36/wireguard-go/device/device.go:530 +0x4b8
>    golang.zx2c4.com/wireguard/device.(*Device).handleDeviceLine()
>        /home/lsc36/wireguard-go/device/uapi.go:223 +0x45c
>    golang.zx2c4.com/wireguard/device.(*Device).IpcSetOperation()
>        /home/lsc36/wireguard-go/device/uapi.go:183 +0x210
>    golang.zx2c4.com/wireguard/device.(*Device).IpcHandle()
>        /home/lsc36/wireguard-go/device/uapi.go:428 +0x248
>    main.main.func4.1()
>        /home/lsc36/wireguard-go/main.go:245 +0x4c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> The bug looks introduced by a recent commit 9e2f386 "conn, device, tun:
> implement vectorized I/O on Linux". Without much knowledge to the
> codebase, it seems to me that Endpoint is supposed to be guarded by the
> RWMutex embedded in Peer, yet the change introduced a write without
> locking the mutex (`ep.ClearSrc()` called from sticky_linux.go:18).
>
> In addition, I found it weird that Endpoint objects are reused via
> `endpointPool`. The docstring suggests "Endpoints are immutable, so we
> can re-use them" but that doesn't seem true.
>
> Added authors/reviewers of 9e2f386 to cc. Would you take a look?
>
> Regards,
> SC
>
