Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F71C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:23:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF6820C09
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:23:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SIt6F6tF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF6820C09
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d2fe054;
	Wed, 17 Jun 2020 08:04:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id efdb2e59
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:04:31 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3659e944
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=DR2O/HXy7rRDn5yM7LKQd4XxWvE=; b=SIt6F6
 tF0Fqfh7U9RCPrZUf27NPy0VoQFqlG9NQT93C1RV9OhuXzY2bAqab8tnYuD8itmB
 eX5i5akvXhMxF4tXbmBje5dTIFWo2af8Yk4kgal8W1YNOsC4cH69F92O72ihIa7/
 suHWyloDLwJwSeW5/LczpMIQBOlG4d4AOG7PhoTcn8ZR9KWvDDBfIf2gnX+2jhbm
 js59TWZ+cRgGLMbrO3hhkuQbD2+mAAqFG6zeO05OvR98vr8Bg6GnbHgLUm17iQQ4
 ApjUHZO8L5232V7GqGoE2sOnmG71xRmc7HUyMSLrm0uKhZJOXNtrRrAcwYwTyfqC
 YF4oKcXCBByDkQsw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6a5fd67d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:04:30 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id r2so1789167ioo.4
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 01:22:34 -0700 (PDT)
X-Gm-Message-State: AOAM532N6bdWU7jbKSnEvOAlOy4hszvC7ptl3hTcS7y56+tyz1FyPQCo
 gc8Xx5lTfYSSHdhG13tkGES9PxCSI8Gv2flMO/s=
X-Google-Smtp-Source: ABdhPJw83MML/9WgEx+KexEVR14Sn2CtHt0CqR60zKFITlFVEeT9rT2bAm60oabLCtGkMw5TWuRdpvaI6UggJdxw6rM=
X-Received: by 2002:a6b:6705:: with SMTP id b5mr6847470ioc.29.1592382154345;
 Wed, 17 Jun 2020 01:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <M9rS5MC--3-2@tutanota.com> <M9wcIP0--3-2@tutanota.com>
In-Reply-To: <M9wcIP0--3-2@tutanota.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 02:22:23 -0600
X-Gmail-Original-Message-ID: <CAHmME9pfQPhJDp_0j3KD6FfkHrzpp8bHUOUtgZw6xUiabumG5A@mail.gmail.com>
Message-ID: <CAHmME9pfQPhJDp_0j3KD6FfkHrzpp8bHUOUtgZw6xUiabumG5A@mail.gmail.com>
Subject: Re: why multiple call to fmt.Fprintln for printing warning
To: kolokd <kolokd@tutanota.com>
Cc: Wireguard <wireguard@lists.zx2c4.com>
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

On Wed, Jun 17, 2020 at 2:01 AM kolokd <kolokd@tutanota.com> wrote:
>
> reply
>
> Jun 15, 2020, 4:09 PM by kolokd@tutanota.com:
>
> > https://git.zx2c4.com/wireguard-go/tree/main.go#n39
> >
> > why multiple call?
> >

Patches welcome.
