Return-Path: <SRS0=OwtD=PT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E85C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 11:18:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDDC12177B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Jan 2019 11:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=erayd.net header.i=@erayd.net header.b="YINTa0hN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDDC12177B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=erayd.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4352b68;
	Fri, 11 Jan 2019 11:14:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17ab0d58
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 11:14:23 +0000 (UTC)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a99997ce
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Jan 2019 11:14:23 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id p22so288151ybg.6
 for <wireguard@lists.zx2c4.com>; Fri, 11 Jan 2019 03:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erayd.net; s=ga;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gkky3+b7hqk3XeU11Uoc9h0zy9ntVj8/7IrR0Wlv8eE=;
 b=YINTa0hNVdloce+AnK/Zj5n2KxVdI9PIMWsTNswQf4dnWyrrIei92V4APzsKaBCuSL
 YgpaM2JCLReRmSYH9CeaEp6VpMdLMC4FBVbx4iDQwc2bofyrIWUXyg/bmVA1oaKlCqy+
 0Uxj2B7KFG8Yd7nCEBvRM+YyrAzG5pAVYOxPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gkky3+b7hqk3XeU11Uoc9h0zy9ntVj8/7IrR0Wlv8eE=;
 b=ifnEycFsl6+Ez+LsM1WU0aaGCo5DHdcY5Gc26wmEtCJQKKmjRdqjVxio/j8g+Fmztl
 VTkombgGHWLCz2+AVr8xdvDgoczDDZnYAcO5OxFPA4I+AWUVeC599ixlWf9J28Kw0L0I
 7E8zUshrbuCxC7Hy1DocbrNudqRIZrxMO+Adk6R1LWhNFNeyCQpddVrtV8kMsuyQdemk
 UZ9psCCecnr1wFRK7f5+t3G/HJK2x73/DgiGIdlqBeJCd01XpgU/OJyCHs2Kt+EyPHq8
 gst4EaEVDTDR5ox5iGgpnR42pmf9lL2WxnUjtTsm567omf+3TbS1s70jIJj6yKxp9VkQ
 BkcA==
X-Gm-Message-State: AJcUukdc1rg+k5KZ76/bSL4rhRMqa/yMdgu2P6W9KyuTOZ7Nhcu5jofj
 t9/f4bAVyyS46xdWhupzUwKY3dw/9/Qfn8iSe1/LqA==
X-Google-Smtp-Source: ALg8bN741u77nIsvZXMzBA2XXqdOZzWMGEciHn3QD7fgg50xM6C99rw47GrbcWXXTSeK4DW+IjSZg7M3cNaeCT+OeqQ=
X-Received: by 2002:a25:b091:: with SMTP id f17mr13251841ybj.25.1547205473288; 
 Fri, 11 Jan 2019 03:17:53 -0800 (PST)
MIME-Version: 1.0
References: <CALLpx3RrfNM7Brf0m-9eEMbRiHneUWK00fNorUAn948asC6jSg@mail.gmail.com>
In-Reply-To: <CALLpx3RrfNM7Brf0m-9eEMbRiHneUWK00fNorUAn948asC6jSg@mail.gmail.com>
From: Steve Gilberd <steve@erayd.net>
Date: Sat, 12 Jan 2019 00:17:38 +1300
Message-ID: <CAJQSx3ZqE99QnZx8O2M9J-VFP=V=We3Zbp7iNQnnO5ptNf8ocQ@mail.gmail.com>
Subject: Re: how would one go about building an admin frontend?
To: John Accoun <jsonacc@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2263070791062333750=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2263070791062333750==
Content-Type: multipart/alternative; boundary="000000000000a15df5057f2cd835"

--000000000000a15df5057f2cd835
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why not use an existing solution (e.g. puppet et al)? The capability is
already there, unless you need a GUI.

Cheers,
Steve

On Fri, 11 Jan 2019, 21:09 John Accoun, <jsonacc@gmail.com> wrote:

> I need to provision a large number of linux devices on multiple locations
> and put them all on a VPN.
> Configuring each device manually is too tedious. I was thinking of
> spinning up a server with a small HTTP api to exchange keys and configure
> wireguard on both sides. Then each device would call this server to
> register itself. And while I am a it I thought I could throw together a
> minimal admin ui that I could use for example to manually remove peers.
>
> I red the 'Web App provisioning Server' which I believe describes a
> possible solution for this use case. But I am confused with the whole dat=
a
> storage thing. Where do configuarations live? Are the configuration files
> at /etc/whireguard/ the source of truth? If I edit these when is the list
> of peers refreshed?
>
> The above mentioned document suggests shelling out to command line tools.
> Is this the recommended way. Does a general purpose library for managing
> wireguard config exist?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019, The Terrace, Wellington 6143, NZ*

--000000000000a15df5057f2cd835
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Why not use an existing solution (e.g. puppet et al)? The capability is alr=
eady there, unless you need a GUI.=C2=A0<div><br></div><div>Cheers,</div><d=
iv>Steve<br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, 11 Jan =
2019, 21:09 John Accoun, &lt;<a href=3D"mailto:jsonacc@gmail.com">jsonacc@g=
mail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr">I need to provision a large number of linux devices on multiple locat=
ions and put them all on a VPN.<div>Configuring each device manually is too=
 tedious. I was thinking of spinning up a server with a small HTTP api to e=
xchange keys and configure wireguard on both sides. Then each device would =
call this server to register itself. And while I am a it I thought I could =
throw together a minimal admin ui that I could use for example to manually =
remove peers.</div><div><br></div><div>I red the &#39;Web App provisioning =
Server&#39; which I believe describes a possible solution for this use case=
. But I am confused with the whole data storage thing. Where do configuarat=
ions live? Are the configuration files at /etc/whireguard/ the source of tr=
uth? If I edit these when is the list of peers refreshed?</div><div><br></d=
iv><div>The above mentioned document suggests shelling out to command line =
tools. Is this the recommended way. Does a general purpose library for mana=
ging wireguard config exist?</div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p dir=3D"ltr">Cheers,<=
/p>
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

--000000000000a15df5057f2cd835--

--===============2263070791062333750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2263070791062333750==--
