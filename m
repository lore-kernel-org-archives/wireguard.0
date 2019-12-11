Return-Path: <SRS0=vHM2=2B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5BCC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Dec 2019 19:23:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C08C420836
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Dec 2019 19:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ki8ihiXE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C08C420836
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a156dd9;
	Wed, 11 Dec 2019 19:23:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e828d0d
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 19:23:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c38d65e
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 19:23:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74942938
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 18:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=fSnvT+AB/PlJFhWeNsF5A13dBVM=; b=ki8ihi
 XE5LxzyNuXgpkQjK6M8JEw13CvuXwh9zemuH2pCDKc4gXxpj9KmNA6WGcts3mEt0
 xUdY+ZtcTaqoxC9PhjGM0WQXHvMC6E4AFbsr4jAvPqsN6WL4I9gUVklWwL2ZVlBF
 s2a+w/QrcDb0wFsbtTrgT7Md84ZR8Z3/lWeSEuqEZHJWDkp8uxtqwHSBN+GpmBJt
 dWZoSEEa3LHzQvpn2KLZyrh0Z5vguN5HNIU0/y9GFZecN5hmD2bBdQ2bAR7/T55B
 Zq9y/jLiltsKRmb01rwjMNROiowRNeTysC109qGPVBK4tkoMv0vJOKC4q8LnTemf
 5O/SCqU856Ecnp7A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 584cf5d6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Dec 2019 18:27:21 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id k196so14319006oib.2
 for <wireguard@lists.zx2c4.com>; Wed, 11 Dec 2019 11:23:02 -0800 (PST)
X-Gm-Message-State: APjAAAUTDm+fGrZHS8kW2XKvWMRPlhWUuYOD7wLvAuhzMLCCBtT9u1W+
 Pks/wXzqE7r34jnvreN3cvAtoOnNP686cQrg26Q=
X-Google-Smtp-Source: APXvYqwX5PVV6DkukeYlzrWmXHCNxIXdsdQL3xDRLzi37xW5OC3pqcPYdmluWx8t9EKL2GezIrq4PXanmuKMPqzXLeM=
X-Received: by 2002:aca:815:: with SMTP id 21mr4247756oii.52.1576092181969;
 Wed, 11 Dec 2019 11:23:01 -0800 (PST)
MIME-Version: 1.0
References: <fa4b08be3b6fee08@frisell.zx2c4.com>
 <NHVyo9ngt5xOvRvbPjQgDNH8pGe-_qN2sVDvP7jv2a6ZZRWd_0Ia9q6w2ZUTEdIQ_n-U-TRDxz-92_hnUpJTx_e-XlC180z5q1wWwF9q5rs=@protonmail.ch>
 <CAHmME9qFER60XD1aVqP3cgpEHOnikMWfhC-mrxYXojWEjWcu8w@mail.gmail.com>
 <qgogeFsyHmrD5A5oDJC_2s3UznPWIP0ncQl5Co1jS5Khgl_48mDer0UJFV3r6DUKs9bJyCS2j7f8dYz9WT_3WLQEYx8v8iP9cVFXXqvojwY=@protonmail.ch>
 <CAHmME9pmhntbNxw9ABjA-krzFARDaV+ZWZhgmWuL9hwfMJUCEA@mail.gmail.com>
 <sUhAy9FQoNuL5pe4TIlO25pMeAUxCEvrvj9LPjQ9WauOtxLWfE3Ug9juP6RORXxjLpl6AfV7x5k9i-mkfs-OK1IYx2FcusfU7Ko3uLlcfHM=@protonmail.ch>
 <CAHmME9pUfWvtnOwaFtD-+ZZjG0maS+pBUOqp_fmMD2OkyWNRXQ@mail.gmail.com>
 <d6oxUBUTOkqCrCBzL2cNsRFieVsCyW8xyJyZP4qv24E4PwTWauo1bKsMThdjCPJ54N7QYRuPMwY-Tzj_js-3w31RQzYyWp6s7dZZVXiLBTg=@protonmail.ch>
In-Reply-To: <d6oxUBUTOkqCrCBzL2cNsRFieVsCyW8xyJyZP4qv24E4PwTWauo1bKsMThdjCPJ54N7QYRuPMwY-Tzj_js-3w31RQzYyWp6s7dZZVXiLBTg=@protonmail.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 11 Dec 2019 20:22:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9qY8i63u2Mxzhkf4ie2RW9Ku5rCd0aMuxB8utGvT__bxw@mail.gmail.com>
Message-ID: <CAHmME9qY8i63u2Mxzhkf4ie2RW9Ku5rCd0aMuxB8utGvT__bxw@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

On Wed, Dec 11, 2019 at 8:13 PM Jordan Glover
<Golden_Miller83@protonmail.ch> wrote:
>
> On Friday, December 6, 2019 5:35 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Looks like an arch problem or a libnftnl problem. I've made a minimal
> > reproducer:
> >
> > printf 'filter\nCOMMIT\nraw\nCOMMIT\n*mangle\nCOMMIT\n' | sudo
> > iptables-nft-restore -n
> >
> > I filed a bug report on Arch: https://bugs.archlinux.org/task/64755
> > You can follow up with them.
>
> I tried to compile myself iptables 1.8.4 which is latest upstream version
> and have good and bad news:
>
> The good one is your minimal reproducer no longer causes segfault.
>
> The bad one is wg-quick still does:
>
> wg-quick[2325]: [#] iptables-restore -n
> audit[2326]: ANOM_ABEND auid=4294967295 uid=0 gid=0 ses=4294967295 subj==unconfined pid=2326 comm="iptables-restor" exe="/usr/bin/xtables-nft-multi" sig=11 res=1
> wg-quick[2325]: /usr/bin/wg-quick: line 29:  2326 Segmentation fault      (core dumped) "$@"
> kernel: show_signal_msg: 40 callbacks suppressed
> kernel: iptables-restor[2326]: segfault at 0 ip 000069bb4df13cc9 sp 0000716fcc5b9b30 error 4 in libnftnl.so.11.2.0[69bb4df11000+18000]
> kernel: Code: 15 5c 20 02 00 48 85 c0 74 07 48 89 00 48 89 40 08 48 83 c4 08 c3 66 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 53 48 83 ec 08 <48> 8b 3f 48 8b 1f 48 39 fd 74 2f 0f 1f 40 00 48 8b 47 08 48 89 43
>
> Maybe upstream found and fixed some regression but still missed
> the other one.

Can you craft a new minimal reproducer?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
