Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22093CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 06:55:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 32f376ae;
	Mon, 5 Oct 2026 06:55:58 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cb632338
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jun 2026 00:33:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-490acbb0f89so23627875e9.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Jun 2026 17:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780878800; x=1781483600; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=G7800XX0/jd3oHhl/vxf3RLaE2dN1LF3q0H5SjsvGhk=;
 b=JAbLTrYPo+/tYZPMFH+Ao5m8ccBA8SzWkTZagGVD2VLdXRT7L3pB6m7PT0+6ykuhHV
 DBPkKyqncbJhG7ikWayZrYbjzYzg3pl+BODsy1L64XrD68Y3RRU4mVezSysbUJcYL8id
 MRq//CpXEZwoHuMsrl4CP6b5cifcA8DapmzBJ/FhlZcPpIEvrH4CLJiIEG9LJ1/weKrO
 MkEOn5u223mJDrRLc+lwCkFwyffUzlFVQFpobiZaIndANoKUZcs+Av6anvsk/6ktM4+Z
 3H+RksGKl7QXXzFZPYV+MOxZN+9Vc9B8Z0VvDvyhXGbXVuft0f1Ne9wwcArG+GmX3In1
 IvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780878800; x=1781483600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G7800XX0/jd3oHhl/vxf3RLaE2dN1LF3q0H5SjsvGhk=;
 b=LmrkWDXKh4qe8gLPFl/2ej+prq1d+vfPPJvM+QXaOq8g52IX4tphxJvc89vQSAVe2d
 ozQ1oUY2GNiCOWB13crfjS7TAPPNmmYY5rnKFpjRLmkAS2RZEiTDc31K41+EBRpBiYn6
 ICI7KGD9BcUOTYHoxXOHAo3u18AC0sx37jZC7j2QI0At8I/52M2Z3v24NGSsKKqoxldG
 i+jgKdR85ug49OTY2HZidnFfNhj+LkpVo2qgVOlIxcDaR/C42IVC5tPh/h34LO42b+ew
 AyIfKaCB7SFMnmS7aD1WSCOu0dWiacy+hKs5z6FzGyAqMZ7J+FXdaVLTpzYXeXdh2Hwg
 6stA==
X-Gm-Message-State: AOJu0YxwqBTh2cG7L++qt/QwXbv4eNhRUHdhP/yhCVQOqKXTF0sAZRac
 xj3AjOOsULfoXyXw/lj7S7N8+oRNdBCu7IO/9qGwykcr4sCnQih/Ic8CYlxQbPMiZH8=
X-Gm-Gg: Acq92OEpbQXEh3CS19dt5ItfdvPOJaCwV0e6MhgEho+NQN5Fqt4dZzpm5y+tN6KMJab
 I3Ap91IJmJPOqDLnm7pHxVlbBlwOWk1PqQXIljIh+kUbXKd7fqsGsNtsD37xtZ1GpqYLic4GHQn
 ChxRQVTnIwp6J+0xZDmWIrqYj4ABJyA+uXBvAh8Q/jbU7H+2yyphGCLXfpXIluXrXoOIY4QvqF9
 yBZbAarDMlOmXJnxChil5TFpgnSoYNVqSEPMG1BNdmMYTNmL+fyZMGc9ReH26bQmJIySJD36h6i
 uKy9R6vlGNBLvMDM9+BPT/1de1xK6+1OgosWseyztxqPidGjCz8hiP8Ap9K/zUCfYqPo1bfAKTf
 nRpYU3zjjDnlyMVtaoHulYlpu9xbvHzsM9RNDnbu6fycPzRTzUsdL83wlJjb5KUulPg62p6LfHv
 YQ0JNNYudYvtAR7eoQydHon5w=
X-Received: by 2002:a05:600c:4e55:b0:490:601f:d775 with SMTP id
 5b1f17b1804b1-490c259a232mr226758405e9.5.1780878800465; 
 Sun, 07 Jun 2026 17:33:20 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f368e9fsm46252261f8f.37.2026.06.07.17.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 17:33:20 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Artjom Vejsel <akawolf0@gmail.com>
Subject: [PATCH wireguard-go 1/3] conn: enable IP_PKTINFO ancillary data on
 PacketConn
Date: Mon,  8 Jun 2026 03:33:05 +0300
Message-ID: <20260608003307.2598372-2-akawolf0@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608003307.2598372-1-akawolf0@gmail.com>
References: <20260608003307.2598372-1-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

The IPV6_RECVPKTINFO/IP_PKTINFO setsockopts are set during socket
creation via the ListenConfig control function. However, x/net/ipv4 and
x/net/ipv6 PacketConn instances maintain their own internal control
message option tracking (rawOpt), which is consulted during recvmmsg
unpacking. Without calling SetControlMessage(FlagDst|FlagInterface,
true), the PacketConn does not advertise these flags to the unpack
path, and the resulting Message.NN remains zero on every read.

Because Message.NN is zero, getSrcFromControl never finds a PKTINFO
cmsg, StdNetEndpoint.src is never populated, and setSrcControl writes
empty control bytes on send. The kernel then selects the outgoing
source address by route lookup (RFC 6724) rather than honoring the
destination address of the incoming packet. The sticky source address
behavior is silently broken on hosts with multiple addresses on the
listening interface.

Reproduced with a userspace bind on a Linux interface holding two
global IPv6 addresses, where the route preferred source differs from
the address the peer initiated the handshake on: the server responded
from the route-preferred address, the peer rejected the response, and
the session never established.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 conn/bind_std.go | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conn/bind_std.go b/conn/bind_std.go
index f5c8816..c88ed4e 100644
--- a/conn/bind_std.go
+++ b/conn/bind_std.go
@@ -177,6 +177,7 @@ again:
 		s.ipv4TxOffload, s.ipv4RxOffload = supportsUDPOffload(v4conn)
 		if runtime.GOOS == "linux" || runtime.GOOS == "android" {
 			v4pc = ipv4.NewPacketConn(v4conn)
+			_ = v4pc.SetControlMessage(ipv4.FlagDst|ipv4.FlagInterface, true)
 			s.ipv4PC = v4pc
 		}
 		fns = append(fns, s.makeReceiveIPv4(v4pc, v4conn, s.ipv4RxOffload))
@@ -186,6 +187,7 @@ again:
 		s.ipv6TxOffload, s.ipv6RxOffload = supportsUDPOffload(v6conn)
 		if runtime.GOOS == "linux" || runtime.GOOS == "android" {
 			v6pc = ipv6.NewPacketConn(v6conn)
+			_ = v6pc.SetControlMessage(ipv6.FlagDst|ipv6.FlagInterface, true)
 			s.ipv6PC = v6pc
 		}
 		fns = append(fns, s.makeReceiveIPv6(v6pc, v6conn, s.ipv6RxOffload))
-- 
2.54.0

