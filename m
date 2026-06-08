Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283EFCA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 06:56:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2d38fd76;
	Mon, 5 Oct 2026 06:56:00 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d9c04cd5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jun 2026 00:33:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ef6565cfdso1640642f8f.0
 for <wireguard@lists.zx2c4.com>; Sun, 07 Jun 2026 17:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780878802; x=1781483602; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVhAV0jeLDIesyRfK3czdCVypMekywhIWN/lMQ3dBDM=;
 b=ADnWSqjuoskCx23Ap0G3xXzsIRNbyyMxpvdBBOwFSCLzR/1QUx7KLU31iCc9egaj7s
 Q2vALBh+OlIczauFDRqPjjQJxvqNHnYpfh6M0vuHMeliSpFO6pkzjH+kuTG4N9HHlft3
 dHjWd4C6XiERcAbkr54rXD6D3elU1T5kXlc9qjf630gURsQytpIQv55cbBehK58gYZ1d
 SOQVsuHv9b/1g2xjxsOCLzK8FUAC5nLBZTFIJscBGBMSxF47PPRw3UPU1ZaWigEsIwEq
 2+OQvkr6HOTIk4l3+dYA1m5ukuoHahH+KAoElXPucH5ZFzcOTH96BGPI5Gz3dVvK+yjg
 uYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780878802; x=1781483602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XVhAV0jeLDIesyRfK3czdCVypMekywhIWN/lMQ3dBDM=;
 b=lDOHUfvxK/Qd9FcswWJRsKMpeLaK6F/988CGCg65VigDTvsTPCa34keIz8zGR3CUwl
 UM3YLLRoJHHuvecmNHyJAWj4b2XbQ5pLUWp0IIq/lJ/faMAxeIr1Iz9yrZtt2sn4hQqR
 rqSZwfGiKbEi11zXgX02M9JysLiu9xhuruKf5Z5OV01JpdqgPDCZubWyB+VLi4rLbxg8
 LTrrF9tYsGdibgqv/QNGbxyUGQa5CNiLUaq4xMhHcP8VTllRsWJRYU2e0mo4bYC5Rclm
 z+j9K5gokW4kktjqEWq5upZ3J7eDVAkgHqce+zP+8kwKabaD3KL7PiJAc5qriIZ5V8kA
 nlow==
X-Gm-Message-State: AOJu0Yx6Ew+e134qIxc0CuUuiCq8pg8TXIfVE8Gk59gwXx7dkGG74aTn
 iqYNx+P4ICY5EGOHPIsQCgq8anjE4n3mDcfHKn7RBe6d66AcgZZGb3XJx4gC4htzpj8=
X-Gm-Gg: Acq92OFl0yql04dUuZbuTHqEnWb9TXIjInCRcAMgTtY2R2PbKSLTUN2FCYWmdGStUay
 HtsXMZM/g4yHjGto3BFcTKJ19o4JaQ2yDX/OMEz8fOr6btOmWMCJGVF9jO4cA69BQwX1kfDH+Qc
 Ggm3n7p79puiS6TFGBfU2Os9EBUDSgl5LZCTDHJqyO9q1Or0km8YBfTkvvOGloVE+0KiqqpkmP5
 cVI/8YNHvmU1B5gkXWYf0dOcftexLHw7tqcZ1UYC5kwVX76d23E8VqJ6XYzWwRQIxMjFonkPUkW
 rEMYBL4kLM35RIziOQebhWs1pRw2K5LWM5t1hsqXNdGgwNtA9H3DFWtoFnbDVNlPxhbvZOCgEqC
 KqB9UzZbJQ89tmOOJBpGqJJk7BrOeqxodqpar8cZ2SUG8fGMikrk4HHYDzArEpSiGF3rccuae1s
 y+P3IqptTbT0xW
X-Received: by 2002:a5d:4e46:0:b0:43d:6244:f8b with SMTP id
 ffacd0b85a97d-46030505f34mr16194931f8f.13.1780878801970; 
 Sun, 07 Jun 2026 17:33:21 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f368e9fsm46252261f8f.37.2026.06.07.17.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 17:33:21 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Artjom Vejsel <akawolf0@gmail.com>
Subject: [PATCH wireguard-go 2/3] conn: reset udpAddrPool slice length before
 copy
Date: Mon,  8 Jun 2026 03:33:06 +0300
Message-ID: <20260608003307.2598372-3-akawolf0@gmail.com>
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

The pooled net.UDPAddr is allocated once with IP = make([]byte, 16) and
reused indiscriminately for both IPv4 and IPv6 sends. The current code
copies the destination address first and then truncates the slice to
the desired length, which works in isolation but corrupts the address
on pool reuse:

  1. v4 send: copy(ua.IP, as4[:]) writes 4 bytes, then
     ua.IP = ua.IP[:4] truncates the slice.
  2. ua is returned to the pool with len(IP) == 4.
  3. v6 send: copy(ua.IP, as16[:]) copies only min(len(dst), len(src))
     == 4 bytes (the slice header still says len == 4), then
     ua.IP = ua.IP[:16] re-extends the slice over the stale tail.

The result is an outgoing IPv6 datagram with the upper 4 bytes of the
intended destination address followed by 12 stale bytes from prior
sends. tcpdump shows truncated destinations like 2001:db8:: instead of
2001:db8::aaa, and either drops the packet or routes it to a wrong
peer.

Resize the slice before copy so the destination is written into the
full address space and any stale bytes are overwritten.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 conn/bind_std.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conn/bind_std.go b/conn/bind_std.go
index c88ed4e..72f3047 100644
--- a/conn/bind_std.go
+++ b/conn/bind_std.go
@@ -368,13 +368,13 @@ func (s *StdNetBind) Send(bufs [][]byte, endpoint Endpoint) error {
 	ua := s.udpAddrPool.Get().(*net.UDPAddr)
 	defer s.udpAddrPool.Put(ua)
 	if is6 {
+		ua.IP = ua.IP[:16]
 		as16 := endpoint.DstIP().As16()
 		copy(ua.IP, as16[:])
-		ua.IP = ua.IP[:16]
 	} else {
+		ua.IP = ua.IP[:4]
 		as4 := endpoint.DstIP().As4()
 		copy(ua.IP, as4[:])
-		ua.IP = ua.IP[:4]
 	}
 	ua.Port = int(endpoint.(*StdNetEndpoint).Port())
 	var (
-- 
2.54.0

