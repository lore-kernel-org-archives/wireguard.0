Return-Path: <SRS0=tD3D=XI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92948C4CEC7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 12:07:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E7DC2084F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Sep 2019 12:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lenstra-fr.20150623.gappssmtp.com header.i=@lenstra-fr.20150623.gappssmtp.com header.b="ewoMNnvv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E7DC2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lenstra.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 180a6e5a;
	Fri, 13 Sep 2019 12:07:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a65ff18a
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Sep 2019 21:01:26 +0000 (UTC)
Received: from mail-yw1-xc2b.google.com (mail-yw1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a6c3df9
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Sep 2019 21:01:26 +0000 (UTC)
Received: by mail-yw1-xc2b.google.com with SMTP id n126so9683407ywf.1
 for <wireguard@lists.zx2c4.com>; Thu, 12 Sep 2019 14:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lenstra-fr.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:date:message-id:subject:to;
 bh=PJRQtJdfsZFYkeoocc48URnEyyGuydEkM1W1cuw5THo=;
 b=ewoMNnvvS2IVYSFVPdEpdlwS01Rpxv6/IGGEKuvfwBaldFFTEDrdqbiu/H2CzdtMua
 YAStm6UHRv0s2BEhaDpFFX4GLV/wgRyRPa46k0ZhVOUE/1iUcg8t9TslBbBOkL6/KmfA
 BRhYABm5K+/G+7fXSczDhv5krhCdGmXYkyPNgQ2XECY27ts2UTw0zVsqEPryv2lj8hTd
 183ZxStZxJbydmTtLm3UINVcTD+jaGelE+vwvzZtxAjixswANhasPKlQ1lGnUefFsdJS
 NBygggD4EmZf45xDqxIOzWHZC8nPFHCokXC7H9URF3wsj8cZo2Ctre6ky66XFEGa9uQN
 l/0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
 bh=PJRQtJdfsZFYkeoocc48URnEyyGuydEkM1W1cuw5THo=;
 b=TZN1CQL2RTGyF7C8LwVYp9Yf5XMB5nCPNBt7tAq0TXuREUEJ2vmKKte6K2hoRXVbTc
 /Eiu9SU1J5sQkeL5zl4NFvMQdX259lTurne17nSri68POF4TnomGAMC2l9hU1LABHFKs
 jVRRU4NwzP1oTxYm4SEkXjkKW3HXzSklOuwhEIiMA0YGQ9L7vgrNDKzyKisGLeJLXBNc
 PNPdtaPX/nJSkUYFrD5kz7hyrlr4M0SUMXgm3bRetrYb0O6Z7xQrgdBO70ftKGR7QWXc
 kDX0idBFclMt/3pICtOLaDJxVE6zxTQNddzG6EDHsdKlFtd3L/3PRQbAe9k9KlLY2F3A
 RoiQ==
X-Gm-Message-State: APjAAAWSXLZlgYNqe3PIylBAMdmTm0oyrNXfFXwmn9TdfzREo8KLLmeL
 bSjG92ZpoAlnVe4HPeW1HJZNgXEBzjjCgNaco5lt7Seg
X-Google-Smtp-Source: APXvYqyuwZeE7F4opRKxXLjBwENvITMXU5Y8ZntGiCQqwSh2+zy87VRpKzNbU0nbkZdoYFoQ2AtTeCWNVVSU5F8ca0Y=
X-Received: by 2002:a0d:db0d:: with SMTP id d13mr31571218ywe.394.1568322085483; 
 Thu, 12 Sep 2019 14:01:25 -0700 (PDT)
Received: from 1058052472880 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Sep 2019 14:01:24 -0700
From: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@lenstra.fr>
MIME-Version: 1.0
Date: Thu, 12 Sep 2019 14:01:24 -0700
Message-ID: <CAFsReqSUQYthBTr4o7HQQGdNUgzA33i9hAoJ_UieNUzJbB=hLA@mail.gmail.com>
Subject: Adding 2FA to WireGuard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 13 Sep 2019 14:07:12 +0200
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
Content-Type: multipart/mixed; boundary="===============6518028947153987651=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6518028947153987651==
Content-Type: multipart/alternative; boundary="000000000000cc893b05926170ed"

--000000000000cc893b05926170ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everybody! We are using WireeGuard on Mac and Linux which works great
but for
compliance purpose, we would like to be able to add an OTP challenge on
connection.

I've been looking at the archive of the mailing list and at the various
projects
built around WireGuard and started writing an implementation based on the
idea
from https://lists.zx2c4.com/pipermail/wireguard/2017-September/001741.html=
:

> Alternatively, you could do OTP in-band, in order to authorize that
> public key for a certain window of time before inactivity. In this
> scheme, you'd disallow access to the network segment based on firewall
> rules until a certain in-band challenge is made -- perhaps by
> contacting a certain sandboxed server and answering an OTP challenge
> there

My current implementation (I plan to publish it under MIT license once it's
ready) has a Python server on the WireGuard server bound to the wg interfac=
e
that add an IPTable rule to allow the traffic for a given amount of time
when
a TOTP is received over TCP. Here are some details

  - The TOTP is bound to the internal tunnel IP address so the IP address
that
  opens the TCP connection is used to identify the user, as thee packet
must
  have been decrypted, it seems to me that there is no way to spoof this.

  - A small text protocol let the user log-in, log-out and read the status
of the
  connection.

The client needs to send the TOTP just after connecting to the server, for
which
I had hoped to use the "PostUp" field of wg-quick.

{Post,Pre}-{Up,Down} seems to be only available on wg-quick for now but we
are
using the wireguard-apple client so I have a few questions:

  1. Is the absence of support {Post,Pre}-{Up,Down} in wireguard-apple on
  purpose or would a patch to add this welcomed?

  2. Is this way to do the OTP authentication sound?

  3. I've seen that TunSafe has added an extension to the WireGuard
protocol so
  the TOTP auth would not be shared by an attacker that succeded to connect
when
  the user is already connected. This seems like a good idea to do, what
are your
  thougts about this? Would you recommend against my "easier"
implementation?

  4. I know that TunSafe was strongly advised against when it was
closed-source.
  Now that it is AGPL code, is it still the case?

One more thing, to simplify the deployment of WireGuard, I would like to
propose
a change in the way the MacOS client import WireGuard configurations from a
file.

Our current flow is "Please open the WireGuard app, click on create Tunnel,
give
it a name, paste this configuration underneath what's already written, hit
save
and send us your public key". It gives a lot of oportunity to the user to
mistype something and make changing the configuration cumbersome ("Edit the
tunnel, don't touch the `[Interface]` part but replace what's underneath by
this") so I would like to be able to send to the user a configuration file
with
the PrivateKey missing and have the WireGuard client generate one on the
fly but
this currently gives an error "Interface=E2=80=99s private key is required"=
. Would
sending a patch for this be welcomed too?


Thanks for taking the time to help me, I look forward to contribute to
WireGuard :)

R=C3=A9mi

--000000000000cc893b05926170ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>body{font-family:Helvetica,Arial;font-size:13px}</style>=
</head><body><div style=3D"font-family:Helvetica,Arial;font-size:13px"><div=
 style=3D"margin:0px">Hi everybody! We are using WireeGuard on Mac and Linu=
x which works great but for=C2=A0</div><div style=3D"margin:0px">compliance=
 purpose, we would like to be able to add an OTP challenge on connection.</=
div><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">I&#39;ve =
been looking at the archive of the mailing list and at the various projects=
</div><div style=3D"margin:0px">built around WireGuard and started writing =
an implementation based on the idea</div><div style=3D"margin:0px">from <a =
href=3D"https://lists.zx2c4.com/pipermail/wireguard/2017-September/001741.h=
tml">https://lists.zx2c4.com/pipermail/wireguard/2017-September/001741.html=
</a>:</div><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">&g=
t; Alternatively, you could do OTP in-band, in order to authorize that</div=
><div style=3D"margin:0px">&gt; public key for a certain window of time bef=
ore inactivity. In this</div><div style=3D"margin:0px">&gt; scheme, you&#39=
;d disallow access to the network segment based on firewall</div><div style=
=3D"margin:0px">&gt; rules until a certain in-band challenge is made -- per=
haps by</div><div style=3D"margin:0px">&gt; contacting a certain sandboxed =
server and answering an OTP challenge</div><div style=3D"margin:0px">&gt; t=
here</div><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">My =
current implementation (I plan to publish it under MIT license once it&#39;=
s=C2=A0</div><div style=3D"margin:0px">ready) has a Python server on the Wi=
reGuard server bound to the wg interface</div><div style=3D"margin:0px">tha=
t add an IPTable rule to allow the traffic for a given amount of time when<=
/div><div style=3D"margin:0px">a TOTP is received over TCP. Here are some d=
etails</div><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">=
=C2=A0 - The TOTP is bound to the internal tunnel IP address so the IP addr=
ess that</div><div style=3D"margin:0px">=C2=A0 opens the TCP connection is =
used to identify the user, as thee packet must=C2=A0</div><div style=3D"mar=
gin:0px">=C2=A0 have been decrypted, it seems to me that there is no way to=
 spoof this.</div><div style=3D"margin:0px"><br></div><div style=3D"margin:=
0px">=C2=A0 - A small text protocol let the user log-in, log-out and read t=
he status of the=C2=A0</div><div style=3D"margin:0px">=C2=A0 connection.</d=
iv><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">The client=
 needs to send the TOTP just after connecting to the server, for which</div=
><div style=3D"margin:0px">I had hoped to use the &quot;PostUp&quot; field =
of wg-quick.</div><div style=3D"margin:0px"><br></div><div style=3D"margin:=
0px">{Post,Pre}-{Up,Down} seems to be only available on wg-quick for now bu=
t we are</div><div style=3D"margin:0px">using the wireguard-apple client so=
 I have a few questions:</div><div style=3D"margin:0px"><br></div><div styl=
e=3D"margin:0px">=C2=A0 1. Is the absence of support {Post,Pre}-{Up,Down} i=
n wireguard-apple on</div><div style=3D"margin:0px">=C2=A0 purpose or would=
 a patch to add this welcomed?</div><div style=3D"margin:0px"><br></div><di=
v style=3D"margin:0px">=C2=A0 2. Is this way to do the OTP authentication s=
ound?</div><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">=
=C2=A0 3. I&#39;ve seen that TunSafe has added an extension to the WireGuar=
d protocol so</div><div style=3D"margin:0px">=C2=A0 the TOTP auth would not=
 be shared by an attacker that succeded to connect when</div><div style=3D"=
margin:0px">=C2=A0 the user is already connected. This seems like a good id=
ea to do, what are your=C2=A0</div><div style=3D"margin:0px">=C2=A0 thougts=
 about this? Would you recommend against my &quot;easier&quot; implementati=
on?</div><div style=3D"margin:0px"><br></div><div style=3D"margin:0px">=C2=
=A0 4. I know that TunSafe was strongly advised against when it was closed-=
source.</div><div style=3D"margin:0px">=C2=A0 Now that it is AGPL code, is =
it still the case?</div><div style=3D"margin:0px"><br></div><div style=3D"m=
argin:0px">One more thing, to simplify the deployment of WireGuard, I would=
 like to propose</div><div style=3D"margin:0px">a change in the way the Mac=
OS client import WireGuard configurations from a file.</div><div style=3D"m=
argin:0px"><br></div><div style=3D"margin:0px">Our current flow is &quot;Pl=
ease open the WireGuard app, click on create Tunnel, give=C2=A0</div><div s=
tyle=3D"margin:0px">it a name, paste this configuration underneath what&#39=
;s already written, hit save</div><div style=3D"margin:0px">and send us you=
r public key&quot;. It gives a lot of oportunity to the user to</div><div s=
tyle=3D"margin:0px">mistype something and make changing the configuration c=
umbersome (&quot;Edit the=C2=A0</div><div style=3D"margin:0px">tunnel, don&=
#39;t touch the `[Interface]` part but replace what&#39;s underneath by=C2=
=A0</div><div style=3D"margin:0px">this&quot;) so I would like to be able t=
o send to the user a configuration file with</div><div style=3D"margin:0px"=
>the PrivateKey missing and have the WireGuard client generate one on the f=
ly but</div><div style=3D"margin:0px">this currently gives an error &quot;I=
nterface=E2=80=99s private key is required&quot;. Would</div><div style=3D"=
margin:0px">sending a patch for this be welcomed too?</div><div style=3D"ma=
rgin:0px"><br></div><div style=3D"margin:0px"><br></div><div style=3D"margi=
n:0px">Thanks for taking the time to help me, I look forward to contribute =
to WireGuard :)</div><div style=3D"margin:0px"><br></div><div style=3D"marg=
in:0px">R=C3=A9mi</div><div><br></div></div></body></html>

--000000000000cc893b05926170ed--

--===============6518028947153987651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6518028947153987651==--
