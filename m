Return-Path: <SRS0=R3ug=IQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FA4C4332E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Mar 2021 17:03:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4816B64E38
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Mar 2021 17:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4816B64E38
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29ec84ad;
	Thu, 18 Mar 2021 16:57:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6d6c83b5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Mar 2021 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616086666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2raz3xmxfaPvFu2pSkiE0EI0DosoVDw0Ftn7W7ndbM0=;
 b=G49iC/h9XZzWfbd8iIBN/bQGFIOeXsLj0SCifwI7k/KhD4qBYK4KvlL7vAhVkJef+YY7Kv
 RSy3IvLOzCjmOHMIbqFJE8jlY5iwq7FpTVgrTrYkWnonrbfdSm0btwGfnHn6f9HXcF7oSm
 mo4o5llqL5PS6dmuiPOKoCTpbVf7Gaw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0664a31e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Mar 2021 16:57:46 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id v107so2490629ybi.0
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 09:57:46 -0700 (PDT)
X-Gm-Message-State: AOAM5326vQw73rdfslkj1ioB+7tInRBhzIADdGxNwgIMMIydPLu7FiYD
 SFv9TEHkwbv8+U/hjXHZ/wu0ObckkLAoJKgEoDs=
X-Google-Smtp-Source: ABdhPJxFM6kd6HuLbn+LMLeN2oasfNlFJ4GEB8305Y+awsyvETsE2BtF0cpEEadrVskddctTGK/rSn2K74KfISljNSY=
X-Received: by 2002:a25:9bc5:: with SMTP id w5mr309584ybo.279.1616086666065;
 Thu, 18 Mar 2021 09:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <CACNAnaHit=-=rNy2DFZg6=zs1XFBvqt10Ta-MTM79NSWu1AK0w@mail.gmail.com>
In-Reply-To: <CACNAnaHit=-=rNy2DFZg6=zs1XFBvqt10Ta-MTM79NSWu1AK0w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Mar 2021 10:57:35 -0600
X-Gmail-Original-Message-ID: <CAHmME9ombhO5+YHTJugxG0rZEGOFLh6zOw2CnG8OQNAywEHtSQ@mail.gmail.com>
Message-ID: <CAHmME9ombhO5+YHTJugxG0rZEGOFLh6zOw2CnG8OQNAywEHtSQ@mail.gmail.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
To: Kyle Evans <kevans@freebsd.org>
Cc: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Kyle,

On Thu, Mar 18, 2021 at 10:53 AM Kyle Evans <kevans@freebsd.org> wrote:
> involved with this announcement that I'm leaving it for now. There's
> been too much press surrounding this, and it's distracting me from the
> work that I like to do and what I'm typically known for.

Makes sense and is understandable. It's been pretty miserable for all of us.

It looks like we'll eventually find somebody on the FreeBSD side of
things to take over where you left off, but hopefully for now in the
coming weeks things can just level out to some tranquility, so we can
get back to distraction-free coding without all the drama.

Jason
