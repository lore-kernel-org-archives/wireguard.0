Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBBBC432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 05:48:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D28F21D7B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 05:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H72nxzXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D28F21D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 903c5ccf;
	Wed, 25 Sep 2019 05:48:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3cf7296
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 05:48:07 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27a68835
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 05:48:06 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id h144so10550080iof.7
 for <wireguard@lists.zx2c4.com>; Tue, 24 Sep 2019 22:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQWrQbbxYnzZkD4X0fQ31+ioVoiUdPamoicx7TtP9k0=;
 b=H72nxzXOi2QCrOpUFcQVdZJ9CQBh17sb51w8EKCrxlPCfYNGYpz6Ap1oOxiy+wLCQp
 sBkej8CSMgNRTcSqANkcyY+CX4ZG4dM4eafUBL7CZnBRbIWhkcI/KkAJTuLOBO3auk4V
 3Nb5+CrTpXqeFuvPrcJkNAvN23IWACK3qvHjQxns9SjZVDAQShZpGD9p4CWKG5w+AKwW
 /dP7Exew4p2QV1etIZxUuVz7Wr9XAD4mKQ+wAYpS4HDBPs1vhr4W0ET2MrRyaLXLCtss
 3hXkw73KXs4S2S5mFnIv224S3YqOrjKMyGeSHfilebKGzOH6ymPpxK47rGcLvh1zTva0
 qfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQWrQbbxYnzZkD4X0fQ31+ioVoiUdPamoicx7TtP9k0=;
 b=Cyei/YZfL6LP3JOWG9n+sv5dlyL6v+wB22W9O7a6zqYDN0yWu/sKoVtr3Y+JqDjYVM
 XZkJG0PBo5PXufEq1EcPGHaHrwINjYNjpu0+mBEvyaC2RvBHJ/cJX5W2g3r7ZQCQ6ATL
 0BPB7y8qi7NRC1wpxs6/KSGSbmAgYjoFFeyx+tqpIUYKGeVxBB4Co9bbUH0KxAwjWfWf
 3XivJ/qvqpJW8nZWERspZ81nQ1yVHcFoTfgDN06w2YcyRIXi3P47DYAHV109eIx3gq/W
 rgpPQ+HWydrXS03ykSinJs0B/Njfjikzl0wzamccZqHflAePy1IjRQHL7p2qzOwmAIo7
 cv6Q==
X-Gm-Message-State: APjAAAVT0ciW21Uk5iQW9jweCO4iBCzvrrqYKrSSQXW3SdtoXsZ792Zo
 HIbZn8EFI/B+e71HVA34EcS3KLbpp5lvSDLquZc=
X-Google-Smtp-Source: APXvYqxI1oqX4HlPmDLuXUS04pjOH1jIsWb3S36nwg2GdwOg3Q8NI5IWNl8CYDRzcf6v5P1yXiBx5r8LJJ9QTCGxZD4=
X-Received: by 2002:a5d:9dd4:: with SMTP id 20mr8431952ioo.1.1569390486130;
 Tue, 24 Sep 2019 22:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <573fbdd7-cc13-ee2a-e9a7-eaf095471e3a@noc23.de>
In-Reply-To: <573fbdd7-cc13-ee2a-e9a7-eaf095471e3a@noc23.de>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Wed, 25 Sep 2019 07:47:55 +0200
Message-ID: <CAA6-MF-nK3Jm6jzdXuhk62cqfD4XACtG1md3jvUBCix3fcnuFw@mail.gmail.com>
Subject: Re: Build fail on OpenBSD 6.5 amd64
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
Content-Type: multipart/mixed; boundary="===============2374681539837831962=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2374681539837831962==
Content-Type: multipart/alternative; boundary="00000000000070b72905935a323d"

--00000000000070b72905935a323d
Content-Type: text/plain; charset="UTF-8"

Den tis 24 sep. 2019 kl 11:00 skrev Ulrich Kalloch <ulli@noc23.de>:

> Hello @ all
> if you have installed firmware remove it if possible.

The install Process check that /usr/include/machine is empty.
> then check that the directory /usr/include/machine is empty.

If not clean it.
>

I think this part is way off and probably all the way into "bad advice".

Cleaning /usr/include/machine is wrong, and fw_update seems completely
unrelated to either the contents of the C includes or building WG.

You didn't have the compiler installed which what was causing your issues
with building wg and I think that's it, nothing more.

-- 
May the most significant bit of your life be positive.

--00000000000070b72905935a323d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Den tis 24 sep. 2019 kl 11:00 skrev Ulric=
h Kalloch &lt;<a href=3D"mailto:ulli@noc23.de">ulli@noc23.de</a>&gt;:<br></=
div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hello @ all<br>if you have installed firmware remove it if possible.<=
/blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
The install Process check that /usr/include/machine is empty.<br>then check=
 that the directory /usr/include/machine is empty.=C2=A0</blockquote><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">If not clean it.<br></blockquot=
e><div><br></div><div>I think this part is way off and probably all the way=
 into &quot;bad advice&quot;.</div><div><br></div><div>Cleaning /usr/includ=
e/machine is wrong, and fw_update seems completely</div><div>unrelated to e=
ither the contents of the C includes or building WG.</div><div><br></div><d=
iv>You didn&#39;t have the compiler installed which what was causing your i=
ssues</div><div>with building wg and I think that&#39;s it, nothing more.</=
div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">=
May the most significant bit of your life be positive.<br></div></div>

--00000000000070b72905935a323d--

--===============2374681539837831962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2374681539837831962==--
