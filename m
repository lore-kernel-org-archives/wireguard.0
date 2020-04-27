Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44AEBC82E00
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 23:10:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6DE82072D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 23:10:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="X/8coleT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6DE82072D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54511fe5;
	Mon, 27 Apr 2020 22:58:11 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad9b5288
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 22:58:09 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52988f7f
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 22:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=Rz7dwSvq6L+O
 cMK963akA4gOfPs=; b=X/8coleTom+JdkF1wyNizLSiZXaVBZ/pn5OzwmogB5Zu
 gtpEigRI4NSmHNqekt03XtPz9E+hy/0VRLTUuXzpFvXtzRc4p4AWw57esIDGs6+x
 WZoWdqLrrHUCkzrXKrz0YMc6n9j6bywrKgoyIguofeVIFUBMEdkat5XIb6U1l418
 2TmZCsIcwl1edH6I60C6WDua3sfxW57eJpxSP4RiPfCAK0hAkEIeTHG3OX+Nb5yU
 UpyRwE1jm6iy9Lj66mGGhdG+0xpx0eAX83XegrdJDiNkMZuktoTDqZpxvPK8Qb0f
 E9DteUUOL4BzWJxcUDRR124cNzAL5ggguHo89bkj6Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33105680
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 22:58:07 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id c16so18449153ilr.3
 for <wireguard@lists.zx2c4.com>; Mon, 27 Apr 2020 16:09:41 -0700 (PDT)
X-Gm-Message-State: AGi0PubRNMxkyVbqQ1sd2zsA+R1SJwS2Qr6QcDxPbc+mMlJw04MTKQvR
 KQTOwI8idfSWAO2qfeZQIs+A3/mkbKbMGPSycM0=
X-Google-Smtp-Source: APiQypIqdOjl06mq+ZG1C3Fyyk7+1A833zwE0Cgf3y6NDSLZZUGtUCZd2MmqxFYnGZ4hxQspB/YdrNQOsCn64Z86CL0=
X-Received: by 2002:a92:5c82:: with SMTP id d2mr24398414ilg.231.1588028980593; 
 Mon, 27 Apr 2020 16:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <87d07sy81p.fsf@toke.dk> <20200427211619.603544-1-toke@redhat.com>
In-Reply-To: <20200427211619.603544-1-toke@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Apr 2020 17:09:29 -0600
X-Gmail-Original-Message-ID: <CAHmME9rUCYuBCFbw=yhNPqDDJWD3ZUQ_R9xjQ-yp6DXA9_iScA@mail.gmail.com>
Message-ID: <CAHmME9rUCYuBCFbw=yhNPqDDJWD3ZUQ_R9xjQ-yp6DXA9_iScA@mail.gmail.com>
Subject: Re: [PATCH net v2] wireguard: use tunnel helpers for decapsulating
 ECN markings
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Olivier Tilmans <olivier.tilmans@nokia-bell-labs.com>,
 Dave Taht <dave.taht@gmail.com>, 
 "Rodney W . Grimes" <ietf@gndrsh.dnsmgr.net>
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

On Mon, Apr 27, 2020 at 3:16 PM Toke H=C3=B8iland-J=C3=B8rgensen <toke@redh=
at.com> wrote:
>
> WireGuard currently only propagates ECN markings on tunnel decap accordin=
g
> to the old RFC3168 specification. However, the spec has since been update=
d
> in RFC6040 to recommend slightly different decapsulation semantics. This
> was implemented in the kernel as a set of common helpers for ECN
> decapsulation, so let's just switch over WireGuard to using those, so it
> can benefit from this enhancement and any future tweaks.
>
> RFC6040 also recommends dropping packets on certain combinations of
> erroneous code points on the inner and outer packet headers which shouldn=
't
> appear in normal operation. The helper signals this by a return value > 1=
,
> so also add a handler for this case.

Thanks for the details in your other email and for this v2. I've
applied this to the wireguard tree and will send things up to net
later this week with a few other things brewing there.

By the way, the original code came out of a discussion I had with Dave
Taht while I was coding this on an airplane many years ago. I read
some old RFCs, made some changes, he tested them with cake, and told
me that the behavior looked correct. And that's about as far as I've
forayed into ECN land with WireGuard. It seems like it might be
helpful (at some point) to add something to the netns.sh test to make
sure that all this machinery is actually working and continues to work
properly as things change in the future.
