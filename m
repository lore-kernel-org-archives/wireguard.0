Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76328CEE349
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 18:35:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60a60ed6;
	Tue, 18 Nov 2025 17:24:21 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c3a616a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1756738334;
 bh=7AacMuB4EgHFQr+FzPApSSfG+3ILvt7xvDy7ny/dTcQ=;
 h=From:To:Cc:Subject:Date:From;
 b=FYQO9LInj2Drr2C3M+KIi06JA41U6vM9JUR40TOJWho7B2AeYnz7RZxmGZbAUqUSG
 sU37L4eemwbf1FchcHgGX20FbYduuUq1UfI3F4d+LwSVbF25BVvOv9RcovUe72T43b
 oo527N/ARmvGk741WIqxHwmJD5/r+4DLKiWyUlKRicN3mZPDBLnjW+tNygdx5748OQ
 XT3ulUn69NZN2rIgOC6/SthA2rX1GfpaiZjaoFz+WArEAnTSTyViFUgwJ/7pRHeTEh
 f9ZfRTR8Hg1W8Pln9HbCCnUASXgbHby7cwGDDn5UA88UyIer0htMK3z1lGLWrCJ9C1
 be3VGoGijfYPA==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id DF0BD600C4;
 Mon,  1 Sep 2025 14:51:16 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 9360D2021C5; Mon, 01 Sep 2025 14:50:52 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net 0/4] tools: ynl-gen: misc fixes + wireguard ynl plan
Date: Mon,  1 Sep 2025 14:50:19 +0000
Message-ID: <20250901145034.525518-1-ast@fiberby.net>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

Hi,

This is the first batch of changes related to converting
the netlink around wireguard, to be based on an YNL spec,
with the focus on making it a 1-to-1 replacement.

I will post these 28 patches in 3 batches.

This 1st series with some misc fixes for net.

Once this 1st series makes its way to net-next, then I plan
to post the 2nd series with YNL improvements for net-next,
and the 3rd series with the wireguard changes as RFC at
the same time, as many of the patches in the 2nd series is
using the 3rd series for justification, so they should be
available for reviewers.

Once the 2nd series is accepted into net-next, then
I will post the 3rd series in v1 for net-next.

Below are the diff stats for each series:

1st series (this) - misc fixes (4 patches):
 Documentation/netlink/specs/fou.yaml     | 4 ++--
 include/net/genetlink.h                  | 2 +-
 net/ipv4/fou_nl.c                        | 4 ++--
 tools/net/ynl/pyynl/ynl_gen_c.py         | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

2nd series - ynl improvements (10 patches):
 Doc../netlink/genetlink-legacy.yaml      |  2 +-
 tools/net/ynl/pyynl/lib/ynl.py           | 36 ++++++++++++---
 tools/net/ynl/pyynl/ynl_gen_c.py         | 34 ++++++++------
 3 files changed, 52 insertions(+), 20 deletions(-)

3rd series - wireguard changes (14 patches):
 Doc../netlink/specs/wireguard.yaml       | 321 ++++++++++++++
 MAINTAINERS                              |   3 +
 drivers/net/wireguard/Makefile           |   1 +
 drivers/net/wireguard/netlink.c          |  73 +--
 drivers/net/wireguard/netlink_gen.c      |  72 +++
 drivers/net/wireguard/netlink_gen.h      |  30 ++
 include/uapi/linux/wireguard.h           | 202 ++-------
 include/uapi/linux/wireguard_params.h    |  18 +
 tools/net/ynl/samples/.gitignore         |   1 +
 tools/net/ynl/samples/wireguard.c        | 104 +++++
 10 files changed, 605 insertions(+), 220 deletions(-)

Asbjørn Sloth Tønnesen (4):
  netlink: specs: fou: change local-v6/peer-v6 check
  tools: ynl-gen: use macro for binary min-len check
  tools: ynl-gen: fix nested array counting
  genetlink: fix typo in comment

 Documentation/netlink/specs/fou.yaml | 4 ++--
 include/net/genetlink.h              | 2 +-
 net/ipv4/fou_nl.c                    | 4 ++--
 tools/net/ynl/pyynl/ynl_gen_c.py     | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.50.1

