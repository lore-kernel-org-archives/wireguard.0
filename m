Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11EEC43444
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E11220657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="pUC65Bh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E11220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4a67be0;
	Wed, 16 Jan 2019 16:32:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d5554cb
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 15:48:39 +0000 (UTC)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51c90a96
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 15:48:39 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id 32so7975984ota.12
 for <wireguard@lists.zx2c4.com>; Wed, 16 Jan 2019 07:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=pP7TH77P9zuInob5Ghzndh03FllxTGAeAp/oPx61PpU=;
 b=pUC65Bh5saXA6+0ref+onacnq7PqhhCnbyBpsfaHqSGGZmtEH4uSZp2XjK5nzGUHye
 Yh0P6YY/bjaMG8/d0RGsFIANu22ToTFfV4HOGQw04oYRyGxpcoM8NP644ukaWsp8i7eZ
 x33xqAjB39uEApNFPoPL4TIjypN6F2nfUEE3vQQE7aybJvgWmtDjf9yhlDsRnl6NbTXA
 6fCQqrPMLWlps+lVYBDZtvcvBAURM4s3guVE590nRtq4VRDIM1t+XDdU++Le+LCpMkwn
 gR/hTnug+MXIohrwdxWYRRMM2w2aYmeHu9evCUxcFPxrGzhsebis4m3oshp/ljbu1EFT
 yj8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=pP7TH77P9zuInob5Ghzndh03FllxTGAeAp/oPx61PpU=;
 b=e2jplcop4TVTHRUGpPid0PzrCsIarOFEVQZT4pleSJY43YQXHO8J+/ye8BWUZSGncM
 4wTCDQhwznZSRELcBKeg8AgZK3MEA7Ge/JBa3fKsuzNUScmuFfxZ8ZHQ7pX5sEpBa8pT
 JbnYRXDz7Q9u5TkArPXEiqQvkx6bQR+BM4RY/Sx5p18ccNpXaAvvAWQeucRAkKBsianm
 WKcxuj9SUFDaWqJFN8Jc+wvlh2edDglwzJhVKwQ5L+Swrua9rcmEoQ3QwYOJz+vHvzqR
 XZ/x74J16hqYwg3G1X1IGn0Bt1Ir2U5tNYHWJWfSjE1DUvJ9Qep31mJ06CoIK38r/wr6
 IV7Q==
X-Gm-Message-State: AJcUukeiuMNCAOlD7+AkvT8aXn/zj+aRXnjGUT6dgNougJQWXikENZat
 vCwTEjp3iLJuBeNNqAkMb/25QdO846bbkl6hUWMXHs/W
X-Google-Smtp-Source: ALg8bN53jwJVsXrPgOmssiI7IqzEpgiVeKMPgk+jAldGajHisKxjxGPFKPQyF483Ri8XMioR9+KwubBJQR9qdnq2kEo=
X-Received: by 2002:a9d:4d17:: with SMTP id n23mr5598060otf.66.1547653969450; 
 Wed, 16 Jan 2019 07:52:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4a:2f0d:0:0:0:0:0 with HTTP; Wed, 16 Jan 2019 07:52:48
 -0800 (PST)
In-Reply-To: <20190116153913.GB19179@pure.paranoia.local>
References: <20190116153913.GB19179@pure.paranoia.local>
From: John <graysky@archlinux.us>
Date: Wed, 16 Jan 2019 10:52:48 -0500
Message-ID: <CAO_nJAYgvq-+2mVdVu2qoo7yFEiX9LHnaaEk0CDGhngBZ+Kagg@mail.gmail.com>
Subject: Re: Logging remote connecting IP
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-Mailman-Approved-At: Wed, 16 Jan 2019 17:32:07 +0100
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
Content-Type: multipart/mixed; boundary="===============1039764041235615203=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1039764041235615203==
Content-Type: multipart/alternative; boundary="00000000000015ad07057f954528"

--00000000000015ad07057f954528
Content-Type: text/plain; charset="UTF-8"

Enable the debug option when building should print to dmesg.

On Wednesday, January 16, 2019, Konstantin Ryabitsev <
konstantin@linuxfoundation.org> wrote:

> Hello:
>
> For auditing purposes, I would like to be able to log the remote
> endpoint IP for each wg connection on the server side. What's the best
> way to do this, preferably using syslog?
>
> Best,
> -K
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>


-- 
Sent from Gmail Mobile

--00000000000015ad07057f954528
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Enable the debug option when building should print to dmesg.<br><br>On Wedn=
esday, January 16, 2019, Konstantin Ryabitsev &lt;<a href=3D"mailto:konstan=
tin@linuxfoundation.org">konstantin@linuxfoundation.org</a>&gt; wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hello:<br>
<br>
For auditing purposes, I would like to be able to log the remote<br>
endpoint IP for each wg connection on the server side. What&#39;s the best<=
br>
way to do this, preferably using syslog?<br>
<br>
Best,<br>
-K<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" target=3D"_b=
lank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wireguard</a><br>
</blockquote><br><br>-- <br>Sent from Gmail Mobile<br>

--00000000000015ad07057f954528--

--===============1039764041235615203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1039764041235615203==--
