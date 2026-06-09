Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AB8CA5FFE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:13:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 80278130;
	Mon, 5 Oct 2026 06:56:11 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 17a6c5df
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jun 2026 22:01:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-490c1915793so41638095e9.2
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jun 2026 15:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781042515; x=1781647315; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHVIIcBEecJ36xkvRIpu1xJVb7BfbaLZ6hqzWpzMV5E=;
 b=DsuxhM0ngfN+yHZuNaQV1il5W2BegFqQqKYHZMEZaAiFX9TXc3SIK1bYLHLLJrc/yV
 NiQ1x77FcYlbbfMHDrgUbZ3qoTNXoVDEi6fwIIhRq2vlzLasXYiOsirbYOq395GsXQU5
 hizRBqHsCk8Ps6IxYSpvZonJsezl3WFSLWSPnNzwaueUfoS+nhIkHnmSY/cxmjVBNv+H
 Q0VAbVIqClxPPPhIQJylwD+Yf1gptkIPLRG2CizYDr/LRgvs0yvcp9YDeKGcuKz+YzGA
 aCP48vxMWdR6Cu17cpwY+5tcgnPlf45FM2PbQRtRlv0sBsE9TwNFLzHi5PKsyVClIN2q
 WKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781042515; x=1781647315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kHVIIcBEecJ36xkvRIpu1xJVb7BfbaLZ6hqzWpzMV5E=;
 b=ax6VOsRlB88B+Ji1b6arn5gYWOOOzyA/YZOLu7n7/ElN1KZRX4D4HXdzbmCOS1+/PO
 trkgdeskHYmcef8kfAzX8NvXyftCreQjm+FBywWscVnqnc27zXkH3Ppm7vD4UpSpHu+B
 gp0Gy9D0wLggcYHF892mnhGHNz9oro6uT0ky/g/zUzql6AYI066xnhOtCLYFioayTy1Q
 R3kscw8TUpn/brBMKRi88LPG+DzDjyx2rLh6WV/A8oJa5GM8bD77HSHO5u+xzfYLFh2O
 Qc0+2DevqKdXx9Y1HgpONjbZi0OQVxsNAHRfpJEhHWeppkvyMSbRKmHWGqPsxBYIj2gP
 pOKw==
X-Gm-Message-State: AOJu0YzaZcs+tPYdo1JdM6PI+IqiLnhP3VhLV+Cna17ffBiux0RqjAJ9
 MzDIol/ogZBd0YTAQvTNWBokHCy5IyNnv71IDvctTfyXOSb8D0AyWEXFSgJAOQqt
X-Gm-Gg: Acq92OEsQNPydJ71CEpAHN81zQpRJXj88XoIEXcrRagDGS/2Dg48YaX2fsX6oi5ByPy
 ZiyGgSbsVzA0iTWOmgCTrbpwPqKP9IUbE0z2KdLTzuh+lPni51+o+1Z+D+QA6qolLq/2AZbnNnh
 R27wRLpMW5dMNLsci9UR/V+GE+mg3TFoCWSYHkq7WZMOcxxpatR6DQ2WgWbxVmd68TyMA2k27ik
 SWURMuy2luPzvKp4ADCNCuUAWjhwnlOmphzYIeepaSIPGlfRMdzkIuHRGR7WrpDH/oIkhaIKXyc
 5Kv2sX7j+PXUGQzwLdAaskJN5wVU7Q+5xIQwjSmaCVzIQ0ls+LX76hGEAM74h4cE/5d46HGIH+S
 pCfI7CFPd/H3ZcrM+NO8RMRR504w63z1+8xPy3bRixwzF4nNEkMeA4YapX0jv0v1acSc/k9s3pQ
 Vw/QU+UodE283e
X-Received: by 2002:a05:6000:189:b0:45e:df46:ba30 with SMTP id
 ffacd0b85a97d-46030630642mr24951009f8f.34.1781042515086; 
 Tue, 09 Jun 2026 15:01:55 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm54422367f8f.32.2026.06.09.15.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 15:01:53 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Artjom Vejsel <akawolf0@gmail.com>
Subject: [PATCH wireguard-go 3/3] conn: propagate ancillary data to coalesced
 split frames
Date: Wed, 10 Jun 2026 01:01:38 +0300
Message-ID: <20260609220138.4160252-4-akawolf0@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609220138.4160252-1-akawolf0@gmail.com>
References: <20260609220138.4160252-1-akawolf0@gmail.com>
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

splitCoalescedMessages divides a single coalesced read into individual
frames by copying Buffers[0][start:end], setting N, and propagating
Addr to each child slot, but it does not propagate the control buffer
(OOB) or its length (NN). The parent buffer holds the cmsg returned by
recvmmsg for the entire coalesced datagram, including the PKTINFO that
identifies the destination address of the original packet. The child
slots retain whatever control content was left over from a previous
recv, with NN == 0 for unused slots and stale data for reused ones.

receiveIP then calls getSrcFromControl(msg.OOB[:msg.NN], ep) on each
emitted message. Because NN is zero for every split frame except the
first (which still aliases the parent's storage), StdNetEndpoint.src
is never populated for the rest, and setSrcControl on the
corresponding send writes empty control bytes. The kernel falls back
to route-based source selection, defeating the sticky source address
mechanism whenever UDP_GRO coalesces packets — which is the common
case on Linux 5.12+.

Copy the parent's control buffer and length into each split child. The
n == i case is skipped because the destination slot is the parent
itself and the slices already alias.

Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
---
 conn/bind_std.go | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conn/bind_std.go b/conn/bind_std.go
index 72f3047..88c0ce3 100644
--- a/conn/bind_std.go
+++ b/conn/bind_std.go
@@ -528,6 +528,11 @@ func splitCoalescedMessages(msgs []ipv6.Message, firstMsgAt int, getGSO getGSOFu
 			copied := copy(msgs[n].Buffers[0], msg.Buffers[0][start:end])
 			msgs[n].N = copied
 			msgs[n].Addr = msg.Addr
+			if n != i {
+				oobCopied := copy(msgs[n].OOB[:cap(msgs[n].OOB)], msg.OOB[:msg.NN])
+				msgs[n].OOB = msgs[n].OOB[:oobCopied]
+				msgs[n].NN = oobCopied
+			}
 			start = end
 			end += gsoSize
 			if end > msg.N {
-- 
2.54.0

