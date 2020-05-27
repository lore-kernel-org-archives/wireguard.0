Return-Path: <SRS0=KoV/=7J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB36C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 11:47:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5347120873
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 May 2020 11:47:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlDsnTJh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5347120873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52b469ab;
	Wed, 27 May 2020 11:31:26 +0000 (UTC)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ea6a124
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 May 2020 11:31:23 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a25so16883567ljp.3
 for <wireguard@lists.zx2c4.com>; Wed, 27 May 2020 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=TR6Guyi2wvXDuX0pi4r/K/01/fZKudF/HthgUAa+eko=;
 b=JlDsnTJhpkdCNsdFWkeLeS+yXrqy8slLgNjdk4UL1GYvvjIXqiLL5OoRuchnE52707
 Cfw59eg9IIgIE36AF04PdTFsxhL8+Gxsp4ay2Vu8wSpnBSPd5JlB2EFiN+VpDFpxqgSM
 RaRs7ioc3p3OBheJxvuRXP7xXB1RcZSXaNUAYQeW3nZrJFCzUbqOCzvfCg0ECDy431HC
 NPwWUZ2Up2xoy/ZlNTPBzzVE5VPkDGo0S3wXutvuNbakioXDpeLEWzTKh5cCSEKcGZfF
 nDG8p0+PRnXtZsrXIjk6pUdBdnrNUnX7KIf0b2hF/ocOhb0GjRQU+Ofe+7ooNP13GEB9
 IsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=TR6Guyi2wvXDuX0pi4r/K/01/fZKudF/HthgUAa+eko=;
 b=GpeAmQtdCKDbpQ31Tgwdls0Gblogz9RB1te2/SRvGoOzE+cAU1Q2HXk2LYX7Z10BH6
 1DsvhOB7vAJQ5/hPnyuzHy2+l7fKQ6J12X0PfLSiSduYqhRJaRflhWca3bjBaMu/7wAo
 yYQ1pPxOd3KyURuIRW2hZfolegxGRbgjUU3VG5Jk6F1BWZrZmQ3lr+V3fk6hJTpDYcmg
 twc55MT1LQn17o33YGc2z308BC0ExfIIAUGgYC8EfLeiKvd649aUKrAv+Y68Wy+nh4gV
 0Jb4eShGwGppl8zZQLI/NQP/MvXQdi1+wx5imZlX7xT3eeBdcfW8AfAFF6PuPl3ODOyU
 iEhg==
X-Gm-Message-State: AOAM532SLHju944/cFob3I6o687SmxQ/itiMGnAtdf06fJVV2HMJ5N7/
 Pij98fwGoYjhOqmqjxaeJ98=
X-Google-Smtp-Source: ABdhPJyw7ZXIyuuoG/21SzyJNGA5FEHKgF0Plzuf1R8x6cXHDONcbC+/+Rqf7UJ+BZqM7nVfR9hqyQ==
X-Received: by 2002:a05:651c:1035:: with SMTP id
 w21mr2922555ljm.278.1590580004107; 
 Wed, 27 May 2020 04:46:44 -0700 (PDT)
Received: from PC-681 (134-103-235-80.sta.estpak.ee. [80.235.103.134])
 by smtp.gmail.com with ESMTPSA id s28sm765769lfs.3.2020.05.27.04.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 04:46:43 -0700 (PDT)
Message-ID: <f1d8a68465306d9f3def763eb7460701896acbda.camel@gmail.com>
Subject: Re: Question about origin of packet relative to peer
From: Arti Zirk <arti.zirk@gmail.com>
To: nicolas prochazka <prochazka.nicolas@gmail.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Wed, 27 May 2020 14:46:42 +0300
In-Reply-To: <CADdae-huQZkB2yZ1mD8vTt=0K8X81K3A3LYuCnKbF=GQ3x50xg@mail.gmail.com>
References: <CADdae-huQZkB2yZ1mD8vTt=0K8X81K3A3LYuCnKbF=GQ3x50xg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
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

On K, 2020-05-27 at 11:01 +0200, nicolas prochazka wrote:
> How can i know that a packet come from peer X ?
You can check which peers allowed ips list covers the received packets
source ip

> Is is possible to mark packet not a level interface (wg0) but at peer
> level ?
Its probably possible to generate iptables rules from peer allowed ips
list that marks packets with different ids

