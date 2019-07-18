Return-Path: <SRS0=0coH=VP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1063C76195
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 08:01:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219BB20880
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jul 2019 08:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUM3mOrf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 219BB20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04a43180;
	Thu, 18 Jul 2019 08:01:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6e9407
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 08:01:43 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcc0047f
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jul 2019 08:01:43 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id k20so50003192ios.10
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jul 2019 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hH4wINW5gAeaYYUqD0v5yy6bHKg+Th6w+LtCtx+QnfY=;
 b=WUM3mOrfGqVXMumLyERP28knvVMC5icZso/ju0NSv53ttsXJJxqyDC23ICxr88SFSA
 XrfeO7rSZyoBZ4bz9P3IngjW+UmN5s2IrBcANOr4an2QWxOgpTPKLaIq6qvIP8WWoEkg
 vfmaqTC6BV2mzEbszPVJ2A9JQ0uIEubZHlTwnIdcPoba6/JtyssyFMaNmrq7LLezkIZ+
 rf4iBYEfYe/QrXE9eMSxAoTUoi2BBOKPuBtFmHpBYTt6JswDFdzm/VqfQsx/Lv1JgkWn
 Y1Nc0VWo/yCSNBOB1DRlbTPlT3eeBmiYObbWoXyluwH5os1+pAIYr2G9kNoW3RWeRQOJ
 OwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hH4wINW5gAeaYYUqD0v5yy6bHKg+Th6w+LtCtx+QnfY=;
 b=mDGc3tDGiaog+eqsgPidt/fOc0YClASF6jBl5aI5dAaYuF+e/nluFx0wP8lpm4jacj
 NEAoolMQEpI3GqqK5Ky+mdEZA52THzddfiWAkwaBQ4SdkgQvJXJctXHfkJIjHo4VuqvD
 5uEhlyMhzoOSyv4qcSt3xI/bTbfwQn2Fkmnyn8OeQ9gv1pYzIsQ6+6RnGJtjmjf3jKQY
 l6HBAlCmvftNvpc7lCrO2L1YgpECvLHiW8/G5IRcG5T+qIUxkScFRFMVokyxB2XUPEaf
 0+qPTrZ+/5HTmNU/UcZ+G2P2CF0rQk+OaNzzdY/nWCxrFegf0bkcNKTMz43FXIt4+bE/
 rjzw==
X-Gm-Message-State: APjAAAWwuYH1qlXaJzfO6tgWbU+jVBy+Lmt1JJPpndR1yoj/6rodf4VY
 pY7qEzfwXUPFlLA0+syqMu50lPvU1o09A3PRYHcm7w==
X-Google-Smtp-Source: APXvYqwnIRV0V/+wlNIidSMX+di3m0bS5ZkuuU11/TgdEHB8pwfvHFAgZlsUDsWI1CzirImuu43o9dTwsZ8t8qex4NI=
X-Received: by 2002:a02:cb4b:: with SMTP id k11mr46586847jap.109.1563436902788; 
 Thu, 18 Jul 2019 01:01:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAKJniYRn7ZkV9tGOpK=mZoDb24TfMyq44zgE0c5uPo+Ac-sZsA@mail.gmail.com>
 <20190718015027.00e6010f@natsu>
 <CAA6-MF8gzQOdo9qxhpBJdcOUZ57bfdA8fCPZTi15XbYvG1pATA@mail.gmail.com>
 <20190718115614.60b7927a@natsu>
In-Reply-To: <20190718115614.60b7927a@natsu>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Thu, 18 Jul 2019 10:01:31 +0200
Message-ID: <CAA6-MF_yzAj5-+D6K_H9GaQRaZLLW0D2a88FQnMmwO66+=O67g@mail.gmail.com>
Subject: Re: Speed on Raspberry Pi 4
To: Roman Mamedov <rm@romanrm.net>
Cc: Christopher Bachner <hello@chrisbox.org>,
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
Content-Type: multipart/mixed; boundary="===============4969196187595232867=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4969196187595232867==
Content-Type: multipart/alternative; boundary="00000000000038317d058df0053a"

--00000000000038317d058df0053a
Content-Type: text/plain; charset="UTF-8"

Den tors 18 juli 2019 kl 08:56 skrev Roman Mamedov <rm@romanrm.net>:

> On Thu, 18 Jul 2019 08:38:54 +0200
> Janne Johansson <icepic.dz@gmail.com> wrote:
>
> > With taskset you should be able to:
> > https://www.howtoforge.com/linux-taskset-command/
>
> It appears "taskset" only works on regular programs, not kernel threads:
>
> # taskset -p -c 1 2128
> pid 2128's current affinity list: 0
> taskset: failed to set pid 2128's affinity: Invalid argument
>
> # taskset -p -c 1 2129
> pid 2129's current affinity list: 1
> taskset: failed to set pid 2129's affinity: Invalid argument
>
> As the above shows, WG threads are already bound to a particular CPU and
> this
> can't be changed.
>

Right, my bad.

-- 
May the most significant bit of your life be positive.

--00000000000038317d058df0053a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Den tors 18 juli 2019 kl 08:56 skrev =
Roman Mamedov &lt;<a href=3D"mailto:rm@romanrm.net">rm@romanrm.net</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 18 Jul =
2019 08:38:54 +0200<br>
Janne Johansson &lt;<a href=3D"mailto:icepic.dz@gmail.com" target=3D"_blank=
">icepic.dz@gmail.com</a>&gt; wrote:<br>
<br>
&gt; With taskset you should be able to:<br>
&gt; <a href=3D"https://www.howtoforge.com/linux-taskset-command/" rel=3D"n=
oreferrer" target=3D"_blank">https://www.howtoforge.com/linux-taskset-comma=
nd/</a><br>
<br>
It appears &quot;taskset&quot; only works on regular programs, not kernel t=
hreads:<br>
<br>
# taskset -p -c 1 2128<br>
pid 2128&#39;s current affinity list: 0<br>
taskset: failed to set pid 2128&#39;s affinity: Invalid argument<br>
<br>
# taskset -p -c 1 2129<br>
pid 2129&#39;s current affinity list: 1<br>
taskset: failed to set pid 2129&#39;s affinity: Invalid argument<br>
<br>
As the above shows, WG threads are already bound to a particular CPU and th=
is<br>
can&#39;t be changed.<br></blockquote><div><br></div><div>Right, my bad.=C2=
=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signat=
ure">May the most significant bit of your life be positive.<br></div></div>

--00000000000038317d058df0053a--

--===============4969196187595232867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4969196187595232867==--
