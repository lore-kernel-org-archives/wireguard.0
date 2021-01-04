Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A633C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 22:24:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7002251E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 22:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7002251E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd77f896;
	Mon, 4 Jan 2021 22:13:06 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 88bc5051
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 22:13:04 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed5eb0be
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 22:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=PN75zi28HP0xsKFcsHHc89fnqaY=; b=ns1dKa
 CGbKyIow/Fb/re16ClRKN6MnFGk1qWQE0PLLEGy48G1uEpUIxDWHRQC3EfV9XQwF
 cPCDN2vyH5SrTpna/6oUPMYGD8aQd5ebOg8oKfd0vJfaoK1O/4pThpfIaTTS24FC
 M0UtoVfHPrnWUJn2HAjK0MaB7jhs49xdTlnLzng/DNEcP1XTBPEO3fvf/Iz8goQG
 OR+SHBas4ZKv4C3BLKRdAruzEewazpQTG4D/78IDqFQC1EJ3n9Ex5uzUgZ+ar15X
 ouzxk2SFIWjNMaCQUYc/CSoqCRHlhg35NDueII69JhhPvF5s4WfJBW5hQpFGbkqo
 zP0xI8If6zpcTGgQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fc03c816
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 22:13:50 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id y4so27455480ybn.3
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 14:23:58 -0800 (PST)
X-Gm-Message-State: AOAM532Z9Qgr1Dt/FCfIfsQavVs+3m8GyIAuD15/bOhJlHRykzujCBm9
 WQEO7LfgzHah1iE66pauHTwFoYPSD6hX2peDPTE=
X-Google-Smtp-Source: ABdhPJyLCgduHa4Y9qDeBgCfuF68sqRCQGsTtJZL1qMqLPJz72omdXdV+vPjTY796C1/WrxKkx+aPn9fYOjArbWU840=
X-Received: by 2002:a25:4744:: with SMTP id
 u65mr116168195yba.239.1609799038025; 
 Mon, 04 Jan 2021 14:23:58 -0800 (PST)
MIME-Version: 1.0
References: <b20148fb5d1e34fbb61b0b56511ae011@ies.univ-montp2.fr>
In-Reply-To: <b20148fb5d1e34fbb61b0b56511ae011@ies.univ-montp2.fr>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Jan 2021 23:23:47 +0100
X-Gmail-Original-Message-ID: <CAHmME9qxpcmy30wn4ANxLOcwoyi2Rc_UHq_ehNWrEkDeY8gHGQ@mail.gmail.com>
Message-ID: <CAHmME9qxpcmy30wn4ANxLOcwoyi2Rc_UHq_ehNWrEkDeY8gHGQ@mail.gmail.com>
Subject: Re: Wireguard connections are lost after a few minutes
To: Philippe Camps <philippe.camps@ies.univ-montp2.fr>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Are you sharing the private key with other machines?
