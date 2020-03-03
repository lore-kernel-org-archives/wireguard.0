Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C17C3F2C6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:18:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E88620870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:18:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9iA6/kF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E88620870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8582f424;
	Tue, 3 Mar 2020 23:08:52 +0000 (UTC)
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1397179d
 for <wireguard@lists.zx2c4.com>; Tue, 3 Mar 2020 16:10:33 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id v19so3526010ote.8
 for <wireguard@lists.zx2c4.com>; Tue, 03 Mar 2020 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=it4WPmFwb8eQSjTg9MnV1dhMGN2a+bnEiCORux3kd2w=;
 b=b9iA6/kFQ50Ws0FzQjWpBGFgx5om0ExxvOlF03SVlto2ASSIs0IyHlk221l6QJWYaL
 LhXxHFI/F5HuL3uGpNIqHXKMzxJgH4UA1sdwA0rh0dZrmkf171AVdAAmYmHkM+NUe9PF
 vPHuBIAhCxtOv8LGCk2BQGYZaFsKJTydQ2FKL6lfgQR9DxBNjxa5a1GgT5Ru/Sj9KJ3U
 aSB+Q+G6f6KrN+YrBDUjIa8AfaerFvrVx88Mv6B7H5ZhUOdL6hSK51zUNoLC8Xf8rWdv
 s+kvUa+MGcLC+eqYZ/iPrq5iEnXdiuxvsbmrdetq7/zO6lcQ7RkTald4qbfbF4PsoPfD
 CVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=it4WPmFwb8eQSjTg9MnV1dhMGN2a+bnEiCORux3kd2w=;
 b=WSkNlLRU92ww7ASXLtDoVwZdSRPhrAZV110Vzhbt/PZUjh9jna72E5sIvUORH/rY0i
 JN3wn9qFNhoAwch8eHcvutut2azWcQL6cB5VCaeWh0GFu55Ie+87wLjwYVZJuojPqfJH
 uA7S5HvCNhG6SrovVe/5qjsL6KdAyTMz2bfcEtpkj7k7k8GYZdLEG2tPJq6hLjPBOWWz
 6r+JmiMw4n5d+DHM87mLMk9XpvihBtr+WkoakGsR4dFztJjuWfX6UCBq6RZAG7++qGcO
 bSY3Xh04+BATNLGvAM87TvW+w/P1iqriW4HufKtBC6YMbvkRIoj5Vy95cWS6TQFWdX6H
 sMyg==
X-Gm-Message-State: ANhLgQ3jYvhBPcYR6jkOSFQLxIeKl1dfH1iglZPDAVAr4kqdbJcmr7+W
 IaDSL5JJlZ07McFea555iZEDzAoqBUm55HK1gTU=
X-Google-Smtp-Source: ADFU+vuFevZHvwjtBo5UjYTHdns53jW4lSavHt/Oi0EXV4LNowum5Xc1PtE9w9AizZXjLLE/3sDcu0c+XKoO0p/HciY=
X-Received: by 2002:a05:6830:1684:: with SMTP id
 k4mr4123389otr.75.1583252099575; 
 Tue, 03 Mar 2020 08:14:59 -0800 (PST)
MIME-Version: 1.0
References: <CANcmUPE9PPfniYa5ejj180Wncth7i3qS0A-ZaG06X4bwkRn5qQ@mail.gmail.com>
 <CAHmME9raXy8gjJ44MHso1WjU_QFz1_Z8Q12q2GauoBPGJSaSxg@mail.gmail.com>
 <CANcmUPEyCiw694-aa32fbLJ5LTd-fMp0D7NtgteqRvLasfmNZQ@mail.gmail.com>
 <CANcmUPEcc4TbeSi85nQbG86-nO4mrRE=xCHcid=K8H=UESGVDA@mail.gmail.com>
 <CAHmME9r6Tvc55m1YpX+rdXtx-RO32UgPRTJy4Y76j9E3U2CGeg@mail.gmail.com>
In-Reply-To: <CAHmME9r6Tvc55m1YpX+rdXtx-RO32UgPRTJy4Y76j9E3U2CGeg@mail.gmail.com>
From: Tony Arcieri <bascule@gmail.com>
Date: Tue, 3 Mar 2020 08:14:48 -0800
Message-ID: <CAHOTMVKcqDKD0hPHh_RM-LijXLbE-V8vBGTb82aPJMDQ+i2F_Q@mail.gmail.com>
Subject: Re: Cortex-m support
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:45 +0100
Cc: Jonathan Beri <jmberi@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============0929303669467807090=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0929303669467807090==
Content-Type: multipart/alternative; boundary="000000000000fc3318059ff59ada"

--000000000000fc3318059ff59ada
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 29, 2020 at 11:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> It's likely our rust implementation well be well-suited for what you
> have in mind.


Looking at wireguard-rs, in its current form it makes a lot of use of
`alloc` (namely `Vec` and `HashMap`) and `std` features (`fs`, `net`,
`sync`).

Getting it working on a Cortex-M would involve extracting a core protocol
implementation which doesn't make use of any of those features as a
library/crate which has no dependencies (or only optional dependencies
which can be switched off with Cargo features) on `alloc` and `std`.

(as it were, I'm also interested in using wireguard-rs this way in a
"heapless" no_std environment)

-- 
Tony Arcieri

--000000000000fc3318059ff59ada
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Feb 29, 2020 at 11:08 PM Jason A.=
 Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">It&#39;s likely our rust implementation well be well-suite=
d for what you<br>
have in mind.</blockquote><div><br></div><div>Looking at wireguard-rs, in i=
ts current form it makes a lot of use of `alloc` (namely `Vec` and `HashMap=
`) and `std` features (`fs`, `net`, `sync`).</div><div><br></div><div>Getti=
ng it working on a Cortex-M would involve extracting a core protocol implem=
entation which doesn&#39;t make use of any of those features as a library/c=
rate which has no dependencies (or only optional dependencies which can be =
switched off with Cargo features) on `alloc` and `std`.</div></div><div><br=
></div><div>(as it were, I&#39;m also interested in using wireguard-rs this=
 way in a &quot;heapless&quot; no_std environment)</div><div><br></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature">Tony Arcieri<br></div></div>

--000000000000fc3318059ff59ada--

--===============0929303669467807090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0929303669467807090==--
