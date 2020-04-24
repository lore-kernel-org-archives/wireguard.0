Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 094D1C54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97F0221556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHsdGl4K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97F0221556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ca218af;
	Fri, 24 Apr 2020 20:36:37 +0000 (UTC)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [2607:f8b0:4864:20::443])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bd030812
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 19:29:08 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 18so5273401pfx.6
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 12:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pP9FHwXJV5axl/h/h4TZoR5YAp1KJ6NzgTZabnl2AsI=;
 b=QHsdGl4KYI7EWKNGu6rruJd0BwrI2HvPZvQzFUy+GOHrtLZDStzd6cDCSwWygZ+pzi
 JxkNnwhlz7VKep9FI0ZVe8W/MQQpea3vtpUPF0l+2zevy1FOTMKMoFWwmCRou9rzGrul
 U7TH7YJfMPxDrOYSucfpT3nFvm85o8a2HrEtFoJAut1K76FgTGmAkuGSV85hT3JKE/oW
 5vmyqFMZ0dOahqX4cjCfHf8fAk/H+yP6e+tIMvhN49+/IhVnw+NR734s9ENkJItnPuBs
 X95hOdrhHN610ecskv/87PH40WU7NcMLOFrJu9XxFlz5+XKXMlnmttXkyJvo3B0VDy27
 zZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pP9FHwXJV5axl/h/h4TZoR5YAp1KJ6NzgTZabnl2AsI=;
 b=Az7epC+TGtnah5HaAoEcSQtEujOxavtBdJUQt1e+rCgqeBGCcmfLTGa9m0J3AlmfZg
 CmHu+9c5U+o9WV7KTuJ0v4lOBZh4jBUj+Chr9sGwvy9L2fd7uv8ZuDRCElO6bCB7xzN9
 r+l85VFWzQbigwoulHWCaihA9fjmJbx5rVVSeQ2HKnqfG0LxXY8Tab0ZWWQbcNYfGTZ5
 p1he9aE7yF6PeImBwGHuYSClOfzuJ12YDf+rO+rbXz5aUFNEzzUlVL/BkmPPki+J0DCI
 iZaxz62mVNJi6yJxh301VmGb0kTH2zxb0SjyxUWMSgpVoYX1GMfnFQUpnpc0R+tCg860
 6qcA==
X-Gm-Message-State: AGi0PuZl9NzP5pVAfqRW25osVsvOtnPXAtzI39NYaO/SuZKSEod+/Rjz
 f6wBOk17dvt8X52rPCcyNQjd3bsM
X-Google-Smtp-Source: APiQypK/ghFeuS0soyEiZZjUFE4bI3LQgcI2Jj4gXltWOT5EBXQ4UTPNq5/EzNfL+O7Lvktr6Am1bw==
X-Received: by 2002:a62:7555:: with SMTP id q82mr11257750pfc.136.1587757216622; 
 Fri, 24 Apr 2020 12:40:16 -0700 (PDT)
Received: from goliath.corp.microsoft.com ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id m24sm5446847pgn.91.2020.04.24.12.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 12:40:16 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 0/1] wintun: use standard volatile semantics
Date: Fri, 24 Apr 2020 12:40:09 -0700
Message-Id: <20200424194010.32225-1-godisgovernment@gmail.com>
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

Make all archs are use the standardized concept of volatile.
This patch will cause the most changes to arm64 codegen, and has
yet to be tested on arm64 so is currently being submitted for
comments. If someone would like to test on arm64 it would be
appreciated. I do have an arm64 device, but it seems there's no
existing arm64/windows wireguard binary package, so I can't
just install such a thing and swap out the driver.

Shawn Hoffman (1):
  replace atomic.h with provided APIs switch to /volatile:iso

 wintun.c               | 76 +++++++++++++++++++++---------------------
 wintun.vcxproj         |  5 ++-
 wintun.vcxproj.filters |  3 --
 3 files changed, 40 insertions(+), 44 deletions(-)

-- 
2.20.1

