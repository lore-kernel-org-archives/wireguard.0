Return-Path: <SRS0=JYHX=XY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2C8C4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 19:32:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E96320815
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Sep 2019 19:32:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGOUNwF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E96320815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b964ac72;
	Sun, 29 Sep 2019 19:31:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f190777b
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 19:31:58 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7224e139
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Sep 2019 19:31:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id r17so12531989wme.0
 for <wireguard@lists.zx2c4.com>; Sun, 29 Sep 2019 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qair/VCYMrWmikgFNwgE5EPq5Iw7N2s03I3FDlaeqg8=;
 b=DGOUNwF6HwYzKwKmHamwVtb1zk0jcji3PrBVV3JV/f4dXfvktY9K+bw6bjJIpWv8HP
 DOPwb0XEq1STq0ZLqXZmv9pO49hPyO6D/yt8fadXAKLvKqPQkBybtokOXuN6hAZNMz/m
 GZdmVvmib07qXiQwvzqZSR7UBmZaYcJZ/eHJ+kwHMn/gwR+XzryN9xL5lNjdbNS1eCWx
 pJ1413bB4SRtmW5+P+cZ+csxQKVIQPjsgh5q8JP+JnpPrCdAyutPIuCgNqkNNqUPS7i8
 hBWX1pDXj98UAAZUGr42P+wlL1iUrCk1nuRjt0pEROMlU5TMD/R/76Z21FyngSiimwdX
 qDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qair/VCYMrWmikgFNwgE5EPq5Iw7N2s03I3FDlaeqg8=;
 b=T0iyalRCn3kWyy+kdCXkeq+8lrRmgmBRDh2pj+EKWLxkjIwb+18r5FF5WleDxFoP3p
 APfv5kykpjT8//eYAubM2CoTxVuRKtYMRK2AQAZHt3h4JAxkGKG/ZF67M3nuX2WYJSd3
 nvcibiXUCQ65groMUmqCECUMJRfDqtRua5KhakpPm1iVsFRckeUPlXyqH5mdH2ItM1PP
 1KlhvESJW4qOFR5Sg7p+zQDmMSoVGJSYFO9DvhhNVl/tnEpg+xcgfPpigvKksQr8i+Hs
 XNxH+pevEUzdJrS8FI4RwWROzpDNK2dzNi78XKn+5WjWWPNiCrHeY977dO4Ez8gDoHpc
 sKFg==
X-Gm-Message-State: APjAAAX3qwbZJ1yHPIPtmJPUhsAejzJ2BJcxpdQ0Ir5dP+2LPZ/PF1Uk
 DoJdpzaklOuGpi+Qi9r8ce57AXhcYKdtzbnh8+k=
X-Google-Smtp-Source: APXvYqwmz0n5wEvTkkJns5OjyLpkAxashR/6gelQceAiI/k4sw9tFLISlfg+DO9/VOS1KSlIILbfoXzOcLvGdn0l2EQ=
X-Received: by 2002:a05:600c:248a:: with SMTP id
 10mr14537492wms.97.1569785516089; 
 Sun, 29 Sep 2019 12:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
 <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
In-Reply-To: <72539641-4832-70d5-09b5-430a8ab2deae@noc23.de>
From: Henning Reich <henning.reich@gmail.com>
Date: Sun, 29 Sep 2019 21:31:47 +0200
Message-ID: <CAOAVeL0e4JP+T6Z1353UPRmEXL84ZX5MSe+pjTO6xzzn9TB83A@mail.gmail.com>
Subject: Re: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
To: Ulrich Kalloch <ulli@noc23.de>
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
Content-Type: multipart/mixed; boundary="===============6961887880378374876=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6961887880378374876==
Content-Type: multipart/alternative; boundary="0000000000000f654f0593b62c14"

--0000000000000f654f0593b62c14
Content-Type: text/plain; charset="UTF-8"

Should a DNS entry Wirth one
AAAA record and one A record solve thus problem? So the OS decide the best
way to connect?

Ulrich Kalloch <ulli@noc23.de> schrieb am So., 29. Sep. 2019, 16:29:

> Hello @ all
>
> i am interested in this too.
>
> Regards
>
> Ulli
>
> Am 27.05.19 um 20:10 schrieb Rene 'Renne' Bartsch, B.Sc. Informatics:
> > Hi,
> >
> > is it meanwhile possible to define an IPv6 endpoint AND and an IPv4
> > endpoint as fallback
> > in case a road warrior does not get IPv6 connectivity when switching
> > internet sockets?
> >
> > Regards,
> >
> > Renne
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000000f654f0593b62c14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Should a DNS entry Wirth one<div dir=3D"auto">AAAA record=
 and one A record solve thus problem? So the OS decide the best way to conn=
ect?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">Ulrich Kalloch &lt;<a href=3D"mailto:ulli@noc23.de">ulli@noc23.de=
</a>&gt; schrieb am So., 29. Sep. 2019, 16:29:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hello @ all<br>
<br>
i am interested in this too.<br>
<br>
Regards<br>
<br>
Ulli<br>
<br>
Am 27.05.19 um 20:10 schrieb Rene &#39;Renne&#39; Bartsch, B.Sc. Informatic=
s:<br>
&gt; Hi,<br>
&gt;<br>
&gt; is it meanwhile possible to define an IPv6 endpoint AND and an IPv4<br=
>
&gt; endpoint as fallback<br>
&gt; in case a road warrior does not get IPv6 connectivity when switching<b=
r>
&gt; internet sockets?<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; Renne<br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"=
noreferrer">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a><br>
<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000000f654f0593b62c14--

--===============6961887880378374876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6961887880378374876==--
