Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131A1C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jul 2022 16:03:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5ca5b52f;
	Tue, 5 Jul 2022 16:03:45 +0000 (UTC)
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [2607:f8b0:4864:20::e32])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 460646a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2022 16:03:43 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id q28so12360487vsp.7
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2022 09:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=slEXq/G31jDSHF2Vtt8JiedAiCCp9hC55AANbuEPCOQ=;
 b=k9xFqAllkE3EWiTsxaZi1dSMAxe4v27RMctPxHP2q1ETuKo6x/60Gkan8cMCis5E3b
 iEXbbvuPNI9RIVuUsz91gFFF9C0QjKaEHCHYJPGJFsIXeMjRz4+jKhG95v6qeDjS7zCU
 G/698CPLJvIfN1K5UryG97XogrGDWeC40ypdERJtLYkw0rvCCKcDkY3B32RsAfN4sGGq
 OonA0n+yGtugqjrOn/mdYUKabVEacwfJx53OOjOmkS01dGuMn4VzXEkminmXNH1EZLOI
 wihS+aMVr4SsCKItQWRGczYriFvGcHDmP/OE0tQ8U6WC0gG+1TIPOUiZV1sc+eIt75MF
 0zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=slEXq/G31jDSHF2Vtt8JiedAiCCp9hC55AANbuEPCOQ=;
 b=Qxu0iM7X/OiURJ2KwQwMZDJgSYOWyiA08Gb8SGehiz4unxF5SGptxfy5QM0rxmWGwY
 85JxL3O1l9RG9iRmE99wnVy4BnSam3LFpmC9MPVefGtVJGHipr3AOVMgQXRXgoTMV0fv
 uOKfkAMWwsLtBBolo9Nw+Ca6K6QM+Q6ICe2n7MMhgPwOrd4b1r+0f/JobFdVJl2H8AmH
 iFiJiR5MLzSsUSo3nitzIZnFTsdJPGy0s/sPLNTnPE97nS5zOr1+h7N9Ef8mgzQ7KExG
 ZmHRRyN6IZDUrbR20zN4nhVjr1p9bXhoVsjIfgYIKqSDEGBccvgoa5fy1PlfzNr23ptK
 HFpg==
X-Gm-Message-State: AJIora+LT/+heBQFjPzb7QzEAKkRG6FVXYIpixhzZtTv0anmLMtvkM8x
 uYPdg0rfrC2T1lL7D8PCBVZm6FHk3ze2hBg7Pr12wxT7pvU=
X-Google-Smtp-Source: AGRyM1sCTtASQ4C5j+I0LfuaEW4yyrXSD+/vx3oSvSdUG+9Jl8hcbZoPOTSyFAPcp358kn/yhu0YB+KvJrE9H9RoacM=
X-Received: by 2002:a67:ffc8:0:b0:357:8ec:4b42 with SMTP id
 w8-20020a67ffc8000000b0035708ec4b42mr58886vsq.16.1657037022208; Tue, 05 Jul
 2022 09:03:42 -0700 (PDT)
MIME-Version: 1.0
From: Alexey Ponkin <alexey.ponkin@gmail.com>
Date: Tue, 5 Jul 2022 18:03:32 +0200
Message-ID: <CA+QYBNnQBGhK=kfM5ppJ3mMPumwv8obcsqgsT68BtxvNcWp+Uw@mail.gmail.com>
Subject: Adding '-fembed-bitcode' to 'wireguard-apple' build
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

Hi guys,
I have the same problem as mentioned here -
https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg07033.html
In short: I added '-fembed-bitcode' to wireguard-apple's Makefile and
it solved the problem.
Let me know if I'm missing anything.

PR - https://github.com/WireGuard/wireguard-apple/pull/13

Cheers.
