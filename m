Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C23C10F06
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E9E2085A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4mJ1G+G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E9E2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8c1bc65;
	Fri, 1 Mar 2019 09:52:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb5e1316
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 08:05:09 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3114407
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 08:05:09 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id x9so18866266iog.12
 for <wireguard@lists.zx2c4.com>; Fri, 01 Mar 2019 00:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZwv2Rj3T+VTGDRoaf++czVYAx+0xPaMK4l1pXIzp1M=;
 b=X4mJ1G+GxnjXl8FvaRJ2hPOrKh6lztxKS6w04m1qEQ+kxQFMhdPYVTVRNFd3ijPeSk
 JYgyx4Zp151wVTXLxzRP9FADTjdIdlT3VmfpzVD37tC8NcbEVLBsFP+H1XJxEpbxtc5Y
 F0dkbas03HMeICxvZ0Cz/1gp47ORqgFJoi/XZjvLR6sLOPJOZShAXQT+rdubc6Q+yeiX
 f3OwILhBVfxD83CVZTvXzoG8hh52riJWJ8cvFI6C86Z6KigxeBSkmMFIcGpLkj59u0k2
 yOvgdlfObmjo4Gozr8F8r+ltGaxtKNuMJLeAvsTnXxG9NaQu1rX2QEwtCP3bpcQV9DYN
 PGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZwv2Rj3T+VTGDRoaf++czVYAx+0xPaMK4l1pXIzp1M=;
 b=r0C00EKaeRSJKiYyOOJ4L7Ce17iKRPnetthSklsKvbR95uMevuEAVlzDPJVIU6Tm2L
 DwlTLt+0ZBXWacYQqTHxT1Y4bgCaoLFIbisjU+yH1LfPznWr9qht9Ft4aDEyMc0P9D89
 2Y92fbKaMSCL6mW5CsPF+6XFZAoFBdFsMpRyP6WjZ4yPjymy4rqePdXVktN2+31x4CeN
 9RHcIEFdUpqgb2ZOd7sr2e0fpG8BUK3lau4mJsT8Ff6B4Y8W+Yk3997IyTy1HbQTVd69
 0KU1mifC+YyQ5CDWfSmyc8Gq6znfGB5la8qMP1sQGQbDPlQfrVnBb6TSfUH0ZiARC1G5
 EBnA==
X-Gm-Message-State: APjAAAUxZtThySfJSyKymHCHexzaNSmscNx+cAmuZ4ToRRAo0XMngqMn
 RVpeA2DVFZDgJgWZfIOC13AvX9jGNbSaOGgJq0o=
X-Google-Smtp-Source: APXvYqxYCVw/OGohHXzXBzTPc4JiJYY+HAzPvVWxSE/RIFKkCBlYGcaPZOsAXtVNuAW5/kn+CDtzqRfPT1sKHlpm5Rk=
X-Received: by 2002:a6b:e00b:: with SMTP id z11mr1973783iog.211.1551428096696; 
 Fri, 01 Mar 2019 00:14:56 -0800 (PST)
MIME-Version: 1.0
References: <304c3849-35d1-3312-1670-e7a8469a01fe@post.com>
 <CALJ2VGZo9HYKyJt1=Or+DOhJgbOs1gs=XMECCLdfxN-dS325-Q@mail.gmail.com>
In-Reply-To: <CALJ2VGZo9HYKyJt1=Or+DOhJgbOs1gs=XMECCLdfxN-dS325-Q@mail.gmail.com>
From: Triffid Hunter <triffid.hunter@gmail.com>
Date: Fri, 1 Mar 2019 16:14:45 +0800
Message-ID: <CACL3eKBUmeyUDUZXbPMPe_c6xFvAH7Y--6LdhSeU11+yoBDdWQ@mail.gmail.com>
Subject: Re: Openresolv package is a requirement and should be added to
 install docs
To: Reuben Martin <reuben.m.work@gmail.com>
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:52:31 +0100
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
Content-Type: multipart/mixed; boundary="===============6896878026538542486=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6896878026538542486==
Content-Type: multipart/alternative; boundary="00000000000099286e0583040008"

--00000000000099286e0583040008
Content-Type: text/plain; charset="UTF-8"

I ran into this the other day, simply remove the DNS= line from your conf.

Probably should be documented that wg-quick will barf and tear down your
interface if you have DNS= but not `resolvconf` command.

On Fri, 1 Mar 2019 at 02:46, Reuben Martin <reuben.m.work@gmail.com> wrote:

> On Thu, Feb 28, 2019, 12:29 PM F <finalcountdown@post.com> wrote:
>
>> Learnt how to get WG working here
>> https://github.com/StreisandEffect/streisand/issues/1434 and it
>> describes how the openresolv package is needed to get WG to connect
>>
>
> That may be a requirement in the context that document was written for.
> But that is not a requirement for wireguard.
>
>> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000099286e0583040008
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I ran into this the other day, simply remove the DNS=
=3D line from your conf.<br><br></div>Probably should be documented that wg=
-quick will barf and tear down your interface if you have DNS=3D but not `r=
esolvconf` command.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Fri, 1 Mar 2019 at 02:46, Reuben Martin &lt;<a hr=
ef=3D"mailto:reuben.m.work@gmail.com">reuben.m.work@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"au=
to"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Feb 28, 2019, 12:29 PM F &lt;<a href=3D"mailto:finalcountdown@post.c=
om" target=3D"_blank">finalcountdown@post.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Learnt how to get WG working h=
ere<br>
<a href=3D"https://github.com/StreisandEffect/streisand/issues/1434" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/StreisandEffec=
t/streisand/issues/1434</a> and it<br>
describes how the openresolv package is needed to get WG to connect<br></bl=
ockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">That may=
 be a requirement in the context that document was written for. But that is=
 not a requirement for wireguard.</div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
</blockquote></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--00000000000099286e0583040008--

--===============6896878026538542486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6896878026538542486==--
