Return-Path: <SRS0=oIpX=JQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0A4C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 19:44:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C92611EE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Apr 2021 19:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C92611EE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6bd18e9;
	Mon, 19 Apr 2021 19:43:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d97148c0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 19:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618861389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zRzOjqiVVWatbl7FsKlf25kX17DDLqQT7RuXBzldh9A=;
 b=SRQSoC7GVRtnxCIZVP3ZIk4tXKHnnGWLOLlZKQoFDbrWJpO93TPs/CREkG+8lC2zMrYiuu
 mcEFPXlTBdLX5JqHV0XexmWo+RkRJXiy6SjVMZmJIsVa639q/EhcBfVbZNyyW/EVm6w2KH
 Guu77SiLfh5DrMXl3IcMMjTf2qvb1HQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 648b216e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Apr 2021 19:43:09 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id v3so37830178ybi.1
 for <wireguard@lists.zx2c4.com>; Mon, 19 Apr 2021 12:43:09 -0700 (PDT)
X-Gm-Message-State: AOAM530g12VrFo794O+/ORJuE5Z+kinmhW/paG1c6p4uPy9SByu/YsLm
 yKpKTQcyBOfAx52GUZ+msXOShwmOJlA0amPBbX4=
X-Google-Smtp-Source: ABdhPJzGLNevVqbJQAkxXk6lcHQOIPyJgp9IERRdxqGoXr0iqQ4rs4nHAj0UEE0n5FvoNf2MEwKu5jmF9X6xh55dbjg=
X-Received: by 2002:a25:aa14:: with SMTP id s20mr20744086ybi.306.1618861389250; 
 Mon, 19 Apr 2021 12:43:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rAzGauYJuq4Qpn561f1YrYTaSN1mj2HB2Kdhgd2QJs9A@mail.gmail.com>
 <87371254-15f1-494b-8740-38071d7f7d68@stha.de> <874kg8ldjn.fsf@toke.dk>
 <7be52421-db0d-4971-99b0-ce76307d1a33@stha.de>
 <CAHmME9pxnh6MFdQGQCWRX6aNJu=rM-SyVY1jLb6EurgNNhwJSg@mail.gmail.com>
 <87sg3rigdx.fsf@toke.dk>
 <CAHmME9qerb3LhuJfQ2L=J9gz=vGXV47qUAwC3-LYMTWVWnn62Q@mail.gmail.com>
 <15c3483d-546b-4c86-aca7-9ab37945791e@stha.de> <87a6pyinbh.fsf@toke.dk>
 <87fszmgmhh.fsf@toke.dk> <c93d0e62-8992-4c19-a2d3-08f7af3f5873@stha.de>
In-Reply-To: <c93d0e62-8992-4c19-a2d3-08f7af3f5873@stha.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 19 Apr 2021 13:42:58 -0600
X-Gmail-Original-Message-ID: <CAHmME9rVb7vONYxfYfeccCpA3ePhfUifi_FX-=8ugBu_n0_SPg@mail.gmail.com>
Message-ID: <CAHmME9rVb7vONYxfYfeccCpA3ePhfUifi_FX-=8ugBu_n0_SPg@mail.gmail.com>
Subject: Re: FreeBSD if_wg POINTTOPOINT and MULTICAST behaviour
To: Stefan Haller <stefan.haller@stha.de>
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 19, 2021 at 1:42 PM Stefan Haller <stefan.haller@stha.de> wrote=
:
>
> On Mon, Apr 19, 2021 at 08:25:46PM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
> > Stefan, any chance you could test this patch to Bird (*instead of* the
> > previous one that removes the check from the Babel code)?
>
> The patch is working on FreeBSD 13.0.

Just FYI, the previous patch was added to ports, so I wanted to double
check that you removed that previous patch before adding this one...
