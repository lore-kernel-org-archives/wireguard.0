Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE19C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F93206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXYSDRb1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F93206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c64a32df;
	Sat, 15 Dec 2018 16:56:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76e68b9e
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:25 +0000 (UTC)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cfedd4d
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:25 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x30so7444884edx.2
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNXhPhXTrz/6nRaIEJ420niQFNypfAZ3yDKjuFeVdwo=;
 b=XXYSDRb1UtHkw4W/hBsAIuiheF5piReKANK31KL9lTFkHJwtczgy92MrInqhvFKnjp
 FYGoFrjnDySmbjIlxTwx6brpmBnUuGXzfziXfHH7thHFjoDbYrk59JY22+txZRua7Ltb
 F3I0VMWJHIMrXgOXJm8G55/YZOz0k/UCO5SSdvrNJfbYYKdM3GQtky8nLJ9w8yF7XE5U
 8FNnOHrb6ibcKEspjTsUwdqFEBK+NF6tl72GJeL4ZtMxy3cUKimb4D9Qqs5TiiqGeXTI
 7qsvcrGWeUtW/p2KFKEgGM/o3XAoFFVwCSvLYr9F4M5hEYgNk6vnqeqw2YVr1OeZMHAN
 Tsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNXhPhXTrz/6nRaIEJ420niQFNypfAZ3yDKjuFeVdwo=;
 b=sTp1Yy0Z3c4pUOe+Sb4+3WLP/hzEiQ/wPvME4vlIreQUjlI216JDEsVw/ZKclc6TQG
 HcK1M8cXEG1FAuChjqJrq5A/ebUQcUkfyuCAa+nnd85CusKl/IDqggNwAqDHLUk8kmOK
 g6SoaTj8zfa9UxiuQK2SNm2MUkU+qksQ76FhgpPACG1VMXzt18gubeY72EIkT6rebs27
 kS54D8ivp5rLD9Ys0MIb2/FQDgrcBPMqZvOs3r32mSVP4aWYMCsTFdkKXK6AvaK950wM
 CLACVdnZdH1eLrejA0YmDGsFTcqKzTfEVfRUDd6ZD9dkIt4ia/zJXqodb8Zkz7WJv/wM
 Ki/Q==
X-Gm-Message-State: AA+aEWbaNTkx1dG3PqZvZV/s4t7JQ920vhEpwravPTdMyfarWAuz6FOx
 cBQWIpM4d8pGXH9vRNZhIKU/L4HC
X-Google-Smtp-Source: AFSGD/XJ2DGK7Ks9ArIEYXOM2GfbRj1Mo6d7fllf4fpAlHr3KX13hD3RJe3nfGen0slg+ldyPBEwag==
X-Received: by 2002:a17:906:4003:: with SMTP id
 v3-v6mr5552696ejj.240.1544892988660; 
 Sat, 15 Dec 2018 08:56:28 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:27 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 00/11] Allow changing the transit namespace
Date: Sat, 15 Dec 2018 17:56:02 +0100
Message-Id: <20181215165613.5486-1-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
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

Hi,

This is v5 of this series. This series makes the following changes:

* wg(1) can now access devices in another network namespace. The syntax
  is
    
    wg --netns <pid|file-path> <subcommand>

  For example

    wg --netns 5363 show wg0

* wg(1) can now change the network namespace of the UDP socket of a
  device. The syntax is

    wg set <device> transit-netns <pid|file-path>

  For example

    wg set wg0 transit-netns 5363

* When retrieving or modifying properties of the UDP socket (its
  incoming port or its network namespace), the netlink code now checks
  that the calling process has at least one of the following properties:

  * The calling process' network namespace is the same as the (new)
    network namespace of the socket.
  * The calling process has the CAP_NET_ADMIN capability in the (new)
    network namespace of the socket.

These changes allow a user to create a wg device in a user namespace and
to set the network namespace of the UDP socket to the init namespace.
This allows the user to communicate over a wg device even if the user
does not have root in the init namespace.

The code of this version is almost identical to the previous version
except that

* the first commit has been dropped and
* the code has been rebased on master.

Julian

Julian Orth (11):
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

 src/device.c            |  35 ++++++----
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
 22 files changed, 477 insertions(+), 102 deletions(-)
 create mode 100644 src/tools/netns.c
 create mode 100644 src/tools/netns.h

-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
