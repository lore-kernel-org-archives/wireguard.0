Return-Path: <SRS0=RTrd=57=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517C1C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:57:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED71120774
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Apr 2020 21:57:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JOOlFyA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED71120774
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ad05d79;
	Wed, 15 Apr 2020 21:47:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6295d4b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:47:03 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9f0b974
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OdCwxEG2ldqPqhYg0AkRPkIv8Uw=; b=JOOlFy
 A3t6ie9LZXSnAzwS4aGylzmvknpxKLeevv43Ny2UqtKxWYhcyKQPwDEaSk30QL44
 X+ubR0vljOlTEBqOGFByxy1VUfNR0eZ8Jf3O4POkfq3BM/jtWnY5I2Ni+V+rbxCx
 fC9SRSaR5YraClhVCJAEHkJQ2VjLH5TxjXNWet9rEZbYR0dPp6RtKSdGTN2LTBRc
 b1w0/u2rk+zEg1kqJ12Ksw0gN+/6gn/erT34rhbyaweJGZRGkjzz9yQWKGmTz5k/
 yM5leWGQA0zEDejoYW3Wdhsv5spv/xruAnWwJm2VDsZUbtbSMX+v1ZmSJd5Kb0ZX
 Qx35l7IWnxJiesIg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b7f4859b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Apr 2020 21:47:01 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id c17so4941839ilk.6
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2020 14:57:01 -0700 (PDT)
X-Gm-Message-State: AGi0PuaIhJKGzFNky2vREfN1LZrFtTbw0l4p4ycW9GYLR6KpchIPvPOc
 UfsCEHPw+guRrql2mglmTvEJuQI8e1C81mAawHg=
X-Google-Smtp-Source: APiQypJCK5nEpbNucBXIumYt1Os+h6nMDesFCFd1UHXtPgp77KW5FhN+Cj7w7O0NOKQSMKknuQQzzbCpUxP0fkjZoQ0=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr7990244iln.224.1586987821105; 
 Wed, 15 Apr 2020 14:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <50d9516e-9546-07ce-d0f4-434e5893f2a9@attglobal.net>
 <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
In-Reply-To: <CAHmME9qRQGQLbuDcfcf8zvsW9twzCkCNqkdMd8kMgEABF=kBYw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Apr 2020 15:56:50 -0600
X-Gmail-Original-Message-ID: <CAHmME9roWgF=8OmYkiexuhAb+dYsiGgRoLGDyiLmNcn8jipj+w@mail.gmail.com>
Message-ID: <CAHmME9roWgF=8OmYkiexuhAb+dYsiGgRoLGDyiLmNcn8jipj+w@mail.gmail.com>
Subject: Re: kmod-wireguard 20200413 fails transaction check
To: Eddie <stunnel@attglobal.net>
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

On Wed, Apr 15, 2020 at 3:39 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> This is because ELRepo is a crumbling mess held together by bubble gum
> and scotch tape. Run this:
>
> $ sudo yum install yum-plugins-elrepo

$ sudo yum install yum-plugin-elrepo
