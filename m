Return-Path: <SRS0=TyIk=XE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD2D4C4740C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Sep 2019 14:37:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D3A2086D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Sep 2019 14:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=coryfields.com header.i=@coryfields.com header.b="JSgTJwIW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D3A2086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=coryfields.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d39b6221;
	Mon, 9 Sep 2019 14:37:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab6f6bac
 for <wireguard@lists.zx2c4.com>; Mon, 9 Sep 2019 14:37:08 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30425e07
 for <wireguard@lists.zx2c4.com>; Mon, 9 Sep 2019 14:37:08 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d3so6652464plr.1
 for <wireguard@lists.zx2c4.com>; Mon, 09 Sep 2019 07:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=coryfields.com; s=google;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=jrUwbxf7ak3HmwxXGReaxVoJegX9qLCsWwMJhIkwALs=;
 b=JSgTJwIWaEaq4Vz97V9FtLWaugI5pYpOLLvF2xrgPEMOkuYPRngfw8F0KyziguvCGY
 fpCnaPdlbahvNmTyTknKiVE9oZhtiEVC3ofxQa7nj4sI4WVbeCfpOwUYVCs4U4FR42hy
 vB2tgAkndESJPwrb/SAsnkq+kKb4/vyQkb7qXeifNg7+p4/ycnsZzH314yVZu1yaanSh
 7kupqlkVVcxa/arZSTfn1Yw0nHEsCSun52FGYFsUjmf4oPEZ80I/yIOislZJaiCSqj60
 +lP2g0r7aAXXxla3rhaISnGXh4YFjBk22U1q3DTnzCmbU7Gj44VkNqYwIoRwU82t62N9
 mBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=jrUwbxf7ak3HmwxXGReaxVoJegX9qLCsWwMJhIkwALs=;
 b=bYZHKJKrcZqc7Syrk9/khVoRMwQ3CD/KUHN7n2w9DBXzm7TztvXK+CZuWdgCFqfZCo
 ZQ1K1bJnnU78n/7j97yXmSATwU3NyWKd8WBcHVAPR18n9rdER7Dc5FBfU2Py/SOXZ9yO
 twYpPkpjlvtDZVbj58mEJ38bOe2OggpYsHvLcQEhZ49mh0iz2v1z0iwpDkG0M9g1Qs6u
 ltWbvp22Jey38Wx4JdSIvF8bYF9TDFNKe2YSNOPWvBOkMp0qithUUWph33z8mQXVFdbs
 wbJSM8STJ5kCH3WdQNA6iUGWu7kTsHKohhB7b87b0WdCD03z2GkxF62tcJsQZFOh8WpE
 ddnw==
X-Gm-Message-State: APjAAAWMJ2lvRSXS0ZNPLxkFwXtjWq1Ra0hcuwMDQp6O74hHp41/vv42
 HkppIKoHc2VDOxKgtAzFXjJp8vmsBdMS+eibhCBwvA==
X-Google-Smtp-Source: APXvYqzc6w1w5IM0w6V9hwK6q6mXg3GM+4Y9O8udjnJKQrZmHiut9tLdPhUpEkwj+3ZMSjaK518+kxtA/IMb+wuYCXE=
X-Received: by 2002:a17:902:322:: with SMTP id
 31mr24535363pld.150.1568039827745; 
 Mon, 09 Sep 2019 07:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
 <CAPk0gXqPUHS0ufEj7CEDHaf+_KDbzKW8Et8yHO3mtjR9SEUNwQ@mail.gmail.com>
 <CAHmME9pd5j1-NYc4mOz7vbwJ_805fPyO_dK8=+dB7-z0+oebOg@mail.gmail.com>
 <CAPk0gXpes_ALUUug2BJc-x_cRNPtV1kNn3T1b2WnRkv-fn7izw@mail.gmail.com>
In-Reply-To: <CAPk0gXpes_ALUUug2BJc-x_cRNPtV1kNn3T1b2WnRkv-fn7izw@mail.gmail.com>
From: Cory Fields <lists@coryfields.com>
Date: Mon, 9 Sep 2019 10:36:56 -0400
Message-ID: <CAApLimgxcJgr-cyLPz+sAQWZDxMugy4BxQQC_018FZx2Vr_56Q@mail.gmail.com>
Subject: Re: wireguard-android broken after update to Android 10
To: Frederick Ding <frederick@frederickding.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: lists@coryfields.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3313141226947505430=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3313141226947505430==
Content-Type: multipart/alternative; boundary="000000000000ed4c8105921fb8f0"

--000000000000ed4c8105921fb8f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the data point, Fredrick! Knowing that it worked for someone
else, I kept fiddling. It now works for me as well.

I'm not sure what fixed it, so I'll try to go through the things I did
again to reproduce the problem. I'll report back if it's anything
interesting.

Thanks again.
Cory

On Fri, Sep 6, 2019 at 6:00 PM Frederick Ding <frederick@frederickding.com>
wrote:

> That=E2=80=99s right, works for me. And I was previously on the Q betas a=
nd
> WireGuard from the Play Store continued to work.
>
> On Fri, Sep 6, 2019 at 23:59 Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
>> On Fri, Sep 6, 2019, 16:55 Frederick Ding <frederick@frederickding.com>
>> wrote:
>>
>>> Pixel 3 user here on Android 10. Have you checked
>>>
>>
>> Just to be certain: is the implication here that you have a P3+AndroidQ
>> and don't face any trouble using WireGuard?
>>
> --
> Regards,
> Frederick Ding | frederick@frederickding.com
>

--000000000000ed4c8105921fb8f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the data point, Fredrick! Knowing that it =
worked for someone else, I kept fiddling. It now works for me as well.</div=
><div><br></div><div>I&#39;m not sure what fixed it, so I&#39;ll try to go =
through the things I did again to reproduce the problem. I&#39;ll report ba=
ck if it&#39;s anything interesting.</div><div><br></div><div>Thanks again.=
</div><div>Cory<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Fri, Sep 6, 2019 at 6:00 PM Frederick Ding &lt;=
<a href=3D"mailto:frederick@frederickding.com">frederick@frederickding.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div><div dir=3D"auto">That=E2=80=99s right, works for me. And I was previou=
sly on the Q betas and WireGuard from the Play Store continued to work.=C2=
=A0</div></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Sep 6, 2019 at 23:59 Jason A. Donenfeld &lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"au=
to"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, Sep 6, 2019, 16:55 Frederick Ding &lt;<a href=3D"mailto:fred=
erick@frederickding.com" target=3D"_blank">frederick@frederickding.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"auto"><div>Pixel 3 user here on Android 10. Have you checked</div></=
div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Just t=
o be certain: is the implication here that you have a P3+AndroidQ and don&#=
39;t face any trouble using WireGuard?</div><div class=3D"gmail_quote" dir=
=3D"auto"></div></div>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail-m_850462129=
5005809747gmail_signature">Regards,<br>Frederick Ding | <a href=3D"mailto:f=
rederick@frederickding.com" target=3D"_blank">frederick@frederickding.com</=
a><br></div>
</blockquote></div>

--000000000000ed4c8105921fb8f0--

--===============3313141226947505430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3313141226947505430==--
