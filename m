Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B1D0C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 13:36:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 314F964FE0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 13:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 314F964FE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2a6aea0;
	Tue, 16 Mar 2021 13:36:39 +0000 (UTC)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a1ea9a3d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 20:49:51 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 16so14761833pgo.13
 for <wireguard@lists.zx2c4.com>; Mon, 15 Mar 2021 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bNyytrOBBRZsLvUxjcZwHhhC83/UUG5lv5nmOJQdPto=;
 b=JaPwxj8YGAqAHOEQ475t685Vvh+HgDTwF/1EA5eDeFEs1hejWm8ARCMAtStSmkTqxf
 fRKtNYwoJH+jJqRZPHxh1W1y+JPA3r1ad8IGoVtIMWF80+9j/fEIddzrEZsU9n+Ec8vd
 lx0oYBfRXFFdFy6iltYg0r6DzANeaUh3ma8VNrPxsHt/hfQlhAWqwTSGruofakJRapWd
 N+J5nOtE3Fh/quRmX8FAvBv3xQhYBvBZLzIH3a9do9ZFIcTxHmA+buq3lozm9ocxKtsY
 UeKdiHkl0+DgW/XcStUA4C35//DFLzixe6yScs8zzQEH4G8PY3zRXgKCDJ9cJt3ijd7+
 hTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bNyytrOBBRZsLvUxjcZwHhhC83/UUG5lv5nmOJQdPto=;
 b=qW7re9kUzn456EA2DZG/Bs+ir0enUccjyPI++XxZvAB2SShY+RO83UJlsb74aIkIQZ
 dACkYAUXh1/dFlDqhokFqWhi1d2hgyIHas4nfgsktDroJzZbJ1OFBKRZ50YTYheaoE3H
 9MD0Jgw2EL0JSJoB3q39GQkoDx7YHgSyq6gnhwXefAwI3BWYzYbmlnuEAhgikHtTuaSx
 WTHFaoMLLn/j5xyGGAzNRl/37NoBg0IX8IzGvyPGnb6DkGQBgCAMN0Ht2nTXKPPJ8HRo
 fKaHTyO7TX4n2ATWkx91WTHC+tXEvYDhKMQfooKROVg7TukaiMoIEQedA6nr+w3HBAYk
 /sBA==
X-Gm-Message-State: AOAM531k+yHmyk5a+ZeWwfzr2rFJ/yUHaaqUn6doonCEm96Tws39aBRV
 AhAfzhEC3Dpfx5G/9NbrqYs42RYilXmFTd+03YH3GN49mWw=
X-Google-Smtp-Source: ABdhPJzracy+rHxokNNnHVqUSZ380E9cWDqVbxOF16p6KQUjwtwbGHHtk8IdLmfq+dunDs8anDEcCxHL2rkKpucSDOQ=
X-Received: by 2002:a63:2009:: with SMTP id g9mr792002pgg.219.1615841389357;
 Mon, 15 Mar 2021 13:49:49 -0700 (PDT)
MIME-Version: 1.0
From: Tim <timstartuptim@gmail.com>
Date: Mon, 15 Mar 2021 15:49:36 -0500
Message-ID: <CABmZ64yKVBO0jz68qOeQfZ+cxwn0JcfOy9=pKNP1AjLDDUAg9Q@mail.gmail.com>
Subject: Wireguard Windows client/exe - disable creation of routes
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 16 Mar 2021 13:36:37 +0000
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

Does anybody know how one can use the Wireguard Windows
client/executables to establish a connection but not have the
client/executables modify the Windows routing tables.  Functionality
similar to the "Table = off" in the linux WG but using the Wireguard
Windows executables (wg.exe/wireguard.exe)?

My goal is to use the existing executables but to handle route
creation on my own.

I've tried "Table = off" but it does not work.  Nor does a cursory
examination of the source code.  Though this seems to be something
basic, so I imagine I am missing how to do it.

Any idea?

Thanks in advance for your help!
