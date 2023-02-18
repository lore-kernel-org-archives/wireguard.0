Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3488AC61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Feb 2023 17:50:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d08eb5b0;
	Sat, 18 Feb 2023 17:50:43 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 292b7f1f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Feb 2023 17:50:41 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 h10-20020a17090aa88a00b002349a303ca5so1005597pjq.4
 for <wireguard@lists.zx2c4.com>; Sat, 18 Feb 2023 09:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qq27IcDWxYMd2k/IclolrkDcC9+ud3EF7JeSblElt1M=;
 b=WDNve3CyAdTAqwRGUNK6qz2xVNmtv7dNqMtQXO3BROMhz9Jat/35aa5mCDuQMdCgW0
 yL/ulDkeK6QeABE2gRf4tuitJtEGzUahBBLq7Rwa1L3Qo8A63xb4FrYSnmIy7/+njAAG
 jm69WsBv7jMHBWScgYjlQ4ZzKRGiGSnTIps8Ry3Z0bwLzQPTHcKQYhdYFju/DE0V1qzP
 RbHej1+vx9LgUoGdcps98tukFLrZG/pEDSV4WhFDdmjeTP8BJZAhg6mjHoZXP5qAqexD
 y8oEwn1PqB/QWgoUjEPO8DOlwmzfP1fzRKXSnd9BzZQf0nmASXfgiEtmXKMk5Wv/3Vek
 MpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qq27IcDWxYMd2k/IclolrkDcC9+ud3EF7JeSblElt1M=;
 b=CbvtQnKfczDOHJH31uGjmZVkNyRxahfsUwBc5dxX9JzMdra3T++cLqaNVOflbl03Q6
 hzuiuGgc70jjIitcxyHFlqVDFXlKsJKmDlI+Qqftr6J3+bJP5qaHPgvn6zTWmo+AFID/
 841ZsE5vDi24ONWqhc5DiSkYaBzWfCVp4nL/JlbqZ6lNzUEk83wz+GjmwVo1oVTWMtK8
 deopF6GoNNRHEA/WfdPQ3XtFjuuKTg6jNcI1sFQs2c/eDx6eB/iBJ0vNQ9uIqLOAMBgk
 3U/wzmtmZJ9wmuIJV4Px9o41OgKPHLmidjmj4FGHHt2UFLhcgVgmoNLvlK6nqjBhEf+8
 3bGQ==
X-Gm-Message-State: AO0yUKWj5H8OskIW1MtGLGUD1FVXI2OXlb+T4YmFE3H+QszM2v6zNAr0
 JzdKh8GMAlb15UKvWqWztONJwA==
X-Google-Smtp-Source: AK7set86ySsTtb3UyepZekRtBC0qLgMEON/Z9CVvk8H0I9lI8+L/DxLBo1IpsHDflvv+0bCDtFN89g==
X-Received: by 2002:a05:6a21:3391:b0:b6:a9ad:a07f with SMTP id
 yy17-20020a056a21339100b000b6a9ada07fmr5178019pzb.27.1676742639321; 
 Sat, 18 Feb 2023 09:50:39 -0800 (PST)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
 by smtp.gmail.com with ESMTPSA id
 s8-20020aa78288000000b005a83129caeasm4890712pfm.185.2023.02.18.09.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Feb 2023 09:50:39 -0800 (PST)
Date: Sat, 18 Feb 2023 09:50:36 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org
Subject: Fw: [Bug 217054] New: wireguard - allowedips.c - warning: the frame
 size of 1032 bytes is larger than 1024 bytes
Message-ID: <20230218095036.7c558146@hermes.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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



Begin forwarded message:

Date: Sat, 18 Feb 2023 15:49:26 +0000
From: bugzilla-daemon@kernel.org
To: stephen@networkplumber.org
Subject: [Bug 217054] New: wireguard - allowedips.c - warning: the frame size of 1032 bytes is larger than 1024 bytes


https://bugzilla.kernel.org/show_bug.cgi?id=217054

            Bug ID: 217054
           Summary: wireguard - allowedips.c - warning: the frame size of
                    1032 bytes is larger than 1024 bytes
           Product: Networking
           Version: 2.5
    Kernel Version: 6.1.12
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Other
          Assignee: stephen@networkplumber.org
          Reporter: ionut_n2001@yahoo.com
        Regression: No

CC [M]  drivers/memstick/core/memstick.o
drivers/net/wireguard/allowedips.c: In function 'root_remove_peer_lists':
drivers/net/wireguard/allowedips.c:80:1: warning: the frame size of 1032 bytes
is larger than 1024 bytes [-Wframe-larger-than=]
   80 | }
      | ^
drivers/net/wireguard/allowedips.c: In function 'root_free_rcu':
drivers/net/wireguard/allowedips.c:67:1: warning: the frame size of 1032 bytes
is larger than 1024 bytes [-Wframe-larger-than=]
   67 | }
      | ^
  CC [M]  drivers/net/wireguard/ratelimiter.o
  CC [M]  drivers/memstick/core/ms_block.o

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
