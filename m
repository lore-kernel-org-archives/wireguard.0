Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C6DBC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 03:37:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076DA20738
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 03:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="ooQtKrxm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076DA20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6c4b1b9;
	Mon, 23 Nov 2020 03:32:03 +0000 (UTC)
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 160d9990
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 03:32:00 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 0AN3atbN017589
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 12:36:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0AN3atbN017589
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1606102616;
 bh=YL64JWX8+POTNkn/GZ7B+nszuW5O8YQqSfoss8+OVhk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ooQtKrxm1EI5JJsobUKyeYXAjIV+RoefFSoPmKabq0sodI0Y1kw+Yxf5jMgOU3v1w
 W5HSJfgC7Ej7Hg80VGtMAFcmNyxPtUQaK73w6lhwLwGliH3flZ7yc57MtqiU0FIx1m
 6ei0KbX+XgpmmGOGSBQzYwXM2775PqN2AfMu9nvZqWvl9UpfrzAvVIN8/t7ILYBwYH
 45J1SGSHpQVjwYtVGtQYTkEn2Kr42iG243csfHSuHHxaWZznhqAqqXpo8QhOA2CISk
 fTy4GoIZHjWNKw1q5jrUotX5w6+Bpqm4pJdEapeAZihlZrCYUbcY4lRZB9/0cdKDIn
 5Z0iWPVnvOMWg==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id k5so1727149plt.6
 for <wireguard@lists.zx2c4.com>; Sun, 22 Nov 2020 19:36:55 -0800 (PST)
X-Gm-Message-State: AOAM530YkVCD8Rr7vsAM+X/Y6hnGicH8H5v7nKlVY6qKOj1GAFCntGcH
 OmuGjDRbQ1udboHHSquqU2Et/X2YjMi3aAyW4s8=
X-Google-Smtp-Source: ABdhPJzNuqDamg2p4M+v2AI8oS/thdIABCwyrr94QP7NGfbG5kGWuCZOsctgZMaDSWL8YqmDoi92WL62fYY5d0QrEd4=
X-Received: by 2002:a17:902:ff0e:b029:d6:820d:cb81 with SMTP id
 f14-20020a170902ff0eb02900d6820dcb81mr22899656plj.47.1606102615011; Sun, 22
 Nov 2020 19:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20201121194339.52290-1-masahiroy@kernel.org>
 <CANiq72nL7yxGj-Q6aOxG68967g_fB6=hDED0mTBrZ_SjC=U-Pg@mail.gmail.com>
In-Reply-To: <CANiq72nL7yxGj-Q6aOxG68967g_fB6=hDED0mTBrZ_SjC=U-Pg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 23 Nov 2020 12:36:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNARjU5HTcTjJG1-sQTJBFqohC1O8aAvFs3Hn_sXscH_pdg@mail.gmail.com>
Message-ID: <CAK7LNARjU5HTcTjJG1-sQTJBFqohC1O8aAvFs3Hn_sXscH_pdg@mail.gmail.com>
Subject: Re: [PATCH] compiler_attribute: remove CONFIG_ENABLE_MUST_CHECK
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>, wireguard@lists.zx2c4.com,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Nick Desaulniers <ndesaulniers@google.com>
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

On Sun, Nov 22, 2020 at 5:45 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sat, Nov 21, 2020 at 8:44 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Our goal is to always enable __must_check where appreciate, so this
> > CONFIG option is no longer needed.
>
> This would be great. It also implies we can then move it to
> `compiler_attributes.h` since it does not depend on config options
> anymore.
>
> We should also rename it to `__nodiscard`, since that is the
> standardized name (coming soon to C2x and in C++ for years).
>
> Cc'ing the Clang folks too to make them aware.
>

I can move it to compiler_attribute.h

This attribute is supported by gcc, clang, and icc.
https://godbolt.org/z/ehd6so

I can send v2.



I do not mind renaming, but it should be done in a separate patch.




-- 
Best Regards
Masahiro Yamada
