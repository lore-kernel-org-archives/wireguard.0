Return-Path: <SRS0=i4ZG=5W=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D91C2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:24:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D73C6206C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Apr 2020 06:24:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="r0cd5T8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D73C6206C0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be0030b2;
	Mon, 6 Apr 2020 06:16:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9e93d8e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 06:16:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d400d5b
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 06:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=zjOml+sKvpFjLGIi3WzYyIuL6qE=; b=r0cd5T
 8C0MG28SaK94g9Xb5JtaPaOEfcfjclFFLyqGq5NHvgVqciFkwdX/jR7Tk+dVGpCc
 seFxU8R84w4S6jlAMEVHxv8ZCb90CajcIS6HsKprTzYfOjHAn41y+dErKfOwkf3c
 lHs4hNIgkZ1+3q+upMqDlMkn21bP9dY4mDUzjoaZc5pfjNQ98Ve3k40BGeajv/K3
 vZGjDJSIh2IL0FN8Wx2qrlnetu+K10yb23/vx2+AGlM9DOf/G5ak3Z7SSKMQqRGm
 PWEY3+A6ehAt+nZwdP4Nfvw0fVgtqCD4TbsxZZnMD2MC7eqZPpA50KS8ngch/8J1
 U9nGvGGgXQC5CVpw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8c78fb16
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Apr 2020 06:16:08 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id n10so14570463iom.3
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 23:24:54 -0700 (PDT)
X-Gm-Message-State: AGi0Pua05YMzaUxqMjYcuPSqIXWZRod9gK7j4OxYqxYI2+/8CRhtcGPH
 7n5IT3ezyIAnPEGV4hCfbEYkYEzYLmBlLBHo7+k=
X-Google-Smtp-Source: APiQypJtvUmdDjoMYHK0efXd40DZ/nWXSXStSspbknVEMdvn5vdoFggl7W/yb4P6mgm4vDpy4p+zrdISVnRnNU2ZdmM=
X-Received: by 2002:a5d:9c16:: with SMTP id 22mr1258079ioe.79.1586154293607;
 Sun, 05 Apr 2020 23:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <CABtXGiDykFrPtVPsn8QOfr2WayPOU_hn+_VpgmJy9Ap3+LOTfw@mail.gmail.com>
In-Reply-To: <CABtXGiDykFrPtVPsn8QOfr2WayPOU_hn+_VpgmJy9Ap3+LOTfw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Apr 2020 00:24:42 -0600
X-Gmail-Original-Message-ID: <CAHmME9rWYZ1VHXgUw2Pku0oxKetNZHyuKHAreAVDgAOYXCdgtw@mail.gmail.com>
Message-ID: <CAHmME9rWYZ1VHXgUw2Pku0oxKetNZHyuKHAreAVDgAOYXCdgtw@mail.gmail.com>
Subject: Re: Android app user (not test on iOS)
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Update the app. This was fixed, but you're still running an old
version, most likely.
