Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39739C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:25:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F1D20848
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDLtXpJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F1D20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec13dcb4;
	Fri, 16 Oct 2020 13:16:59 +0000 (UTC)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [2607:f8b0:4864:20::b2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0cdf1e00
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Oct 2020 20:51:25 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id n142so108279ybf.7
 for <wireguard@lists.zx2c4.com>; Thu, 15 Oct 2020 13:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=44mL05k785DouSBlejy0dBs4QUnqK66cIXdGTm3L/Kw=;
 b=YDLtXpJS/8IhomPkwNXqi6hChyPregqRrLw5g4kWTwft55IrA8/TUrv8Kb+ogD5CRA
 ar4ET/E/h+WvF/FKX4NwzL+Bdv7eiWsiBbHHyg3LP3f/81K4S12aTlQCY5t6bYh0tTRP
 +SbK8vmJ1LIAM4Wwlmgo33FepgMD9l3DWWiSpPcuu+j16bfMUqU9gdncxDs6O8ibWBbN
 9MnIZKR5ofGIWz0k856zhikThHRQbg+lPW73aojf+kuvTHRckh/ZZLUHSZjBNs5BLsk5
 VzbPPDU5/jPWx1amk16e0Ah0BwnsiQ78vp2k9G9B4I109c3SVYto0YS08jbdDnlFPx39
 G0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=44mL05k785DouSBlejy0dBs4QUnqK66cIXdGTm3L/Kw=;
 b=btyTUuF+jtj+0koS1sWWfo+C0XgMp+KGC/OVyTli4LswmUV/MdSAVUYh/gEyLSNz28
 548Fj79jaFO09JgnFY+o/lkMDHPpDN0rkHhTtmDbloJDiK5ESrldCEwC6lCGrIxNnpXF
 9G97VZj8EuQNdjnYxEyBYZSTijP3oZlMApy2JB0K768+lWo3JpJ68XTa+YpgonWA/Z48
 Fa0Csfy80+sKBr9cmSGjP0ZSfZPJ9sScxxYM6KMvc7dcf0rdSvob+bTz3iEWQeaR+1i9
 PBvVtz5GLLkwP3yweKpXFAbh5C3lchjpOPvANHqe3XMddzXyGh77vU2EWjgBPajLRLeA
 HBpA==
X-Gm-Message-State: AOAM533Rl0hsYrwhqOML6nuQdHEqbGOqWEQUroUKt4bjBm/PLIooNJ4V
 rxpfQxnhaT1HR/LMLrIiFYxqGyssS9g/EGuf3GKLiHiNK10z5GvZ
X-Google-Smtp-Source: ABdhPJwyQxUxEnvY2z/QDrkzeWU6Sm/o5mSeiE6G1jTcPnx1RgOziy85xsKIlEs7UHaUF/fiHLpIryBRFd+Vq7hL7p0=
X-Received: by 2002:a25:40c5:: with SMTP id n188mr346200yba.514.1602795107812; 
 Thu, 15 Oct 2020 13:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAA6eTQFuf1n3HLtkg0xLp-+kGF5Xf_v5zEYYP7U0ae3Mvn810Q@mail.gmail.com>
 <CAA6eTQFfWxMBuPzJd-xHAaCj3GUt+nkb3BLpwomF1+-05CU9dA@mail.gmail.com>
In-Reply-To: <CAA6eTQFfWxMBuPzJd-xHAaCj3GUt+nkb3BLpwomF1+-05CU9dA@mail.gmail.com>
From: Boiler Plate <boilerplate4u@gmail.com>
Date: Thu, 15 Oct 2020 22:51:36 +0200
Message-ID: <CAPLehQ1sZSRdusvf4ZAZ7H+Svtm0JznEacTpccVBhW+xYyio4w@mail.gmail.com>
Subject: Re: [wg-apple] Prevent changes to the resolver?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Forgot to mention that the mac-gui (WireGuard app) always sets the
default route no matter what conf is used:

Destination      Gateway          RT_IFA           Flags        Refs
   Use    Mtu     Netif
default              link#14            10.0.0.4           UCSI
     1        0       1420   utun2
10.0.0.3/32       link#14            10.0.0.4           UCS
  0        0       1420   utun2
10.0.0.4           10.0.0.4           10.0.0.4           UH
     0        0       1420   utun2
--

On Thu, Oct 15, 2020 at 10:43 PM Boilerplate4U <Boilerplate4U@gmail.com> wrote:
>
> ---------- Forwarded message ---------
> From: Boilerplate4U <Boilerplate4U@gmail.com>
> Date: tors 15 okt. 2020 kl 20:55
> Subject: [wg-apple] Prevent changes to the resolver?
> To: <wireguard@lists.zx2c4.com>
>
>
> Does anyone know how to prevent wg on macos (gui) from making changes
> to the resolver (i.e. /etc/resolv.conf) ? Every time when I activate a
> tunnel, wg resets the dns settings and sets the tunnel ip as the
> resolver address.
>
> macos catalina 10.15.7, app version: 0.0.20191105, backend 0.0.20191013
> --
>
> Thanks in advance!
