Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19DDC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 21:12:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 008902171F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 21:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnIlaD8n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 008902171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0de8c615;
	Wed, 2 Jan 2019 21:09:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b91623a9
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 21:09:47 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c8214db
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 21:09:47 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a20so20539639edc.8
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 13:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xMhvNf4VIdnCFn30vzk7xAwqZDnvtoOmcdl8dcYY1/8=;
 b=bnIlaD8njjummCgmKGOENGHHGdKIFYxrqrlDEk36oigGHd14wRBZjHJcVFpugZuDRw
 Y63okitoteNnzey13pUFIDZhkpBfnTmo8HzDtVYfSjyQjTg/DvlQpgZS/n8fXTcosRMv
 UhpiFNs3e0kwddveyZL0iZQ4vZWIDXrgHb9IxnTre0/xZ5dlYLPnmjZ4kEabA8BaWIxj
 cfZKRUQ+4ecBvIvk4CF4bCrLVjiFFxkAdGw1qkE5P/tMrCnKwuDJwEbk04T4+GZwwb53
 icN5JimCCsT4QWFkMP0EaVVmlFnH5XXbgp+ki/JjELUaVwVZA5gbyjfpsU5ZjD3C5y19
 aDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xMhvNf4VIdnCFn30vzk7xAwqZDnvtoOmcdl8dcYY1/8=;
 b=AXmVmWvxrh5zByyEPSdfsBgxvfTZQ6GFD9U6Z+uMw7/doWmv8E5F0DARKyHQ3a+e8E
 mH8+gZnUikZuHEYHox/RCcVqFd5FWRK1rvGq3e7yqyQo9aD64X2nsGXZSlYg3fheDhS7
 /cUldj0HhHfo9XZ7C16dq2RllXc9//xQJKtfRC0cO+LNaAhvKKpYKn+K/YbC0VsJYOgs
 NlSX5Lg/cY8twySeh/Sq1jTsVNamRKr2dAy875uNazFloIFe/wPRb4vxPZU/ToJsR+iI
 nuRsm8MzCH6RZCnnuyKOZoqM3q5TUCe0Mt1tYKnCqIosDkbwarKvfb0xBh3HqB8XQ3Hz
 Ijmg==
X-Gm-Message-State: AJcUukc6hcNj/VV2P1UBAV+R271tJ+EN+uAYhRLiBB3rHQe0U4gpFX/5
 lHfMh+8dMF6g1mHj/JSo0q048qrx7xU2vQnUIVY=
X-Google-Smtp-Source: ALg8bN5S177EGLk+7Ppd/RrbXOFjj+dsTZDuSYzzSY1c1wNDnKez44po9sJlZOMtQDmtbLDqIIX9/NWD+PJd/ulK+LI=
X-Received: by 2002:a50:c182:: with SMTP id m2mr33137981edf.139.1546463530867; 
 Wed, 02 Jan 2019 13:12:10 -0800 (PST)
MIME-Version: 1.0
References: <CANe8y8aLx8pRXAZhwD9Cn4zY5tg2w7Mq3nc=WT9s=2kULx9tPg@mail.gmail.com>
 <CAHmME9qn5o4UVPnx3g-kNW3+h17Yhn2fCd0jKMRVavkRg3SSiw@mail.gmail.com>
In-Reply-To: <CAHmME9qn5o4UVPnx3g-kNW3+h17Yhn2fCd0jKMRVavkRg3SSiw@mail.gmail.com>
From: C Habs <bumpthelala@gmail.com>
Date: Wed, 2 Jan 2019 21:11:59 +0000
Message-ID: <CANe8y8ZAmOoRKKGT0p5RVwSrB13UGzH8wwNzdkPbvnFeY5WN-Q@mail.gmail.com>
Subject: Re: signature verification
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============7113931115583810411=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7113931115583810411==
Content-Type: multipart/alternative; boundary="0000000000006a66ba057e8019f0"

--0000000000006a66ba057e8019f0
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 2, 2019 at 5:55 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Signing key:
> https://www.zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc
> Tarball:
> https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.xz
> Signature:
> https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.asc
>
> zx2c4@thinkpad /tmp $ wget -q
> https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.xz
> zx2c4@thinkpad /tmp $ wget -q
> https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.asc
> zx2c4@thinkpad /tmp $ unxz WireGuard-0.0.20181218.tar.xz
> zx2c4@thinkpad /tmp $ gpg --verify WireGuard-0.0.20181218.tar.asc
> gpg: assuming signed data in 'WireGuard-0.0.20181218.tar'
> gpg: Signature made Tue 18 Dec 2018 04:42:59 PM CET
> gpg:                using RSA key AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
> gpg:                issuer "jason@zx2c4.com"
> gpg: Good signature from "Jason A. Donenfeld <Jason@zx2c4.com>"
>

Thank you for the information and assistance.  Like many, I am excited
about Wireguard and I have been impressed with its easy-to-setup
easy-to-use provision and its performance.  Wishing you all the the best
for the new year 2019. Thank you for all your efforts and to everyone
involved and making Wireguard available - it is most appreciated.

Habs

--0000000000006a66ba057e8019f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jan 2,=
 2019 at 5:55 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">=
Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">Signing key: <a href=3D"https://www.zx2c4.com/keys/AB9942E6D=
4A4CFC3412620A749FC7012A5DE03AE.asc" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc</a><=
br>
Tarball: <a href=3D"https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.=
20181218.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com=
/WireGuard/snapshot/WireGuard-0.0.20181218.tar.xz</a><br>
Signature: <a href=3D"https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.=
0.20181218.tar.asc" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.=
com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.asc</a><br>
<br>
zx2c4@thinkpad /tmp $ wget -q<br>
<a href=3D"https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.=
tar.xz" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/WireGuar=
d/snapshot/WireGuard-0.0.20181218.tar.xz</a><br>
zx2c4@thinkpad /tmp $ wget -q<br>
<a href=3D"https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.=
tar.asc" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/WireGua=
rd/snapshot/WireGuard-0.0.20181218.tar.asc</a><br>
zx2c4@thinkpad /tmp $ unxz WireGuard-0.0.20181218.tar.xz<br>
zx2c4@thinkpad /tmp $ gpg --verify WireGuard-0.0.20181218.tar.asc<br>
gpg: assuming signed data in &#39;WireGuard-0.0.20181218.tar&#39;<br>
gpg: Signature made Tue 18 Dec 2018 04:42:59 PM CET<br>
gpg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 using RSA key A=
B9942E6D4A4CFC3412620A749FC7012A5DE03AE<br>
gpg:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 issuer &quot;<a=
 href=3D"mailto:jason@zx2c4.com" target=3D"_blank">jason@zx2c4.com</a>&quot=
;<br>
gpg: Good signature from &quot;Jason A. Donenfeld &lt;<a href=3D"mailto:Jas=
on@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;&quot;<br></blockquo=
te><div><br></div><div>Thank you for the information and assistance.=C2=A0 =
Like many, I am excited about Wireguard and I have been impressed with its =
easy-to-setup easy-to-use provision and its performance.=C2=A0 Wishing you =
all the the best for the new year 2019. Thank you for all your efforts and =
to everyone involved and making Wireguard available - it is most appreciate=
d.</div><div><br></div><div>Habs<br></div></div></div>

--0000000000006a66ba057e8019f0--

--===============7113931115583810411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7113931115583810411==--
