Return-Path: <SRS0=CAqW=O7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URI_HEX autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07994C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Dec 2018 05:28:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B76821939
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Dec 2018 05:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTkjnE9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B76821939
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f19a3b37;
	Sat, 22 Dec 2018 05:27:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f28def4a
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:02:58 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5efd7f8e
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Dec 2018 05:02:58 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r10so7147008wrs.10
 for <wireguard@lists.zx2c4.com>; Fri, 21 Dec 2018 21:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=nvYMMlmRIDT+V0EluGq8cbdfekNL274Mz/fPsSAaBaU=;
 b=cTkjnE9/E/VVH2VyRZNSImDJa0kqYz4LtaGsx0IMpTla7zshmE1Du84z3yucqIT7TJ
 F5HzlyB/RBNuKfCCI0Ge0DvyTZJjfIt2GKxf7Il2zp014AgQXy+5LKAeYKpp83XK9aBX
 uK5i0PsrPZ5o537bDb9DADRFrTfNK12JldfjyBccG8/3FR71+wLEvqoR+pL57UcTPLwq
 2g/ocCFLo9aGMggeKhtO6HzYgWQA3P0fxIWKxb8fpHDg4n0Iamz9yQu+BekkYmF8JvOL
 PnoZI2QsxN9x9cLhSVDKg6uejgQrUj1VUUOX00eBfYGAG7Li3ycAH5MaDu3WnmLihk7N
 6TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nvYMMlmRIDT+V0EluGq8cbdfekNL274Mz/fPsSAaBaU=;
 b=AxCE1B0oqH998EpyEN9srVxSn8VECuExSrSmzFd54Ft0PH2dE3JcdAX9J0/4NE/FTx
 tSBlpeKR88Mqm0F67yPZqDxrsiF4/mbrp0ARRAuUq7uCthxg+2aWOEEE5+ILX3GLqrSu
 0vjGL7JGzdvk7pF/EnO2H3uKc9Ad4KyNi2wWNBIj+S/BxypjAsxlySBoFISTGSLZpKTC
 mCl0Xq8uGvKShOL9F+AoYXFognAg8BtTjLS/Pi9v9Y8bGnlrKlmjehwVGSXcroETd3jS
 CkUfJmKnew6+BWriS68kjt43TCSs8IIgveGdfyzMBKGFqUTBheX761/MET9kzXtFsz0D
 eoUg==
X-Gm-Message-State: AJcUukfkHxpKTvMutwpt1tQMFyEMSv+kDbY7OrQmdaGuOzhgxr73vlT9
 ZCjlKZOwM6amBfL1Mc5XzL4ED3qis4f6NJ07Dcg2e19p
X-Google-Smtp-Source: ALg8bN55FzwHAfX0pw5kK9ZwssClvIMu2ISikXT0qeGdmpyvxHruG5aru24HiuyfIxc6xeLGnvb3BqDgHPSRcvnRN6Q=
X-Received: by 2002:adf:9484:: with SMTP id 4mr4683356wrr.98.1545455032214;
 Fri, 21 Dec 2018 21:03:52 -0800 (PST)
MIME-Version: 1.0
From: Jason Edson <jaysonedson@gmail.com>
Date: Fri, 21 Dec 2018 21:03:41 -0800
Message-ID: <CAH0N1aTX3SYqGLER1nkWaGmCUqjFSyHbx6jj_mpN2pEh+fcZww@mail.gmail.com>
Subject: Android 3.18 inline kernel build failure
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 22 Dec 2018 06:27:35 +0100
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
Content-Type: multipart/mixed; boundary="===============4377497937242597226=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4377497937242597226==
Content-Type: multipart/alternative; boundary="000000000000362aac057d954ab1"

--000000000000362aac057d954ab1
Content-Type: text/plain; charset="UTF-8"

When building with the latest source that the wireguard importer script
fetches (http://WireGuard-0.0.20181218.zip) I am getting this error:

  AS      net/wireguard/crypto/zinc/chacha20/chacha20-arm64.o
fixdep: error opening config file:
../../../../../../kernel/google/marlin/net/wireguard/crypto/zinc/chacha20/chacha20-arm64.S:
No such file or directory
make[3]: ***
[/media/otherhd/benzorom/kernel/google/marlin/scripts/Makefile.build:301:
net/wireguard/crypto/zinc/chacha20/chacha20-arm64.o] Error 2

I'm assuming that it's trying to go to the wrong path with ../ but I can't
figure it out and so I don't know where to look in the wireguard source. I
can remove the importer script and go back to an old version (ex
http://WireGuard-0.0.20181119.zip) and all is well.

Any help would be appreciated.

Jason

--000000000000362aac057d954ab1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div cl=
ass=3D"gmail_default" style=3D"font-size:small">When building with the late=
st source that the wireguard importer script fetches (<a href=3D"http://Wir=
eGuard-0.0.20181218.zip">http://WireGuard-0.0.20181218.zip</a>) I am gettin=
g this error:</div><div class=3D"gmail_default" style=3D"font-size:small"><=
br></div><div class=3D"gmail_default" style=3D"font-size:small"><div class=
=3D"gmail_default">=C2=A0 AS=C2=A0 =C2=A0 =C2=A0 net/wireguard/crypto/zinc/=
chacha20/chacha20-arm64.o</div><div class=3D"gmail_default">fixdep: error o=
pening config file: ../../../../../../kernel/google/marlin/net/wireguard/cr=
ypto/zinc/chacha20/chacha20-arm64.S: No such file or directory</div><div cl=
ass=3D"gmail_default">make[3]: *** [/media/otherhd/benzorom/kernel/google/m=
arlin/scripts/Makefile.build:301: net/wireguard/crypto/zinc/chacha20/chacha=
20-arm64.o] Error 2</div><div class=3D"gmail_default"><br></div><div class=
=3D"gmail_default">I&#39;m assuming that it&#39;s trying to go to the wrong=
 path with ../ but I can&#39;t figure it out and so I don&#39;t know where =
to look in the wireguard source. I can remove the importer script and go ba=
ck to an old version (ex=C2=A0<a href=3D"http://WireGuard-0.0.20181119.zip"=
>http://WireGuard-0.0.20181119.zip</a>) and all is well.</div><div class=3D=
"gmail_default"><br></div><div class=3D"gmail_default">Any help would be ap=
preciated.</div><div class=3D"gmail_default"><br></div><div class=3D"gmail_=
default">Jason</div></div></div></div></div></div>

--000000000000362aac057d954ab1--

--===============4377497937242597226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4377497937242597226==--
