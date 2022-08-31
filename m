Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B96C6FA82
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Sep 2022 16:58:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5d5fc909;
	Sun, 4 Sep 2022 16:58:06 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f2c28a7a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 31 Aug 2022 18:18:41 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id r69so14191539pgr.2
 for <wireguard@lists.zx2c4.com>; Wed, 31 Aug 2022 11:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=r84s1trEW8U11Zt3/j+7eTVxncjeVioXnHuwfE7Ary4=;
 b=vwXtvCSsu+RN7/AYoPLfLHN829wEdxILbLCiZi2RaeAWXIM1nYt6z017uBY51SWCZo
 5x3yqED1xXJYytSOlokAeFgo8e4aA5wx6t4JKf8NSt94jrrjzZDiALh3399UHC+X9YOs
 RvlBmdwZwHwZlzvPD1MajDU/xfrCLQB0NmeEGa61URVVHxCIEA1bLF6PU19gYEZfgJQm
 dYq7suzIAqifOyufNfr/PA1+wvpnAXuThdxixLU7vC1kbDxYjs2zMOFppTyWgjiA/0nv
 6JP03gcnUkQg9x/Ji65AqkOu5Um1S+7f3nAfePK4B0XtbijUzg1keuDEBNHbwNwckY4Y
 FoeA==
X-Gm-Message-State: ACgBeo2jaI7D7wElKUoWbRRpRCMM5FbT99/Z/4gMuPSQIwv5SCS8oZAJ
 zOzAPv15d4uGKnsKtQ5OInL9TIXVe3l6zjSMKdg=
X-Google-Smtp-Source: AA6agR7C5vQuA0qTMDjqe6nLH5Z3EFhDcm7LSYESesNp/lBRmRtLweGmSpSFikvrBNJdzlVdts1dPcPx7/refs+G6OA=
X-Received: by 2002:aa7:80d0:0:b0:52d:f9c6:bb14 with SMTP id
 a16-20020aa780d0000000b0052df9c6bb14mr27761309pfn.57.1661969919915; Wed, 31
 Aug 2022 11:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+Mow79-=J1LmFWdFOEnVnV4QCKyWb13YsvzOrsxtWV=GgJ7A@mail.gmail.com>
 <YwzmY6Q/lJIDZyfz@zx2c4.com>
In-Reply-To: <YwzmY6Q/lJIDZyfz@zx2c4.com>
From: Ed Maste <emaste@freebsd.org>
Date: Wed, 31 Aug 2022 14:18:27 -0400
Message-ID: <CAPyFy2DWRu+9ctBiLRpzYdzRj7+tBB_fa1RQM7kwJTz7tTtLvA@mail.gmail.com>
Subject: Re: FreeBSD current socket-src changed. Wireguard not compiling.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Michael Pro <michael.adm@gmail.com>, wireguard@lists.zx2c4.com,
 kevans@freebsd.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 04 Sep 2022 16:58:02 +0000
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

On Mon, 29 Aug 2022 at 12:18, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Tue, Aug 23, 2022 at 12:26:21PM +0300, Michael Pro wrote:
> > Tonight after updating kernel freebsd current I got coredump with
> > wireguard enabled kernel module.
> > ...
> Thanks. Is there a __FreeBSD_version__ change that corresponds?

It is not an exact match, but was bumped to 1400066 shortly after and
should be a suitable value to check.
