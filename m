Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D225AC10F09
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:30:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B102208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="FZEBLAE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B102208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec0e93d;
	Fri, 8 Mar 2019 15:18:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 327887d1
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 20:00:09 +0000 (UTC)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 355757ba
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 20:00:09 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id e15so1071110otk.6
 for <wireguard@lists.zx2c4.com>; Sat, 02 Mar 2019 12:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7EUgMU9QV2i6lteY1phNFxnZOGrgCWHGClUsoX6yUd8=;
 b=FZEBLAE0KyaahxNAEboNoKulP7lSteQSRujrSr5wWOm91j+P1AB9n1n3yjOuB39EBu
 Lyqbar+l1k3Fwe2dprIi0ienk49mFAM5PGjcUe8yondNvBZNUa/o+uVwueqnjSr5uD7k
 MLVM4jsvNYKc0P8cHY2IWH5VG3X06VMGE8WpI48jEbMLNuuqPK5KynMTKC6Zl0W9mTR+
 B7IO7gOpBubJhrfvRoiDCGUYBPtppLQy0PlsodNwu8iCH7/HJphProZfl/Z+axxBC37d
 x1Z+f3nxKlU1JZ/2NNg8LOa5DHRmdlfOFAKC2g+dUefVHtSkgaze5jjatE7sfuOLRtOs
 n0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7EUgMU9QV2i6lteY1phNFxnZOGrgCWHGClUsoX6yUd8=;
 b=RyyTlil+G2QjvrZWO0mZk3svf45Bu4IDLMLJoJ538rFJOvJVOjF9rQWz9SnUqmN6Tg
 sZV1OotX/5EyRW3fU3Q1Nnzq2+DtWwnYm8qaaLDTuxp8NB0BS4WPT8nypwflC1miyv3v
 BvWTLe4SY4ld/Hfv09/De5rL6tCXkMeRAFDsU1NXn6tK32nd9YzS62Y6xS3HAVOjFq+g
 NoGgmqt0E6NE7uG3hUrXfCu7xhVFlgCicebRuv1Q96XagQRZGOBr2dnlTicnP2QfAIdL
 oA3WjaSUA34JU/QkagOgtNIuo5EmYoX5oZTb6xwCQJa3GMxmL24zX+zARgCqhjuYaxpR
 21xA==
X-Gm-Message-State: APjAAAWEGG1xeB/I8EA9cvrXEYQXtuCzUGeDQxV/p/OUUIndAhF5m8Cv
 DhS8hywwABbY7BXENShbUkjdMQyOVTfrUdVUpsmgtF4x
X-Google-Smtp-Source: APXvYqyDExERm2ty895oftkRh1LwR93MiZfPK7FdQ/snGarkYMFrv6qmDaaUYhz//DvwLGORE9CnQtf1Ihhw9Ju0FeM=
X-Received: by 2002:a9d:5c16:: with SMTP id o22mr7360938otk.235.1551557408087; 
 Sat, 02 Mar 2019 12:10:08 -0800 (PST)
MIME-Version: 1.0
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
 <1cY0xL4k2A_qU-I2aF2Oz5uEt2LP_i6oCVA5H5rAsRet4lY1MU8GkCQWOXy8OYSZKGtprlH3lZorUozIOKChzb201YR8fdcMDsp5OS9zT1E=@protonmail.com>
 <EA2CDA40-8988-4C4F-B848-B2F7C6D8716C@lonnie.abelbeck.com>
 <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
In-Reply-To: <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
From: John <graysky@archlinux.us>
Date: Sat, 2 Mar 2019 15:09:57 -0500
Message-ID: <CAO_nJAZr1VcZ4vY+JKyQeEVsOdeDyLaJic4oRZVXZO9sEhZtwQ@mail.gmail.com>
Subject: Re: iOS WG Battery Life
To: kolargol <kolargol@protonmail.com>
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:18:46 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Does the iOS settings>battery show a consistent output for WG using
the CPU cycles?

On Sat, Mar 2, 2019 at 2:55 PM kolargol <kolargol@protonmail.com> wrote:
>
>
> > Possibly, is PersistentKeepalive defined at the "server" endpoint for your iOS peer ?
> >
> > I would expect a measurable additional battery usage if either peer endpoint had PersistentKeepalive defined (non-zero).
>
> Both server and peer have PersistentKeepalive disabled, there is no fancy apps runnign in backgroud - and i am using exac same WiFi and VPN endpoint (for OpenVPN and WG comparision).
> WiFI connection is stable and have strong signal, same with LTE.
> The battery grap shows sharp down in the night as something continuesly draing battery (here wg)
> How can i debug it ?
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
