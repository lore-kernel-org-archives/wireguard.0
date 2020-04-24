Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC63C54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:47:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08A7D20857
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:47:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jiq/d/y6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08A7D20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e43e81b;
	Fri, 24 Apr 2020 20:36:32 +0000 (UTC)
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [2607:f8b0:4864:20::f36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 11d8369b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 18:54:28 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id di6so5214717qvb.10
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 12:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u0RXIuLmTGIeNNL9YdawF8Lq8SQuVSY/QmSKgechT2I=;
 b=Jiq/d/y65UZxHjMluFk+3NyN5wp/p/aj/y02RMdo9+QHCAFeTNxyy3Vy/iPcMYNG5V
 lWcPGp92feX2XdnzVjoQ5aIP7HoaPOEUb9jjZrtVMHtCEmtbYKaKAQIrZsfs7q9I4G+7
 tKgf3hFEjdZJoi1K1Otse0/quxQF3nT+VdzGz8tnRWDOewZm53A0DvZNAXbjPt9HQG44
 YKHh7yN6ugmRQA8HQBth07MB6uAeQEGz299BJ7xIHqYDWszJutJl4oSo37Iu/VKoYt8m
 0UTd8SLDmL0wGWIloWWg+ks7opuUyfhd/zU9hrtcFRaUHCts0nPNQvCysPa+O0hgpZwy
 zKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u0RXIuLmTGIeNNL9YdawF8Lq8SQuVSY/QmSKgechT2I=;
 b=IY9Cm0oociYE+cTgUkCEHT76329mloFiMKNCvos5m4gFe3DEVUFMoxFTEomO0lf2sz
 7jToGhD4hLYjlWxQBdDmzRMROCh3/1fs5jB6dk8wFiXXfpKA/A/y5h5N1qpCRo7VI984
 w7A0t4QD+zJr/GEgYETJCX56KzfsIXIFmKFUnFVI+X10h+iRzXIQV4dR4u5smz0eKemW
 oVsNI2ZDpLje75M0k3m0M6F00UHiOzS7Uq9GKjBWmeKYYvEmdqfxnuwdd9Of0rJwbv1n
 OeHAOmAl6HmPoxpOBibEae/4emlPdJfB+AWRxz7UIauNrRdMR+zG30eMqvM5mIl3O/+c
 KrAA==
X-Gm-Message-State: AGi0PuaV6d99XSADA3rP5nV+HoOwAx4x1F3icZlEwmA3bLKRquklUvkE
 gvYghq1ltp8LhMhZtTdLl7j0aR3w
X-Google-Smtp-Source: APiQypKkytxFVS40a/GbazRGUO8heLPdqPY8e2q/BqrUVwmtJ0T53mQHUHAdgm+2DGVTThXmeEtHrg==
X-Received: by 2002:a62:17c3:: with SMTP id 186mr810133pfx.159.1587754809754; 
 Fri, 24 Apr 2020 12:00:09 -0700 (PDT)
Received: from goliath.corp.microsoft.com ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id i11sm5003187pgi.1.2020.04.24.12.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 12:00:08 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 0/3] misc code cleanup
Date: Fri, 24 Apr 2020 11:59:22 -0700
Message-Id: <20200424185925.31971-1-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:36:30 +0200
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

misc code cleanup. just getting feet wet.

Shawn Hoffman (3):
  don't leak TunDispatchSecurityDescriptor if second
    RtlAbsoluteToSelfRelativeSD fails. practically this can't happen,
    but from wintun code it's unclear.
  use ExEnterCriticalRegionAndAcquireResourceExclusive and
    ExReleaseResourceAndLeaveCriticalRegion
  use RtlSubAuthoritySid instead of directly poking SID

 wintun.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

-- 
2.25.0.windows.1

