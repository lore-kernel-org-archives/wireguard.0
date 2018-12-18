Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1456C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 21:49:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1322184C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Dec 2018 21:49:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbOCMkjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D1322184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48d2d242;
	Tue, 18 Dec 2018 21:48:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b762fc3
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 21:48:30 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67f17a78
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Dec 2018 21:48:30 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id y1so3212695oie.12
 for <wireguard@lists.zx2c4.com>; Tue, 18 Dec 2018 13:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fF7K6pZ+jmpdsMkeIf8tkx3/V9IqnSLB8KjdHeK3aso=;
 b=GbOCMkjRH52h+SbKJRgmd3t3mkXUPHEdePGAW5tufRT+EWEyJ/Efly1HxZlOI5Hlyr
 iFCjTBzKWnRj+hWbOMjO1FNYi6uIfxSvs2G3uc1W4oulx5//C4/btYDbck3arn21S2/K
 1whprgLyTNAfhL3KdJmYrMBvMwnrAPiTA7UHuLmP5NTqrjoB/qAo8U8iNsWhBOqq0/Z2
 eg6j4yMqxkrHQTNHMVyzFyfWTJ7i8L6gI1Hg8J/kmDcPQX5+rWo10UY6m7wz6BwNfdHG
 YhtyMgToW77ZxCn4KaAI6l8LOhEjNzQ1IYyFiog6YOlqSD2lOD1pm/bOYMFZz3gkBG0f
 2IDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fF7K6pZ+jmpdsMkeIf8tkx3/V9IqnSLB8KjdHeK3aso=;
 b=nHg6FSmjeag3pxvgChKPck+TflOSk59yUmaAtrwrFbHi7+Eampo4G6qNlkP6LxfQyA
 X7IfiA8YvvCZDwdOAhn/MdZQtrUpTr4FPf2e/cut2O9ATA7yshmHCxZ/qdeGxelnT09A
 rGgTdYuwBUxuskUCN96q7iqIEwjEK+srWQesXyFczzq0R7iu4ifb92ernOQhbXHnv9iC
 uCWntbho5FGe2/2tZqB637ytiitMyXP+pRUPTuyPEDsN1POUKlPPx7aX5+Y1aOPpzE+z
 BdBcdqfFgCMyBrVjlbBQpxAvB2ELTvhXqTERIF4bz2qmGzq+wjvQ+OY87bbLuhJynbDO
 a3AA==
X-Gm-Message-State: AA+aEWYMHrk+6uXS2bFSGnbibPUAFmz3YX48I4/a9GtMnhqd2npGaII9
 y4ovWwyrQHX4nUeJ4xehIbafRIdVj3Xfd2QAXWk=
X-Google-Smtp-Source: AFSGD/WzPBqmrkifsTayRSq/dmB07MJbGhk2Ig7A2n8bWPSzR8482aTfEK1cNkZRHkD6sFWOf+dJ1wAF5zBQnt+RhQM=
X-Received: by 2002:aca:eb57:: with SMTP id j84mr8278162oih.306.1545169739397; 
 Tue, 18 Dec 2018 13:48:59 -0800 (PST)
MIME-Version: 1.0
References: <CAO_nJAZG+GtovJG0tCusWD3VrMdV=ZMJ1=OXTTO4DQsChtriVg@mail.gmail.com>
In-Reply-To: <CAO_nJAZG+GtovJG0tCusWD3VrMdV=ZMJ1=OXTTO4DQsChtriVg@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 18 Dec 2018 22:48:46 +0100
Message-ID: <CAKXLc7ewkUKnVLugQAzqWbRxb8w1NaDBV4_DtAJeBSVyggveOA@mail.gmail.com>
Subject: Re: Syntax for iperf3 to use over pair wireguard interfaces on a LAN?
To: John <graysky@archlinux.us>
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
Content-Type: multipart/mixed; boundary="===============7638582647906403651=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7638582647906403651==
Content-Type: multipart/alternative; boundary="0000000000006f401f057d52dd98"

--0000000000006f401f057d52dd98
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Dec 2018, 20:50 John <graysky@archlinux.us wrote:

> On bar:
> % iperf3 -c 10.0.9.15 -B 10.0.9.16
> iperf3: error - unable to connect to server: Connection timed outa

iperf -c 10.0.9.15

Also for the server, omit ipaddr, it listens to all interfaces by default.

Kalin.

--0000000000006f401f057d52dd98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Tue, 18 Dec 2018, 20:50 John &lt;<a href=3D"mailto:graysky@archlinux.us"=
>graysky@archlinux.us</a> wrote:</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
On bar:<br>
% iperf3 -c 10.0.9.15 -B 10.0.9.16<br>
iperf3: error - unable to connect to server: Connection timed outa</blockqu=
ote></div></div><div dir=3D"auto">iperf -c 10.0.9.15</div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Also for the server, omit ipaddr, it listens t=
o all interfaces by default.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Kalin.</div><div dir=3D"auto"></div></div>

--0000000000006f401f057d52dd98--

--===============7638582647906403651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7638582647906403651==--
