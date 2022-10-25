Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C82C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  4 Nov 2022 15:15:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aefea068;
	Fri, 4 Nov 2022 15:15:32 +0000 (UTC)
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com
 [2607:f8b0:4864:20::a36])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1b94679b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Oct 2022 06:58:45 +0000 (UTC)
Received: by mail-vk1-xa36.google.com with SMTP id n78so4581100vkf.12
 for <wireguard@lists.zx2c4.com>; Mon, 24 Oct 2022 23:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=rM3MX00ha85A8KKL4Yyz5Du6qs/t3JgSKEWWrCAv9WM=;
 b=FOc9RP7krz+bjHcQue3rOjkW57iuq3iqy/ecfBKIfoQVEiYin0F2jA8SLI2pf/aNW8
 nr2b3TXP5GZTciXYuo87l4E11ljUHWPG46V0DqzfTX5SPsrcD3AJc/3cuhBZYf7cIQxw
 thNv3yQrwEItapQTPSw0kU6XyLg5s2FPOvOS7DfkHBY2O2ZREtetCo/0dD0jmqu3bhPj
 zDl3eUtc7a3/cYUdLFM8TCdI5UwoLUtaQ4Xq9766COqLvwg0+K6ocYpwkzqYX4yC29a5
 CMy9y35Tk4X4L6/XNv3q2cmYd5ZZ62o7/vOSYDiushtxxcaxRxCcaIl8K7ErXokkDHGf
 0rSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rM3MX00ha85A8KKL4Yyz5Du6qs/t3JgSKEWWrCAv9WM=;
 b=kxNywwnAyPgMptwxOAFOf6SQL1gOKchJco+pqioiZMXN6zk3GCwK8zHEsO77hjeQ72
 7MNKcBliQXLODe8UtftX8J45Bgqw/U7+s0cqw7DpBW8+0OnS4+VpmVlPwG41QivCDxnh
 A1YuDMzF45jv7Qph7CMbicNsQA/bLv+U/SnzqoqEEZ+lXvcbEuH0DwK7ul8e1fQim9+V
 Y31v+qeCw3anQ2623i902Hyd4rGwUoKnNmqUISTHAgOzUIm6tZuk8nFoJn0LWJ3VQ2he
 ViYTFYX4QJBFTSYC0hZOUu2CL4hgj7oL/ZEu1YjuRuC+HSj66k/VhPHrNYucCdnAV6c0
 Iggw==
X-Gm-Message-State: ACrzQf0kw8tH2F9jnNh+jorSzmgfo20Mr/sPO7Xdgs7G6Slw4JetHXtt
 VUblcRAqV9hgu3RsvqhLjrrzRG7y7IiB/6kfGTm/pdOqef8=
X-Google-Smtp-Source: AMsMyM5GsRvtGGrBejSAwcoPXRZdgdgCr1ojs7etegybvGfDNCLVu6k2s8NX3uhbqbCpb5g0piHuY94T8z/03bjs6Ts=
X-Received: by 2002:a1f:ecc6:0:b0:3aa:a785:5e2f with SMTP id
 k189-20020a1fecc6000000b003aaa7855e2fmr20111192vkh.6.1666681124397; Mon, 24
 Oct 2022 23:58:44 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Sanderson <kyle.leet@gmail.com>
Date: Mon, 24 Oct 2022 23:58:33 -0700
Message-ID: <CACsaVZ+rAuNX=iTbtmm18Dbq2y66Fxj=_3Vf-PHwLR03ENQEBQ@mail.gmail.com>
Subject: absolutely terrible wireguard performance on a 4ghz box - need tuning
 help
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 04 Nov 2022 15:15:31 +0000
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

hi wireguard,

APU2C4 - AMD Embedded G series GX-412TC, 1 GHz quad Jaguar core with
64 bit and AES-NI support

There has to be a way to improve this. I'm getting 20-40MB/s (causing
a system load of 6 on this poor box) where SSHFS in comparison is
still able to fly. Traffic not traversing the tunnel is also,
strangely, impacted as well. I have the Intel i210AT controller, which
doesn't appear to have any offloading to it when wireguard is present.

ksoftirqd/0 spins at around 50%, ksoftirqd/1 spins around 20%, and the
other 12(!) wg-crypt threads hover around 20% respectively.
If I disable wg I'm able to get line-rate through acceleration.
The other 2 ksoftirqds sit around 5% respectively. kworker events
jumping between 10-25%.

Regrettably openwrt doesn't appear to have perf available...

K.
