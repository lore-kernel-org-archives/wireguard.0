Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACE2AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:29:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D8E164ECF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:29:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D8E164ECF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c643e7a6;
	Tue, 9 Mar 2021 21:26:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b14ee627
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 21:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615325209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o2NIolnlir9IyGUfCwzqer7fOac5/Pvz8h97yv5KcsE=;
 b=gEpsQtz2hoe3nYc4hdvetW2HXR2HY2fjQpd0fbH10b94WhooK8LjPQtgqisqrwK8Fywi6G
 Nz8kEgzTzTtbiUoZH9wgQi/VXYPPqR7aOpyDX3vMOvuhD8apW7a/MFfOgpfIjSx9WrZbfm
 GjYYexH2uuc0+CzWgJFKVI6FytcvFxw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ace22ffc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 21:26:49 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id m9so15506665ybk.8
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 13:26:49 -0800 (PST)
X-Gm-Message-State: AOAM532Wb5Od/QmF2kensVbN+aq6LlMG+MEcv2Gh5BwyWiB5JPsApIE+
 OMAOQnR4f/0SeERpo19Ud55JLregxEi6ulptnyo=
X-Google-Smtp-Source: ABdhPJzWoCzabiONewk/0+tOEhN0S/OZaROh5B41tseH7Joud3IqJw0KRpiSqavxFh5QiPL8zd6hCeStuhLmNyhgHiw=
X-Received: by 2002:a25:5289:: with SMTP id
 g131mr44546866ybb.178.1615325208944; 
 Tue, 09 Mar 2021 13:26:48 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOUJVEyxfT-bOhUe4gZb7yUN_=xwun13pnt+iDZus=LRXQ@mail.gmail.com>
In-Reply-To: <CAKVinOUJVEyxfT-bOhUe4gZb7yUN_=xwun13pnt+iDZus=LRXQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Mar 2021 14:26:38 -0700
X-Gmail-Original-Message-ID: <CAHmME9pC=y2_d_z6iyB2ci0O2gKw7WyXnkTxj7AAfwbWLcA7zg@mail.gmail.com>
Message-ID: <CAHmME9pC=y2_d_z6iyB2ci0O2gKw7WyXnkTxj7AAfwbWLcA7zg@mail.gmail.com>
Subject: Re: Any possibility to run wireguard-go with android vpnservice?
To: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
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

What you're trying to do has actually already been done and is
available with a nice Java wrapper:

https://git.zx2c4.com/wireguard-android/about/#embedding
https://search.maven.org/artifact/com.wireguard.android/tunnel
https://javadoc.io/doc/com.wireguard.android/tunnel/latest/index.html

This should hopefully save you a bunch of time.
