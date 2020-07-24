Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19032C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 14:49:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55AF2065F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 14:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nlmuvXt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55AF2065F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8e37ef4;
	Fri, 24 Jul 2020 14:26:49 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6607c14d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:26:47 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b85116c8
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=B2cfRY9ErTTMLF5LcfmJp8fqShs=; b=nlmuvX
 t5IqVFl+W0G3l/pfcDCztaizr0ap/Mq6XGEO49PyI6r3G1CzEhkg2BqiLglZsWRU
 g12o8wShDkJPG+ER+XUMrrC1Sue3xVp/IM+Wg7d6uFvJ9KdA6JPBvTS7PJSjamF6
 GnRxRV1L8w40ApR/gIDcJGPeHCUJs/MqYP7LaZSqkvksbfbr/WwtLBGeX+jB20Im
 zoi2q7+JfQbjBX6TNU7UJkLeCT+02KFdTCnyk6WZrX2ggnfzXbTzowSWjDT91sjl
 5MVT1vZhqldXMl0jWu0uwd9e5vk5Hrq0Dn0TG9BqUojnrBPro6pdzE2vjzHzg4hz
 2PvizNLtY2QGlg2w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1f50e15a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:26:47 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id e64so10023377iof.12
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 07:49:43 -0700 (PDT)
X-Gm-Message-State: AOAM531hIbYrPpJwPBgCHd+2wQrFHKC/Jib/efdzyZzfRKgdd0EL3eoA
 yXV54zugLLMDXN5X2GxNyk7dwSSDd7sNrPky/mQ=
X-Google-Smtp-Source: ABdhPJxH+C2UnxnXramazuMnvsSWlw9Wb5k1H6gZPaposgD7SLrmts5JLGeoQMolNBi1Kow68zZaOoHJmFNzfqctAhw=
X-Received: by 2002:a05:6638:1ec:: with SMTP id
 t12mr11092055jaq.86.1595602182628; 
 Fri, 24 Jul 2020 07:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
 <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
 <CABZXeoBN-0fBVpXnu4=J-ovxxNCXV5FAQ4rGsuaTe2Jecf060g@mail.gmail.com>
 <CAHmME9qX9h9GKCEXfLiU4=AJ-v6CSWEFCcV5Xy54gBefXdy=Vg@mail.gmail.com>
 <20200724144605.GA1897@nautica>
In-Reply-To: <20200724144605.GA1897@nautica>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jul 2020 16:49:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9oQ3UyweSVepF3bfsuTYo7EiGXkdFwqJ=bKcDOHwLbZyQ@mail.gmail.com>
Message-ID: <CAHmME9oQ3UyweSVepF3bfsuTYo7EiGXkdFwqJ=bKcDOHwLbZyQ@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: =?UTF-8?Q?Tomcs=C3=A1nyi=2C_Domonkos?= <domi@tomcsanyi.net>, 
 Garrit Franke <garritfranke@gmail.com>,
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

On Fri, Jul 24, 2020 at 4:46 PM Dominique Martinet
<asmadeus@codewreck.org> wrote:
> FWIW, bash (and zsh, ksh etc) will optimise the last command call of a
> script to not fork, `bash -c 'exec foo'`  is the same as `bash -c 'foo'`
>
> (for some reason it doesn't in the subshell though so that one makes a
> difference; you can check with e.g. `strace -f -e clone bash -c ...`)
>
>
> Simpler shells e.g. dash or busybox ash don't, but they don't support
> the pipe substitution syntax either so I guess it doesn't matter here.

Right, I observed the same thing when I was testing this, but figured
it was better to be explicit in both cases.

thinkpad ~ # strace -f -e clone /bin/bash -c '/usr/bin/wg syncconf
wgnet0 <(/usr/bin/wg-quick strip wgnet0)' 2>&1 | grep clone | wc -l
3
thinkpad ~ # strace -f -e clone /bin/bash -c 'exec /usr/bin/wg
syncconf wgnet0 <(/usr/bin/wg-quick strip wgnet0)' 2>&1 | grep clone |
wc -l
3
thinkpad ~ # strace -f -e clone /bin/bash -c 'exec /usr/bin/wg
syncconf wgnet0 <(exec /usr/bin/wg-quick strip wgnet0)' 2>&1 | grep
clone | wc -l
2
