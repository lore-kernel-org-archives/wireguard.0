Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C80C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 17:58:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE7AF204EC
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 17:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3kRW2No"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE7AF204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd95af1b;
	Tue, 27 Aug 2019 17:58:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1deb4ed6
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 17:58:04 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ffff5b7
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 17:58:04 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c12so4547807lfh.5
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 10:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MlzRuDAm453gX7djd1lt68qV+GuMfmNctGl7Sibd1Kw=;
 b=l3kRW2NoKFmp0eVOC4NRewMy3HshDm6hMmvHCYlT9cjMxubYJt8/4WAMxfD4PH2cIR
 K266m7tzpYTmompFyGWmnzHezLYT4NVt2dpr+iBqJCXZw8fE1z87uQXN+a5b/7RomO7K
 YGNARKrAgny6n6s9w4nKn5BaQnoKWm05gaEui09Ke6O6UcYwZCFVqqB1p/R4vCo9wOcy
 SoGvtxRlThRnoX1KlBf1Cwm8StDgofr8vK0sn6MhbcBvMSY93Yht6DBSojHb0tC5acs5
 9KWH/HZD87JKhkjwUmx+CCXiY9v2erWwR7FgGbBi3CtfyvSohAKlBjMhmPCSIDXqTDtu
 oSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MlzRuDAm453gX7djd1lt68qV+GuMfmNctGl7Sibd1Kw=;
 b=oHP+1tBqZtbBTgOl7/NS0YEDiW919TqJpTrh/hXP1oOKPA08UUep6Xh3XFiVpSN4JC
 xpc3z2kigQxv8rINxl29TuBd/VwxN8NBdAI/6jWus9KJk9nbWTE5dTz/j2+L0tUtVWXf
 83eZgX47Xu0GHGIiqNAhJVudDDWYmNsLoXKQDZOPqY3+V0tJLRhMXH1nRd2/5mlQdGuF
 qiJGD9Ykh/ARyETiFwmJpoEh2t3cAOp9JbaOae0u7rHe+9E+JGWP5vX2lK1rp4Qmk6SY
 fyBmHLHCZlzuBraC32jT8yPoayw+54cvV1uTdGwEKbJ9Yd/kK5F56dv9bRso4jGF9qT+
 7Mmg==
X-Gm-Message-State: APjAAAW934gRZTCWJIW4rHneSzct7LVLRCtO/yQF4xMRsIzAlWuIMTBa
 cfVzx6tTxx1BY2n8syN5M36a0nke2KW2ygyWdGw=
X-Google-Smtp-Source: APXvYqw9Tfuz+jI5Z8qbF58Zl5bfq6i9zqbFTSvAV+4ucFNXl2OY0qxBjbpWVXy4h2CdpL2C5oeHRtPIMHRwT2bPzaA=
X-Received: by 2002:ac2:531b:: with SMTP id c27mr5021834lfh.107.1566928683309; 
 Tue, 27 Aug 2019 10:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAF+AZZVktGm19scLjT4Ku-JyQGyxQGfsLFSf=wybyuuiuoULQw@mail.gmail.com>
In-Reply-To: <CAF+AZZVktGm19scLjT4Ku-JyQGyxQGfsLFSf=wybyuuiuoULQw@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 27 Aug 2019 20:57:51 +0300
Message-ID: <CAKXLc7eTLhy0B_=8qOZRgKbgDYknMPkiMOHuaBj+208iNsAZcQ@mail.gmail.com>
Subject: Re: need a hand with WG setup
To: Dimitar Vassilev <dimitar.vassilev@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4852951861209612532=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4852951861209612532==
Content-Type: multipart/alternative; boundary="0000000000008eb15d05911d039a"

--0000000000008eb15d05911d039a
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Aug 2019, 20:21 Dimitar Vassilev, <dimitar.vassilev@gmail.com>
wrote:

> Hello,
>
> I'm trying to establish site to site VPN with 2 OpenWRTs 18.6.4 - linux
> 4.9.184
>
> my problem is that I cannot get any ping running and cannot reach the
> remote tunnel ips.
>
1. Disable the FW and test.

2. Try ping from one router to the other using the configured public IP
address

3. Ping the other using the WG IP address

If all runs them it is a routing problem left to solve...

Kalin.

--0000000000008eb15d05911d039a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 27 Aug 2019, 20:21 Dimitar Vassilev, &lt;<a hr=
ef=3D"mailto:dimitar.vassilev@gmail.com">dimitar.vassilev@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hello,<div=
><br></div><div>I&#39;m trying to establish site to site VPN with 2 OpenWRT=
s 18.6.4 - linux 4.9.184</div><div><br></div><div>my problem is that I cann=
ot get any ping running and cannot reach the remote tunnel ips.</div></div>=
</blockquote></div></div><div dir=3D"auto">1. Disable the FW and test.</div=
><div dir=3D"auto"><br></div><div dir=3D"auto">2. Try ping from one router =
to the other using the configured public IP address</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">3. Ping the other using the WG IP address</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">If all runs them it is a rout=
ing problem left to solve...</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Kalin.</div></div>

--0000000000008eb15d05911d039a--

--===============4852951861209612532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4852951861209612532==--
