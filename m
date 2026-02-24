Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD014F55433
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 23:50:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a3c6feb5;
	Tue, 24 Feb 2026 23:47:27 +0000 (UTC)
Received: from mail-dy1-x1329.google.com (mail-dy1-x1329.google.com
 [2607:f8b0:4864:20::1329])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d49af9bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 23:47:23 +0000 (UTC)
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-2ba94dbf739so6776310eec.1
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 15:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771976842; x=1772581642; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEKuOoP9nDBuw67QlJObbTRZmr9v5zgeu3WshUcJ4JY=;
 b=bSXQ8mPijGf1ced+rvytf0mqYuhuMPFiNV6mk1x911eNS/Ty8dxTcim7pgtc92rzh+
 i7iLy0GX724N968TSKL6QlEnksoYtMSkcB/QPGi0W5x8ynFhQo6IPPmmSXANijf8TrYN
 yB/mqtGmUU2M5So4bZvnYlcDD8F5/KYwMnxM0CAw91KdLX902kk6L+VKz/4M5TdVa/0K
 xV6dG11BouNh/DTIqkiCCDQPbSQno1NNnueMNFrxCJN+8ibM6gDgk+NiHqshZKEMg4sF
 M1l5vZJ9pg5XuyDBrEY1v6FdMQ3Cc2JOaqHeMd62wQntjuUL+sm05aP3q5LaibxpdH5M
 9mmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771976842; x=1772581642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fEKuOoP9nDBuw67QlJObbTRZmr9v5zgeu3WshUcJ4JY=;
 b=IhZ930w9aXwHMFre16JcKaYL9RtgC8IqByD8+SPOl2UIJNeZJ4WttLHOPhV1zIWzfo
 glehCm4VGO3q+wLybMKF+ohiftA0fO4EuzD8ybGDm8Cs+exziZuXeFbBAxIaOMurmPEA
 MaQ340A0jinO2YZVnC0L2htPw25JckF/bBpqoh7dfC4Qr9BHih9WXsHMcgSOebT5GAF5
 3cvMTcmSmXeI+QBbopaWknmoiAllC6bndpBFHY3rZtZ1e2tZIuq8uAIrDV7jTHaB+BNq
 peWiMHp+cADIQYrIlzX90Zq4v3/cdUK5xIdEJjPpqg8u0ywJB69AuI4/p6ZtQc6Z1jam
 ypCA==
X-Gm-Message-State: AOJu0YyNniUZOE/mpJVABAuJ0/UDpiISx0zDzqk9pDR9Aoyin+mZvcL4
 BM2EG49QeFRCAPiCcFa4jiwZ1fkGg2z6jySjCTz8PHoPkvMSYlO/LOI6VrxiyT6V
X-Gm-Gg: ATEYQzzhmjros3Erep/IZCHYKC1TD77pGOW9Pnk+gB+rpeWX6WKH8GfMEv5KhWtG4yw
 VQCs2fUPbl9I7+Aw5yD1MWbkV7MIyQRqGx+rUjDrdKd/sr3QQT8ULZoHvwa0SxRdWgNoM81fYaV
 uUF+4RllfADGB7Itml7TEQbYOsQSP3psYaqynRSOsnB7o0DINNOpJEfEC5nxU74E17p5u7Z1cnF
 7Lm4NuhfxE8T6FOsg+xnTNxRxL+uM1bBx/J5kRMYsqerdw6KmLUsTQCC4sxC2S63SueJoy9rd/p
 eQEaN70BGvOGsUEgBSK5S5dAKSljDu6GXPgrcv5zkVxxyG61ixjeTS59iV+DGxclW/WR1ADC7wQ
 XHa0lQlhwovtUQKrgyDWy0W8pp9EvQExhl/rBP8O1fI0u598SHEVFszQ2v8zOiC5ZUZwYXGd+Ot
 PF0C4f57xeiUFbHoebPTSq3gJm9YVEKYMxqigeGlXymBOh/yqBJYE=
X-Received: by 2002:a05:7300:6dac:b0:2b8:29e2:93e9 with SMTP id
 5a478bee46e88-2bd7bd62ddamr5010491eec.37.1771976841607; 
 Tue, 24 Feb 2026 15:47:21 -0800 (PST)
Received: from localhost.localdomain ([2601:645:0:cdeb:3db4:7690:94b4:8ccb])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bd7dc167b2sm7607985eec.28.2026.02.24.15.47.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 15:47:21 -0800 (PST)
From: odedkatz <katz.oded@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: odedk@twingate.com,
	alexey@twingate.com
Subject: [PATCH 1/1] Fix missed-wakeup race in ring buffer Alertable signaling
Date: Tue, 24 Feb 2026 15:47:17 -0800
Message-ID: <20260224234717.16883-2-katz.oded@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260224234717.16883-1-katz.oded@gmail.com>
References: <20260224234717.16883-1-katz.oded@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Alexey Lapuka <alexey@twingate.com>

   Add MemoryBarrier() between store-load pairs in the Dekker-style
   synchronization used by the Receive ring's Alertable/Tail protocol.

   On x86-64, WriteRelease/ReadAcquire only prevent compiler reordering
   and provide acquire/release semantics, but do not emit MFENCE — the
   only instruction that prevents store-load reordering across cores.
   Without a full barrier, both the userspace producer and the kernel
   consumer can simultaneously read stale values:

     Userspace: STORE(Tail)  ...  LOAD(Alertable) -> sees FALSE (stale)
     Driver:    STORE(Alertable=TRUE) ... LOAD(Tail) -> sees old tail

   The driver then enters KeWaitForMultipleObjects with no pending
   SetEvent, sleeping until a TCP retransmission (typically 4-5s later)
   re-triggers the send path and wins the race.

   The fix adds MemoryBarrier() (MFENCE on x86) on both sides:
   - api/session.c WintunSendPacket: between WriteULongRelease(Tail) and
     ReadAcquire(Alertable)
   - driver/twintun.c TunProcessReceiveData: between
     WriteRelease(Alertable, TRUE) and ReadULongAcquire(Tail)

   This guarantees that at least one side always observes the other's
   store, preventing the missed wakeup while preserving the Alertable
   optimization that avoids unnecessary SetEvent syscalls.
---
 api/session.c   | 1 +
 driver/wintun.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/api/session.c b/api/session.c
index ab96c64..13d5bca 100644
--- a/api/session.c
+++ b/api/session.c
@@ -302,6 +302,7 @@ WintunSendPacket(TUN_SESSION *Session, const BYTE *Packet)
     if (Session->Descriptor.Receive.Ring->Tail != Session->Receive.TailRelease)
     {
         WriteULongRelease(&Session->Descriptor.Receive.Ring->Tail, Session->Receive.TailRelease);
+        MemoryBarrier();
         if (ReadAcquire(&Session->Descriptor.Receive.Ring->Alertable))
             SetEvent(Session->Descriptor.Receive.TailMoved);
     }
diff --git a/driver/wintun.c b/driver/wintun.c
index 82e346b..72ba5d3 100644
--- a/driver/wintun.c
+++ b/driver/wintun.c
@@ -481,6 +481,7 @@ TunProcessReceiveData(_Inout_ TUN_CTX *Ctx)
             if (RingHead == RingTail)
             {
                 WriteRelease(&Ring->Alertable, TRUE);
+                MemoryBarrier();
                 RingTail = ReadULongAcquire(&Ring->Tail);
                 if (RingHead == RingTail)
                 {
-- 
2.43.0

