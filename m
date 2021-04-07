Return-Path: <SRS0=evAC=JE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA676C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 11:16:17 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B4361154
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Apr 2021 11:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B4361154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=babioch.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e457d99;
	Wed, 7 Apr 2021 11:16:14 +0000 (UTC)
Received: from mail.babioch.de (mail.babioch.de [144.76.131.5])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 90c2d7d4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 11:16:13 +0000 (UTC)
Subject: Re: Best strategy for multiple point-to-point tunnels
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babioch.de; s=24406;
 t=1617794172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRARZHDmJzLiYnkwFPgytkno1Z7xfyTYzQB9LYeGD4E=;
 b=eHIXsFxIzlch7GH+IwhLd2E04UrCRywoXxGhrc87FRHqGkS0UleT8TQOyw4DmWbCshWR+i
 vlrPQU/zUlsVLKBjhPHWF9S+yZaWltUUjxgtVtc7gx+AgA8+xJ6sOogX+AXiERsG8OHHg/
 3YK4eB/y4yf9YN9+X6r0qBIhdweOUBWB2kJKDM2Kv0fSbCysN5YFWlSVUC5De0PhXW9KuV
 k7qDST9EuGB7rhYz5Bk9Zk7vKG97MpD8yBctq9ibFiMp0Fszw8XDAsl1dY4Em5ANB5foPU
 kKfdcIS2e+McBZWWF1YblBwaZbAP53dRPzYOYmhiMDdvpM1e8/DEP/SvO/d4EQ==
To: wireguard@lists.zx2c4.com
References: <93213ae2-3ad1-7f8a-1e21-57f672738e18@babioch.de>
 <CA+cYV6tQA=PkSsJkAKQ199q8qv74s1y_En4gBYwZiu9bHuwu_A@mail.gmail.com>
 <CA+cYV6ve9iPTb5QzdUQ39DEY+7Weq_+OvVLfHi0Jkrx-LMmc_g@mail.gmail.com>
 <76daec03-67b8-25a7-a2c1-bd51a0e9c891@harbourfrontcentre.com>
From: Karol Babioch <karol@babioch.de>
Message-ID: <cd76a8a1-f09d-77c1-0284-b7d449cd2cd7@babioch.de>
Date: Wed, 7 Apr 2021 13:16:02 +0200
MIME-Version: 1.0
In-Reply-To: <76daec03-67b8-25a7-a2c1-bd51a0e9c891@harbourfrontcentre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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

Hi,

Am 06.04.21 um 22:28 schrieb Allen Chen:
> The process of update is bugging me a lot. Does a update break the 1-n
> connection? There should be a way to check the version compatibility.
> But I don't know how.

right now there are no incompabilities (AFAIK). Not sure how this will
be handled in the future. I guess only time will tell.

I was hoping that some (core) developer could share his thoughts on what
it could look like, but maybe its also too theoretical and can only be
answered, once there is an issue and we know what is affected, etc.

Best regards,
Karol Babioch
