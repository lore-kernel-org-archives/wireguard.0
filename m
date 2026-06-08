Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F1DCA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 06:55:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b8e81259;
	Mon, 5 Oct 2026 06:55:55 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4cc3bc70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jun 2026 00:33:19 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490c1915793so20925915e9.2
 for <wireguard@lists.zx2c4.com>; Sun, 07 Jun 2026 17:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780878799; x=1781483599; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4NXNT6GX4lYRy9eecNMpJTgAlXoMReTDAmcvsHVIiNU=;
 b=CGSd10kPoujbyA6gLPtJhRfkkaZkzlD6WfLI4OPNF0zqahpy0b2hfBDD10lwcaih/5
 9j0udTnygGvfR0skFw458gfSYiQZhAmScWOdyIxWwCPgWvbpY8IDkKjmBhAFUIouGYpP
 kpYTvWVBTn7xb2F3h+Iwwvo5E71SooFPFwaMl38CzrdNq/IDIX1CCBPm8liEriRlREYd
 M5JlU7CYnksiKDWHoD4UyEhRom1piaDf6ADk6Syi2OH4GAz8+DFWY+2Z/0odtjKnBfAt
 f9uiMswtOZPoKhgvPZM2lo/P1LT87RsdOeo/YxMKskho/CUwy0zeFLxjZwWLp+KaIBQa
 EOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780878799; x=1781483599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NXNT6GX4lYRy9eecNMpJTgAlXoMReTDAmcvsHVIiNU=;
 b=gEwgIVwpxJNl0LdYUuhFyodLWHY9q+OHQzWgVM461VYxB/LTsQY1BEyD27Twy6Pbcl
 onVx424hsUgxlolIEPeB4nPULZcnPK28g6DeA9FV7RV5br3cqqtVQ7yNdAIFGSPn1l8y
 FNXt32rShzY9WzCZMSj7OOukSqnKecSf6wbL89bDKnp14JKIoTiN7oQ1mTgfmYFhyYcr
 XnVu+hqqJSK86TXp1zPYn9/1AupMZdD1e7VzLrFvJMYv4ci5rqS65eOiUTzgK0HSzQck
 FVat5DU+++H8kXrsTsijUS2csla6u0dllT2kblEO8i2oacvxDNJD4xC8FVgwlZ7Wwf5v
 ZI5Q==
X-Gm-Message-State: AOJu0YwY+BoUWD4un0+7Nnu92O0O2Z8C/ol5NB3DTxWFFVfYLzcnAdm2
 NPylyBnOyTjw2/gWcFiC53DxU3Izg8bvuOiSnjxbcTPhmBrgmpuh/obOc06qnHroPkI=
X-Gm-Gg: Acq92OGpT5WpKJTWjHSbD0h3UkFj2kTztwWpDtDxZ/6yEW2MaBy36GvtcSSgLWxVCPk
 80QUqkiszqfvPMhwaGgojXZk92NXh3XyQU5opOAgf2J/g+7ZQsyETZbrlVGVdoPdxW1J1ZwyVA2
 aBvJjlwJGnMJtvmjU/tg7ckAydMeJhC3CEtNAESFS2AC9lalJzpjyHEwJB8+4MPm5d7IgC6I3D2
 h8wYDNn3sHnWoXOX6O+Lwb7E/qv8waE25iiP886OhkWsK5Opyl1aUThj/OR0Xnn8cOMxU03PJ/Q
 cIHgSdcj/m0B7Z6SsaAP2mRo6y5qKd4Eo5JokWw41Pwu4H0M9bPcYx/QpaC/XwVmI/seaM7cNPv
 6JI0dKeO/iHmbSvbs1WtOquPPM2Mbp1mMlWr4irJPNb6oVpTCYEmPzFr+mOozScZ53CSAMdVJKD
 rVZejBe7mxLCzm
X-Received: by 2002:a05:600c:8b35:b0:490:c08b:b24b with SMTP id
 5b1f17b1804b1-490c26131c0mr213028285e9.26.1780878799187; 
 Sun, 07 Jun 2026 17:33:19 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f368e9fsm46252261f8f.37.2026.06.07.17.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 17:33:18 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com
Subject: [PATCH wireguard-go 0/3] conn: fix sticky source address on multi-IP
 hosts
Date: Mon,  8 Jun 2026 03:33:04 +0300
Message-ID: <20260608003307.2598372-1-akawolf0@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Three independent bugs in conn/bind_std.go cause the sticky source
address feature to silently fail on hosts with multiple addresses on
the listening interface. With UDP_GRO enabled (Linux 5.12+) the
brokenness compounds: even after fixing PKTINFO delivery on the
PacketConn, coalesced reads drop the cmsg on every frame past the
first.

Symptom on a real-world setup: a Linux box with a static 2001:db8::100
and a DHCPv6-assigned 2001:db8::943 on enp1s0, where the default
route's preferred source is ::943. A peer initiates a handshake to
[::100]:port; the server responds from ::943; the peer rejects the
response because the source IP does not match its configured endpoint;
the session never establishes. The user has to install a route hack
(ip -6 route ... src ::100) as a workaround.

After this series, the kernel's PKTINFO ancillary data correctly
threads through the PacketConn, recvmmsg/UDP_GRO split path, and back
into the outgoing sendmsg cmsg, so the response is emitted from the
address the peer reached, regardless of route source preference.

Reproduction via netns, verified end-to-end:

  sudo ip netns add srvns && sudo ip netns add cltns
  sudo ip link add veth-srv type veth peer name veth-srvNS
  sudo ip link add veth-clt type veth peer name veth-cltNS
  sudo ip link set veth-srvNS netns srvns
  sudo ip link set veth-cltNS netns cltns
  sudo ip link add br-test type bridge
  sudo ip link set veth-srv master br-test
  sudo ip link set veth-clt master br-test
  sudo ip link set veth-srv up
  sudo ip link set veth-clt up
  sudo ip link set br-test up
  sudo ip netns exec srvns ip link set veth-srvNS up
  sudo ip netns exec srvns ip -6 addr add fd00:1::100/64 dev veth-srvNS
  sudo ip netns exec srvns ip -6 addr add fd00:1::943/64 dev veth-srvNS
  sudo ip netns exec cltns ip link set veth-cltNS up
  sudo ip netns exec cltns ip -6 addr add fd00:1::1/64 dev veth-cltNS
  sleep 3                                     # wait for DAD
  sudo ip netns exec srvns ip -6 route get fd00:1::1
  # confirms: src fd00:1::943 (the preferred source from /64)

Run wireguard-go in each netns with the client's Endpoint set to
[fd00:1::100]:port. Before the series, tcpdump -i br-test shows the
handshake response from ::943 and the client immediately roams its
endpoint to ::943. After the series, the response is from ::100 and
the client's endpoint stays as configured.

Each patch is independent and reviewable on its own:

  1/3 enables PKTINFO delivery on the receive path so ep.src actually
      gets populated;
  2/3 fixes a slice-length pool-reuse bug in Send() that truncates the
      destination address after v4/v6 transitions;
  3/3 restores PKTINFO on each frame produced by splitCoalescedMessages
      so UDP_GRO offload no longer defeats the fix from 1/3.

 conn/bind_std.go | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.54.0

