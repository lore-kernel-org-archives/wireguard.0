Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 577ACC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:34:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D676C2081D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 18:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UD6Le/75"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D676C2081D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb5229b6;
	Sun, 4 Nov 2018 18:29:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dc1a6ed
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:29:56 +0000 (UTC)
Received: from mail-it1-x12b.google.com (mail-it1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b71787d8
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 18:29:56 +0000 (UTC)
Received: by mail-it1-x12b.google.com with SMTP id w7-v6so9662112itd.1
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 10:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yCuGD7bvYsTLZvZzz1hg1vPYmzdmDwNIWT9Ow4btAYs=;
 b=UD6Le/75ozjXauqcOGMK5lyhUTsBTUvYbKt8+tgKD0CLPk/Ujtf6XSf6eSUZ9U1BYo
 ikKD+uzw2e9ZqoSjJIz+Vce7bpSGJowUy42pqXcQaMc25RgVswaJB4T96CVVjRkHcssE
 6emLoGw9Z2sK7RTlcHg719xKGWi+jVGbBBxL4jB/1GPgyYa8O58jfw0P9syaoWwNu/Z5
 PX/we0hZBX/R6IVFvtF6lJrvdL6k5o66UcN4vPJTgnWaQewJzPbhEiufAsKrzoeoXpm0
 vq4tUq/CqV7YxUgZvN0CCsRfijKz9OVG3iPrxKHgcBMpwDSmjN7POuvYu9iewXHBfzkL
 FBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yCuGD7bvYsTLZvZzz1hg1vPYmzdmDwNIWT9Ow4btAYs=;
 b=fEElXQ+kqTyKwX0KGHCj4ceTtUAGkUihdS1wQndaIUqkk7fJaQri+17OCRhcrOPhIs
 AKWEjRrmjKj6Npo8I1iggH6omIt68DrkmvmvlaXQgo44xIXVujive/5wdOSxnzQq922k
 Y8TYrp+HM3Vv8fU43p8IwlhP4GDV+c9ZnLMHtXHvL9utJcmCNSZm40VKUtNqC/tX4N3Y
 DFNNtsldLaCRSBRVq0a0+UFvbE0bzdyXQ9jfDH0/eidSh8MkYQBWFZ9kUyWL36EtxrMW
 N3zR8G1l3ZBR+WEWo/f8MpfQNZXTi62IG/4sUWqkCc1nOPqfqEWW19VNtoWq+nr+hZCn
 Ta5Q==
X-Gm-Message-State: AGRZ1gL7qlr8P5u1hszInVb37Vl20uYSdEaPi7JPp5MSykWuONqScvfu
 i4lHqhtwRBfn2rUrmabWSPvZEkpGqXxys3Tzv8w=
X-Google-Smtp-Source: AJdET5cQehwCY3GCMDxkssmmZrf4wl4cNHb3H5Ak8ooqGF4oHTVAI01rPvrWAkVvKbkQqLPbMMS5fJMHS7vHBJvb6Mc=
X-Received: by 2002:a24:3d12:: with SMTP id
 n18-v6mr4217433itn.131.1541356443280; 
 Sun, 04 Nov 2018 10:34:03 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce0d+mEUKy=XdDbVSsC+n5jTUGTsTXOmTYvTWXw5=Twweg@mail.gmail.com>
 <CAHmME9qgdK5a7pKeNhMDuy7+t7aDkFXzq0dRKTmzbDtMUCOV1Q@mail.gmail.com>
In-Reply-To: <CAHmME9qgdK5a7pKeNhMDuy7+t7aDkFXzq0dRKTmzbDtMUCOV1Q@mail.gmail.com>
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Sun, 4 Nov 2018 13:33:25 -0500
Message-ID: <CAPRZce1D-CxGFm3yVCmzaO6mK7KCtH9GfGKPb4rrH5tJB1B7YA@mail.gmail.com>
Subject: Re: Wireguard for Android vs Google Play Store
To: Jason@zx2c4.com
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============8283382109904373373=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8283382109904373373==
Content-Type: multipart/alternative; boundary="0000000000004630010579db03fd"

--0000000000004630010579db03fd
Content-Type: text/plain; charset="UTF-8"

I think it was userspace tools. My plan is to upgrade everything, then do a
fresh install of the latest version, and report back on success/failure.
(The version I had been using was quite early.)

--0000000000004630010579db03fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div>I think it was userspace tools. My plan is to upg=
rade everything, then do a fresh install of the latest version, and report =
back on success/failure. (The version I had been using was quite early.)</d=
iv></div></div>

--0000000000004630010579db03fd--

--===============8283382109904373373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8283382109904373373==--
