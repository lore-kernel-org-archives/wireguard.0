Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1679C43612
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:49:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6352021900
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcJUuWFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6352021900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9dc569e;
	Wed, 2 Jan 2019 17:47:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caa2d954
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 13:15:43 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f948642
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 13:15:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h50so15225417ede.5
 for <wireguard@lists.zx2c4.com>; Thu, 27 Dec 2018 05:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=7mJKz98EU3B9Ti1rEa2ZMVHyt51C4+rvnrR3HjsvZCA=;
 b=lcJUuWFVrIOM49dvXAJYn80ZLbWZVcqLD0jBDSveqyiEQNqObePX2puV4t4L8ur0xv
 Pm9uui6FUcQXcdsrvRSe05OTHFQP70tpAFK55xahaFYczw5O/jgA1u97X/c6awHbNjom
 mrTrFTnlD9FMUlPCXQ4tfeeeAHkulM0PviTnRMwu+tE5af95tmOPsjy9X7dkUXoAdvCh
 yCCPXC65bq972iYtLuEgg5Sh4D9ln5p94D1TOAgxZlqv0bG/2pFx5OYWJ8270SCKVL9E
 I1E1wTdj02tVkEOEMdC+TJri5y/vzK0pReb008gYta1QfmkzjDDYi/rgXwEXxIZdJtpE
 Z/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7mJKz98EU3B9Ti1rEa2ZMVHyt51C4+rvnrR3HjsvZCA=;
 b=VvJtVG+i7cYhuqdPKUECxdJ4/ElW1c+j1YhKVyjLe+M4uAXCUDLoMAG0s2vuXP9wiT
 7L4GOkPKDuJcedZvuW90LuyXrNpmCe2LnPEhTI1pnoR3YQv3mYm9YKNgWlGgXEVv37Zt
 DN9Mjc9Oyd2n+JNX/0j5eDuAc9VnXycndU/13s5oEj0FlOH1C9HlB9pYIZfMrNrcrAr0
 TlrsFqW97G3bmjM6/wI1dB0ae/xNLWA0LnwGf6XOGd7uNt8QJVkXEqH0PQwCS8c+xzIe
 zq1tKk2POaxDgHgkBtZltD4ntDE3oVDCvQh6aN2iANTO7NflvErBK49FwWoGC+JUhdB1
 EPXw==
X-Gm-Message-State: AJcUukc1VwgjMFhSQcrY52apuZ7gAq2zo77kLvQU/8IlLM3JZFs2BgKV
 +08RVLIZBzN4OuSwpILqPWvgM2Zq8imB6JYMs6Encwwq
X-Google-Smtp-Source: ALg8bN6AnVVVHA0XDoXVltMu/D/tEZQQ5snIH4WeYW4NCUfJ01FtimgHVA5syLy+Sfohkjmij6pVR7crmYe8NIK6sQg=
X-Received: by 2002:a50:c182:: with SMTP id m2mr11401626edf.139.1545916637739; 
 Thu, 27 Dec 2018 05:17:17 -0800 (PST)
MIME-Version: 1.0
From: C Habs <bumpthelala@gmail.com>
Date: Thu, 27 Dec 2018 13:17:06 +0000
Message-ID: <CANe8y8aLx8pRXAZhwD9Cn4zY5tg2w7Mq3nc=WT9s=2kULx9tPg@mail.gmail.com>
Subject: signature verification
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 18:47:30 +0100
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
Content-Type: multipart/mixed; boundary="===============2196837860304277269=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2196837860304277269==
Content-Type: multipart/alternative; boundary="0000000000000b8002057e00c41e"

--0000000000000b8002057e00c41e
Content-Type: text/plain; charset="UTF-8"

Hello wireguard@

A bit of guidance I need please.

I have been to the 'git' repository to download latest snapshot software.

There is a [gpg] .asc 'sig' file to download, but I am not able to locate a
public key to go with it.

Please advise where I might locate the public keys *and* go about verifying
snapshot WireGuard software ?

Thank you
Habs

--0000000000000b8002057e00c41e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello wireguard@</div><div><br></div><div>A bit of gu=
idance I need please.</div><div><br></div><div>I have been to the &#39;git&=
#39; repository to download latest snapshot software.</div><div><br></div><=
div>There is a [gpg] .asc &#39;sig&#39; file to download, but I am not able=
 to locate a public key to go with it.<br></div><div><br></div><div>Please =
advise where I might locate the public keys *and* go about verifying snapsh=
ot WireGuard software ?</div><div><br></div><div>Thank you</div><div>Habs<b=
r></div><div><br></div><div><br></div></div>

--0000000000000b8002057e00c41e--

--===============2196837860304277269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2196837860304277269==--
