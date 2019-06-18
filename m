Return-Path: <SRS0=lEMV=UV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99B4C43613
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 07:50:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A58A2089E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 07:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5kI45+r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A58A2089E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e71378c3;
	Sat, 22 Jun 2019 07:50:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f51649b6
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 15:32:27 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40dec060
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 15:32:27 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id c11so8832498qkk.8
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2019 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=lmosrnL1iYtmYJmRWDp1gG5ewI7lLEtzRDDFYX5rC4s=;
 b=J5kI45+rEXpT6rfWlgNrJuCKsi8cJBDvoqWVQBEJlITVfebujJQRYxg9flyp68JH5/
 m+jC9QWAevJRhOIt0igmdQQgVUY8h+qkNPsfCobPSBLHvpfeBdMoYahBhlW32aZKj6VE
 SSiEFC8RTDyvSFEQFmlYyJ62fyx671vTOgmEakVcSWrgEOWXB0QjrZSy3008u3IlZasA
 5l1yUXAmIALkAxQrFDukZ+kiWHo5kpGDRQhKpXZ/5mV8ycsjiBEWFJtlkYjcLwxtRlbf
 tWHQJJ7dcTgCmbWtPZYozB0S0WjkMk+CNYJDjNTJXUOMA+ErhZLJe2igG2VceIKCWRp0
 mWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lmosrnL1iYtmYJmRWDp1gG5ewI7lLEtzRDDFYX5rC4s=;
 b=J1G5IydQXBlYCVPXHyMtZEg1kOsLpo6+lsA/cUC8OW/87teVdqcBbArAvAMxn/oAPN
 LNHfauFJGDtoYUOhbjUEcu5mztAb9HHoQ2IZN7wSOMrHuYhPuGJm/BvXxgleZmjqdwzH
 yuSPr0lVSYz9wRIzCkMRoYr5fEwk4rQrzRxYbAhaXV1afOw6KQYCSzTBFm+M95onUy9W
 8o7g9TborvZ9sqdRKQC3cNye8qKfKKZB79uYv0gAJEOr9+gR8n1S9kWwKBWy9MpLnkam
 jQsJTSIsCGzkcyASGZpfFP8HgSLZeiqeHy7GP02prQevSfxLwauVLnrOGnhwx69byBig
 HO3w==
X-Gm-Message-State: APjAAAW1NUzab+iqND1kJL+3fNdbmpwDQ8hyuImxSapQXJ0qSI4hBELQ
 Ydipobji2/f4stesffcn8hJNEEYQ3/Gif8nyBwMCSwtw
X-Google-Smtp-Source: APXvYqx9Sr4ud5Cyo/YgtgdgEtts03LYffstB5E2us9WZdoFRymouhq98WJL4aAMLN+Av8px907Sabimv4DL+HwVbOs=
X-Received: by 2002:a37:be85:: with SMTP id
 o127mr83990153qkf.194.1560871947037; 
 Tue, 18 Jun 2019 08:32:27 -0700 (PDT)
MIME-Version: 1.0
From: Nigel Magnay <nigel.magnay@gmail.com>
Date: Tue, 18 Jun 2019 16:32:16 +0100
Message-ID: <CAPYP83TtUYWsEJ=A5j-NOc81ry6MT1AqCaaBDoHpiyPrSvoofw@mail.gmail.com>
Subject: Fragmentation
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 22 Jun 2019 09:50:24 +0200
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
Content-Type: multipart/mixed; boundary="===============4777937394692953933=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4777937394692953933==
Content-Type: multipart/alternative; boundary="000000000000f17008058b9ad1bf"

--000000000000f17008058b9ad1bf
Content-Type: text/plain; charset="UTF-8"

Hi!

I have successfully set up a wireguard connection, to a server hosted
inside Microsoft Azure. Thankyou for this software, it's so much easier to
configure than the alternatives.


I have a small problem though, which I think I understand (but seems
strange), but I'm not sure of the correct solution.

I have routed all internet traffic over this connection; it works, I can
successfully ping sites, and view some. I'm using IP masquerading at both
ends to connect entire networks (I thus use the client as a gateway).

However - some hosts do not respond - or, rather, there's a packet
fragmentation issue.

I can see with tcpdump on the server entries like this:

17:55:04.461804 IP 85.118.26.200.https > vpn1.60630: Flags [.], seq 1:1441,
ack 518, win 30, length 1440
17:55:04.461849 IP vpn1 > 85.118.26.200: ICMP vpn1 unreachable - need to
frag (mtu 1420), length 556

Which I take to mean "we got a response, it's length is too big to fit in
the vpn payload, please shorten".

What happens though is nothing - it just keeps receiving over-long
responses, so it doesn't work - which is hardly wireguard's fault.

Now, I guess either the end server is simply ignoring me, or the ICMP stuff
is being blocked somewhere. I'm not knowledgeable enough to know if either
of these are likely, as I'm a bit puzzle as to how anything could work
properly if either of those were true.

So - am I doing something wrong? What's the right knobs for me to be
twiddling here?

I have wireguard 0.0.20190601 at each end.

--000000000000f17008058b9ad1bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi!<br><br>I have successfully set up a wireguard connecti=
on, to a server hosted inside Microsoft Azure. Thankyou for this software, =
it&#39;s so much easier to configure than the alternatives.<br><br><br>I ha=
ve a small problem though, which I think I understand (but seems strange), =
but I&#39;m not sure of the correct solution.<br><br>I have routed all inte=
rnet traffic over this connection; it works, I can successfully ping sites,=
 and view some. I&#39;m using IP masquerading at both ends to connect entir=
e networks (I thus use the client as a gateway).<br><br>However - some host=
s do not respond - or, rather, there&#39;s a packet fragmentation issue.<br=
><br>I can see with tcpdump on the server entries like this:<br><br>17:55:0=
4.461804 IP 85.118.26.200.https &gt; vpn1.60630: Flags [.], seq 1:1441, ack=
 518, win 30, length 1440<br>17:55:04.461849 IP vpn1 &gt; <a href=3D"http:/=
/85.118.26.200">85.118.26.200</a>: ICMP vpn1 unreachable - need to frag (mt=
u 1420), length 556<br><br>Which I take to mean &quot;we got a response, it=
&#39;s length is too big to fit in the vpn payload, please shorten&quot;.<b=
r><br>What happens though is nothing - it just keeps receiving over-long re=
sponses, so it doesn&#39;t work - which is hardly wireguard&#39;s fault.<br=
><br>Now, I guess either the end server is simply ignoring me, or the ICMP =
stuff is being blocked somewhere. I&#39;m not knowledgeable enough to know =
if either of these are likely, as I&#39;m a bit puzzle as to how anything c=
ould work properly if either of those were true.<br><br>So - am I doing som=
ething wrong? What&#39;s the right knobs for me to be twiddling here?<br><b=
r>I have wireguard 0.0.20190601 at each end.<div><br></div></div>

--000000000000f17008058b9ad1bf--

--===============4777937394692953933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4777937394692953933==--
