Return-Path: <SRS0=nfW+=NA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DE5C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 00:22:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FCCD60E97
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 00:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FCCD60E97
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b0ef67b;
	Mon, 9 Aug 2021 00:21:59 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b2d8e92
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Aug 2021 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628468514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OypRvnBunuo1jzMW2PG/yfTtBwikn2DEvL8aa3W72Ps=;
 b=br85Fd+/uUmNFsDBpPeyv8r90JDJhvzeBJxINDA8TiEnnkSxdQ1GjD1KBwJdVUzOqNds0n
 B++Ms+IBrVWovMWO4Lr5O8emzoRsABQYgWFaGn3y77Oqbt1Mjc2kFSwbqpEdXvEWS0brXx
 vrSxhA58OshMmYdF68DmvQUaqO8ivak=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2c69d960
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Aug 2021 00:21:54 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id s48so26392135ybi.7
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 17:21:54 -0700 (PDT)
X-Gm-Message-State: AOAM5331XGfhkSe1+lVkZlhCLvZ7y5ycwb3f+6VqN7UYGHqoXw4LNjK4
 xJ6mNS4vX0lf6SKgO2p+s8oJeCPimEWqgdr0+Ts=
X-Google-Smtp-Source: ABdhPJzNJV972nOSUMeJWiSHRM0pCnTf1rbm1MEce4MMw069ifiHWZvJbK+1a7O72u46dWYLQbAbd155vpV9YQjlxD4=
X-Received: by 2002:a25:a109:: with SMTP id z9mr26952735ybh.279.1628468513323; 
 Sun, 08 Aug 2021 17:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <437b77e7-7e63-74c4-4447-713eccd42b59@ut-capitole.fr>
 <7587bd77-a81c-0488-90b5-eac7ed98a3db@ut1.org>
In-Reply-To: <7587bd77-a81c-0488-90b5-eac7ed98a3db@ut1.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 9 Aug 2021 02:21:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9qzPuEzhF6PphkBX50EM50iCiMA+9geRQjGz=v=Oi2+nw@mail.gmail.com>
Message-ID: <CAHmME9qzPuEzhF6PphkBX50EM50iCiMA+9geRQjGz=v=Oi2+nw@mail.gmail.com>
Subject: Re: Windows Client - Issue with Tray Icon
To: bandry@ut1.org
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

Hi Bruno,

Thanks for the suggestion. Implemented here:
https://git.zx2c4.com/wireguard-windows/commit/?id=9c230818231d6395c1d4211d78b2f3ea2ed93943

Jason
