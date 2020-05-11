Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D9AC47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:31:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF8920752
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 21:31:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaXOOl4q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EF8920752
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0d8be8e;
	Mon, 11 May 2020 21:17:44 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 450c2cde
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 May 2020 21:17:42 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id o14so10159063ljp.4
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 14:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PRwf2FEoFEDwbNCxB6mwfyRY+K/arLB9P0BMSWC/ZIM=;
 b=YaXOOl4q9KDl/wZdSes0bUvRS0S4Y40+GE3fb80vVrqxFN+380a9LyKJIRhPtDIwL2
 RlRu1eWC9U46iTn1OXNKm+jlfA87RxL1Gg7QYCOIRftuC/V3/PhrWVutjcWhMDH6rdyC
 StkqfA0WjuHpAH74y4ir5qRRc0iJ1VVOyaV2M4YRadxvoH71649i5OFVspliCOmtHbYm
 x98OxFY+wUDFB/T8+OfJsjHktwMACYBCZ8+F2Ef679ggAehzCxN/g0/8H4O4tJ+TJ/Z4
 YQiPBMWOP94xtBmPI/rWwcqZuECOM7lE9wnZWrgpICga7rIgfDEz8bTLcWfNvd5Ols8w
 ttNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PRwf2FEoFEDwbNCxB6mwfyRY+K/arLB9P0BMSWC/ZIM=;
 b=deY7/uULLQEl5BjKesv4/Qov20q7B3zrv9OtcDX7mf8QViTrwNtC7V6csRkCPXYzc+
 PgfcmXftL5zWvtsN6AHI0yf4UltCf/tlNQiaBMJz8KwulSL/diRinGXz/7H9u80tv4xU
 hnDEeYd2k4SdHA0zzpc6X0jmHRv41BfKT3O2mXl3FgBngiHA+XdWG/AO7fY4Eo/A2fvb
 QKRfbk45oHH2EUUfUuRsAAICQqUJ5xD6M6z1V2sJaDOO1tZzsCDj2W76YsKGq0iK34PJ
 gAweXu+MIO1OGxuER2eXjPZHiZctxVjqIxq2QGokjkvyjOjDZCUW6fiNazdNyR+PjGoA
 +9cg==
X-Gm-Message-State: AOAM532dG0uIvzA4tjc9+H+U0812M3wUatwvCUMCjtnyPHAuCjeSe2oM
 Lfer48LnVIc6hXhL5ZQTAnfSQKwsvRdynXOifU4=
X-Google-Smtp-Source: ABdhPJwSNo+8owok+qCQLg50ud3XjISHSbqJIX0Qn3RTAOOzXtbp8pck91KKIyS1IIKDGBu90ZbfZixyc7KJ5UHciFE=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr11936298ljh.223.1589232662544; 
 Mon, 11 May 2020 14:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
 <CAHmME9ovg+BBhVkKoNDd2LD-C9ChuBW5VXgj4n4V-Cp_-g0uiw@mail.gmail.com>
 <CABtXGiAP6SvNrsTArCe2fNLqTUEeBEOy9Osx+uCinfm6q9Yz1Q@mail.gmail.com>
 <CAHmME9oaWsnghkXhWfSqSS0f52nWfpjNRoBQ7EF-58joPG2z6w@mail.gmail.com>
In-Reply-To: <CAHmME9oaWsnghkXhWfSqSS0f52nWfpjNRoBQ7EF-58joPG2z6w@mail.gmail.com>
From: Phillip McMahon <phillip.mcmahon@gmail.com>
Date: Mon, 11 May 2020 23:30:26 +0200
Message-ID: <CABtXGiDvWgeU9E8qwhxBRXzOzzYj_uVrLu4_kb8=m2W89E54yg@mail.gmail.com>
Subject: Re: Search Domain/DNS Suffix
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ricardo Fraile <rfraile@rfraile.eu>, Simon Rozman <simon@rozman.si>,
 virtualdxs@gmail.com, WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Could be a little confusing as the wg site suggests if you install
wireguard-tools you'll get v1.0.20200510, which is not the case right
now.

Shouldn't the released stable package be referenced?

On Mon, 11 May 2020 at 23:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, May 11, 2020 at 3:17 PM Phillip McMahon
> <phillip.mcmahon@gmail.com> wrote:
> >
> > Wireguard site is showing fedora wireguard-tools as up to date. It has
> > not been released yet, still marked as pending testing
> >
> > https://bodhi.fedoraproject.org/updates/?packages=wireguard-tools
>
> Fine by me. This means there is no further action for Joe, the Fedora
> maintainer, to take on this matter.



-- 
Use this contact page to send me encrypted messages and files

https://flowcrypt.com/me/phillipmcmahon

P.S. Drowning in email? Try SaneBox and take back control:
http://sanebox.com/t/old3m. I love it.
