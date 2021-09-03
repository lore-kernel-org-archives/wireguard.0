Return-Path: <SRS0=rqdY=NZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD8BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 12:16:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CC46101A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Sep 2021 12:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43CC46101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4727a204;
	Fri, 3 Sep 2021 12:16:29 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 481f7a6a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 12:16:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so3691026pjc.3
 for <wireguard@lists.zx2c4.com>; Fri, 03 Sep 2021 05:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7RsEFc5G/M5mEtFl6V5W+wdLbn42NgVxSOlGSj9BYMQ=;
 b=j0CyItVNpmzi31jGuIO3AnoLJr70sf5Rr+MbYEUeoDG5d+xvyFf+BHy9sSG3KrdKbj
 KNTu5CKMQUptcfW+WCw7gMTDnNIvCDn3WiodhPzE+VljGFaBoDLbp3HpeiQlqlrbidZN
 xHyb6fqRHDLWEsYjJODvfNFti9rZOJyc1UFfzcpmJstX7yuGX6Yrw0y+lzoo2aVv2FAC
 2nt31iYYjkk/rTX/mN+m8mx4NYB6T06OscogrDohgPLJoqnznDYhL2f63k36sALTWso3
 9CiVZXgHgu+uKY5TvdPniyEj/ihcNjDfJuUs/vVYGo7wEVElh/7ch9n02IqmwtqU22Z3
 a2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7RsEFc5G/M5mEtFl6V5W+wdLbn42NgVxSOlGSj9BYMQ=;
 b=IQasoIZE4mMtVdnT5ZThRxsk0xp+ZU+eFEZ2TJZzIgMWsFd3lxTX9YAag4ZlaW1KuL
 MPQ/QWy935lgGIFgR0+UOi1LCxMDPOOliC3+1YnTJvV9Xqq/i0v873h5WAggokeEKWrX
 aDCE32KRPl1G0W9kAkzSqgb8SCWEU2NyG26IJdmz6pS1xCWnFdVXPLfYiw4ZJA13x2rP
 n4jGl9KQMroR0NaH6aCDRAT91JZap5on9mhZTmnsqbyn9smmK0fxXg1mHPWQ3UOXCbkO
 tpu9Zjk02MPAVaY6vhIS7uDQ55Cfggx8GaOKjVXq0UDSMV51FjbTEooEO4dwKlXLzw27
 /qeA==
X-Gm-Message-State: AOAM532ZOvcqlnwbZkAUAE4n+ktkmxG77z4JU17YGRj632HuPGzuKC+w
 5/+HISksFljzWIMmFx52uPI=
X-Google-Smtp-Source: ABdhPJwESWt7PnH1e9xWhvnuH3TWQzV90q71BabG7+4YecekT6Pe0+MAP9t35mvpfoLigdMHaLseOA==
X-Received: by 2002:a17:90a:2f23:: with SMTP id
 s32mr9367333pjd.168.1630671385920; 
 Fri, 03 Sep 2021 05:16:25 -0700 (PDT)
Received: from Laptop-X1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id o10sm5097907pfk.212.2021.09.03.05.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 05:16:25 -0700 (PDT)
Date: Fri, 3 Sep 2021 20:16:19 +0800
From: Hangbin Liu <liuhangbin@gmail.com>
To: Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 David Miller <davem@davemloft.net>, Xiumei Mu <xmu@redhat.com>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com
Subject: Re: [PATCH net] wireguard: remove peer cache in netns_pre_exit
Message-ID: <YTISE6AI3y3Le9ww@Laptop-X1>
References: <20210901122904.9094-1-liuhangbin@gmail.com>
 <YS+GX/Y85bch4gMU@zx2c4.com> <877dfzt040.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877dfzt040.fsf@toke.dk>
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

On Thu, Sep 02, 2021 at 06:26:23PM +0200, Toke Høiland-Jørgensen wrote:
> Ran this through the same series of tests as the previous patch, and
> indeed it also seems to resolve the issue, so feel free to add:
> 
> Tested-by: Toke Høiland-Jørgensen <toke@redhat.com>


Thanks Toke for the testing during my PTO. I will try also do the test.
Toke has all my reproducer. So please feel free to send the patch if I
can't finish the test before next week.

Thanks
Hangbin
