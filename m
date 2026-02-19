Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF5DE9A05E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Feb 2026 19:33:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0cd0448;
	Thu, 19 Feb 2026 19:33:04 +0000 (UTC)
Received: from mail-dy1-x132d.google.com (mail-dy1-x132d.google.com
 [2607:f8b0:4864:20::132d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc89c5f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Feb 2026 19:33:02 +0000 (UTC)
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-2baaceb4613so1211015eec.0
 for <wireguard@lists.zx2c4.com>; Thu, 19 Feb 2026 11:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771529580; x=1772134380; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hdqmPv1RDtZiCee6HQCOtrYm5SdHAjjXFXFyp+Yc/Po=;
 b=NWEi0PRZoohBTA2iSQa5LHQRT95xx3UNtXQOHz1gILgjBPc44y6ZD2UGeZaEnvocxT
 AqpxPr1QIA+CvoysVfCrtmFRQQhU2F9Uu8EVymAhsvKMr/5nyRfqs8V+sseIIZ5Cn1Su
 oSc9RmrE+cj5v+AaWFG6W14MaF/YafVUoomkMReIC0hM3Bn8cERv9cemRNVy7kst5TT3
 ytEMtLL5FM0QwERh3vPBXVHSMku8Wq8Xgh/I24HPv4n/2bpkFKtbCRJy4T0VqZw7I0qR
 O794rqwXHYAwLpWkyf/fU4ezK8OzqfoeGo6+c6ZmawOzVxOmCIhUsBZzY+Ht/Yv+/GeH
 iWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771529580; x=1772134380;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdqmPv1RDtZiCee6HQCOtrYm5SdHAjjXFXFyp+Yc/Po=;
 b=JRoi5F1Z5JjkEqksquDHGJlgJ66S2KHMjx+eZ4JwoPsgvTAx3K5K0H1peTZMsrjhOu
 eR0/Qw6ChKa2NKEqVJeBwJD9Y9eW5RCJrQU0Cb4vXm57BLhUXVCWVN3pYKI365r7ZUK6
 DpkrcWUg2az4frWQ9oCPNAEVDUF18DyCgH++z0Vcu4MWpEZJJ6ABOaPwFq32UAehyJmx
 dpNTooqNsrCdnQ+pmal9lDI/bgxvJfO1FjVxsGTeH1OpM0vztZ4gd+9QrypYh89Ekb2A
 374yoqcyQdbm7HuQMo+8e5oxx6PJ25Se1vFIqkx/csrl9py6OTuHTNMoO3RzSU6xXeIs
 5Rmw==
X-Gm-Message-State: AOJu0YzSVxp/GTBH6ZCaApA5Cnp2NshSL/RCppRNF6tELXU8rZkpp2/G
 t1X1zcQ2DXl2R8Qg6NYBBCh9+qG3lXGhOlVVDEQdBywjNqLV/2Jag3dl1ILmGg==
X-Gm-Gg: AZuq6aJz+uggBqetKvQ/ap+RsKI7wg+NvtENr8mpgxBbwDlG6Li32p08HIa5lTRgXi0
 YPSZzvA6b2asswV2Fd7VSSNvy52X1y+pAAIfA4VdCE59P0qm8DQVkG9JhpIctOVXUP5e9UW6jkD
 JA00kn2g0RwxwmihKLcTej/cRgBkFpUQpFj5o/XE89MiUnhKIgcy0f5X9tYpRUddY8EEZ5KzseP
 gCJ//ax8s/95jSvHnpeQ+bfwXiTUgyNeAR+7XRMduIFGJ+99pxJF5GuPYRHaAvXDXpgJmkNli0E
 eZBFf4qh2ZV/YNpbGHp6n17a8RMWpofPBclB8wJ12wIyf7t8H8pnCRO4+gcPR8fKj3zvdaxERpL
 dEc5xWx3+pdQCcKpkPCw/VApoV/XjS0N7A/rkhxsjf02NSqAvQAuUS7q4MbFvxHqhvK+/KIF7yO
 j2jiii4fmB5cV7WUoObcykJHqZyJ/DEMWsYeu8ulVSXKA1+iEKhxw=
X-Received: by 2002:a05:7301:4083:b0:2ba:a080:61c9 with SMTP id
 5a478bee46e88-2bd607e6c75mr1076315eec.10.1771529579828; 
 Thu, 19 Feb 2026 11:32:59 -0800 (PST)
Received: from localhost.localdomain ([2601:645:0:cdeb:78c6:1ab4:b276:9a4a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bacb415dddsm25046851eec.0.2026.02.19.11.32.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Feb 2026 11:32:59 -0800 (PST)
From: odedkatz <katz.oded@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: odedk@twingate.com,
	odedkatz <katz.oded@gmail.com>
Subject: [PATCH 0/1] This PR fixes a critical race condition in the Wintun
 driver that causes ring buffer overruns
Date: Thu, 19 Feb 2026 11:32:54 -0800
Message-ID: <20260219193255.14334-1-katz.oded@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

** Description **
This PR fixes a critical race condition in the Wintun driver that causes ring buffer overruns when multiple UDP senders operate in parallel. The issue occurred because multiple threads could read the same Ring->Head value without synchronization, leading to concurrent modifications that corrupted the ring buffer and resulted in ERROR_INVALID_DATA errors.

** Changes **
Extended the critical section in TunSendNetBufferLists by moving spinlock acquisition before reading Ring->Head, ensuring atomic read-modify-write operations on the ring buffer state
Fixed the lock release timing in TunReturnNetBufferLists to occur after updating Ring->Head, ensuring consistency between the active NBL list and ring buffer head pointer

** History **
the issue was reported to wireguard

```
We were trying to integrate `wintun` into our product and while
testing we found an issue with upload of high UDP throughput on
multiple sockets. initially we thought it may be related to our
integration. but we managed to find the same issue in your example
code.we tried to do some debugging on the example, but it seems like
the corruption is on the driver side.
the way to reproduce this issue- run the example
- run the `send_udp.py` (the attached python script) on 2 different
command terminals
   - `send_udp.py 10.6.7.8 5201 1450`
   - `send_udp.py 10.6.7.8 5201 1400`after some time the
`WintunReceivePacket` returns NULL and `GetLastError()` return 13
(`ERROR_INVALID_DATA`)
many thanks,
```

a fix was provided by wireguard with [this commit](https://git.zx2c4.com/wintun/commit/driver/wintun.c?id=8814f660310c30a9297fc640c844c4ab6f27e5d7), but it didn't solve the issue.


odedkatz (1):
  in order to prevent buffer overrun (which was observed while sending
    multiple high throughput UDP streams from different threads) I move
    the driver spinlock to protect Ring buffer Head.

 driver/wintun.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.43.0

