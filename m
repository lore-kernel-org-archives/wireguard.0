Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F2FEF06EC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:13:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b961511d;
	Sun, 8 Feb 2026 17:13:02 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 38440365
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jul 2025 10:13:45 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-313a001d781so5662383a91.3
 for <wireguard@lists.zx2c4.com>; Wed, 30 Jul 2025 03:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dufour.aero; s=google; t=1753870423; x=1754475223; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=148kQjrHFdJXqs0PHmdWBZ//yB0QRGh8cZiex/O09yo=;
 b=ab3vuB/MKlwHngojJAFtDyzv2nIzxp4Wo1Tg396E2G94gLUuU2P0OFGD++KLKh07t8
 2rTEbTsQAdiYj8YWQXkgUr3nKFIIoRScefr2b4opjJoDUvC4qdt4nPGvaXbiV3zucgek
 asKp13xda4QAjlFF5UeRWnfEDgoxtgHldeUe7MqwDm3fcQ1Dk3Cyzcngc/o84qg06Jg4
 fDzoG4HEzsOm4CgFcVR5KhmjfCaekrF4EMesTqLMW3kw2DFl7rUZPS1OVdtW56g4FNsf
 SPCGGo5wHSlp7TZDz1o5nC1spvqcoL0UDscihdnzUjVlAO+NaITDqI4keqCvVNkeddXV
 WFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753870423; x=1754475223;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=148kQjrHFdJXqs0PHmdWBZ//yB0QRGh8cZiex/O09yo=;
 b=fPua5M+mloADOms7S+wLE4YRVYwXQN17nlin10h4aSExh85k2o2AvZq61ClVgJ+95a
 z3pDR46BNM/Nn9lydCdu0M6eRemtULq+yRoV8ltobStCXGnqMxENqz7czxkyh4ccp/Pn
 Md3ZhsxsJj5myNBC79m0GTbuhW7g1PibEeBeehnlQCvkcBgbyFFMp2FnRgEKU0s2LW7T
 Ob4LycNl4r0kGq4ViPyLtBNrx9kPrNaioYxPNo14iNfns3w1GCzNcFKRss66JMlE1ct4
 PlZuEbKZLcXuhSKlcJczI/vA7Jsg85jKGh0S7nLiemx9Id0yHenlGHr8QXTtUHoaPZh9
 DOyg==
X-Gm-Message-State: AOJu0YzlBeKjRbtxiU9XdKxbjkknzHYktlYgV91VK8sLQOvkDYnG2OWf
 5GfUutzLpEKU0csplZynTGPTH4niXpAElRTKxOtzawp87Wr6mbeglEzLiiclbtDfgkHKxKu7Bcu
 6bifezRX13S3c1L1zxpAezZKEiHTVInBOGQMgVoRT7Lfk8RpXF337OYo=
X-Gm-Gg: ASbGncufEpfPAEY+lX0BHAbyPMcCWd36jyyh4ZFekAWNC3BcrXb9ueTNwW9vV06+UNp
 4OwEq/mRZAOEXZhWANb/nHb1hsqIEbbuHiDKYsvPRANiGrbe29ac8RkX5cHKtRT1YxfWuTGv7Xc
 +SO0K7BFmuL6g1mbxTjwT3X0EJqI0wuXK6Os/eHLl0ULCiMd03DQ5H2BhmSXzcjVpmSRmp8W6/q
 DJQTz8=
X-Google-Smtp-Source: AGHT+IFf4+ba80DmlwP1W7tqQaOJCCPd/X23XT39r4/A0gv0ifk/8FRxfADxYWqGJzrALvYGcu32MO31qXQoYYOmkKQ=
X-Received: by 2002:a17:90b:2f84:b0:31c:3651:2d18 with SMTP id
 98e67ed59e1d1-31f5e380a3amr4185250a91.16.1753870423161; Wed, 30 Jul 2025
 03:13:43 -0700 (PDT)
MIME-Version: 1.0
From: Tobias Bossert <tobias@dufour.aero>
Date: Wed, 30 Jul 2025 12:13:32 +0200
X-Gm-Features: Ac12FXx-3f82it-1O2oeZcCfovGgcaVCVBnfCpv7Qrz-u_ePxXUKD_V6McB9HFY
Message-ID: <CAKijrerLkbUMDyVJjwQjAYC0wNtQS+itMHJkStV5sJaZ+=f4Mg@mail.gmail.com>
Subject: Inconsistent Route Handling Across Different Client Implementations
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:12:58 +0000
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

Dear list,

We arguably have a bit of an "exotic" setup, namely, we have one
interface with two addresses assigned (on the "client" side) and two
peers with the AllowedIPs in the respective subnets. Below is a
minimal ("client") configuration example for context (keys are
intentionally omitted):

[Interface]
Address = 172.16.100.2/24,172.16.101.2/28

[Peer]
AllowedIPs = 172.16.100.0/24
Endpoint = first.tld:51820

[Peer]
AllowedIPs = 172.16.101.0/24
Endpoint = second.tld:51820

The behavior after importing this connection configuration on various
clients leads to different results:

- Linux (wg-quick): Routing does work, kernel routes are used with the
correct "src" attribute set
- Linux (nmcli): Routing does not work out of the box because nmcli
generates a second set of routes with the same metric as the kernel
ones but without the "src" attribute being set. This can be fixed by
setting "Table = off" in the WG config. Moreover, I believe this is a
bug or at least an unfortunate coincidence that the same metric value
is used. An issue has been opened on NetworkManager's GitLab [0].
- Windows: Routing works; the "Table" attribute is not considered an
"Unknown attribute.", but has seemingly no effect.
- Android: Routing only works for the first subnet. Although the
entries in the main routing table are correct (again, kernel routes,
"src" attribute set), additional entries are created in secondary
tables ("local_network" and "tun0"), which take precedence due to a
bunch of policy-based routing rules.
- macOS: Same symptoms as on Android,  "Table = off" considered invalid

Are we trying to do something fundamentally against the design ideas
of WireGuard? Even if so, I would expect importing the same WireGuard
profile on different platforms to yield the same routing behavior.
Also, before you ask, the option of having multiple interface active
at the same time is not a option as this is not foreseen on all the
official (graphical)-clients.

[0] https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/1790
