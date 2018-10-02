Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6E8C64EB5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C48F62083F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cipherdyne-org.20150623.gappssmtp.com header.i=@cipherdyne-org.20150623.gappssmtp.com header.b="HRwXhIsM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C48F62083F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cipherdyne.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aa7c706;
	Tue, 2 Oct 2018 03:06:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c0ffecb
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 02:52:54 +0000 (UTC)
Received: from mail-yw1-xc29.google.com (mail-yw1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b85b663
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 02:52:54 +0000 (UTC)
Received: by mail-yw1-xc29.google.com with SMTP id m129-v6so206354ywc.1
 for <wireguard@lists.zx2c4.com>; Mon, 01 Oct 2018 19:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipherdyne-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=xw8CM3XnScy2HnD5gVwM4byY22xoTtprzM7PBCotsK8=;
 b=HRwXhIsM3UeFiLgdENMuU1GLzuYkrXo2aNyupryrpL+dQVxLFxCYoJY+D91NeyTzYR
 aPjC5tKu9dRozNbiSlAp6DvySBu3JnjNhEXnbOUdKiLe74XTv4yQsYkDsRFrK2Y26dbr
 xWqOKAMlzhcLIVZD8AfDnGJqFojOaKtkKpmxob2VorH1kOciCNXlgvTWdRAgmOKQv2LI
 0aRixYN9tMQcGCTOueDjHF5FCgTQP26dM3+adSBWlD9YV88xRVD/2QhXMlrPNx2tPsDe
 dkaxRjiR8qC7p+3nBzP2M/Mu7Q9iTyHKpK0qzqhdvTS1Nur29RNAJk5Io05B3z37CZFh
 gU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xw8CM3XnScy2HnD5gVwM4byY22xoTtprzM7PBCotsK8=;
 b=rxLHe2kDCqyI/3KiSuAykr4gEJzpQ7/BnyETv2xcetTh4Py/47HiiWBtfX7CDOywm8
 pNbWtMW0phw2eprDwwfF1kRQe19aflyQ2yheO/TpDY5ugqnCSdGpLbrkdvx1qigm3mg9
 +x6xaZRLEeRH5Kv51ppTCY3ivLiNRYt4TqEOYoU73ExpTlVF7FmIBBPN5CXnGvtBWU2s
 o0+hWuwJqUCBWVBUS0GVtaTYmCPxks6rJRJdRtAxvpijPlg2zroryTT6kg89+NbxpULO
 a6yBA8dVwrgoWGfunTnuJy+eDhKKAUk7/C2kLXpo52UwuNzMaTNB9h0I39XqxpJd5Ban
 CLUA==
X-Gm-Message-State: ABuFfoh7uxBvQRAMO0YuVaILB2CJr7FQiJBRjT4oTHKEuJHUzsvUxXUF
 Csj3B0nhjtyYY2INpIPvtjyv1LOy/rMU39ixWsBhIZP0bR8=
X-Google-Smtp-Source: ACcGV61np7zCvNkcGXRkKwPDfjn95T2H9yNC0XwR2P6R3x7+qZF98dXOJqI5atrXaOukxhPo4dOZiw7PNUdXsWScejI=
X-Received: by 2002:a81:b209:: with SMTP id q9-v6mr7692402ywh.45.1538448771450; 
 Mon, 01 Oct 2018 19:52:51 -0700 (PDT)
MIME-Version: 1.0
From: Michael Rash <mbr@cipherdyne.org>
Date: Mon, 1 Oct 2018 22:52:40 -0400
Message-ID: <CABv+sEesH3EX8Uz8TR7Pemj1vsbExJ0rVQ8=SUmXE=SRTEZ2QA@mail.gmail.com>
Subject: macOS, a Linux VM, and Wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 02 Oct 2018 05:06:16 +0200
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
Content-Type: multipart/mixed; boundary="===============1145761116635747545=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1145761116635747545==
Content-Type: multipart/alternative; boundary="00000000000087228b05773604b7"

--00000000000087228b05773604b7
Content-Type: text/plain; charset="UTF-8"

Hi,

This might be of some mild interest (includes a configuration utility) for
anyone who wants to run the Wireguard kernel module from a Linux VM on a
Mac and use it to send everything from the Mac over Wireguard:

https://github.com/mrash/Wireguard-macOS-LinuxVM

All comments welcome.

Thanks,

--Mike

--00000000000087228b05773604b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div>Hi,<div><br></div><div>Thi=
s might be of some mild interest (includes a configuration utility) for any=
one who wants to run the Wireguard kernel module from a Linux VM on a Mac a=
nd use it to send everything from the Mac over Wireguard:</div><div><br></d=
iv><div><a href=3D"https://github.com/mrash/Wireguard-macOS-LinuxVM">https:=
//github.com/mrash/Wireguard-macOS-LinuxVM</a></div><div><br></div><div>All=
 comments welcome.</div><div><br></div><div>Thanks,</div><div><br></div><di=
v>--Mike</div></div></div>

--00000000000087228b05773604b7--

--===============1145761116635747545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1145761116635747545==--
