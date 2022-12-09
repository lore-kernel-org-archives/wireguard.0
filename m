Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D624AC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Dec 2022 19:40:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 460a66a7;
	Fri, 9 Dec 2022 19:40:05 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bf973503
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2022 19:40:04 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a16so4486369edb.9
 for <wireguard@lists.zx2c4.com>; Fri, 09 Dec 2022 11:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ey0LZJzlvHDRlouFvt2LI2hhONU8NWMtSWETLgyi72Y=;
 b=DZ3XeEzgb99rF5wYggtVQCsvhBjlrKCoL6bv9rp4gf3jaQlkfh+IWBkvcdL6jt63V2
 zp+bBT9MeaU/s/3TSlKTVBAMYiS1LBWzUvnGUfMfxXIDhdoaDOCV2wR+yF1YdWhIOgEK
 Hb4Gj6cCImRGSIQipEFr1uvC+zFdu9x/tlGr8oinbt0eFB2pY1Q5xdanljuYjnH44EZq
 HmoQ5nNxw2X/8texxQQECLdAX5MOgzfSpC1VS+TH3obH/SXOB42g0omjz8Myk4zLQTRB
 h1No8ylXjipIWUZoteN/j4NPIHG/xMsvTW+M6p/CX6c4dv5KQxzoptLuNlwhuSD22t0p
 +iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ey0LZJzlvHDRlouFvt2LI2hhONU8NWMtSWETLgyi72Y=;
 b=VaEbOOu/KV+BJAYul28H5Ilw6v7bCpWLJcenSc4UjPqln1eYLSAXtZOZep4QU32geU
 NWzWwvcbp2X4+12RU+VnSpWdNH2a/RCrgyVdTp3Gk/KB5mJih2T1OG9OzK1RqfgNea9R
 2ThZzTNW/Z070QH8JUTNH0DL3hQVq7oA3mtvRtNxoW7hoBVZ2vI40rCnmOeQvmPDKdHg
 5OdcPM3Y1u3pBRWv4cpBUbSLOAglZSkSwe6mAdk5JUhWcz08i1e5nnr8syBjn89GP7R3
 C56Y6uw+9DDjXX8Myj0LhxAZBBQ6DvH4W+w2Doz464YWMa66jBzPPC7XapqgTUBnF3cR
 8Ccw==
X-Gm-Message-State: ANoB5pkwPLSArFBcH6xL8zIUzrKp6i1roH6lm90qQGSOw8K5JjrfY80T
 AFKgL4mLGsJiyUwF8u1we/Yk0UEx5oaHyLzoVWCy6LdDgmvDtw==
X-Google-Smtp-Source: AA0mqf4Jxk5hRC2YJ2GEYyHE/Zr7gWVEa/rBxB0DDj/LV9cvBscdmXGNDD2IJOJhxK9YaGo1JFK9v4g57jqb7tuhMn0=
X-Received: by 2002:a05:6402:2da:b0:46e:8f95:2b49 with SMTP id
 b26-20020a05640202da00b0046e8f952b49mr172278edx.74.1670614803584; Fri, 09 Dec
 2022 11:40:03 -0800 (PST)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Fri, 9 Dec 2022 19:39:27 +0000
Message-ID: <CABBZOs=pDoCAOdwBxRtzU5Bs__QA-pbc1mYqUddLT379BKw0kg@mail.gmail.com>
Subject: Can Wireguard-tools be installed with Checkinstall?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

I would like to have an option to uninstall Wireguard, compile the
latest and reinstall again.
But I can't see "make uninstall" to be implemented. So what are my
options to get a clean reinstallation of Wireguard?

I was playing with Checkinstall to install it as a package instead.

git clone https://git.zx2c4.com/wireguard-tools
make -C wireguard-tools/src -j$(nproc)
cd ~/wireguard-tools/src/
sudo checkinstall -y

But even though the package is created and installed, it doesn't
behave the same way as if I installed it with "make install".
For example there is no /etc/wireguard, even though it said it created it:

========================= Installation results ===========================
'wg' -> '/usr/bin/wg'
'man/wg.8' -> '/usr/share/man/man8/wg.8'
'completion/wg.bash-completion' -> '/usr/share/bash-completion/completions/wg'
'wg-quick/linux.bash' -> '/usr/bin/wg-quick'
install: creating directory '/etc/wireguard'
'man/wg-quick.8' -> '/usr/share/man/man8/wg-quick.8'
'completion/wg-quick.bash-completion' ->
'/usr/share/bash-completion/completions/wg-quick'
'systemd/wg-quick.target' -> '/lib/systemd/system/wg-quick.target'
'systemd/wg-quick@.service' -> '/lib/systemd/system/wg-quick@.service'

======================== Installation successful ==========================

Is Wireguard not compatible with Checkinstall?  Have I missed
anything? Is there a better way to uninstall the compiled version of
Wireguard cleanly without using checkinstall?

Many Thanks,
Houman
