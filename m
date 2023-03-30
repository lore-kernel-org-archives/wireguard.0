Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C375C761A6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Mar 2023 14:27:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef39e748;
	Thu, 30 Mar 2023 14:24:03 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a93d0a9e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Mar 2023 14:24:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 797F662097
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 14:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F1AC4339C
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 14:23:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="YIyaOFZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1680186238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5Vimitj0qOVnIkj9xX+DcHv5RVc3wYHUI9usWSPnso=;
 b=YIyaOFZ89YEugB0QS/RFalbDf5ahuitUenSq+Uf8D1PSWfFzKeN/FrT3SCJjkC3uYGEPZD
 jmaFAxvC3t+1GXAUm3I7ynze4tvahLl2A64c95X+Uyttck9wfGIamu092+IZOvPnmEnkVf
 9wIFevSJzfEH3NRKNkNfUZoTki2QJOE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d18b2032
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Mar 2023 14:23:57 +0000 (UTC)
Received: by mail-ua1-f48.google.com with SMTP id n17so13907202uaj.10
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 07:23:57 -0700 (PDT)
X-Gm-Message-State: AAQBX9eczGfZHyH7zrcp9XJAYNT3EqHrmGNONPgFZl8dlqzvGdnr9L4m
 bS6nc/opJP2No8O25CgXDbPhbBQGGJzHD/iReUU=
X-Google-Smtp-Source: AKy350YSsjvAwd9WUNdiEGNBmY9QK0x20n3kbVjZNTkbwWDKwutPds/hj76/UAIXl9i8Ts4tuhrigt8bfitHrz2STj4=
X-Received: by 2002:a05:6130:a01:b0:68b:817b:eec8 with SMTP id
 bx1-20020a0561300a0100b0068b817beec8mr14241636uab.0.1680186237257; Thu, 30
 Mar 2023 07:23:57 -0700 (PDT)
MIME-Version: 1.0
References: <CA+CGqoKvx-Yeh6zP1_9goVFaPMKaVPQUij2UrO9B9Ea8cRd7iQ@mail.gmail.com>
 <CAHmME9pXvghVW7RUD3gMRR4R9bAfS9YZ7kbt+27m2tnbGtjXFQ@mail.gmail.com>
In-Reply-To: <CAHmME9pXvghVW7RUD3gMRR4R9bAfS9YZ7kbt+27m2tnbGtjXFQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Mar 2023 16:23:46 +0200
X-Gmail-Original-Message-ID: <CAHmME9rTgQKn54SDO+JDNYVYiSFuaV+wjN2yNNNOSw43P6KiKQ@mail.gmail.com>
Message-ID: <CAHmME9rTgQKn54SDO+JDNYVYiSFuaV+wjN2yNNNOSw43P6KiKQ@mail.gmail.com>
Subject: Re: Nw Android version crashes on Android TV / Google TV
To: Kai Haberzettl <khaberz@gmail.com>
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

Or if you can't wait for the update approval, here's the Play Store-signed APK:
https://data.zx2c4.com/wireguard-496-81ed97b6-5d27-466d-a966-f3c7b498ffdb-delete-me-in-two-weeks.apk
