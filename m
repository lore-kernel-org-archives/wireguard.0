Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF12C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:24:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E0A20708
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:24:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN8Hglpz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E0A20708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f5a725c;
	Mon, 11 May 2020 06:11:24 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a4bda580
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 23:16:14 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id t3so4168220qkg.1
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 16:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B3SFbu4hWzwr44dh5Oc0S8bnt3rdcIdMV6uYnZ2bCBE=;
 b=mN8Hglpzaht5SjEj+xnUoISVV95IaMVNu+wm4maU22OPQS4y8YGWTIsOrbtmBnPWDf
 tOxdVI6Groi2s9hSlrL5h1v/SGgbJ1Pm9o0ZTZs2i6KSHqY/wm7h3fP+CdRv2mGpmBdL
 w/nOvHQmsJr9e2bF89iIg/wKTQAltShEXktAcKxxeDeqPuDjT4PXRTX9jTgAPjyLFitG
 D6i+Pli1HUeBHaybFoRFrAqccYKMSY4CT4nSqqeGRFnVHpLh/E9HU/bO2dlZG4CqldWf
 fkug8ZUboOf07PBOzB4lYWf/6JHSGcn2+OuH8J0DeAls0LcqZDrc8GeECJVzyKHbENOT
 YUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B3SFbu4hWzwr44dh5Oc0S8bnt3rdcIdMV6uYnZ2bCBE=;
 b=ct4uZFfoQm6dxR7d/PS/q/QHlRnu5bFwKbpEnVJ7+98iJ07JCg2kflQEsNllADrIaD
 hpOroUDzihAawsIAQZEc6jvmF3JPD52KtyxAafyI3XpH0hRhq1ascEu4b9LGypa6EXn7
 7wrWEskG4mUZ0UEIM/ciKUSGVQ9zzvkJYPKPQz/eHRSH/lCCvv9qNe5wcGZhBJTiaoKV
 Np/jXgbMN2eTOz81+hXFZLLU6E4N23FCD2vckAcwPVAHnwNeUXkMDMFpGxme4MhGBecx
 4BHj6mp1KChM40GxNFLS7oTEQrTPORcwfiaX/EKo+PrJbK6dYNlUKCxdIIAbG1zKY4Cr
 Az+w==
X-Gm-Message-State: AGi0PubY0G+dWTgEigtIZtX90OsiOcLavpQ+bnBynXj8tqwuhxHqM5tB
 OIn+IZPqgwylu3Q0v5SRxVQiONQZtCQnUqZ5/WA=
X-Google-Smtp-Source: APiQypIMHZ4P4H/fn2PWsPTNYGB10GwjGoN7yWQJqZarCANwrmskRU5sEK05s1Wl6EIm3yqoM36/fQulOPzpbTmf0Jw=
X-Received: by 2002:a05:620a:146a:: with SMTP id
 j10mr12182492qkl.333.1588807736689; 
 Wed, 06 May 2020 16:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
 <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
 <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
In-Reply-To: <CAHmME9rbKP4zB5nWG-9vf+2ZepXm+Gqii=qjQ8cnG0O+Dhu2tQ@mail.gmail.com>
From: John Lauro <johnalauro@gmail.com>
Date: Wed, 6 May 2020 19:28:46 -0400
Message-ID: <CADGd2Dq3-EMBqA6bSKbR=C-pTZToPxv1xkM4BvYGh910T_e1Tg@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Justin Kilpatrick <justin@althea.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 11 May 2020 08:11:22 +0200
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

Wireguard is defaulting to 1420 MTU, the ethernet adapter is 1500 MTU,
and I have IPv6 completely disabled.

Can/should the MTU of wireguard be bumped to 1440?

On Wed, May 6, 2020 at 6:26 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Wed, May 6, 2020 at 4:24 PM Justin Kilpatrick <justin@althea.net> wrote:
> >
> > > 1340 or 1360
> >
> > Why two options? I've been using 1340 for a long time.
>
> WireGuard over IPv4 has a 60 byte overhead. WireGuard over IPv6 has an
> 80 byte overhead.
