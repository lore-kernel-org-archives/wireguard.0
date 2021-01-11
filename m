Return-Path: <SRS0=3yHi=GO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F164EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 23:21:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B2F22D07
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 Jan 2021 23:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B2F22D07
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9c75659;
	Mon, 11 Jan 2021 23:20:57 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [167.71.246.149])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 77de4c7e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1610407252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YfknsT5Nff3vSIxpPDeH16Neo9fyfXmZ5rsJnqtpp4I=;
 b=A33LnmDZDpctAPGVvwyTK2KGyc0ULLA6JMO+Xhxzdho/1236/Jsqkt8pIZNwYw7HJh89xG
 Gu50m9OpqGg0n74D9mrUU4o7wdQehM1/l7Jl49OsEUx+9P1wXbXCeO35P008BzwS4+Kw3Q
 fLrQuZVuKs6iy4K5kFSgmnD4hmDQvTo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 84d4d503
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jan 2021 23:20:52 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id f13so396551ybk.11
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jan 2021 15:20:52 -0800 (PST)
X-Gm-Message-State: AOAM533QChRXfnc/Wig33TBGl+RljCuaJ+jh7A4/WXvGJAmH4ir9YzY4
 I4KssN69OiLiQZ4QSYy3kOaMt7RlMDbva6xDugY=
X-Google-Smtp-Source: ABdhPJy6FwZykhP6XVg/bq+mFdUwua2fkp8TXrD19qWJnibyt4WPX7ClP/QVJgcen3xCYXJajBezL9rQOWg4FykBsiU=
X-Received: by 2002:a25:4d7:: with SMTP id 206mr3178181ybe.306.1610407251371; 
 Mon, 11 Jan 2021 15:20:51 -0800 (PST)
MIME-Version: 1.0
References: <78d6a7df-fa89-7d75-480b-aea3c52f72ee@gmail.com>
In-Reply-To: <78d6a7df-fa89-7d75-480b-aea3c52f72ee@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Jan 2021 00:20:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9qzEYxA6uES=Mq8zUrUCogsrP_BmSasVH++_T=2VvennA@mail.gmail.com>
Message-ID: <CAHmME9qzEYxA6uES=Mq8zUrUCogsrP_BmSasVH++_T=2VvennA@mail.gmail.com>
Subject: Re: AMD RDRAND
To: Germano Massullo <germano.massullo@gmail.com>
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

Hi Germano,

On Mon, Jan 11, 2021 at 10:54 PM Germano Massullo
<germano.massullo@gmail.com> wrote:
>
> I would like to inform Wireguard developers about the following.
> it seems that this [1] old AMD RDRAND problem is still present:
> RDRAND on AMD Ryzen 9 5900X is flakey -
> https://github.com/systemd/systemd/issues/18184
>
> I own 2x Ryzen 3600, feel free to write me in case you would like to run
> some tests
>
> [1]:
> https://arstechnica.com/gadgets/2019/10/how-a-months-old-amd-microcode-bug-destroyed-my-weekend/

I fixed this already, by removing the use of RDRAND from
get_random_{u32,u64,int,long} entirely:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=69efea712f5b0489e67d07565aad5c94e09a3e52

This happened almost a year ago back in February, and was backported
to the stable kernels too, which means you should have no issues
finding a working kernel for your brand new Ryzen.

Is this actually a problem you're experiencing or is your report
mostly just speculation based on that systemd issue you linked to?

Jason
