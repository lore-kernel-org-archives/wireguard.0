Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362A7EF06EB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 18:50:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dfdf43b;
	Sun, 8 Feb 2026 17:19:23 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebaca45e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Aug 2025 08:43:33 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2429d9d3755so38130735ad.3
 for <wireguard@lists.zx2c4.com>; Mon, 11 Aug 2025 01:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=southernohio.net; s=google; t=1754901811; x=1755506611; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RR+XVNKHFY7sCiNzicvJxNwpHCYEgHzxNXJjqGCoAW8=;
 b=TCGksy67V7y7kq81rqsL/CRYGB5pRbPW0PoBkih2gCW39pd0B2rSKljqxThpiaKGyM
 0AQnjf2y8Mmj/AB0yUt9ajXYb0r0H6at/lXbe/85jIob9R1ohqRZTjgRYHyytcIDZ1pu
 wZIN9hkhaPta9gBp48okk6/jKro3BDbaqIyxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754901811; x=1755506611;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RR+XVNKHFY7sCiNzicvJxNwpHCYEgHzxNXJjqGCoAW8=;
 b=rFPPrrcSOxdYWhHBsgkaUS+NmbXwVDrJq3JVE6c2E0aaspwA7wQTfH8Cwsw5dcNg3V
 rMtcpCXNt7NCntG3ZOb18ebMdwt5SIWnCsIiFex0j3yw/9sB890mlRs5gqeAmozKYQjK
 loUUMqP79FbFi71jF4Kfev/ZjYBGPK6JxfhOeIot8DiemYvldwrk/y21o+cwGP3ERy+2
 kPlj4klKQPM3NW+twWmmvUCGel+Vma83m+RqdNrZF4mPYn4b8CZMXT5X5wAzCPnqWJWy
 HQt0/mo1MVVRkzGcyalOwaMQJI1DB/LoTSte+w4Zq6P/Nlz0UyQu3Ocochje1Ih4O5g3
 iyxQ==
X-Gm-Message-State: AOJu0Yza2kAY33H+jM8/j+vZy5NjLwrW2pCuxnWAOOzzi3jJdrT43IBd
 JlhYHr2uECjl1iU9jW6sWHsXYRvT7pkFL+Ejves6PuvSOpdSw3iHHjNleman+tikh6glylDzkJr
 RSz88J6mH3mItTPn03ipS/NLKhk3+yUzvUBAC
X-Gm-Gg: ASbGncsNL1ZK2OXySHiyGOivX+FcljEZCZjFoZr7m9TOjYslcbLnRIZySoLNyfLjPAl
 N5l6ZZb6BzXqfAOl2aXU8m6tm9bvM9qpyYtngwGIqiwX2eYUX2x+50st9XMrcZ9ZPReV30cSvPr
 SvOwPGglIQSbXTWSVBCSPfEdC/PHY77+NIZ5DhEFUKJPt8cGtJdsKZjbFIKvQ975hlt0dZ7yk89
 kd4l9U=
X-Google-Smtp-Source: AGHT+IEjAg3YjUSF/PdbXJQfbFvt+Mj7FoDLNVvwGX+XdTcwTdFhonXwShOIYwPCGoSBHPNzG0Y9kAbv+Et/PVEcF2E=
X-Received: by 2002:a17:902:fc87:b0:234:a139:11fb with SMTP id
 d9443c01a7336-242c22160f2mr158205965ad.27.1754901810778; Mon, 11 Aug 2025
 01:43:30 -0700 (PDT)
MIME-Version: 1.0
From: George <lists@southernohio.net>
Date: Mon, 11 Aug 2025 04:43:19 -0400
X-Gm-Features: Ac12FXw59D_SM7ILBU9rO7VQGKwafwR1zyGlY7UMm_-Ea8XI4jOaHcyfx0aDNEE
Message-ID: <CACsAZRTV=nb6fkGS2_=-xBskt0KY6w5bLiXnN4P8RASyhWu9RQ@mail.gmail.com>
Subject: BUG: Crash on log save for Windows wireguard-arm64-0.5.3.msi
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:19:21 +0000
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

When I click the "Save" button or try to "Save to file" the contents
of the Log tab in Windows 11 the File Explorer window very briefly
pops up and then the app crashes entirely.

I'm not seeing anything in the Event Viewer as far as a log goes for the app.

Would appreciate any help isolating what may be causing this issue -
or determining if it's actually a bug that needs to be fixed.


Appreciate your help!

-George
