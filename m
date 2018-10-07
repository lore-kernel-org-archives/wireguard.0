Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C8BC00449
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 15:49:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32AA2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 15:49:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QnTuMPkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32AA2084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d6212f8;
	Sun, 7 Oct 2018 15:48:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4da6e03
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:48:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1908ce6c
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:48:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 916af69e
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=eEXDbwHx5ALKcdsPlwcnxeM27hI=; b=QnTuMP
 kTxpDhonw+Q8fisznv0zJyKr84UVnEczT1nRocIUod9tm3WLk6C7IegbPrFnWN0P
 47yLoybbvyiy6hmb5x5syaxKbYJJxtFDsfjzDrI0VbvdHocy++iWJh60A8WNKsqE
 bqJTCJndYn3h5jtoHnQ9nDc1ZEXWZeQEbH7BB0HbJiv48mbUnHrghlQHZ2fyB4Cx
 vW0By3km6h1XtdK4uPBW69kipVcxrP12weBJEXORV+rZFtgiUKl89l5vQ1RpzNNw
 3jP3+wN0frMjOnPB5BB1hTcP3KmyvJ0I2f7DvpKomDpXIAp/a7hv42Fesa/X4WK9
 o2JhE7myf8UhU7Gw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8870ce2
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 15:48:05 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id l197-v6so13982397oib.8
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 08:48:46 -0700 (PDT)
X-Gm-Message-State: ABuFfog07an9TDE2CTjnQ5/hh/KQGsF0ZV5hJnOhUCONJM3XJvgybplu
 34cLDB46RCW9sYbTaUybeOen+1YRf99PM6KtJcE=
X-Google-Smtp-Source: ACcGV611d8HNO0dDyKoqqZNvbR4PXyPQInl55N+ChLUsGoG4E6FW1ye71UZ7wbnujAChGBiR6wVPKUbGHsCohLNwA8E=
X-Received: by 2002:aca:df42:: with SMTP id
 w63-v6mr3214175oig.295.1538927325355; 
 Sun, 07 Oct 2018 08:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20181007141139.26310-1-ju.orth@gmail.com>
 <20181007141139.26310-2-ju.orth@gmail.com>
In-Reply-To: <20181007141139.26310-2-ju.orth@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Oct 2018 17:48:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9oNpVomYDhh=fdYFKLEALWB=9zgCXJX0_9Y8pzH=L1Z_A@mail.gmail.com>
Message-ID: <CAHmME9oNpVomYDhh=fdYFKLEALWB=9zgCXJX0_9Y8pzH=L1Z_A@mail.gmail.com>
Subject: Re: [PATCH v4 01/12] device: protect socket_init with
 device_update_lock
To: Julian Orth <ju.orth@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

set_device takes rtnl_lock(), and ndo_open is called while holding the
rtnl lock too.  (Try adding `BUG_ON(!rtnl_is_locked());` there.)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
