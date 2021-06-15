Return-Path: <SRS0=zGfa=LJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB899C48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 15:23:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBD761603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 15:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DBD761603
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 097cfabd;
	Tue, 15 Jun 2021 15:23:00 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 88dd76d7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 15:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623770574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LqmRTrAunC9/lQT6NXmxBI0K/XOaIJF5yhABaqq9t+8=;
 b=pSI+PzR+F3qBrYpKcwjcMauUAJvhqAouVcmJjoXjB9PasVpR127vrN6g8oL13dYoEVZCa4
 2yp6EqyPk4qvYToUMW1D7EB0ObF2xqHA5uwN4ZHjo3zNsOhUqklOG/cNNrfVp5xFALZ5of
 a8ptkrbSO3LhsuczWWJsGgIAMQN4Yck=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 27956dd4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Jun 2021 15:22:54 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id p184so21029317yba.11
 for <wireguard@lists.zx2c4.com>; Tue, 15 Jun 2021 08:22:54 -0700 (PDT)
X-Gm-Message-State: AOAM530Bpit0mVmXjLFc91/8pGJoSGdmndKuMitoulzWp5+eYuc4NjWT
 SFOplh8JBXLYalh7zDfifLKmA15KeVXlQRaAtoY=
X-Google-Smtp-Source: ABdhPJwtS2JhzyPd12BXbKxsHQMmMAsrTT+7J8Wt3ftF8RKxSG0psiu1Wjk+fQ1Qj+n4Ar4InhTK7+ykTaIHKr73f+4=
X-Received: by 2002:a25:be09:: with SMTP id h9mr34272975ybk.239.1623770573921; 
 Tue, 15 Jun 2021 08:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADTMz0Kfxc3pQAM=KNstz-dZeHfYDWeqz360pPZLC1RvrW6+pw@mail.gmail.com>
 <CAHmME9qKqGkBp=JjQa0JdQGYa-YSZjdKADZ7k7KwZa1E4+FOOA@mail.gmail.com>
 <B86BC46E-BBD1-4C0F-9193-7E6F31513E69@lonnie.abelbeck.com>
 <CADTMz0++zot3+g2qeGG92ouCjE6UpkHryugZ+xJDzfVqzTYhTw@mail.gmail.com>
In-Reply-To: <CADTMz0++zot3+g2qeGG92ouCjE6UpkHryugZ+xJDzfVqzTYhTw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 15 Jun 2021 17:22:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9pYrnfBZUg8eRhzGdK2ReiMd-p-4Kx5F0t55HJtpOX0rg@mail.gmail.com>
Message-ID: <CAHmME9pYrnfBZUg8eRhzGdK2ReiMd-p-4Kx5F0t55HJtpOX0rg@mail.gmail.com>
Subject: Re: wg syncconf (and setconf) error when one or more endpoints is
 unresolvable
To: Christian McDonald <rcmcdonald91@gmail.com>
Cc: Lonnie Abelbeck <lists@lonnie.abelbeck.com>, 
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

Hi Christian,

I don't condone shipping patched binaries to your users, and I won't
provide support for that here. What I'd recommend instead, if you want
really fine grained control over DNS resolution, is to just resolve
your DNS names prior to calling wg(8), and then apply whatever policy
you want to the results of that prior resolution step, such as
retries, discards, fallbacks, and so forth.

Jason
