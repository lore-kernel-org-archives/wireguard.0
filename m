Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683CFC43140
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 22:01:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ABF620692
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 22:01:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=frederickding.com header.i=@frederickding.com header.b="ZbbFAkit"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ABF620692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frederickding.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf8c0058;
	Fri, 6 Sep 2019 22:00:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be158200
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:00:35 +0000 (UTC)
Received: from mail-yw1-xc32.google.com (mail-yw1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27b55314
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 22:00:35 +0000 (UTC)
Received: by mail-yw1-xc32.google.com with SMTP id k200so2788084ywa.7
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 15:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=frederickding.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/F8YcP6bTdsrOTOLcZEiDywaQsT5Xp/aNCcbniVWtSQ=;
 b=ZbbFAkitc39ScmqhBigmoLkEUCwTsmX+eIhL+YpKzGRXOatugF91g2wRslqpYU03pM
 5X5X7cEJ4TmF73FHGgmZvnQvWsxORFiO5eSPMotUawh/o1Clgmc/PJELTiiuERVGNWSz
 V0Bt7QicmU4zPmPa4LkdiGMpRUPAjRzAuucbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/F8YcP6bTdsrOTOLcZEiDywaQsT5Xp/aNCcbniVWtSQ=;
 b=L52C1jmKiscrZDrQ+Q7G4VHfmdUenBqF8Ybfgfvu/2g2p0YLIvxMeNqLE2jmtsZLVc
 rTRY9k6WUqpuwW0+0hLNCa9dYkCkOFigAEJMYI6xCddcePIHtNwmW8RZK7qkidjHRquZ
 rLAWgrAS9FBzwhK+Z0NQaQqakBI3MU3fLqrmqMXoG69RGBZ5g1jKaaCI91tUf0dW1H9F
 Qo8kS6+IHdpo2jpImL6h1M+9FsqH4Js6tPe2p9VT2r4kUaCgS0BcZNVZYkflhxaVIPvg
 j1t8avPUaPpIycQnRijheoc379rTR1levYMiGEvhe7QTthMeTLKY5c+cWQoGVjN7FiGG
 HhbA==
X-Gm-Message-State: APjAAAUTNI3kQOTWeJt9e6I4QS9Lmxqrh4BHOEQRk6fcP4rYiaE2IeiI
 eHzF7f3yE6kZsVHOJQWAz1vZcnp+eyCLv3rDOwiWpRfh/qQ=
X-Google-Smtp-Source: APXvYqxhB3qR9oDSIOilIbwaTKtWoG8Y0vBY2Uo6qY4plltW1CSAgnnyDbiPXBtJr86VNWxNROwEdlbYcOx2PKr8Jn0=
X-Received: by 2002:a81:528d:: with SMTP id g135mr8195531ywb.445.1567807234683; 
 Fri, 06 Sep 2019 15:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
 <CAPk0gXqPUHS0ufEj7CEDHaf+_KDbzKW8Et8yHO3mtjR9SEUNwQ@mail.gmail.com>
 <CAHmME9pd5j1-NYc4mOz7vbwJ_805fPyO_dK8=+dB7-z0+oebOg@mail.gmail.com>
In-Reply-To: <CAHmME9pd5j1-NYc4mOz7vbwJ_805fPyO_dK8=+dB7-z0+oebOg@mail.gmail.com>
From: Frederick Ding <frederick@frederickding.com>
Date: Fri, 6 Sep 2019 18:00:23 -0400
Message-ID: <CAPk0gXpes_ALUUug2BJc-x_cRNPtV1kNn3T1b2WnRkv-fn7izw@mail.gmail.com>
Subject: Re: wireguard-android broken after update to Android 10
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5640256884889245702=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5640256884889245702==
Content-Type: multipart/alternative; boundary="0000000000004ccf440591e99192"

--0000000000004ccf440591e99192
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That=E2=80=99s right, works for me. And I was previously on the Q betas and
WireGuard from the Play Store continued to work.

On Fri, Sep 6, 2019 at 23:59 Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> On Fri, Sep 6, 2019, 16:55 Frederick Ding <frederick@frederickding.com>
> wrote:
>
>> Pixel 3 user here on Android 10. Have you checked
>>
>
> Just to be certain: is the implication here that you have a P3+AndroidQ
> and don't face any trouble using WireGuard?
>
--=20
Regards,
Frederick Ding | frederick@frederickding.com

--0000000000004ccf440591e99192
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">That=E2=80=99s right, works for me. And I was previo=
usly on the Q betas and WireGuard from the Play Store continued to work.=C2=
=A0</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 6, 2019 at 23:59 Jason A. Donenfeld &lt;<a href=
=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto"><div class=3D"gmail_quote" dir=3D=
"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 6, 2019, 16:55 Fre=
derick Ding &lt;<a href=3D"mailto:frederick@frederickding.com" target=3D"_b=
lank">frederick@frederickding.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"auto"><div>Pixel 3 user here on Android 10. Have =
you checked</div></div></blockquote></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Just to be certain: is the implication here that you have a P3=
+AndroidQ and don&#39;t face any trouble using WireGuard?</div><div class=
=3D"gmail_quote" dir=3D"auto"></div></div>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature">Regards,<br>Frederick Ding | <a href=3D"=
mailto:frederick@frederickding.com" target=3D"_blank">frederick@frederickdi=
ng.com</a><br></div>

--0000000000004ccf440591e99192--

--===============5640256884889245702==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5640256884889245702==--
