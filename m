Return-Path: <SRS0=JHi/=XL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D602CC49ED7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Sep 2019 09:53:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CC7206A4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Sep 2019 09:53:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bIMAzf2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39CC7206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e31ec34;
	Mon, 16 Sep 2019 09:53:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91d8abe3
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Sep 2019 09:53:37 +0000 (UTC)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4466f536
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Sep 2019 09:53:37 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id s22so1244217otr.6
 for <wireguard@lists.zx2c4.com>; Mon, 16 Sep 2019 02:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fg0IaaK2yZNdSijmG7akfwVS/nkZcsj2Hsmn9Hk8M+Q=;
 b=bIMAzf2lVUrbK7b5bU+K3Ynh5BGSUczXcU+PPuDwIFzfXuJDpDBkrljSHoiNTgQWRr
 KdhA/2oOJ2pgS1qqvSd2gzOVTOYF8EYapxiNLmHC4gTXQCPeYrxHe3vBP59gLYoLVYXb
 1Gc9jfvpGiKFzZvGFdEGtMaS7GBTUC1+ppqrD5LGfBi0f4BRNqNA/ND2kWF8N+r/YY2C
 EwmsZlhyTg9eM2Wl1pbfBbGHrUtG8lLikkdH5Hzdc645A4yqdd1pBmQm9lt+bhsY/Hlv
 XALtWZ8Wht3cRlPpYNyPWeIF3+STVueLgGGoHiH5zIvjy2k5TceFtlJnJW6k+tVMrqvM
 rVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fg0IaaK2yZNdSijmG7akfwVS/nkZcsj2Hsmn9Hk8M+Q=;
 b=UG6C2N5Bi/5PRjPuSAyItUTQH7Bu3I6vy7WgNtFETCS+pVOQ2c0GB0r96XAXmb9p3t
 f0MOCX41+X2n4qz47khgO2cEA6OtFD5SmVjOgxS2ZC2APNVsHbgsx/pC9sM9/G/y5Ffy
 wxLZxZyooSSsGj5cTRokrJnyDs/2Sl6ekqP0eb1/A/XNfcdw7+ZQmaX50gOymo7MAMxx
 Ntj9DsLvb1LKkfOmDlnQ21fYXT1c//VB93Sdc3BE38UcujHAsRduyLzNzuy1RDRZxtMJ
 8eSVfr86cR5zrLHrTVSbOVNzdk+H7mBkY+4lzh2425+PHBYRlhLLNutCL4+o4JJH6oMN
 Kyjg==
X-Gm-Message-State: APjAAAXUAV5t2w8T29nkXNM9wwjq8rMnfm9uoc0nhK1LWrSGU8maRB7n
 NvUH8/snXStnHPnXk/TqqCdiXXH3U6D+eBvlRsaNzjGZyBQ=
X-Google-Smtp-Source: APXvYqxU49rQrkEIaWC0p7rELnhrSAlrt6gCPQczSfhCX1Ntb7BvUqxldH6x/Fu0gtRd6ismVsX5YxTHHM32sCaQ/fY=
X-Received: by 2002:a9d:1e83:: with SMTP id n3mr40285506otn.287.1568627617190; 
 Mon, 16 Sep 2019 02:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHo=znZWFs427fDRYPUx3jxjXR01McUFwsOQR9rQy4ocWwyRNA@mail.gmail.com>
 <CAHmME9rXV2_YG3fGMErDeTjfHeNKhDC2cCYA6Kw93n9A328QpQ@mail.gmail.com>
 <CAHmME9p0ue59kxwD3BWGLmU3U-SmO2fxxhP7ubCsGts2GU-aZg@mail.gmail.com>
In-Reply-To: <CAHmME9p0ue59kxwD3BWGLmU3U-SmO2fxxhP7ubCsGts2GU-aZg@mail.gmail.com>
From: Sebastiano Barrera <sebastiano.barrera@gmail.com>
Date: Mon, 16 Sep 2019 11:53:20 +0200
Message-ID: <CAHo=znac+BQ594WTCGtrEm=G-Rc2O9AdvhBMYy3RGmr9eeUhjg@mail.gmail.com>
Subject: Re: On Windows: Wrong source IP address
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason,

Thank you very much for your explanation! I'll look into it and study
the source code you linked, but I don't think I'll be able to
contribute any concrete work before the next week or so.  I'll be back
when I do!

Thanks again!
-Sebastiano

Il giorno sab 14 set 2019 alle ore 19:11 Jason A. Donenfeld
<Jason@zx2c4.com> ha scritto:
>
> To give more detail, a more ideal solution would be to specify the
> source address / source if index using WSASendMsg, and retrieve the
> incoming destination address / destination if index using WSARecvMsg,
> and implement sticky socket semantics. A linux implementation in C is
> here: https://git.zx2c4.com/WireGuard/tree/contrib/examples/sticky-sockets/sticky-sockets.c
> and in go is here:
> https://git.zx2c4.com/wireguard-go/tree/device/conn_linux.go . If you
> want to provide conn_windows.go that implements sticky sockets, that
> would probably solve 80% of the problem. The remaining part would be
> policy routing for the case when we don't have a sender if or when
> it's gone stale.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
