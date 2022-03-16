Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF94C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Mar 2022 13:29:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7286d5b7;
	Wed, 16 Mar 2022 13:29:10 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bba001f7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Mar 2022 13:29:08 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id g19so3897599pfc.9
 for <wireguard@lists.zx2c4.com>; Wed, 16 Mar 2022 06:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=J+VEgPf3T/8s8jsBYss7k35A6k4lbrc1PhyPevALUgk=;
 b=a03E78IYEULs4L0vsGrlnrktgzv8Q4xjiQUBlc/Ve5dcxO8dBdIZO+5CaW3XGse6HH
 YKfEAbxRrdYMGfR9eOV4iPjYtAOk8tzgrXHm8//aSu3DbF9O8EQyDybWbIJ56Vu+ZHt7
 RHevifuef154sV296UaHxSCNyAQ3BReWirLwOv6Aeowfryot/2Ko/nhzhlgspGNkp/ew
 AWb35ptflBkpJ/4PmweZRf2tefd2a4qqbcALKZWrGG3ANTinMoeFHhbw+HUjT/Xt68bO
 14DZQxIKiXrem7vCYykVb/wOYQE0LJ757YEr2dYlMTF9l1PUuktZkkqp/fgHOiXRBTJM
 ussg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=J+VEgPf3T/8s8jsBYss7k35A6k4lbrc1PhyPevALUgk=;
 b=gY4R3amFYICIm8dQd7/xPGx2YN9PCbgYJhtpfKFzTRrRGRnbzhr8keKDeIDAkH5PZ7
 L01wLl+fMeQd1TkJQmVjVk7RAshtYai43UxVmyoqFllAZjG/IFXZ/g+kNcpUaDOXMg7M
 kceMBqgzRBZvDlrjDc2245i4FkymD9WD/HHUDWznS7r9vyYDpN6L6JWv9cn1wdb5qqES
 Ikkn40jU9VkS08Jv0DUyVdRF2igYf/TvWEhSQYJJ+TezSpfHatA+udUQdqxdt0RbBIdQ
 tT30FDuR8KKN0qaNoYWakh3LjsYDpR4Me7zPyteugSFTrJ/OB2SZUcAM5AQEfvWpnVH2
 s1hg==
X-Gm-Message-State: AOAM532ZGfDPsR05lL9/L0sjNlk4yc2Na9T1qcd0wEyVBCSXKW8T8fFP
 imdBFOzj/j1unQ2z3GgrQv2M2AE+wx7Z/eTM4mmxYxd+NDUj/lNW4H0=
X-Google-Smtp-Source: ABdhPJz/qYP2zZpD3BzicXMKIqnJIzKr3+hwzEfIZTXr7B7pK8JHR6gBqwb6DSi53+t115gi3hKCrd6JDLzTLok4wt8=
X-Received: by 2002:a63:6f87:0:b0:380:cccc:b387 with SMTP id
 k129-20020a636f87000000b00380ccccb387mr28885749pgc.172.1647437346748; Wed, 16
 Mar 2022 06:29:06 -0700 (PDT)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Wed, 16 Mar 2022 13:28:30 +0000
Message-ID: <CABBZOsnPNS3ZONaTEWvye6sy+kA8rS3uNUm1UUnQgFkcY=aYXg@mail.gmail.com>
Subject: Is Wireguard supported on Mac Catalyst?
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

Hello,

The Wireguard project currently supports both iOS and MacOS natively.
Now there is also the option of enabling Mac Catalyst inside an iOS
target and making it Mac compatible. Without having to rewrite the
code in Mac's AppKit.

But does Wireguard support Catalyst?

When I try to build the project with Catalyst enabled, I get this error:

ld: library not found for -lwg-go

I have been trying now for hours. It would be amazing to know if
that's possible or not.

Many Thanks,
Houman
