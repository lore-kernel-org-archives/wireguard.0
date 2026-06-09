Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71A0CA5FE2
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:00:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a8c6b7c8;
	Mon, 5 Oct 2026 06:56:05 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9f1296f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jun 2026 22:01:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45eea68dd6fso3241972f8f.2
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jun 2026 15:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781042511; x=1781647311; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4NXNT6GX4lYRy9eecNMpJTgAlXoMReTDAmcvsHVIiNU=;
 b=VaE7H4zEvXHA3ToesdJJoSYFnM1KnQbIHXEnqgv3hOsYz/CP0baE98px1wjhsHnK7C
 9daQtD5vROLHfeh7NDCkSFy1seXXfcNRBPAUMe3+rjtddc0KYITGJ8y0mT6OVwX5aT8R
 lGxkYYB10U/mVBNqVexdRmSBcQq0yf9pRoK6V0Owg7f7awYIg67I53Y63baDVtPxXQ48
 RZ78jZK/Cixv1cBV5KPuDBRSYYmVGgCoq9MEO4GVaXSWK/eXvxdl9OlJM+mvbsru7WXl
 fQcdnoFpkNtOi/hMVRkC47MG75krfs8t5IBua3wnF2HLgxYmTNK5JQjNCzcvtZckdK9X
 g8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781042511; x=1781647311;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NXNT6GX4lYRy9eecNMpJTgAlXoMReTDAmcvsHVIiNU=;
 b=BmTr6NjpbgiX0QUekQ7Job3YjnG3Ez3tu+JipUDJdjxdTsAYmu1Q0RK3lXbGarwX+H
 MZ8vMTC+x4SZ4NJp34b2Kk2GJTJ2dWOFmYcEf8degsvrz6wx7Xr2QxP5Ll4GZw02wvia
 7ozGC+L/0UrIs8BQsJm4n+1yVhhcPJa+LIIGm1wO+MtZ9Z9BJXsey8N6mo3ILDftlftu
 Dy7PGKE8nm538qaKsAttBGPszwWXjONA6BrC2HlUEq+XFhAryFwCob766orwdIClvQG+
 QI3JVWoDnzVvVh8BYnruULieR8T/62d/jz7V6wakDe9iDFutQbAOuwWtNMM71vf+/3Bl
 8VrA==
X-Gm-Message-State: AOJu0YzfC6MirQWGwbnDaBxYqQNL6SMc0wMSUXfC6mDoayqHXSuekdQD
 FFUujC10neF6Ceqah4F6AoaoMdKSCwGRJMquiHGP4PVmgq/pMYwFhfg1t1oCJQU7
X-Gm-Gg: Acq92OGFZUuVFSGj6vANyenuSCMi+CYfPblGRMCdYtCD6B9uOfGdD3NRKg2z1kNpzUK
 Su8HVWCb0N5tC4RTmlpCC1wL++yqRyqWIHkM+ZptT3BDcTBEafKwjuf6zTUpmAcruwSiuWVc+zq
 OeGHUtHU2Ev3HOuKerBt9CAFP1T3YnYy/R6IyDKukXhkFjaxy9cx5TwZJ3x2uRnuhTlknLKGLWH
 ugK/uYanwPGZjW0sfERitHINH1cQNntMiAwVEAymnFHfzH3N2GlMPFzYtg+KHrZ2Ri0KxSWCJfs
 LNTWcr43PE2PaP7WvEzacvBA9PeokrDBPD0CSnJmvZlabRLHU/oonUtnzttS87AEYNWeED963ky
 VoucBPgTSKckliyIyVcwOgspc6SkuIipT9qBEHiZHJnUDqLKQLDW7+hpSpZDgjYv6U56zxxS+8I
 uh+l3FhPpL6Unr
X-Received: by 2002:a05:6000:c01:b0:45e:ed10:8dff with SMTP id
 ffacd0b85a97d-4603050f573mr26243458f8f.24.1781042509287; 
 Tue, 09 Jun 2026 15:01:49 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm54422367f8f.32.2026.06.09.15.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 15:01:48 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com
Subject: [PATCH wireguard-go 0/3] conn: fix sticky source address on multi-IP
 hosts
Date: Wed, 10 Jun 2026 01:01:35 +0300
Message-ID: <20260609220138.4160252-1-akawolf0@gmail.com>
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

