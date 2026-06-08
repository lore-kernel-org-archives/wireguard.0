Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6796CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 06:57:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a536a2ad;
	Mon, 5 Oct 2026 06:56:03 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d4f9052f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jun 2026 00:33:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45fe59255beso1795286f8f.1
 for <wireguard@lists.zx2c4.com>; Sun, 07 Jun 2026 17:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780878803; x=1781483603; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kHVIIcBEecJ36xkvRIpu1xJVb7BfbaLZ6hqzWpzMV5E=;
 b=EzLn+rhPfOWV9bWyCn46Yvt68j1C2BWMBBPsLkTYrc9IoY50EWjr4w2yzR526PhmMl
 RTUL7W57HZv4pGL59rd5bkGftHsy7Wj4rpybVASaG4srQOblLWw9sfcxZkpCL1cj21fU
 yD9wRcDY4CVlm5VKFxVM4p77+qG5ISeZWsRe4XM4ANKXU9yUNtFYA98PVkEqU3agHjKD
 x66PN6VOG8ovbrbQAuDScngYwXlqpGQALbuJ8yS13D4IOttrWuTgrPCZKuDojiTqE01w
 BX8VZBSb356ClEJIN2YKPjcfVWfg1H1lN94T5clP8v9C1l/TVVI7iB68niDJp2ZKH+0b
 r//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780878803; x=1781483603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kHVIIcBEecJ36xkvRIpu1xJVb7BfbaLZ6hqzWpzMV5E=;
 b=oV5TLAOVVRRrEKhNObokr7DDDQNv7fhkt6YwZ4dqVuCzeSCbLrdQ2FNuZ6malY8Pqw
 BntDDlA+g5FdYkQ1MaaddxLnq8E/+b0kL6ISNQT1vQom5b1qMheiT+EByDR0hXZ9fQ9G
 GHuQFU25vLUe8K8OUKMm5Gm7EuaujIrquAfjtLy+6vXFs6IGl4gvF36PsXWRHe3nI7Wq
 Gltljtkh2GTbPQc20VQW06mfRrr9DHU6J1ur+oO7bkI9Eh9AgnnspnuMaWo4M3BK0Gq5
 L4osTAgBmg/OWVrzfrmOEbWALI1IwFEu0saS0UVXwfBf51fLzHaxTDwiXz+AvEjTFja4
 eDpw==
X-Gm-Message-State: AOJu0YxRMaUqfaLOySZ+qkAXWeV7F0jSVF4DYaLfOBRA48rR9ASHKjMk
 mTCWrj/FEfzkNL1/ZevI+Cco9fySlScq8OtGg2pPD4TLwAu3hleIoHrlzGJfR6CeJSI=
X-Gm-Gg: Acq92OEyCv059+HHga38qtphntgD+LHPLj9/YfYtcrRcKxb1gy5zrJOVFEbXZoDNXKD
 lgmvHoAeAAiWOF79pbxt+XIshbytssnedyghmO2QfGFb6vLwM7CtkC4EGjHx04iFLS6H61XX5Do
 g5oJmcc5vrjCPl4wLxvYFZKoKpnXuGAbON9WesV+/mADJ1VACq93tKQXa+6sfy2CpIHOPvlhh09
 Lh89LIWR/lSVcZOpp35GRK3GAFMxf8qkOKF476Q/tD7dw4TRw+7uLKoPs6TCq0eRh2s7q0JTXSf
 0XMhX7qI9iI6tknotgUZkN57sYDApdofMEB/gO3BSnxkUFe3CtMBT2/A8Fw71QTDkyz/ctwgYsH
 lFIBhKpUtVuUVDukvjfNy37CHRKM3MjlUblVve02G0HKQ/LeWDQSiUCpAIfJuQXAC4pm9LDlfFb
 e565VLp3oLIagi
X-Received: by 2002:a5d:6684:0:b0:45f:f142:d571 with SMTP id
 ffacd0b85a97d-460302e453bmr14538784f8f.13.1780878803107; 
 Sun, 07 Jun 2026 17:33:23 -0700 (PDT)
Received: from akaWolf-arm ([2a10:1fc0:3::318:6a20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f368e9fsm46252261f8f.37.2026.06.07.17.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 17:33:22 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Artjom Vejsel <akawolf0@gmail.com>
Subject: [PATCH wireguard-go 3/3] conn: propagate ancillary data to coalesced
 split frames
Date: Mon,  8 Jun 2026 03:33:07 +0300
Message-ID: <20260608003307.2598372-4-akawolf0@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608003307.2598372-1-akawolf0@gmail.com>
References: <20260608003307.2598372-1-akawolf0@gmail.com>
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

