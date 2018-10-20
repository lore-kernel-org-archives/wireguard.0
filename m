Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD511C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:13:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474172085A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FoG1fL1h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474172085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af71935e;
	Sun, 4 Nov 2018 17:09:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d4f9ab6
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Oct 2018 21:05:23 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f527773
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Oct 2018 21:05:23 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id r63-v6so6673211wma.4
 for <wireguard@lists.zx2c4.com>; Sat, 20 Oct 2018 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=e8xZlBD2sFlqqc9mQapvDazI5luGA0OzKbzxHSjbHRg=;
 b=FoG1fL1hO/y8aAgYS2RZo8GMP0iZcVDSz7jNOo9wpoHbTCavOxwZ2GPE5GNs8t2dZX
 7Y7H57Ar5d/8nawAS2OYcGmBV4D4Jb7dkEmxQK4f/YwOhiEBZBJuL0liSJX9UM2tlLuV
 hqlOrGlW/0o7FMSmz40VSF/AFCBVPL5PLCTQUS4gZEPjshuEeJueI+DddV4Z8cHj/RCm
 exfZV0u+85aU0i0heBGDisn9nc2fR57xkDIJGYFMWfCvjia1YPE7JRTCrRa+F76SplYo
 my69IO1kZa7agd0yUS58MZ6TbFFlylaAAAuIZJNnBstl/ZBT4cYqQlhX/bL2oA92QNB6
 VceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e8xZlBD2sFlqqc9mQapvDazI5luGA0OzKbzxHSjbHRg=;
 b=bFCg8HZ0sJgfETPWI4DDt9O/Lp5aw9IA4NkQsz+lAg9GKPPoxfX3dIUoEGBt4k02lY
 ac0fKBSGU4hzmW/BVD+yiGNC06zoLopuz1V5DeRQ/Dgnr14BDrXkcOBwp3cWaXxvSnc+
 y9f2XTaZmCo8xKYhQ2KTVeMdDA/DH7rkqKQT+OIo5RIcS7bNxVPWMtNNZfKLbZ9dwFMI
 uRI5NLnX439Y0339ifDs7KnYiV2SVRK6NXZ58AlQAmo+QSBsni/DZNbQ1x3uKtWoC4ba
 N8zwHsu7ZWb6Pqwtw0LQHejY8V0yxqmOXYNlzuNRlKxt0KJJizxi3dzJEPmLAX+5Ux9O
 gAQA==
X-Gm-Message-State: ABuFfojVYnolb9oVUGeZBqAIcptBtrZFy2ZdyZ46SSuIiSepthK7KOdm
 pVRruhO7tPqgeSiMy4caftVlKwrtR7k=
X-Google-Smtp-Source: ACcGV636QopRqkG71dYui/VJeL/dBI6mkKmukK7A9lPlt9H/QO76FV6WNgRVpPKRAd3sMb/xhaJTWg==
X-Received: by 2002:a1c:e4c6:: with SMTP id
 b189-v6mr9979802wmh.114.1540069659296; 
 Sat, 20 Oct 2018 14:07:39 -0700 (PDT)
Received: from themisto.localnet (225.86.205.77.rev.sfr.net. [77.205.86.225])
 by smtp.gmail.com with ESMTPSA id
 r131-v6sm14454280wmb.32.2018.10.20.14.07.38
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 20 Oct 2018 14:07:38 -0700 (PDT)
From: =?ISO-8859-1?Q?Robert=2DAndr=E9?= Mauchin <zebob.m@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: wireguard dkms systemd
Date: Sat, 20 Oct 2018 23:07:37 +0200
Message-ID: <2194364.9yR51crFA9@themisto>
In-Reply-To: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:09:41 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On samedi 20 octobre 2018 22:59:17 CEST Lucian Cristian wrote:
> updating the wireguard module on systemd based linux gives
> 
> Warning: The unit file, source configuration file or drop-ins of
> wg-quick@wg0.service changed on disk. Run 'systemctl daemon-reload' to
> reload units.
> Sleeping 3 seconds...
> 
> can this be fixed int the restart script ?
> 
> the tunnel won't come up if the unit is not reloaded
> 
> Thank you !
> 

It depends on how you install Wireguard; normally such thing is handled by 
your package manager. You should contact your package maintainer if this is 
not the case.


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
