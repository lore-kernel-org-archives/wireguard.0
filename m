Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BFAC04AAE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273E420830
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:28:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCW5EyBq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 273E420830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5206e4c9;
	Mon, 6 May 2019 20:28:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d255b274
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 02:09:51 +0000 (UTC)
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d89fb134
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Apr 2019 02:09:50 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id e2so10625604vsc.13
 for <wireguard@lists.zx2c4.com>; Mon, 15 Apr 2019 19:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8c2FGa0QtXvhid5QL351LRaGk/MHZW3nLMKlm3jKJbw=;
 b=SCW5EyBqsPuQGftRBjOtmcZDsPmKu7TIabsYKWYQrCZf4yOayvxIktuHDi0fFNHlFD
 1XOsVqT0jl33luj52IeF3PdoD7W0xdDD0dI2rqr2KLpeCiMECKg7YUUM6khMKqbV3jA+
 IGZRaAmkzjx9FPon7Lrr//MzsU5GIbKJq52wV0hGlO9yTnyAUc9QZuzZ3maxvJhCRVZB
 fRjcW2BYRmABys21NLSGZrQTCGzl1VHMSm78TORyrZMJURIJ9B1GezduBymKrIuUWhsL
 TgUAxTM0UibXzInGjhdhDItYdzuMoiR7p2uOPIq8VsAgnOiEqcZv1N0PqEWbAHGEdtpF
 4k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8c2FGa0QtXvhid5QL351LRaGk/MHZW3nLMKlm3jKJbw=;
 b=bXIOQ+3ke8zhnLs1TL/Ar6qdaZjnAcI1AOadbp9rTlgYn6N2fRhUUXL1T0M0gZoGDu
 bWMg6l9RzlTCDXutcCAAACyQ2gEonEoVZkZ7s82QiGClUnLPq1zywtaxbLrrqvcU/idW
 Chi8+6xNw1ldsufrgI6AqF/q0+zi5I09lkqJj8jNNUZzEXhK90CpQ9xZLGeFzJ54HBFm
 J390CyfET1mbTa8x7WVTHLfT/HT926M7jsTXoSV4kGeOOvte8hKon8xYDLmjqeG/kRiA
 FlgpQaCKFZSmK19aK7clnOZ9WSPP0ZCzRh4udRSwfug/78zhfV37t2ElNAdZbreoCAvT
 Cc7Q==
X-Gm-Message-State: APjAAAV/HYojmUnIlG2SJ/Gg8/moMwN8UIicVMSD5kSe6BzAWxZkiecb
 6JG7iuHFtHEf+lRmS4hJck9BF2sNN+v9k4PhIsB66WwhKhA=
X-Google-Smtp-Source: APXvYqxdDf+n2LwxfCprJnpleHda5aJa9l/Kl45M+6mw7xExHEFkaOA5STwj4U1wLnGR+CPl0QqzCkkitwtkrmHJjdQ=
X-Received: by 2002:a67:f813:: with SMTP id l19mr42704078vso.46.1555380589576; 
 Mon, 15 Apr 2019 19:09:49 -0700 (PDT)
MIME-Version: 1.0
From: Joseph Jeffers <monprin@gmail.com>
Date: Mon, 15 Apr 2019 22:09:37 -0400
Message-ID: <CANL8rF+LbByc14jB-+HGG=TbiRYufCG_Ggw0h9ezvti5ueVFsw@mail.gmail.com>
Subject: Ubuntu PPA Package Bug
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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
Content-Type: multipart/mixed; boundary="===============0406277279770877221=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0406277279770877221==
Content-Type: multipart/alternative; boundary="00000000000088469705869c43ae"

--00000000000088469705869c43ae
Content-Type: text/plain; charset="UTF-8"

Hello mailing list,

I am building a server utilizing wireguard and network namespaces, and
since the most recent update I seem to have developed an issue where
wireguard on Ubuntu no longer seems to be able to reach the internet
despite following the instructions verbatim. It does however seem to work
on Debian.

To test this I wrote a script that sets up the interface and tests it side
by side with the default network interface. It also tests the network
namespace method as well. It conforms as close as possible to your
instructions. I am using Mullvad as the server to connect to. To get clean
tests, I spun up two clean VMs on Digital Ocean, one Debian and one Ubuntu,
did any available updates, followed the install instruction on the page,
and ran the script. The script and the results are in this Gist:

https://gist.github.com/monprin/c9352f32a6e7e02561a571f27d7ce274

I also tried to test this on Fedora 29 in the same manner, but something
more major went wrong with the install from Copr.

Any guidance on any workarounds for this would be greatly appreciated since
the old build no longer seem to appear in the PPA. I would be happy to help
in any way I can in trying to troubleshoot this, but I wasn't able to dig
into the code as is it is pretty far from my high level python wheelhouse.

Thanks for all your work on Wireguard, I am loving it!

-- 
*Joseph Ray Jeffers*
Email: monprin@gmail.com

--00000000000088469705869c43ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello mailing list,</div><div><br></=
div><div>I am building a server utilizing wireguard and network namespaces,=
 and since the most recent update I seem to have developed an issue where w=
ireguard on Ubuntu no longer seems to be able to reach the internet despite=
 following the instructions verbatim. It does however seem to work on Debia=
n.</div><div><br></div><div>To test this I wrote a script that sets up the =
interface and tests it side by side with the default network interface. It =
also tests the network namespace method as well. It conforms as close as po=
ssible to your instructions. I am using Mullvad as the server to connect to=
. To get clean tests, I spun up two clean VMs on Digital Ocean, one Debian =
and one Ubuntu, did any available updates, followed the install instruction=
 on the page, and ran the script. The script and the results are in this Gi=
st:</div><div><br></div><div><a href=3D"https://gist.github.com/monprin/c93=
52f32a6e7e02561a571f27d7ce274">https://gist.github.com/monprin/c9352f32a6e7=
e02561a571f27d7ce274</a></div><div><br></div><div>I also tried to test this=
 on Fedora 29 in the same manner, but something more major went wrong with =
the install from Copr. <br></div><div><br></div><div>Any guidance on any wo=
rkarounds for this would be greatly appreciated since the old build no long=
er seem to appear in the PPA. I would be happy to help in any way I can in =
trying to troubleshoot this, but I wasn&#39;t able to dig into the code as =
is it is pretty far from my high level python wheelhouse.</div><div><br></d=
iv><div>Thanks for all your work on Wireguard, I am loving it!<br></div><di=
v><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><b>Joseph Ray Jeffe=
rs</b><div>Email: <a href=3D"mailto:monprin@gmail.com" target=3D"_blank">mo=
nprin@gmail.com</a></div></div></div></div></div>

--00000000000088469705869c43ae--

--===============0406277279770877221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0406277279770877221==--
