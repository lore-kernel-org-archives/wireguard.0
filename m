Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF72C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:05:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 734D4218A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=joonix-se.20150623.gappssmtp.com header.i=@joonix-se.20150623.gappssmtp.com header.b="ay+D+3Yw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 734D4218A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joonix.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55d8acd7;
	Sat, 23 Mar 2019 00:04:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2df6cd2
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 16:50:34 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c7374fa
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 16:50:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id t13so5882466lji.2
 for <wireguard@lists.zx2c4.com>; Thu, 21 Mar 2019 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joonix-se.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:subject:message-id:date:to;
 bh=EPqbhR6rqNv9EFeLcaqA2tKAjyMBX55cVl94z4BMhVw=;
 b=ay+D+3YwNG+irLKiHHNpatTGD6rJZIxMRvtbNB3O1xXOoN/WJERCVuKPQ+Nfa4sScr
 LLQfssDOi+QMdVtj1dk4h6pI2s7G8UWOR307wn6/16j7x3L2zEy/KToXEX+FRFNOzLKP
 hiiz/3KaDk1PflYwkUc5fJeK+KIeqgSuViYxTbMd5FUtuTXKqVJ7VqoYJPQN6p6vcDEX
 6DTi6BHnOLEF3XAWBHTGpJ59b2LlRizL7p5U/B2X6+udSGCDoWYT6WeF5H5a1fJe97Ap
 S4LyFsD0wnClt3jCOZfRjq3VT0fFkVWHKZSBL8f3jmXd0hLuQElHXFPmn9CZE3XE0kwR
 s17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=EPqbhR6rqNv9EFeLcaqA2tKAjyMBX55cVl94z4BMhVw=;
 b=bxJhj0/2XGHm4Xlo4r3nlvevdvFArQzwr9t/TI2ewJGagX/vwA8e0WY/zMPE1r9NhE
 5NZyH5etWkB5MlsizwmMA3hfleqoS3wcf9FsIlj8ynnysg1f/mazbJdTGwZNj2QbW6qJ
 Nt5th/Zcn0nVXvFTvgTFB+sK2M8SNO97cnAhBXXKy5vTA8AYc3i5CV8vBxrb6IusLEeE
 6Xvs5+3mSPAfyisqnmytnNlXeoOqkrNYNu24MqnAx0AmxF8XaCuOjvbB0JH2uBbyjXcc
 +HM+eMOp5iEuYrJVFTgcZd6C5dVgYlznpiSKj9XDS5pJbQDx9hCJbna/s6URPu5Rom0F
 euow==
X-Gm-Message-State: APjAAAWbq8Pq4auFEWFJ4JnNe5fZpTwpNpksWr4DBGVPexEfjO+gM+Px
 ZiJNCIk+LNfaHsL+zKTCtOCLHc1wX7LwFQ==
X-Google-Smtp-Source: APXvYqyBK3riS7F+eosh1yj7calsQK2zQkKEOW/aIW6mQrObEPv8BTYy1TAix3Ed6DTAsTJoTCHtaw==
X-Received: by 2002:a2e:904b:: with SMTP id n11mr2599692ljg.57.1553187058287; 
 Thu, 21 Mar 2019 09:50:58 -0700 (PDT)
Received: from [10.80.0.245] (h-154-138.A353.priv.bahnhof.se. [37.123.154.138])
 by smtp.gmail.com with ESMTPSA id v26sm939739lja.60.2019.03.21.09.50.57
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Mar 2019 09:50:57 -0700 (PDT)
From: =?utf-8?Q?Johnny_Bergstr=C3=B6m?= <johnny@joonix.se>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: a couple of unrelated questions
Message-Id: <16381132-7BBB-43B3-AF62-EBB055B79015@joonix.se>
Date: Thu, 21 Mar 2019 17:50:56 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:04:33 +0100
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
Content-Type: multipart/mixed; boundary="===============3886341808066272314=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============3886341808066272314==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_86E251B3-3C71-4265-A346-4C88511B32B7"


--Apple-Mail=_86E251B3-3C71-4265-A346-4C88511B32B7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello,

I=E2=80=99m currently developing a couple of services which will use =
Wireguard as its core enabler.
While looking for somewhere to ask questions or post issues I found this =
list, so here it goes:

1. Why not enable issue tracking on Github (and preferably not "only a =
mirror")? It would be much easier for someone like me to follow known =
problems and questions as most other open source projects are on the =
same platform. I would expect more contributions to your project would =
be the result.

2.1 Why block building with Go on linux like this: =
https://github.com/WireGuard/wireguard-go/blob/master/donotuseon_linux.go =
<https://github.com/WireGuard/wireguard-go/blob/master/donotuseon_linux.go=
>=20
Kernel module is preferred, but there are still use cases where you want =
the Go version even when it=E2=80=99s linux behind the scenes.

2.2 Would you accept a pull request for refactoring the Go version to =
become a re-usable module? E.g. not have everything in package main.

3. Are there plans on a custom URL handler for the Android and iOS for =
easily importing a config?
As opposed to the steps involved in first then going into the app and =
importing.


Thank you for a great project!

Johnny=

--Apple-Mail=_86E251B3-3C71-4265-A346-4C88511B32B7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D"">Hello,<div =
class=3D""><br class=3D""></div><div class=3D"">I=E2=80=99m currently =
developing a couple of services which will use Wireguard as its core =
enabler.</div><div class=3D"">While looking for somewhere to ask =
questions or post issues I found this list, so here it goes:</div><div =
class=3D""><br class=3D""></div><div class=3D"">1. Why not enable issue =
tracking on Github (and preferably not "only a mirror")? It would be =
much easier for someone like me to follow known problems and questions =
as most other open source projects are on the same platform. I would =
expect more contributions to your project would be the result.</div><div =
class=3D""><br class=3D""></div><div class=3D"">2.1 Why block building =
with Go on linux like this:&nbsp;<a =
href=3D"https://github.com/WireGuard/wireguard-go/blob/master/donotuseon_l=
inux.go" =
class=3D"">https://github.com/WireGuard/wireguard-go/blob/master/donotuseo=
n_linux.go</a>&nbsp;</div><div class=3D"">Kernel module is preferred, =
but there are still use cases where you want the Go version even when =
it=E2=80=99s linux behind the scenes.</div><div class=3D""><br =
class=3D""></div><div class=3D"">2.2 Would you accept a pull request for =
refactoring the Go version to become a re-usable module? E.g. not have =
everything in package main.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">3. Are there plans on a custom URL handler for the Android =
and iOS for easily importing a config?</div><div class=3D"">As opposed =
to the steps involved in first then going into the app and =
importing.</div><div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D"">Thank you for a great =
project!</div><div class=3D""><br class=3D""></div><div =
class=3D"">Johnny</div></body></html>=

--Apple-Mail=_86E251B3-3C71-4265-A346-4C88511B32B7--

--===============3886341808066272314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3886341808066272314==--
