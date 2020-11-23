Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D163DC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 17:01:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC9220727
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 17:01:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVEZRacQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC9220727
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f4d13a1;
	Mon, 23 Nov 2020 16:55:46 +0000 (UTC)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [2607:f8b0:4864:20::b42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4034c375
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 16:55:44 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id g15so16559671ybq.6
 for <wireguard@lists.zx2c4.com>; Mon, 23 Nov 2020 09:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8oS1tqNv7f6RkxFUUnN8Th7AIx+SIEYLcj7Qp63p9k=;
 b=XVEZRacQJCq6PUcwiSqBhTCNm6nCGyDfUWju1rcXBbeqoud9rcUoA0tOMYCMzB16+A
 Tf2nyNR3t/IgTmwCIQB3ypyJX49r6P9OYc4rr8O0GyP+kH9GvVo57h25AzM2IpNdBJCI
 6VLJdQ/PQ4UkU3N4pmDXYYgizJ5Pfla+w5/9goVU/6MpEicrzk67JRLBr0Cie208jhlC
 H98JkfQHihT+nzvH+TLNNG0iXU+4+bFV34QO7OZ83KC7AUou7iPn0+Or7kQLOKk4QbqZ
 u31mLbMWS6fVKYWBJpOVY66yIIwTk5i1l6O01w6Kg0HE6F0Pd/kbjjmGlUCXMvB2VIHC
 l2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8oS1tqNv7f6RkxFUUnN8Th7AIx+SIEYLcj7Qp63p9k=;
 b=i4+N6bnTIv9Fh/Zptc0BF3AQjhyZ376KZFROc8Y/AFO/H7fmEUG4UQZfhSodasiIlp
 4Jg8G9IxLb8MtB0vxfGK9Oufl/iyYZGSi7Kdv3MlPgQOL9Wco8sGpLOaucb4jYqPU8ag
 UJIrVvvAeuNGQyHxlTihF1pxst32eQMid5WYeRQMErOo05xWxyImJYaIIc5Vdh1emQWZ
 wvvRvisw+5nyXvt2rkPhjlAjJmP7D2V14Zeq78WtAURK5GLCwdEVxdS1EbPZxmVPFFwA
 zIMf3Nh7IkVYVOmP7iZzV4fRna+RyBxpInF7gFY1UmoIMqvKFMZCkD0RE++/Im8wACE8
 OhaA==
X-Gm-Message-State: AOAM530Y21sJq0ksDmdLAWtvWLUlwx+IFF6MzPZsOUEpnHOup8hb7tw7
 Mr0gWPYsIOaS5K3CbVly+smbAn4KQzswuey3O4w=
X-Google-Smtp-Source: ABdhPJw65A04SBNaDefIkuI5vF2SMl8iYxkpxXq0HO2LbpXElojOUQFFbXitA0Vl7O8rkXXIAYbjyBqND8UiNocLcps=
X-Received: by 2002:a25:2e0d:: with SMTP id u13mr381510ybu.247.1606150868581; 
 Mon, 23 Nov 2020 09:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20201121194339.52290-1-masahiroy@kernel.org>
 <CANiq72nL7yxGj-Q6aOxG68967g_fB6=hDED0mTBrZ_SjC=U-Pg@mail.gmail.com>
 <CAK7LNARjU5HTcTjJG1-sQTJBFqohC1O8aAvFs3Hn_sXscH_pdg@mail.gmail.com>
In-Reply-To: <CAK7LNARjU5HTcTjJG1-sQTJBFqohC1O8aAvFs3Hn_sXscH_pdg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Nov 2020 18:00:57 +0100
Message-ID: <CANiq72mcJMRqV+YZbQtLTCR37ydD=8yFjFzg5ZYMmtH5pK1sEQ@mail.gmail.com>
Subject: Re: [PATCH] compiler_attribute: remove CONFIG_ENABLE_MUST_CHECK
To: Masahiro Yamada <masahiroy@kernel.org>
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

On Mon, Nov 23, 2020 at 4:37 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I can move it to compiler_attribute.h
>
> This attribute is supported by gcc, clang, and icc.
> https://godbolt.org/z/ehd6so
>
> I can send v2.
>
> I do not mind renaming, but it should be done in a separate patch.

Of course -- sorry, I didn't mean we had to do them now, i.e. we can
do the move and the rename later on, if you prefer.

Cheers,
Miguel
