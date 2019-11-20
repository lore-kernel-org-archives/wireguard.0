Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA55C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:05:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBDCC20678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=benburkert-com.20150623.gappssmtp.com header.i=@benburkert-com.20150623.gappssmtp.com header.b="leJhytg3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBDCC20678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benburkert.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd3b960d;
	Wed, 27 Nov 2019 09:04:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e95f3a04
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Nov 2019 19:58:27 +0000 (UTC)
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dae3e562
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Nov 2019 19:58:26 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id k15so562455vsp.2
 for <wireguard@lists.zx2c4.com>; Wed, 20 Nov 2019 11:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=benburkert-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=fhR0MjoNkvUN1UlcVPJ4l+6qodpO2PAydATLAzldQhE=;
 b=leJhytg3+Ak0bwGDMV9ljLDMZD+SIKEt12X3Z+iep84RrwOGCOuVZ5ztTfOPVUfMEq
 yygT7WhDN4DlKY2HFtHernuzNAue8p/F2B+W1IE8n2C5HZAGH5dkEPomcDDbow4fpvjV
 k2Rb3MoL/JinM4HdmybYOnUza8MyDABeoUmL6gOgmBuMhwnVnZuTYbHQw7cd3oYAWN30
 sRglokiqMkNPUSu3Z2c8Ser1bsHTAv37yr9LUmIyanUM3JWIAzSB5BhtcItP7V5yatRg
 SD9I0DVIXVR1SgPOCDCI4YofnJtPxOJbaDAbknSzhtdcE8LcPWiHqHosRL8VBN1m96FK
 VfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fhR0MjoNkvUN1UlcVPJ4l+6qodpO2PAydATLAzldQhE=;
 b=dNMMiaeLP08i5dFYVNifruIOhUBVr0VUQBe5LIaBh9KyfTEU/uq6bWR51nkqpNiaI2
 gH/wy6QWxYPg/4Fp/oyDayWr19rYgMfHeaJ1BIFyYhGonQB9SxMG/bS5zuLqvlAiWr4Y
 9t3nOGxOwCxQ7TE6MJw/05rW3yW5FovzhKDuD5bFIfiqSc2nsMSvfhoKbdYJORxr93Bz
 Ha0q8EbcNE8CJhivonrxViKeKK0pwOUriSzsKQFV3MsXYVviT/9xyp98UH5JnGVrcTCI
 CJF/EDtRCHyoIFddCIynZOfC2E6grjjCK0gYFB4v5N/2OyW814gXJePzXokZf+wmV/ok
 buVw==
X-Gm-Message-State: APjAAAU0pfhHVE6yXTpeqE7GzimiQsJYQLT4HUmt52V984ROhU8uXBdB
 ge3nj4ya+Fjpi799Ufl/si9525Yzhua49c7txI/M3gVKJ4I=
X-Google-Smtp-Source: APXvYqzFLG9lcFGqUUjQeWwOmvdzrctxC04P1wj0kwYn0Q31ssIIcveRKTkmHjCXtxpTfTIuz5jX1Ag3rp6oy9Y3tO4=
X-Received: by 2002:a67:f508:: with SMTP id u8mr3105910vsn.116.1574279906095; 
 Wed, 20 Nov 2019 11:58:26 -0800 (PST)
MIME-Version: 1.0
From: Ben Burkert <ben@benburkert.com>
Date: Wed, 20 Nov 2019 14:58:15 -0500
Message-ID: <CAMi2xeQs3hCB9DEZZOZMUQyx6r_HT6Qh_MAnBgNvhOmfJvrChg@mail.gmail.com>
Subject: wireguard-go data race in Peer.SendBuffer()
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:04:23 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Greetings,

The Go race detector is reporting a data race in my application due to
what appears to be concurrent calls to Peer.SendHandshakeInitiation().
It seems that it is unsafe to call golang.org/x/sys/unix.SendmsgN()
concurrently due to the sockaddr() implementation which mutates
memory: https://github.com/golang/sys/blob/bd437916bb0eb726b873ee8e9b2dcf212d32e2fd/unix/syscall_aix.go#L53-L55

I believe this data race can be fixed by switching to an exclusive
lock in the Peer.SendBuffer() method:
https://github.com/WireGuard/wireguard-go/blob/f2ea85e9f9921bc29a7dcb2007212b153540c01a/device/peer.go#L144-L145

If it helps I can mail a patch to this effect. I've copied the output
of the race detector below.

Best,
-Ben

==================
==================
WARNING: DATA RACE
Write at 0x00c0011f2740 by goroutine 27:
  golang.org/x/sys/unix.(*SockaddrInet4).sockaddr()
      /go/pkg/mod/golang.org/x/sys@v0.0.0-20191105231009-c1f44814a5cd/unix/syscall_linux.go:384
+0x114
  golang.org/x/sys/unix.SendmsgN()
      /go/pkg/mod/golang.org/x/sys@v0.0.0-20191105231009-c1f44814a5cd/unix/syscall_linux.go:1304
+0x288
  golang.zx2c4.com/wireguard/device.send4()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/conn_linux.go:485
+0x11f
  golang.zx2c4.com/wireguard/device.(*nativeBind).Send()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/conn_linux.go:268
+0x1d6
  golang.zx2c4.com/wireguard/device.(*Peer).SendBuffer()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/peer.go:151
+0x285
  golang.zx2c4.com/wireguard/device.(*Peer).SendHandshakeInitiation()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/send.go:163
+0x692
  golang.zx2c4.com/wireguard/device.(*Device).RoutineReadFromTUN()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/send.go:318
+0x4b8

Previous write at 0x00c0011f2740 by goroutine 386:
  golang.org/x/sys/unix.(*SockaddrInet4).sockaddr()
      /go/pkg/mod/golang.org/x/sys@v0.0.0-20191105231009-c1f44814a5cd/unix/syscall_linux.go:384
+0x114
  golang.org/x/sys/unix.SendmsgN()
      /go/pkg/mod/golang.org/x/sys@v0.0.0-20191105231009-c1f44814a5cd/unix/syscall_linux.go:1304
+0x288
  golang.zx2c4.com/wireguard/device.send4()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/conn_linux.go:485
+0x11f
  golang.zx2c4.com/wireguard/device.(*nativeBind).Send()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/conn_linux.go:268
+0x1d6
  golang.zx2c4.com/wireguard/device.(*Peer).SendBuffer()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/peer.go:151
+0x285
  golang.zx2c4.com/wireguard/device.(*Peer).SendHandshakeInitiation()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/send.go:163
+0x692
  golang.zx2c4.com/wireguard/device.expiredRetransmitHandshake()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/timers.go:110
+0x40c
  golang.zx2c4.com/wireguard/device.(*Peer).NewTimer.func1()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/timers.go:42
+0xd8

Goroutine 27 (running) created at:
  golang.zx2c4.com/wireguard/device.NewDevice()
      /go/pkg/mod/golang.zx2c4.com/wireguard@v0.0.20191012/device/device.go:322
+0x5e8
  main.main()
      /go/src/x/main.go:102 +0x58e

Goroutine 386 (finished) created at:
  time.goFunc()
      /usr/local/go/src/time/sleep.go:168 +0x51
==================
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
