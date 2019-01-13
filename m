Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFC7C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A94520657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClFuySgN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A94520657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fb3be90;
	Wed, 16 Jan 2019 16:32:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f53cbb87
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Jan 2019 00:06:31 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7141a072
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Jan 2019 00:06:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id y20so15924126edw.9
 for <wireguard@lists.zx2c4.com>; Sat, 12 Jan 2019 16:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BmPdbYH4ebsh2SkmLbdJGyxV/Q1nRDEzWFVFE52MClg=;
 b=ClFuySgN8n0cgrRLf0mSjsnRncXHo4VvlT+eVwf0r5wnwDWS+eQY+PpjU/E6Dqzpzc
 46qtUCjZR4cFAjR5TAW8RZgMqIw765ErsAJmgzNrMqBwp7wAj9IlLLLlbkuTCuyPKwbE
 TOrRDwgu4Vhe8eeADuJb0GHEPm8tVoXxPEz3o7Z90yilma3oZUXqDi9MUSP2JGmv2pfx
 u4BUIO6bVge5S4CC1+hkHKN38PXSRbr0wsbdhvZD0sz3rQ54m4sYKJmS64wS3Oumk6/o
 L5juETBS+8+ry576Atvmx3IMq0oNg4Q9sdy9AnG8xP0i2RlRXCyI3bPIQ2JBmL4OBeXn
 ghAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmPdbYH4ebsh2SkmLbdJGyxV/Q1nRDEzWFVFE52MClg=;
 b=j4hAt0xaQFhK7/OljTCLH3lK7kwY3TiPXL5aej4WDgjTuqmRcz2NgVOaKh4apNJd+f
 1m4mgiZmadXMKv45C5ycSECXhSvpKqCHjbbWCM90RCVcx6Rk9h+2S249Gx6BroYd2ZC0
 WPd/bTVle2tr/0en4ntQSKpkVAOppppoml1kWRBB9PFOhCNfDFZkWjHy0aFtgjcZxHmc
 Dwy+wWMZtm1rvNGiO42oT1eVbNzwg0HxAYyhqwMP9LvsNq9j36JHISBxBmSWD1hmB4LJ
 g87hJF8GK4FT+2Iq4YHXXkgPAktoDHF0qvYcZfi3JBuYtu1/B35+DsIuaj8NAZmTnJF6
 7TbQ==
X-Gm-Message-State: AJcUukezg4dXG5rzCdFSsTxhQRuSnTwc6N+gzQ1AiIoU9+FfTbm//AHH
 ykSNtlroXpU0JaHdo6V0QrD9cuHvSineqt4XSRU=
X-Google-Smtp-Source: ALg8bN7IKLjeKStHMCIQZrUMDyUc3EExK8eC1hB1eto+idbb0t0gXCc4dGL8FFIfujJd+tf2UjMDA0M+P1nsWMWTlMc=
X-Received: by 2002:a17:906:4bd7:: with SMTP id
 x23-v6mr16338629ejv.105.1547338211153; 
 Sat, 12 Jan 2019 16:10:11 -0800 (PST)
MIME-Version: 1.0
References: <CALLpx3RrfNM7Brf0m-9eEMbRiHneUWK00fNorUAn948asC6jSg@mail.gmail.com>
 <CAJQSx3ZqE99QnZx8O2M9J-VFP=V=We3Zbp7iNQnnO5ptNf8ocQ@mail.gmail.com>
In-Reply-To: <CAJQSx3ZqE99QnZx8O2M9J-VFP=V=We3Zbp7iNQnnO5ptNf8ocQ@mail.gmail.com>
From: John Accoun <jsonacc@gmail.com>
Date: Sun, 13 Jan 2019 01:09:59 +0100
Message-ID: <CALLpx3SftnnHC6pNPp=gGMi0OZBJ6F849KT-VF28aGfgD2naqA@mail.gmail.com>
Subject: Re: how would one go about building an admin frontend?
To: Steve Gilberd <steve@erayd.net>
X-Mailman-Approved-At: Wed, 16 Jan 2019 17:32:07 +0100
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
Content-Type: multipart/mixed; boundary="===============4748263703156000394=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4748263703156000394==
Content-Type: multipart/alternative; boundary="0000000000006c5df0057f4bc0cf"

--0000000000006c5df0057f4bc0cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Why not use an existing solution (e.g. puppet et al)? The capability is
already there,

No. It's not. Notice that I did mention that the devices would call a
server to register themselves. In fact, the whole problem I am trying to
solve is providing connectivity to peers behind NATs and connected from
unknown locations. Being able to just ssh'ing into a peer is the end goal
itself, not the starting point.

But let's please not get off topic. I think I was clear in what I asked.



On Fri, Jan 11, 2019 at 12:17 PM Steve Gilberd <steve@erayd.net> wrote:

> Why not use an existing solution (e.g. puppet et al)? The capability is
> already there, unless you need a GUI.
>
> Cheers,
> Steve
>
> On Fri, 11 Jan 2019, 21:09 John Accoun, <jsonacc@gmail.com> wrote:
>
>> I need to provision a large number of linux devices on multiple location=
s
>> and put them all on a VPN.
>> Configuring each device manually is too tedious. I was thinking of
>> spinning up a server with a small HTTP api to exchange keys and configur=
e
>> wireguard on both sides. Then each device would call this server to
>> register itself. And while I am a it I thought I could throw together a
>> minimal admin ui that I could use for example to manually remove peers.
>>
>> I red the 'Web App provisioning Server' which I believe describes a
>> possible solution for this use case. But I am confused with the whole da=
ta
>> storage thing. Where do configuarations live? Are the configuration file=
s
>> at /etc/whireguard/ the source of truth? If I edit these when is the lis=
t
>> of peers refreshed?
>>
>> The above mentioned document suggests shelling out to command line tools=
.
>> Is this the recommended way. Does a general purpose library for managing
>> wireguard config exist?
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
> --
>
> Cheers,
>
> *Steve Gilberd*
> Erayd LTD *=C2=B7* Consultant
> *Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
> *PO Box 10019, The Terrace, Wellington 6143, NZ*
>

--0000000000006c5df0057f4bc0cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Why not use an existing solution (e.g. puppet et al)?=
 The capability is already there,=C2=A0<div><br></div><div>No. It&#39;s not=
. Notice that I did mention that the devices would call a server to registe=
r themselves. In fact, the whole problem I am trying to solve is providing =
connectivity to peers behind NATs and connected from unknown locations. Bei=
ng able to just ssh&#39;ing into a peer is the end goal itself, not the sta=
rting point.</div><div><br></div><div>But let&#39;s please not get off topi=
c. I think I was clear in what I asked.</div><div><br><div><br></div></div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Jan 11, 2019 =
at 12:17 PM Steve Gilberd &lt;<a href=3D"mailto:steve@erayd.net">steve@eray=
d.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Why not use an existing solution (e.g. puppet et al)? The capability i=
s already there, unless you need a GUI.=C2=A0<div><br></div><div>Cheers,</d=
iv><div>Steve<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 11=
 Jan 2019, 21:09 John Accoun, &lt;<a href=3D"mailto:jsonacc@gmail.com" targ=
et=3D"_blank">jsonacc@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">I need to provision a lar=
ge number of linux devices on multiple locations and put them all on a VPN.=
<div>Configuring each device manually is too tedious. I was thinking of spi=
nning up a server with a small HTTP api to exchange keys and configure wire=
guard on both sides. Then each device would call this server to register it=
self. And while I am a it I thought I could throw together a minimal admin =
ui that I could use for example to manually remove peers.</div><div><br></d=
iv><div>I red the &#39;Web App provisioning Server&#39; which I believe des=
cribes a possible solution for this use case. But I am confused with the wh=
ole data storage thing. Where do configuarations live? Are the configuratio=
n files at /etc/whireguard/ the source of truth? If I edit these when is th=
e list of peers refreshed?</div><div><br></div><div>The above mentioned doc=
ument suggests shelling out to command line tools. Is this the recommended =
way. Does a general purpose library for managing wireguard config exist?</d=
iv></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail-m_288802039=
3656552780gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr">Cheers,</p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<span style=3D"color:rgb(102,102,102)">Erayd LTD=C2=A0</span><span style=3D=
"color:rgb(102,102,102)"><b>=C2=B7</b></span><span style=3D"color:rgb(102,1=
02,102)">=C2=A0Consultant</span><br>
<span style=3D"color:rgb(102,102,102)"><i>Phone: +64 4 974-4229=C2=A0</i></=
span><span style=3D"color:rgb(102,102,102)"><i><b>=C2=B7</b></i></span><spa=
n style=3D"color:rgb(102,102,102)"><i>=C2=A0Mob: +64 27 565-3237</i></span>=
<br>
<span style=3D"color:rgb(102,102,102)"><i>PO Box 10019, The Terrace, Wellin=
gton 6143, NZ</i></span></p>
</div></div>
</blockquote></div>

--0000000000006c5df0057f4bc0cf--

--===============4748263703156000394==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4748263703156000394==--
