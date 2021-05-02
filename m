Return-Path: <SRS0=aU6O=J6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F708C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 13:04:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF5F661183
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 May 2021 13:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF5F661183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56d74132;
	Mon, 3 May 2021 13:02:31 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3504d8a7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 May 2021 21:44:30 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x19so5304793lfa.2
 for <wireguard@lists.zx2c4.com>; Sun, 02 May 2021 14:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=c1+zQZbFBZbySLRZmQbdyvoK3tCSxwar5EqHbYvXtQQ=;
 b=aUDRdyHZKDAr4bPNWm1TLYMexMdStMYRDaL11X7nS7GCgphh7D3NM4FaXkOs2rzV0n
 7apAEq5vynjFgJt3+c7iTS8XUcIM8/JauMB76smgaIsVess8qnVVUHLW2HNk5GT61Nxv
 5l1+f36n57aiUFiEhX6RNVMu/eDwLryPbsqaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c1+zQZbFBZbySLRZmQbdyvoK3tCSxwar5EqHbYvXtQQ=;
 b=gSMzNhzaogNJOyTvt3WVO1UksZqA7DtyZ6NR+zni1hSkkA7Cdb34fRoBz5JQrA9nye
 CJq9e+2V1Yo9Z/LdIQCZ9X7f9Fz0SLswA13S8+xbnvdxDIauJsWjEAJMIUeghjqOJDkR
 A8AcQp3vPvfBcu8CxzmrL2Dpg+2qyl17JRhxxxyiJYbd5KwD675NmHejx3C5cWI7qEKe
 XX1pXT/cwLBMJjU238Qsfz0M/iTAyceHGdzOJmwIh3Lsy5rWZBebVS2gPpIGVPeYDgEh
 sRK/NmIDqcI6lCFgXcU/ujkBBVmoiSJGuxGNnS33gNq0kW+jSaqaIx5/LG0t74LPjI94
 /31A==
X-Gm-Message-State: AOAM530Hd3B2/xhK5wciz6Iuur08H/6B8vpYlc3JTmhs4hZ//PzXgqB6
 e2THy/ZVCTQ8ugkkpB47lepv2aNoaUXI9MuOivDuViXwbmsyqw==
X-Google-Smtp-Source: ABdhPJzUU+DBGbkeX+gw5wOYwpk45Sil1BZPOZjAWvvcgs8dsyHoqvufBy6ZWS9kPyLh0YGUuXOj81tscYA1r41h9WI=
X-Received: by 2002:a19:8c09:: with SMTP id o9mr11060710lfd.560.1619991869624; 
 Sun, 02 May 2021 14:44:29 -0700 (PDT)
MIME-Version: 1.0
From: Manojav Sridhar <manojav@manojav.com>
Date: Sun, 2 May 2021 17:44:04 -0400
Message-ID: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
Subject: kp's and mem corruption?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 03 May 2021 13:02:30 +0000
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

Hi Jason,

Great work on the Freebsd kmod so far!

Couple of issues to report. I am running the wireguard-kmod-0.0.20210428
snapshot on my pfsense router. I am working with the pfSense-pkg-Wireguard
effort in building the WG package. Admittedly I am mostly testing and
providing some UI code. However I have come across 2 errors. First one  is
a KP that happened sometime today.

FreeBSD pfsense 12.2-STABLE FreeBSD 12.2-STABLE
1b709158e581(RELENG_2_5_0) pfSense  amd64

Here is the stack trace from the KP https://pastebin.com/4bjdzYas

db:0:kdb.enter.default> bt
Tracing pid 0 tid 100402 td 0xfffff800c67b6740
kdb_enter() at kdb_enter+0x37/frame 0xfffffe004d02c4b0
vpanic() at vpanic+0x197/frame 0xfffffe004d02c500
panic() at panic+0x43/frame 0xfffffe004d02c560
trap_fatal() at trap_fatal+0x391/frame 0xfffffe004d02c5c0
trap() at trap+0x67/frame 0xfffffe004d02c6d0
calltrap() at calltrap+0x8/frame 0xfffffe004d02c6d0
--- trap 0x9, rip = 0xffffffff840fd580, rsp = 0xfffffe004d02c7a0, rbp =
0xfffffe004d02c7e0 ---
noise_remote_index_insert() at noise_remote_index_insert+0xb0/frame
0xfffffe004d02c7e0
noise_consume_initiation() at noise_consume_initiation+0x6bb/frame
0xfffffe004d02ca10
wg_softc_handshake_receive() at wg_softc_handshake_receive+0x27a/frame
0xfffffe004d02cb20
gtaskqueue_run_locked() at gtaskqueue_run_locked+0x121/frame
0xfffffe004d02cb80
gtaskqueue_thread_loop() at gtaskqueue_thread_loop+0xb6/frame
0xfffffe004d02cbb0
fork_exit() at fork_exit+0x7e/frame 0xfffffe004d02cbf0
fork_trampoline() at fork_trampoline+0xe/frame 0xfffffe004d02cbf0


Second issue is that I am seeing memory silent corruption where the pfSense
UI stops responding and serves up invalid files. Reboot fixes it. I have
NOT noticed this issue with the 0415 snapshot; this happened both in the
0424 and 0428 snapshots. While I cannot definitively say its wg related,
that is the only bit changing on the boxes.

Thanks
Manoj
