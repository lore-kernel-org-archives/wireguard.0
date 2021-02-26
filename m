Return-Path: <SRS0=Udva=H5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B83C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 11:01:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195B164EAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 11:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 195B164EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ce53c0a;
	Sat, 27 Feb 2021 11:01:22 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [2607:f8b0:4864:20::52a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d81cc4f6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Feb 2021 20:30:34 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id t25so6911546pga.2
 for <wireguard@lists.zx2c4.com>; Fri, 26 Feb 2021 12:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=d3T/9mLeAsJZfNanU9gy3pltg/ivQGwrAL9/AjPsZNY=;
 b=b3z24okpbq1vdblKCGEx4abnOXjUZETnaPWlikZ43alVao0IH3FcVMDJv1VWmLngNc
 pm+VFJZTaGAWovuXcFMSy9gGCBgjlPkBRf+sI4SwSGJliOCCDFIMrjjcWB6mwAT5ltOZ
 7Bmfna8pN1Vjxh3taotbYxl+7q+sG9kmcpnwjqYFfm9snbTEoa0pMm6Ibe/6RJWIuLbG
 +h4eN63Ypwq1n6FNlw5sgUkQX4iBqzup04djh6j9Sp6WrkDEO7q95I+n+xp6tHyrIb3V
 RbMLULV32G389fKnMyQQBVbg+A1UQL3fkdpSpjsxKtRcjSuoD94oWQ5D++gko48AcHTm
 /fyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=d3T/9mLeAsJZfNanU9gy3pltg/ivQGwrAL9/AjPsZNY=;
 b=C/xdESGjr9F6d0Kz6Dr4arIbjMhjhcHAJ5oXzQmnLy3dOxb3KObIdg65ZSr04kkv0y
 mVbchEBOloz1LKPhYsMPlpC845N4MeyPlG48C7GQJtFFNLJ2tBrojh6GKDHP449ydDRZ
 6ZPI8YxafDlbAHAbwbywFxVDpN9JQSPuAe7eKXSC2o9VkOQihONsxuIyu4xSR12LA4YU
 WO4Ueoy9sV0jhoXZ/xQ7aTM0Y/CX8NMRGpIxXZq4njk93Rv/X4r4CckKP0WbKjdTVtRN
 CzGZTiqg58C2MTOhEifdvcWsq4IicSJKp1UOyPXJMzj9VxwGci7H+1KbH5eUK4WJo9xC
 wyhw==
X-Gm-Message-State: AOAM5337MlmeyYnZWFoahUtyJtRd0tWPkub4taodWi4U4eivSNo9gVyu
 btI8x8laQ2c7p8I4m64J4H7V76ISKSbv8w3DsgOUy976kB4=
X-Google-Smtp-Source: ABdhPJxgvyK3tdKSblhdkyNICfk8nGsoZPwlWWIZApJvtKhghWC5SWx3JFG0LLk11SoHCP5QYGRDKQb/QjpzpxBfluk=
X-Received: by 2002:a65:5b43:: with SMTP id y3mr4506151pgr.415.1614371432654; 
 Fri, 26 Feb 2021 12:30:32 -0800 (PST)
MIME-Version: 1.0
From: Tim <timstartuptim@gmail.com>
Date: Fri, 26 Feb 2021 14:30:19 -0600
Message-ID: <CABmZ64xFvs+yDU4=ZYYiRzNicUQK2u3zt2+Wb0S2V+1rvGc8fQ@mail.gmail.com>
Subject: Wireguard Windows client/exe - disable creation of routes
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 27 Feb 2021 11:01:16 +0000
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

Hello,

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

Thanks
