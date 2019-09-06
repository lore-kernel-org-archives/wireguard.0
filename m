Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41614C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:20:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1ED62070C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:20:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vpRFHGYb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1ED62070C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efb6d5f0;
	Fri, 6 Sep 2019 21:20:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef5714b6
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:19:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aec2d9a2
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:19:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d664d09
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 20:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Vg/vd0/+thKKl7qDttCKwxDPN8c=; b=vpRFHG
 YbUcxKC55/OX+MQBkVqTl+46SPFk2smDlyPs3I7DlBCT9bb+EJPho24C51MmFucQ
 BP6921VEU5iawA049qtsU8ZLb6gAHRkjtckWPYqbLmC8+pNBVGmfk6VgR/cWmUPF
 KgXae5LKFRrMIfG7zwNfH2eRqhy/92hcA3JYd1aKCPwiXNtVTR0gDULmU/lMrmWL
 eq0Nlg542Dcj1Yyyoe63HX9u/yZeCStPs6lpCfw70Jg3bcQdFWCFD1VVnjE8S+ak
 mAfbzHdPHJfPqdBJV//JnoJY3ZFQhXw/xFOPsEk0WJYE8u0IZxZYsvFRjQZTJyfs
 DLNLqYPjcHWTSrhQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b8ce0c7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 20:36:36 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id w6so6181810oie.11
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 14:19:58 -0700 (PDT)
X-Gm-Message-State: APjAAAVWkyYG8YvP97kh6XEXA2hWfLeyQybae2wSjKgx1KuYGIIIrKEa
 cS/V97PG3/ByS7EqDIEIP6+jUyiw3nSkmJ6epmU=
X-Google-Smtp-Source: APXvYqxDmFPH4Evb5fOTAqZKXWuTpHHAHGddGNDxlBDWkr4JyNEoyInWXdYSWeSYNsdOaa2bDSnebKi0bP3oDIk/pYs=
X-Received: by 2002:aca:4a50:: with SMTP id x77mr9063416oia.115.1567804797431; 
 Fri, 06 Sep 2019 14:19:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAFdc9D9mbpJmu=3U3V5wCj-uOCsjMGa5KZS4Zk=aWQduwRjsgA@mail.gmail.com>
 <CAHmME9rqd8VqJiT3xJTba6N9ngaeM9MVqP98f54dU1CtGFfwHA@mail.gmail.com>
In-Reply-To: <CAHmME9rqd8VqJiT3xJTba6N9ngaeM9MVqP98f54dU1CtGFfwHA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 15:19:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9pRjRgoqoEre4MnK47pU210DQ0bQ3GM3FyJ-ciVFSuT0Q@mail.gmail.com>
Message-ID: <CAHmME9pRjRgoqoEre4MnK47pU210DQ0bQ3GM3FyJ-ciVFSuT0Q@mail.gmail.com>
Subject: Re: Problems on linux-image-4.15.0-1047-aws
To: Johnny Rose Carlsen <jrcarlsen@gmail.com>
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

On Fri, Sep 6, 2019 at 3:18 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> available to the general population

https://wiki.ubuntu.com/Testing/EnableProposed

This might work.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
