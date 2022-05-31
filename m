Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227D1C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 May 2022 05:10:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 97b670c6;
	Tue, 31 May 2022 05:10:49 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2963b679
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 May 2022 05:10:47 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4F70790D73
 for <wireguard@lists.zx2c4.com>; Tue, 31 May 2022 05:10:46 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4LC0jL1RVzz3wJ5
 for <wireguard@lists.zx2c4.com>; Tue, 31 May 2022 05:10:46 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1653973846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MPsBlzUR8m26gO/Qe64oh2NJSCruKP1Gm1EGy7F8IA=;
 b=f69lpoVDcdM1C72aqv+txUmLqUMF7IHZFrrjGtEsUX90xLbW084vxeP8uSJInhWlmN4Jk6
 tl0aSSWLO9Vx8Gfabbz9Xlw4DbyIL4KuQb9dNul2i3bERTBFC6uQ/+Z6UzbqE/eHQ+SncH
 4lT3JDMBVjIw59mrrwUrOJF9GSv9SxTIJ5AwjguDeAMN4UPiV4JhcE27CvrbFNEJuJ5R6e
 D2FUSicHM0D5Gw8nOKoNIkMM9+QsdTpmW65b8GK62WrBcH0mUiAqvUPwXxvgH8+WSVTWrM
 GztJHcM30hpGYo/O4joAPI0k0RG2QVwvops4wCOAa7lFfnHxxigV19xH+sDxMA==
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 0D35726959
 for <wireguard@lists.zx2c4.com>; Tue, 31 May 2022 05:10:46 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-lf1-f48.google.com with SMTP id br17so19677352lfb.2
 for <wireguard@lists.zx2c4.com>; Mon, 30 May 2022 22:10:45 -0700 (PDT)
X-Gm-Message-State: AOAM533KKvXkhwu8ZLcuSNEm/hsvA7RLEKstJHpo/70o7MDos2oFBCqu
 /D7n2DfdyJJM7/XTfifIwhcIJkcjQj6wJ/vk5NY=
X-Google-Smtp-Source: ABdhPJxEGx42xbpQQNyfPh25Gu9PG+QDsFYIhlPsSWjItKxo8ePi74hTOhcCssJ6VnihxvriwvQlEaGk1MlJ3bq/fi4=
X-Received: by 2002:a05:6512:2205:b0:478:53d5:bdb1 with SMTP id
 h5-20020a056512220500b0047853d5bdb1mr37681917lfu.561.1653973844629; Mon, 30
 May 2022 22:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <4c3ffcc9-82e2-6295-03b3-d26b3bf3d7fc@gmail.com>
In-Reply-To: <4c3ffcc9-82e2-6295-03b3-d26b3bf3d7fc@gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Mon, 30 May 2022 22:10:49 -0700
X-Gmail-Original-Message-ID: <CACNAnaE6BkRjFWSvBeJ8rmBd+ZArZbHyY_-rnU++JCvKJs8Odw@mail.gmail.com>
Message-ID: <CACNAnaE6BkRjFWSvBeJ8rmBd+ZArZbHyY_-rnU++JCvKJs8Odw@mail.gmail.com>
Subject: Re: if_wg on BeagleBone black
To: Konrad Sewillo-Jopek <kjopek@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1653973846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MPsBlzUR8m26gO/Qe64oh2NJSCruKP1Gm1EGy7F8IA=;
 b=AEnzI0kv593hPT5W2faWZ8qBI9vlPQ4X6Yfu9LhVO8fiyYPEbI7vzWMvNeDfOFwrhOaekm
 VhheATuMr067cfBZQj9HluTQnshx7ici0QoMnEse8mBhiZ259tre7x5l+DAtAOoy29a0Ci
 7l6vrCA4WbfwqTQ7R1mGr3fExnnW9E8pRPiSztuoLqD3UbXt4NlJ8AsK3Y2F85SBBDaP5g
 aJPx2CqDFiZa+r+fgU9keW7cfiEyO8KeWbw8iLj5vmKOJMmQrHsMKYPxiDwDQWmAch18+T
 2hx6a2ruSSbLLioEXgYSmVOIzp/39qcbL77ZblrRpEYKGDsVn/VV55KguLQAaQ==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1653973846; a=rsa-sha256; cv=none;
 b=hKs1x1m6KuyBCnCwt5fHdzUs62VFFQZbwPzMo/5p10jagM9nj/YhxJa5VspJh/xM1LLPo3
 rvl6K9uCiYdg7or7Etai//P+qEBurMvYSB0uZX4/D8nSWsES1FEXqfs0q+98+Tl/setcOZ
 rLvxshtGGuCnuzK+6feyxcwvyY+rh2lZBFDrkldAZIm2EIr4NAyyA5AAmVYcoy95KeMkhn
 ioHlwOsNSA+zKBsbAJ84W/+15k2Nwrii28RAxYLS3YP/NN9EwooyjnHA8ZEfMzdYVoJYay
 P4lGCA3oX8WYYo4j8LJQXDcDwnxAsvjaiNgrJYStOHzW5dmH2JWEQaMtXyXvzg==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
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

On Thu, May 26, 2022 at 3:54 AM Konrad Sewillo-Jopek <kjopek@gmail.com> wrote:
>
> Hey folks,
>
> here is what I get when trying to ping anything else after
> if_wg is up and running on my BeagleBone Black:
>
> root@beagle:~ # wg show
> interface: wg0
> public key: <removed>
>    private key: (hidden)
>    listening port: 39856
>
> peer: <removed>
>    preshared key: (hidden)
>    endpoint: <removed>
>    allowed ips: 10.11.12.0/24
> root@beagle:~ # ping 10.11.12.1
> PING 10.11.12.1 (10.11.12.1): 56 data bytes
> Fatal kernel mode data abort: 'Translation Fault (L1)' on read
> trapframe: 0xd7195be0
> FSR=00000005, FAR=00000278, spsr=40000013
> r0 =00000000, r1 =00000000, r2 =00000001, r3 =00000000
> r4 =d1626a18, r5 =d1626b2c, r6 =0000005c, r7 =00000000
> r8 =d159c000, r9 =d1493900, r10=d7cd7aa8, r11=d7195c78
> r12=d7b378f8, ssp=d7195c70, slr=d7b14c80, pc =c042f854
>
> panic: Fatal abort
> cpuid = 0
> time = 1652353064
> KDB: stack backtrace:
> #0 0xc0355b70 at kdb_backtrace+0x48
> #1 0xc02fcb50 at vpanic+0x170
> #2 0xc02fc9e0 at vpanic+0
> #3 0xc061bc14 at abort_align+0
> #4 0xc061b704 at abort_handler+0x2a0
> #5 0xc05fac68 at exception_exit+0
> #6 0xc042f854 at if_inc_counter+0xc
> #7 0xd7b14c80 at wg_softc_handshake_receive+0x8d0
> #8 0xc035466c at gtaskqueue_run_locked+0x1b8
> #9 0xc0354204 at gtaskqueue_thread_loop+0x1b0
> #10 0xc02b4b38 at fork_exit+0xc0
> #11 0xc05fabf8 at swi_exit+0
> Uptime: 3m23s
> Automatic reboot in 15 seconds - press a key on the console to abort
>
> Do you know, what may be the cause?
> Some stuff on the path suggests some counters are misaligned.
>

This looks like FreeBSD, which version/branch is this from? If this is
13.1, you'll need to rebuild the kmod -- there was a KBI break
somewhere, and it wasn't reported during any of the -BETA/-RC
otherwise I would've tried to track it down and mitigate it. :-(

Thanks,

Kyle Evans
