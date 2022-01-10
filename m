Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4C6C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Jan 2022 20:40:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2bc5bc44;
	Mon, 10 Jan 2022 20:37:40 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f4694c13
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jan 2022 20:37:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u25so58593198edf.1
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jan 2022 12:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:content-language:to
 :from:subject:content-transfer-encoding;
 bh=2gjGsbVg8LEi2n1eiMHKtm79XeHbaEhsOEofnECR3+8=;
 b=jvN5v/gae31UN2+qlN9kQoC1HqzUmGNAOFjqT2hlUvcL9wWWvoOuC72FdO2T46QpIn
 gG9k8y3Pn1P3r7iIqbZ8pPuWf9kGwFabzF2pyc8sgVLwNgTcw9Eq2oWhBekem3tTp3EO
 Vlxg9anScrmKkg46+qeCqCE5FOutcYQ0j56F70YMUb1TaMBOkgPJH+dogTWZFyI7lVL8
 rcomCJCRaO5BtIXE2cgWohWU4L72eHNRVSGpcj+OXbVoQozcokxekEMTmIKJUAoSVnTh
 uQBFi6k2b/r1HEDwXMdkzV3tzBPFCWK/Njzb3dFLHHUgX2O5yio+onk+BDwGYRttQdTY
 pDoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=2gjGsbVg8LEi2n1eiMHKtm79XeHbaEhsOEofnECR3+8=;
 b=nIxlbEXYySUzEOO2q4vUZVLWe42YqGV7Qqjpc52giwcZzS2tpFhMIL/Jfktamxq8l9
 KvQqAtFKJ374hXYdLd6W+aJolq/UfEFWiqax/hi2DrcbUKlOhY7vubpQRCDoI0ysP2AW
 iK3F53JKmj5uV+oMSm7Uy5wV2Zif+SqtS244DSDrvaSKcXcU0b70O7D535fhKj6bC67/
 EK4gl2/sb6aUWvN0Vqz9f+lvaXZ79VMusufXwDNdmBMXWoY5J71Aua0mqLNgfPYzEgoB
 2G6vgzFDIjdV3w4V9yOugUY3QW33adRF5Bbpq5jJNb9MsZ/pkxzgCvDHbDSQqJzLLsmd
 v5CQ==
X-Gm-Message-State: AOAM5329tyaPH7MxjcSWLpval16ZDnLbjoTTatgRtdQ0/sLz2MxDuDXW
 lYf5kBzXiIYq+glbHqlW9EJ1Libp1bs=
X-Google-Smtp-Source: ABdhPJy/hLV2MMwOq0ojFGSC1zw1iStHctiNGCXH407YFYse/oaYtV/Uh0zHWDl3X7+EU27Uy1fxdg==
X-Received: by 2002:a17:906:4fc7:: with SMTP id
 i7mr1090500ejw.652.1641847057086; 
 Mon, 10 Jan 2022 12:37:37 -0800 (PST)
Received: from mail.otpe.de (otpe.de. [194.163.141.229])
 by smtp.gmail.com with ESMTPSA id eg22sm3941456edb.34.2022.01.10.12.37.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 12:37:36 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 94F0C46002F
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jan 2022 21:37:35 +0100 (CET)
Message-ID: <1e345f21-4564-7df8-1aae-32ba14d42779@qupfer.de>
Date: Mon, 10 Jan 2022 21:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: henning.reich@gmail.com
Subject: Question about MTU and Wireguard and the current changes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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

Hi,
I run in some connection troubles between two wireguards host (one 
running fedora 35, one arch linux). If I tried to transfer large files 
through SSH (SCP or btrfs send/receive thorugh ssh through wireguard 
tunnel) it stucks after a few byte and nothing transfered anymore.

This happens in the last days, so probably an update on one or both 
machines. I also saw, that there some changes on the MTU thing (If I 
remember correctly, a per peer MTU is configurable)

However. My first try was just set the MTU to a lower number (MTU = 
1200) and yes, scp works again.
Okay, so I did the good old ping test. "ping -M do -s $SIZE -c 1 
172.16.0.2" with $SIZE increasing. And that surprised me. It works until 
an Size of 36932 Bytes. Checked with wireguard and "MTU = 36932" and 
yes, scp still working.

Can somebody explain, why the old default setting of "65456" doesn't 
work anymore but the MTU can set to much higher values as typical ones?

Thanks
Henning

