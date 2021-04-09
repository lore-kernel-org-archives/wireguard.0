Return-Path: <SRS0=FF2+=JG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A11C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Apr 2021 00:24:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 647BC60FE8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Apr 2021 00:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 647BC60FE8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b04b031;
	Fri, 9 Apr 2021 00:22:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dcc1129b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Apr 2021 00:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1617927742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRzEOipUPbGfX6uVyLeZSWYeiHyOO45f4j64hB1Bj7I=;
 b=AjWhddHi3B2KkSu7TuK752lXh8r80zBCYl7I9HhkE8HTOsZxVXO4ERSSQ+U5evjucHHJ8O
 CaNLCmReAHqVzvEqzMSNpCzO4wCTWLxyxztgk8iVDa1EZgIP5pmFF82qRJrP+K4YCo+SrP
 4J+dVH7eG9wAvcGnsyZMcC5IugzaU98=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3902d352
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Apr 2021 00:22:22 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id y2so2590804ybq.13
 for <wireguard@lists.zx2c4.com>; Thu, 08 Apr 2021 17:22:22 -0700 (PDT)
X-Gm-Message-State: AOAM531q7l07HKKQ5liXf0ORMYMAR5r3waMZ8ZRK3HREbMkyC9IntrVV
 ePinQcewqptzdy+WXzYHxo5q13CK+z8hnJCBGQ4=
X-Google-Smtp-Source: ABdhPJzxlR8RBapXTipkEZUTqCu+uY3WApRwhHIzn79DS5ZmNIlVghSkhdaIg3iRFDN74sHhr7toX9C4jW6pCs+bxpE=
X-Received: by 2002:a25:4154:: with SMTP id o81mr15910361yba.239.1617927741812; 
 Thu, 08 Apr 2021 17:22:21 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
In-Reply-To: <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Apr 2021 18:22:10 -0600
X-Gmail-Original-Message-ID: <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
Message-ID: <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
Subject: Re: WireGuard for Windows "cq is corrupt" panic in rio_windows.go
 after insufficient buffer space
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Fixed! Thanks for the report:
https://git.zx2c4.com/wireguard-go/commit/?id=be6d8fa52daa048277c4b948d65d82b2d1a84090
