Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28CFC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 19:55:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E86C064EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 19:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E86C064EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=startuptim.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1392770;
	Mon, 15 Mar 2021 19:53:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bfd8def2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Mar 2021 23:52:01 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id c16so14433219ply.0
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 16:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bNyytrOBBRZsLvUxjcZwHhhC83/UUG5lv5nmOJQdPto=;
 b=jpx89DVnhpUttW/b1Gl84kTpdlMIYlFqWPc8V1ajP22JVKd8Mh2kSaZGp5EVUtXNs0
 RRxN0kSBY4GD2zAMk7jaE2psThoNqffki0WPceQ0qvF0ioceskiVdF4AesJ/6vOmSU0f
 PWuAdBQv+1aohXSqWbKcXgatWCae5sTZZNwv+bTvxZTcKaBRmJpiqXN5S4Y2sSfC17gn
 aeJ9jLaEwKDA7j0PXghkEsqHBm4l8clgZn1wqiZQL+6TZENf1b+0IXt7glbAEyPcSljl
 FRoFtb27wQDPYTxYiz70apqdDWoRV5xWLaTK2jZHEiwwYoghGM+UdHK+M14RSj1Km5Dg
 W9iA==
X-Gm-Message-State: AOAM532MzqhbQHyAz3lPtDJqt0hHeMgHIfbUA1xOsnNvdD0mBKZi8h/Z
 zw1qfutifvLa+xv5QeREBBSO1M9tb00=
X-Google-Smtp-Source: ABdhPJw65Ctyy0YXxSE3Nf+yX48MWSPe7XG4qdKkEJH5jgI4372MsnnxYqSA4St82g/6e3GFbNM/+A==
X-Received: by 2002:a17:902:ff0d:b029:e4:a497:fdad with SMTP id
 f13-20020a170902ff0db02900e4a497fdadmr8643637plj.33.1615765920299; 
 Sun, 14 Mar 2021 16:52:00 -0700 (PDT)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com.
 [209.85.214.180])
 by smtp.gmail.com with ESMTPSA id 9sm11137076pgy.79.2021.03.14.16.51.59
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Mar 2021 16:52:00 -0700 (PDT)
Received: by mail-pl1-f180.google.com with SMTP id n17so10856729plc.7
 for <wireguard@lists.zx2c4.com>; Sun, 14 Mar 2021 16:51:59 -0700 (PDT)
X-Received: by 2002:a17:90a:6ba3:: with SMTP id
 w32mr9875712pjj.226.1615765919758; 
 Sun, 14 Mar 2021 16:51:59 -0700 (PDT)
MIME-Version: 1.0
From: Tim <tim@startuptim.com>
Date: Sun, 14 Mar 2021 18:51:45 -0500
X-Gmail-Original-Message-ID: <CABmZ64w1j-5py4xc-JPUU4wz52w3+zpYptoDxENifzeKk5HxRg@mail.gmail.com>
Message-ID: <CABmZ64w1j-5py4xc-JPUU4wz52w3+zpYptoDxENifzeKk5HxRg@mail.gmail.com>
Subject: Wireguard Windows client/exe - disable creation of routes
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 15 Mar 2021 19:53:00 +0000
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
