Return-Path: <SRS0=YmZ5=HW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8914C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Feb 2021 14:37:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311E464EE1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Feb 2021 14:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311E464EE1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7b82a51;
	Sat, 20 Feb 2021 14:33:40 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c6cb307
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Feb 2021 14:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1613831615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eV+hR08NDfK9bT2VvKNNNkAVReCikkbywVC2679rHr8=;
 b=bIqUhJY2hHTPS87wMaElsyZVKFR/qWRUbZy3yqBLUfbLRNJDFJ1LII0r8Sn3e4nD2HKfAe
 2cbFBiVlMnbPNj4GXa8Z3nrCPDvaTO2PazxUztPpaoEhhvJTWBFSz/8G4Ei4hIMzoDanpg
 3/VbfS0J6sHhtfJJeeJu6hJ3WxNHVVk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 08d72d0a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Feb 2021 14:33:35 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id b10so8498577ybn.3
 for <wireguard@lists.zx2c4.com>; Sat, 20 Feb 2021 06:33:35 -0800 (PST)
X-Gm-Message-State: AOAM532O1Y+y+cDK3JtIBqOZVvThFnu0AEPsZegjZWWEiGy2Ut9JDd71
 uKmOSDILkIqClsKsfOXrKAqKNCQKXniFE60Wwuw=
X-Google-Smtp-Source: ABdhPJzYwWD8Fs5VE78pq1vZUdIHO7lttpGvwc6/P9cd9z068RjJVsSK0IJUjYRSkxsZEsALVzgK3AoIHvi5rs1x5gg=
X-Received: by 2002:a25:4981:: with SMTP id
 w123mr20669935yba.123.1613831614653; 
 Sat, 20 Feb 2021 06:33:34 -0800 (PST)
MIME-Version: 1.0
References: <mailman.0.1612101211.63283.wireguard@lists.zx2c4.com>
 <cc0a6bc9-5450-c30b-b3e9-8bb248b8c07d@noris.de>
In-Reply-To: <cc0a6bc9-5450-c30b-b3e9-8bb248b8c07d@noris.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 20 Feb 2021 15:33:23 +0100
X-Gmail-Original-Message-ID: <CAHmME9pQYws_=qohpKGNeL_=aCmrJ6QWtJ+MyFLQrUqHWAscrQ@mail.gmail.com>
Message-ID: <CAHmME9pQYws_=qohpKGNeL_=aCmrJ6QWtJ+MyFLQrUqHWAscrQ@mail.gmail.com>
Subject: Re: Feature request: tag incoming packets
To: Matthias Urlichs <matthias.urlichs@noris.de>
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

There is no need for this and WireGuard was designed to avoid needing
something like this. The AllowedIPs binding gives you a mapping
between source IP and peer public key.

So, if you have on wg0:

PublicKey = ABCD
AllowedIPs = 192.168.33.99/32

Then you can safely have a netfilter rule that says:

iptables -A INPUT -i wg0 -s 192.168.33.99/32 -j ACCEPT

You only need to match two things: the wireguard interface and the
source IP. The strong binding to the public key is the primary
security property that WireGuard gives you via cryptokey routing.
