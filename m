Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03122C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2BC206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uwlge6wo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D2BC206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f9f8cfe;
	Sun, 25 Aug 2019 15:31:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc73d1ed
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Aug 2019 08:25:18 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b202752
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Aug 2019 08:25:18 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k2so21073938wrq.2
 for <wireguard@lists.zx2c4.com>; Tue, 13 Aug 2019 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ST9E9BWA5hiu3eYiMPHIi5lGRVs4HYQG4+wJtPc2Tig=;
 b=uwlge6woFqigZRT2A9ciPw4ysbfqrRSKL2fQFj5h0I6TN62PIQPjXClreHvZAj/2NZ
 amjICybMSWnms1ozhkbe0k+uVfLFLImYRT9t+6Y01Dw3f/6GUpqG/BdrY3cnM/jobmXA
 BeW1a8Y6VpY9KYpxZYZnLKmnEE3aHVExbECn3ppOJO9JNKo4oDyZnSBSTIp52LtkVeDE
 vwKk9vDdY1IJNdcQ+Poj+HAdEcge0Lfnk/RHGJ+PARZwMHRm/60Jk/vVStK5vxQAzwNb
 H7THGqKMK2e0BlFm6f4CkidSkN7LX9yYCSPO0Scr2wreF6cA2nJfI+OffVY3dvktP6Be
 wd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ST9E9BWA5hiu3eYiMPHIi5lGRVs4HYQG4+wJtPc2Tig=;
 b=rrPlXbKFdgIrbZxSUVDdIlsvTTIIUzT1arngp4eHvccOpR/H8ruXyJiDouzMuLBzQs
 h1DPc3pBLyWXgk46Uuz5tCto690Xt4koEzHUQMEcbkigXWEDTYI7z9QMd1oLmOSRtq6G
 eN8P7lYqnWVpsXvOCTUjvc9sXm+vYCuARmaSd5CilBLz0p5vF/uCT2GNGHmqaGNiKNU4
 R7AgA28GFLrRIRT0YugtfGyCwSJ2ehV0vb+n/eywssdxkyaeDKpyjVMwR8jDAgVcngZN
 7oJgKGy9kh02owY46LgSWjIqJKm1+SGsC2PwxsOOIPQ4z+EUmlZ40loApDw7wGROG/9B
 FQtA==
X-Gm-Message-State: APjAAAWnI6zYYI0iL+vZflVJE8uEdzfxeKXk4c8Ff6kM31iMRolv1ebs
 ZAmmdlxjnoqp2+oT0sXh7ATrAlzjyMrdOgnk/fc6it0RHqTEww==
X-Google-Smtp-Source: APXvYqw8QCn4LqM6rNQzP5CVHNkLqBxyoXjQJy/+n9dqatHjcg6H0fjkzK3cjk08Z3tNwag1FEhBIeIafjfBAVB8eeY=
X-Received: by 2002:adf:f584:: with SMTP id f4mr30808769wro.160.1565684716498; 
 Tue, 13 Aug 2019 01:25:16 -0700 (PDT)
MIME-Version: 1.0
From: zhengfish <zhengfish@gmail.com>
Date: Tue, 13 Aug 2019 16:24:39 +0800
Message-ID: <CAJ4Stih2kODmeh9zqRD_EBb-ZAyvKdj3TyKcgMktO+t+Qix60w@mail.gmail.com>
Subject: How to use or run wireguard-go program on Windows7?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:31:10 +0200
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
Content-Type: multipart/mixed; boundary="===============4336723021797041796=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4336723021797041796==
Content-Type: multipart/alternative; boundary="0000000000005b737a058ffb618b"

--0000000000005b737a058ffb618b
Content-Type: text/plain; charset="UTF-8"

Hello,
    I want to know how wireguard-go works, and I tried it on Ubuntu and
Windows7.
    I can run it on Ubuntu, but get failed on Windows7 as following:

    -----------------------------LOG
BEGIN------------------------------------------
    wireguard\wireguard-go.git>go run main_windows.go wg0
    Warning: this is a test program for Windows, mainly used for debugging
this Go package. For a real WireGuard for Windows client, the repo you want
is <https://git.zx2c4.com/wireguard-windows/>, which includes this code as
a module.
    INFO: (wg0) 2019/08/13 16:17:24 Starting wireguard-go version
0.0.20190805
    DEBUG: (wg0) 2019/08/13 16:17:24 Debug log enabled
    ERROR: (wg0) 2019/08/13 16:17:31 Failed to create TUN device: Error
registering rings: Access is denied.
    exit status 1
    -----------------------------LOG
END--------------------------------------------

    What's the meaning of "Error registering rings: Access is denied."?
    I'm sure that I run it with administrator role.
    Or any advice?

    Thanks in advance.

--0000000000005b737a058ffb618b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hello,=C2=A0</div><div class=3D"gmail_default"=
 style=3D"font-family:monospace,monospace;font-size:small">=C2=A0 =C2=A0 I =
want to know how wireguard-go works, and I tried it on Ubuntu and Windows7.=
</div><div class=3D"gmail_default" style=3D"font-family:monospace,monospace=
;font-size:small">=C2=A0 =C2=A0 I can run it on Ubuntu, but get failed on W=
indows7 as following:</div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace,monospace;font-size:small"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:monospace,monospace;font-size:small">=C2=A0 =C2=A0 =
-----------------------------LOG BEGIN-------------------------------------=
-----</div><div class=3D"gmail_default" style=3D"font-family:monospace,mono=
space;font-size:small">=C2=A0 =C2=A0 wireguard\wireguard-go.git&gt;go run m=
ain_windows.go wg0<br>=C2=A0 =C2=A0 Warning: this is a test program for Win=
dows, mainly used for debugging this Go package. For a real WireGuard for W=
indows client, the repo you want is &lt;<a href=3D"https://git.zx2c4.com/wi=
reguard-windows/">https://git.zx2c4.com/wireguard-windows/</a>&gt;, which i=
ncludes this code as a module.<br>=C2=A0 =C2=A0 INFO: (wg0) 2019/08/13 16:1=
7:24 Starting wireguard-go version 0.0.20190805<br>=C2=A0 =C2=A0 DEBUG: (wg=
0) 2019/08/13 16:17:24 Debug log enabled<br>=C2=A0 =C2=A0 ERROR: (wg0) 2019=
/08/13 16:17:31 Failed to create TUN device: Error registering rings: Acces=
s is denied.<br>=C2=A0 =C2=A0 exit status 1<br></div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace,monospace;font-size:small">=C2=A0 =C2=
=A0 -----------------------------LOG END-----------------------------------=
---------=C2=A0=C2=A0<br></div><div class=3D"gmail_default" style=3D"font-f=
amily:monospace,monospace;font-size:small"><br></div><div class=3D"gmail_de=
fault" style=3D"font-family:monospace,monospace;font-size:small">=C2=A0 =C2=
=A0 What&#39;s the meaning of &quot;Error registering rings: Access is deni=
ed.&quot;?</div><div class=3D"gmail_default" style=3D"font-family:monospace=
,monospace;font-size:small">=C2=A0 =C2=A0 I&#39;m sure that I run it with a=
dministrator role.</div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace;font-size:small">=C2=A0 =C2=A0 Or any advice?</div><div =
class=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">=C2=A0 =C2=A0 Thanks in advance.</div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,m=
onospace;font-size:small"><br></div></div>

--0000000000005b737a058ffb618b--

--===============4336723021797041796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4336723021797041796==--
