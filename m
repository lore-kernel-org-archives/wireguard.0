Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57D9F55433
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 23:42:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 59485954;
	Tue, 24 Feb 2026 23:42:55 +0000 (UTC)
Received: from mail-dl1-x122f.google.com (mail-dl1-x122f.google.com
 [2607:f8b0:4864:20::122f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c143f631
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 23:42:53 +0000 (UTC)
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-1277d379936so1164848c88.1
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771976571; x=1772581371; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IEtiy647DnHARFI8yivDbBdmtc9rrMs1k3o2aNyfsyk=;
 b=PT/u8g9dgVu8DJuLJHsfkwHy7dnufvFHeb8VWjSDI7LLS+uFxDZHTKgl0F/AWNu3a8
 DgJWLN6lBA1YVu7gddtLNh3IeMaSilsKJZPdsQe4jMC+lJFSUug0a2QMGcMTnPMCkW5K
 D+PKXSc5ojSTtVsYWsmBCERgEQwoXjF/FCja4RcysXZdZ84XxeDpNVVpCBkIQhxrJvMJ
 4RdBhETk43O1cQ5U16bm8RyXu7YXk8+c8g4dy97ZZoXyhNXwmCoygOBrhSOKgCUE5gxb
 lsJPLJ3Qv4YbY8dpNILwoYhUMwm1FOKRaTujddBxZ9ADYzryk414n6qA4/AEPl7UFqBw
 ofPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771976571; x=1772581371;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IEtiy647DnHARFI8yivDbBdmtc9rrMs1k3o2aNyfsyk=;
 b=Czpl+712Vys3dNr5rHUDlsBc+hS506OtEtTByR3g4nqAR8GmEPDFeAx1eVnzwpqL1X
 Odj9a2N4k5HM/2BoSBzZTccVYEkvNnzeHSGk5z+WKF3TjVjH/7JJcmhXw3DDhVFzk482
 b2LRkSBACSQI2VnsnstrAo4jnzVzcB7Dn6B03toIrgXZ1hMXH5fn8jDSMb11Az1FzXJP
 9RTH+qQ6y9dMHoT+Xd8Q0SuwxQFCvYltoidDLdHVVZQN+zp8IjKQSaNl1qjf5AzKhGMd
 SIdhUyzAXavu+JR5t/Rm3kKEV8YLWN7WnO9bduK1/oT71noKQT1sbz4OkT99u8/Ylwqk
 bH7g==
X-Gm-Message-State: AOJu0YxFMb8tv4+Li9wtGHGNGrXkEkIs4lj58ch7DQ8SJeIdVt+N+mLy
 +sGn8LYct8KWCe4+O/mPk4UtZSCWJJTcDLJa70fBQXNuXoTKmrUD3rhLROg3G83p
X-Gm-Gg: AZuq6aIBj5hkBYzETewvraoWAIBYXXdYjdQZW7ozfxw2+AZ4cqgZC+rxzHEvT0xMfAk
 O3RLQ5WVIF3MeEOxtGpaftI/4OECawwJAibmvDolLky6fFLfUVAPjNuUCjD2zCfDY2S5JI/n4c1
 rhJJsr+pGKAiybhy1/mOUGIx1oGDY1GuxIQYUVqpfbinfpoCcaJagw4XazjGtlMgFgIHh1GCQNR
 tqBxP/FGg+6rCjczGpETONrr1WiEM/N4qOuyHmR1JZ30j9Y/5yPiCOWSWTzrvCpwobWfdeM7W02
 jTRYhPmhUvU4zPN0KpxVxeW3IJCXkCrgYilRbN94VoF+zem0W5JwwjxXs/HU4iLHTnFZnQ5xobP
 IctMp3zY1sNGzT18VyxZEATKtcZKpbBYp8nIVB0FwJU9uFSmqDFuS6ffiN3aUsn8G0Io/AEJXvi
 EoYidFktD6wqsHlU/INkBcxWOzZmkczbX782gM1kgRaNPHko21jbXfof43KTHWSg==
X-Received: by 2002:a05:7022:e28:b0:11b:9386:8264 with SMTP id
 a92af1059eb24-12781edf561mr212082c88.41.1771976570968; 
 Tue, 24 Feb 2026 15:42:50 -0800 (PST)
Received: from localhost.localdomain ([2601:645:0:cdeb:3db4:7690:94b4:8ccb])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1276af2ea06sm14038099c88.7.2026.02.24.15.42.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 15:42:50 -0800 (PST)
From: odedkatz <katz.oded@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: odedk@twingate.com,
	alexey@twingate.com,
	odedkatz <katz.oded@gmail.com>
Subject: [PATCH 0/1] wintun driver get stalled for few sec until another
 packet is being sent -- approach 1
Date: Tue, 24 Feb 2026 15:42:45 -0800
Message-ID: <20260224234246.16021-1-katz.oded@gmail.com>
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

## changes:
- I observed a code [which can lead to a stall condition in the wintun driver](https://github.com/Twingate/wintun/blob/6bfc34a60aa944149fdc7e9cddb191e9a8b6ec1a/driver/twintun.c#L487-L488)
- I didn't want to change the driver code as, I was not sure if it will create a busy loop on kernel
- so instead I tackle this on the client-part of wintun

# issue description:
## Reproducing issue
- run iperf client on Client machine with the command `iperf3 -c 127.0.0.1.us.east.direct.vpn -t 300 -b0 -P1`
- once in a while we see intervals when no throughput goes to 0 and it takes about 4-5 sec to get out of this situation.
     
      

odedkatz (1):
  remove the condition on possibly stale variable
    (Session->Descriptor.Receive.Ring->Alertable)    for Setting
    TailMoved event

 api/session.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.43.0

