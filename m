Return-Path: <SRS0=BFU5=5G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3849EC4332B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 13:59:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AECA20754
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 13:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILnmg4j5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AECA20754
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c86bfd3b;
	Sat, 21 Mar 2020 13:52:35 +0000 (UTC)
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [2607:f8b0:4864:20::e41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74387fd4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 13:52:32 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id x82so5777671vsc.12
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 06:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oznWPeG7X0fgTR4IDFAqhoFXv0MDfMYGyYyG55xP2Oc=;
 b=ILnmg4j5XaQ88Ybp4+KqGV2t9G875poRIryMVFlj6eRbAd70ZPlUtma/4HfSHv/tUE
 cB0IaDyYjqqqJYdkmzAnX470xfyjOfNZOCHDR++Htv5c1KVzvzCSCgaLe8ROXamoL30A
 Ed8DBBb+rRSo+EZz3R0wzyF/0sFUexWiLIoAppXyyqWbzauGbFuyaV3iDdX/4D53X/ZL
 4w9B5DvO4KcXVLpMdhC7h81smcKeRwF0OGmQ/0Is6mVwDzCtj/hp2mnz3QiLV083gppN
 E6a2++JzLNISRsbvCnQ+JoaAOBiCNUQHK6P3ZzqoHhUZWCa9I+EOtdrJCinhifTc3Pb/
 sFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oznWPeG7X0fgTR4IDFAqhoFXv0MDfMYGyYyG55xP2Oc=;
 b=JWWxhymAxp78L412KFf4Vj6e38EqkzTuMWFMmmUFDeYRz8SgAyhWM8eC23d1NPsFEN
 /TexW7OVXxr6tdFhbbVcU3ZsWuI5gwHJ7gsLJcLdNwFnfT89sApv2S2COuOT2uwzYjSk
 JXqrK5sGf1zve/PraxRYdolU2TFK61Z6bGESCI1ceQIpbOBF5W5cUIA5JXbb2DUO0bls
 C/h4bAtN1xpib5zU/gQFU61lsmYBvnzOjNV0Wac3QVMKeO+F49YFe2jd+HV9wVLY36+V
 s1QyH2l2UFJ4YCQ7xJDfurjDp7S5D6fDXQgip/VBM+XT0leNYer7V8d3lVrqsciDeTfT
 WwSA==
X-Gm-Message-State: ANhLgQ2meRkVMMtel506RhvxqAGjFWMJlhplBT2YKe+PlDMl2TU43oEC
 9Tv03IvImhLIS2dkm9z/bK3gG1VfNfnf65IejL9Q+g==
X-Google-Smtp-Source: ADFU+vvJ75MnWXvLat5Im+8SNXlfMA9O6eFtTG9CgZgENT/F9IcLTa8rsWHNtcAvnexaZXv/+x2v4yF0l+7x885tARQ=
X-Received: by 2002:a67:7f58:: with SMTP id a85mr10021155vsd.28.1584799156494; 
 Sat, 21 Mar 2020 06:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200321133045.26722-1-tanioka404@gmail.com>
 <CALpmF+EG5-Q8E5FzZcTHcgVJmiB-0b89mtUTB-WMP2u7GchWmQ@mail.gmail.com>
In-Reply-To: <CALpmF+EG5-Q8E5FzZcTHcgVJmiB-0b89mtUTB-WMP2u7GchWmQ@mail.gmail.com>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sat, 21 Mar 2020 22:59:05 +0900
Message-ID: <CAA2ss9HOCN7NWfgQa4VCef+yrNJFwp60kk73z8LUCdKyB+YKiw@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] strings: Update Japanese translation.
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: wireguard@lists.zx2c4.com
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

Thank you for quick response!

# I created crowedin account and join in the wireguard project :)

2020=E5=B9=B43=E6=9C=8821=E6=97=A5(=E5=9C=9F) 22:49 Harsh Shandilya <me@msf=
jarvis.dev>:
>
> On Sat, 21 Mar 2020 at 19:12, Eiji Tanioka <tanioka404@gmail.com> wrote:
> >
> > Update correspond to commit 029a4a8.
> >
> > Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> > ---
> >  ui/src/main/res/values-ja/strings.xml | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Applied, thanks!
