Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0199C65C33
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AB7C20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwnbcR3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AB7C20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20b00ba6;
	Sun, 7 Oct 2018 14:11:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cda3797
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:14 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92a63bc8
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:14 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 206-v6so5710035wmb.5
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L69SNNap7Afn2vvutcRxGzj8U9NpH1dTLC8u8R8bTIM=;
 b=kwnbcR3wSPUKz5STei+vcFS0W3TCOmff+zlE1sxGxPTee6LUVFWgxpzzcsrg9ZGQWi
 UZkY/fdlMPdHjNqtpFyKbgURsIwg0YKPK2ad/RQdZMC8DMBSFjuIgrT0/8BnN1O/kp2v
 8HVQ1KV2sVEv+YEvXbGE6ECQtfuRTqxEqd9zWOzKFc2uQVd4MGQk8Z0BQGiB00V9ojj7
 dV9zCLahG+QtwQVVuKIUbkoab15ibzLBjYOnEOo6BFxm+qNEwFTflSeMyxdngSfJn4Pk
 Lx3eLvbbZnn/Uy80DvoPsWi/ab26oVVmpkWWnKPq7oRLxjm1O6ZIAe+jzrjg/Mui428L
 Fn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L69SNNap7Afn2vvutcRxGzj8U9NpH1dTLC8u8R8bTIM=;
 b=icM597P1pZ8nt4GA0t/P500Ywt80wqOvNu2wc3XsbPu6dxyB4iLPdzybbPxfjeG+qz
 WcRFWQlXy3flzOkRPfgVnqocxsVNbmb0e3wq/Qx4xjD6Fa8dPBf+KQGDEtuXSTd9MxfA
 HSqwswD2jlZnkBNeZEICgS9RUxFDsye1QsjOTpHGGlonn18BkN7nuY4W9+5VYBZ43UWK
 ISuB9O1OtKvSdl6HyXT5CuQnK3STTFt7MkgCKYJxZezSvD8iPvhkcAuluUzwGBWtPVwm
 fKA42QWI5bV/CyBh1QuifLbrxMF1F7TZuyP+KyUU9Cf9V4fcQjnsJTv/FLZRUtIZA/q0
 Jdew==
X-Gm-Message-State: ABuFfojghaZioNdr6qfu9DDRgJe+AwGTppuDdBux17Qv63S6NfnFoC87
 4YdHbIc9c0VL6cmqT51jbcsl/rh4
X-Google-Smtp-Source: ACcGV62sc+0AWckgG4PdrAuGPyFV3d7kdDMxldE1D0YZKd/TmU+sfS777glAVxL6oVmHGz7Neo/mWQ==
X-Received: by 2002:a1c:8bcc:: with SMTP id
 n195-v6mr13644006wmd.118.1538921511124; 
 Sun, 07 Oct 2018 07:11:51 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:50 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 00/12] Allow changing the transit namespace
Date: Sun,  7 Oct 2018 16:11:27 +0200
Message-Id: <20181007141139.26310-1-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
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

Hello list,

This series is simply v3 [1] rebased on master.

Julian

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-September/003358.html

Julian Orth (12):
  device: protect socket_init with device_update_lock
  netlink: check for CAP_NET_ADMIN manually
  netlink: allow specifying the device namespace
  netlink: restrict access to the UDP socket
  device: rename creating_net to transit_net
  device: store a copy of the device net
  socket: allow modification of transit_net
  netlink: allow modification of transit net
  tools: add framework for shared options
  tools: allow specifying the device namespace
  tools: allow modification of transit net
  tests: add test for transit-net

 src/device.c            |  44 +++++++-----
 src/device.h            |   6 +-
 src/netlink.c           | 150 ++++++++++++++++++++++++++++++++--------
 src/socket.c            |  18 ++---
 src/socket.h            |   6 +-
 src/tests/netns.sh      |  40 +++++++++++
 src/tools/config.c      |   8 +++
 src/tools/containers.h  |  22 +++++-
 src/tools/genkey.c      |   3 +-
 src/tools/ipc.c         |  26 +++++--
 src/tools/ipc.h         |   7 +-
 src/tools/man/wg.8      |   9 ++-
 src/tools/netns.c       |  62 +++++++++++++++++
 src/tools/netns.h       |  18 +++++
 src/tools/pubkey.c      |   3 +-
 src/tools/set.c         |   6 +-
 src/tools/setconf.c     |   4 +-
 src/tools/show.c        |  35 +++++++---
 src/tools/showconf.c    |   4 +-
 src/tools/subcommands.h |  14 ++--
 src/tools/wg.c          |  64 +++++++++++++++--
 src/uapi/wireguard.h    |  39 ++++++++++-
 22 files changed, 483 insertions(+), 105 deletions(-)
 create mode 100644 src/tools/netns.c
 create mode 100644 src/tools/netns.h

-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
