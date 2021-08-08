Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322DFC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:29:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65B7660EBD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65B7660EBD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be714697;
	Sun, 8 Aug 2021 23:08:20 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cd925881
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 23:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628464092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rEsi84ISZ1dxfrEjFVT3Td751kyDqh+PX3C87r5pLkE=;
 b=fprsg66bxMfOFKrpp1kFGEqmpTcrewqTEZHugStPee3taK3a31tUqX2f1yFxT7aHqoZjta
 EKyYUfLeQba8jqor+jABilmM0HhnLuGQAC8nYwuhyHhUoopI9dgMQEy20Y/ncHkqLTjne8
 JK+DA0kChjllh9CFkdV0NagljTMWrAA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 058eddba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 23:08:12 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id z5so24449471ybj.2
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 16:08:12 -0700 (PDT)
X-Gm-Message-State: AOAM531fnvzSLpjbVYdefLGcJtva8lK0dgrDogh8TjIXSOZpnaA0MykG
 8krctwXXE/SoBjYRZfX+xc+R0rbSYL6gVNfloc4=
X-Google-Smtp-Source: ABdhPJyGXuvQDbfcmIxC+ab5gxQZZezaGH/3wIqGus5ZkDxyh0l7VsC6D1kXnjEM1JjqJBLJIpL8vRgD4BfLeTezRxQ=
X-Received: by 2002:a25:18a:: with SMTP id 132mr26602562ybb.123.1628464091414; 
 Sun, 08 Aug 2021 16:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <DB7PR09MB24606350B108C7CB8DA140BFAB1B9@DB7PR09MB2460.eurprd09.prod.outlook.com>
In-Reply-To: <DB7PR09MB24606350B108C7CB8DA140BFAB1B9@DB7PR09MB2460.eurprd09.prod.outlook.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Aug 2021 01:08:00 +0200
X-Gmail-Original-Message-ID: <CAHmME9pbY0Cgbj5JbTVvsxpkdpvJnZ1ZBLQruuUrumgnJ3U73A@mail.gmail.com>
Message-ID: <CAHmME9pbY0Cgbj5JbTVvsxpkdpvJnZ1ZBLQruuUrumgnJ3U73A@mail.gmail.com>
Subject: Re: wireguard-windows: client forgets after restart that there was a
 activated tunnel before and won't activate said tunnel anymore
To: Denis Brodbeck <denis@shahaya.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Denis,

That's a weird issue. Generally the WireGuardTunnel service should
stay installed unless explicitly uninstalled. The UninstallTunnel()
function is called from three places:

1) if you execute wireguard.exe /uninstalltunnelservice [name].
2) If the user presses "deactivate".
3) If the manager quits with "stoponquit", which happens only when the
user right clicks on the tray and presses "exit".

Are you sure that (3) isn't being hit unexpectedly?

Jason
