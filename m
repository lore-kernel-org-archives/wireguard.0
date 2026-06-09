Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42D3CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:13:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f8de4291;
	Mon, 5 Oct 2026 06:56:10 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c9d969c7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jun 2026 22:01:53 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so4560241f8f.2
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jun 2026 15:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781042513; x=1781647313; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVhAV0jeLDIesyRfK3czdCVypMekywhIWN/lMQ3dBDM=;
 b=nqGtGx3Ouaa7vjvXV8gM84pHBCqNsoLlXSVQYMMCa9tY2FsfvZ+fLTxqd7HVeV9LME
 LGnC/003JnJ9hjIV+J+ueLjoG7Dtlukgd0pE5TV39cM6pMx5HJ1vi07pJpqEK4Jig6E2
 TRezXE6xYDDr1om5y/SvJoxp7spt6Cbng+a/o8O3pP370ylWUN2ml7tTXORbBplGxaFE
 XezBqEgG8wn1j9yaYPSPaZxM8Qko9yZtbARS1htF2bNnaFrqBJEgnddak1DYtvLI9fk0
 6+li6a6Nk8486fr4c4OYCQQAEsbZHlyratZfSe1p+DdD2sLNRyp4BaNJsPuTQVrfsB0D
 xbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781042513; x=1781647313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XVhAV0jeLDIesyRfK3czdCVypMekywhIWN/lMQ3dBDM=;
 b=idvEQAHHmRdQ+4ZAeqI8VGc2iNiW1n35zSh3WUZErn2tIlrPMyiOkuaSE4jLzwyFsa
 IKrD8xfIzSNjj3swXURWnRc/5/5GIGbvzHDRTCJlxIS90pJOjEgn4tttcrLLiBkYIJzi
 USvtBXSDk4FD+B2ndQEReYp2sU87okTqjsmjtG6ekLyR9apPC6Itw6XNAOZVbOwWAVnd
 +N4OvOBxfg+bifQP3KpBPro+pN5Xm5jkdW762KsfrIwdNJrvjCBMvnvQ6i0tgzaiu06g
 KyUmuSpkVO4U5scDc/riG41cV1027QVOzc3o6hkcNP2tCGxBpTB8axPCNKUIRzT58bi/
 MjIA==
X-Gm-Message-State: AOJu0YyIQ/Qj1mSgWlxl+w3geFpXOPpCUHOLFQjGAFSvWhsaEQ7phVfV
 cISoI65jSdQ8GFmkeFPipo132Tjawe8KmKkRSTAay5TBS9iAS01A67gZ/TAKlZWa
X-Gm-Gg: Acq92OHp3N3NrDxZK3Ysh7ZmShvW/+gIUq2lLLnWeb6YEN/n80pR2vunV7BbYykbGpa
 R7X0OqASkYiss6BYID1vgIqyaoI2cGVdcvCAkJy9TV3Gy311mNGnvIxgPDVLSFBA7jST15eHtbX
 EFY50EbOl8YT47HNAuMCYBO0a+08TH0MTwB6OIDWOwDZbTNVcuTUX/VlhHURmzRp29kTSr/TOZK
 bZY0QCotGz1JthtyeqwZZRLdEo0TtUX/2CP1blVplZABti8L+10D5teQQnCof9XxjEifvkfRokC
 yn0kgVuWkMJ19dCh30iiGMxFDDnVCskAp4RebZbeF/+UHzQ7NOG9FlxTs3nHIE3YKphnP0H5Tvb
 WkMBxptf0IIUU58X6Tro2jJTVjRZeua6nD77DQ7bXe1FFzcngXB7DIpHhnZ83EmxPP+094II8tE
 EQXVf+XeaGq4sSKMFDlj8kUiI=
X-Received: by 2002:a05:6000:4708:b0:455:7d77:1d25 with SMTP id
 ffacd0b85a97d-460305124cfmr37350959f8f.27.1781042512796; 
 Tue, 09 Jun 2026 15:01:52 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm54422367f8f.32.2026.06.09.15.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 15:01:52 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Artjom Vejsel <akawolf0@gmail.com>
Subject: [PATCH wireguard-go 2/3] conn: reset udpAddrPool slice length before
 copy
Date: Wed, 10 Jun 2026 01:01:37 +0300
Message-ID: <20260609220138.4160252-3-akawolf0@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609220138.4160252-1-akawolf0@gmail.com>
References: <20260609220138.4160252-1-akawolf0@gmail.com>
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

