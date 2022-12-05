Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4CDC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Dec 2022 17:41:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25f8ab1f;
	Mon, 5 Dec 2022 17:41:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 820dfc3a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Dec 2022 17:41:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15B8E6127D
 for <wireguard@lists.zx2c4.com>; Mon,  5 Dec 2022 17:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF75C433D6
 for <wireguard@lists.zx2c4.com>; Mon,  5 Dec 2022 17:41:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GqLwBa1n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1670262067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4s4aYgESwbyNDuZnFg58dZQZD175Fn/onCtlJvr+NHw=;
 b=GqLwBa1nDzPEN6hImNuWPWw9J3Iuq0xgFkFSfEg1RUeOxbOUzHllj1wcKO54BOC6QtT6Rr
 CkPT/qo8Amoe55ckfOxGGb/V5+oMzOqcMHPjEHiwXs01kwweJ3Xkz2ydtMxMjAVX9Mo0Zi
 eCB3Y6WL9R52wM0JCN++O2AhAEM1t4k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f431e264
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Dec 2022 17:41:07 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-3b5d9050e48so126236637b3.2
 for <wireguard@lists.zx2c4.com>; Mon, 05 Dec 2022 09:41:07 -0800 (PST)
X-Gm-Message-State: ANoB5plvm1kjE3L9VDWq5k+x70YfMTFnpBT6mxuyabW9BM+GMnd1AxZJ
 MkaRMUqabQ/iqIo1U6U+Doe05YSngGrjr9TRR3U=
X-Google-Smtp-Source: AA0mqf7xVoW14J+TcHMQVwvTGwPVsMkcsYkfQb0/ZzJYrajby/hjkib5GYhRA6KLFw9RRZhn0tpqrqQHdPg6nZDSTMw=
X-Received: by 2002:a81:4f53:0:b0:36f:de9a:3229 with SMTP id
 d80-20020a814f53000000b0036fde9a3229mr13112901ywb.143.1670262066570; Mon, 05
 Dec 2022 09:41:06 -0800 (PST)
MIME-Version: 1.0
References: <CABBZOsks3ZnpcURYHSQcaWCe8ETY21zitPY5TvtTaAm38DT5EA@mail.gmail.com>
 <834CB179-958C-4C0E-8B17-9918C8A992FB@mullvad.net>
 <CABBZOs=9VVSDEGPw1eQWmusJotA5toLCn1-uNQeZ+moPthAOxg@mail.gmail.com>
 <CAHmME9pZy+EYQbmrBi_5Ei191zJ_X3imSuZ_U766HhXp39MHbA@mail.gmail.com>
 <CABBZOs=yZj7R1oWrj9EUDk8QSGfbhNSjBLmhOtqAPrT5Esrh7A@mail.gmail.com>
In-Reply-To: <CABBZOs=yZj7R1oWrj9EUDk8QSGfbhNSjBLmhOtqAPrT5Esrh7A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Dec 2022 18:40:55 +0100
X-Gmail-Original-Message-ID: <CAHmME9ptx38ZFKs3Ve2=d3G787S4oNzoyJqefAbFwEcdWYbT_w@mail.gmail.com>
Message-ID: <CAHmME9ptx38ZFKs3Ve2=d3G787S4oNzoyJqefAbFwEcdWYbT_w@mail.gmail.com>
Subject: Re: Wireguard iOS crashes after upgrading to XCode 14
To: Houman <houmie@gmail.com>
Cc: Andrej Mihajlov <and@mullvad.net>,
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

On Mon, Dec 5, 2022 at 6:15 PM Houman <houmie@gmail.com> wrote:
>
> Hi Jason,
>
> I was wondering if there are still any plans to focus on the Apple
> development and bring the repo more up-to-date, please.
>
> Since the latest major development on the Wireguard Linux repo seems
> to have finished by 31st October, I was wondering if Apple dev could
> be prioritised next, please.
>
> I can see there was an update to the License file a couple of weeks
> ago. But the last real commit on Apple repo is from Sep 2021.

Yes that's the next priority.
