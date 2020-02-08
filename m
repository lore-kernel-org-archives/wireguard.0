Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69678C352A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:24:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B0322522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="FOaU1z0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B0322522
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20f67e6b;
	Sat, 8 Feb 2020 21:22:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2641e689
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:22:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fba39c5
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:22:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3853d9f
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=sAD9OqumBFcaLXOl4PqkAHJBlz0=; b=FOaU1z
 0/gDtOyJnm/CVhZUXicU/qwHIdXxl+F90CWP++lClxU6KWebrpH//yLHSirRYbTd
 k0MfJ3R8iRT3onoCSofF6n0bKE5z35vSetLAYE+WkOrFwIc/87R4ULx2/1XbW9PP
 lAMQMi/oMfxUBgWrm8DBRVQEwhEQBWY60L3iT24/8dEKQRYzbTNQZvvqzoBuI463
 OLmkioH5Ul7tIiuH7xOcODPvquNwKWAJLgAC8GpH7SYudOGIh22S9vrUvTyj9K6k
 TbuQmVAR6ApssI30W0xNOZxweJnrX/uhVEU3eazeqnwvYJprqMyRMZiQWp131VlJ
 xcV9lF/wUJOq0jgg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0830717c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:22:35 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id a22so5551646oid.13
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:23:57 -0800 (PST)
X-Gm-Message-State: APjAAAV1DasivlLxJW/80vPMk1SBS3hOZ4/14RmglsmfhPUxDrL+lS+Y
 c8blf2spMV8HN74ExVr7yPG5QFM3dxtHWRUpxgM=
X-Google-Smtp-Source: APXvYqwQbUVjMtI5STUoB9hUo6/bx89JSyEgCQVMDQdmkj3Kxl3YDjq+e5c//UmjXQyBefi5JZMog+1xbTcpHjc9KHQ=
X-Received: by 2002:aca:2109:: with SMTP id 9mr5922875oiz.119.1581197036831;
 Sat, 08 Feb 2020 13:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20200208182142.6479-1-khaberz@gmail.com>
In-Reply-To: <20200208182142.6479-1-khaberz@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 22:23:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9oT2Joo7R=naSZ+UnYQzJwTB1aAJx2JjZAk=2kMgTzr3A@mail.gmail.com>
Message-ID: <CAHmME9oT2Joo7R=naSZ+UnYQzJwTB1aAJx2JjZAk=2kMgTzr3A@mail.gmail.com>
Subject: Re: [PATCH] Fix typo in man wg-quick(8)
To: Kai Haberzettl <khaberz@gmail.com>
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

Thanks. Applied as:

https://git.zx2c4.com/wireguard-tools/commit/?id=6fabf9c2fbd056c8c6d5ee9ffd69685aab6baaeb
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
