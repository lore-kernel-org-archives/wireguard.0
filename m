Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64D2C43610
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:07:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57AA320685
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:07:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6JJWID+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57AA320685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 979088dc;
	Mon, 19 Nov 2018 19:01:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dc5eb09
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 03:40:23 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 452d6d77
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Nov 2018 03:40:23 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id u18so19040269lff.10
 for <wireguard@lists.zx2c4.com>; Sat, 17 Nov 2018 19:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RTPJKsOEQ4/x5bKQrd+PIyypqxFfVcjeS0oA0MUZp2M=;
 b=C6JJWID+eKmWL3eJMSQ5WzS6+8AWXCaRqgOwUSTvCwRinId4ZmlIh5HhgM7YMf9pRI
 El0OirFdaOsmmnPWQgDU98hT+ezwRnBsxFPhSDZjgsorWvDyOXYcSU/V3VymURg6nFid
 HhT/Z6mwTcxoX87r1YqTDkoegW5Wu0356roYylgtuNEolM8RRf3QEolF9yxhK8KnJsll
 eO+NNXw/iIbb8b5zAPJmGJO8TEBJTUIfS8B8Fn9f9a+V7Qsn7gKymyfd5zqAT9pvagpv
 xejbhVy5nP7GbxgEdbPN3sw/kzPku+Wlb5YreQ26AdkPdgYXX2k2t6reFYvORDRaBOiY
 Uv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RTPJKsOEQ4/x5bKQrd+PIyypqxFfVcjeS0oA0MUZp2M=;
 b=j0zUdfBP+jnBXNoh4wtx40wQZ4SoKYJ2MXeiGRU0vNP2XIzXtVRUGhYkKZJLXPcVbS
 LJ2BrEZdoKFH9EJ6DvgugnbmVf0gWzag/ewANfazDfBesuesMGWakJxi0gO/r+9hjGJd
 nFh2452uS/zxI2KL/xNxMkPJt3pg8c/BNvEStmxKQKhaMB18mg1NJ0DJWZJ9e2tcqCKB
 xP3FwD8cSXMeug38tllPPooObPhkoxW3DrElf79AcIQ9/LBK4LkaorNkxgb7ZWrJAbvh
 kI8V4JRfDKpPoWRheqksdYA8mvrtcpWcZeBLHyIBE5W2E8nHGxOk2HglKNVVPscC4UL2
 J2NA==
X-Gm-Message-State: AGRZ1gLHIHduBel1+PPsu0dH9AnR8JvkpL9u7L0uk5Qx1OmEcbOOepyt
 QDCiHfxUFydJxQ9tJTHXKk1ljeBCUGVCe6JMcdpu/+aU
X-Google-Smtp-Source: AJdET5cuIxh+OmOiyzDOQMXwjVSfnV5tk3j4LCb1IV92J28QxlKgOTzJwtZN3fxofTpxbnPpCvO+tURThs8Bg8qe0/w=
X-Received: by 2002:a19:a086:: with SMTP id j128mr7758239lfe.93.1542512768791; 
 Sat, 17 Nov 2018 19:46:08 -0800 (PST)
MIME-Version: 1.0
From: Kirill K <kovalev.kirill.a@gmail.com>
Date: Sun, 18 Nov 2018 06:45:57 +0300
Message-ID: <CAAWPTbOG8=XEwB-rCs9i2JYuMoJM-J_5RR4U2S_W4F+4katc_g@mail.gmail.com>
Subject: Docker Swarm over WireGuard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 19 Nov 2018 20:01:18 +0100
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
Content-Type: multipart/mixed; boundary="===============7182670195562656354=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7182670195562656354==
Content-Type: multipart/alternative; boundary="000000000000a538a5057ae83d4e"

--000000000000a538a5057ae83d4e
Content-Type: text/plain; charset="UTF-8"

Hello there!

I'm using WireGuard about a year and really happy with it. It's
easy-to-use, fast and stable. Great thanks for this precious software.

Sometimes I use servers from providers which do not have any internal
network. So I tried to setup Docker Swarm and route it's ingress network
over WireGuard. For some reason it's not working: internal load balancer
fails to access containers from other nodes. So it's impossible to reach
containers from other nodes, load balancing/routing mesh becomes completely
broken.

Setup is pretty basic and everything works like a charm but this particular
feature. I also found few related questions, so there are number of people
interested in fixing this:
https://stackoverflow.com/questions/52409012/docker-swarm-mode-routing-mesh-not-working-with-wireguard-vpn
https://github.com/moby/moby/issues/37985
https://github.com/moby/moby/issues/36689 (that's my issue, more details
here)

Of course, I do understand that this could be Docker-specific issue, so I'm
just asking here for some directions:

- Does someone succeeded at enchancing Docker Swarm with WireGuard?
- My it be netns-related thing? Should we place Docker ingress network and
wg0 interface into same namespace?

Any help appreciated.

-- 
Best regards,
Kirill Kovalev

--000000000000a538a5057ae83d4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello there!</div><div><br></div><di=
v>I&#39;m using WireGuard about a year and really happy with it. It&#39;s e=
asy-to-use, fast and stable. Great thanks for this precious software.</div>=
<div><br></div><div>Sometimes I use servers from providers which do not hav=
e any internal network. So I tried to setup Docker Swarm and route it&#39;s=
 ingress network over WireGuard. For some reason it&#39;s not working: inte=
rnal load balancer fails to access containers from other nodes. So it&#39;s=
 impossible to reach containers from other nodes, load balancing/routing me=
sh becomes completely broken.</div><div><br></div><div>Setup is pretty basi=
c and everything works like a charm but this particular feature. I also fou=
nd few related questions, so there are number of people interested in fixin=
g this:</div><div><a href=3D"https://stackoverflow.com/questions/52409012/d=
ocker-swarm-mode-routing-mesh-not-working-with-wireguard-vpn">https://stack=
overflow.com/questions/52409012/docker-swarm-mode-routing-mesh-not-working-=
with-wireguard-vpn</a></div><div><a href=3D"https://github.com/moby/moby/is=
sues/37985">https://github.com/moby/moby/issues/37985</a></div><div><a href=
=3D"https://github.com/moby/moby/issues/36689">https://github.com/moby/moby=
/issues/36689</a> (that&#39;s my issue, more details here)</div><div><br></=
div><div>Of course, I do understand that this could be Docker-specific issu=
e, so I&#39;m just asking here for some directions:</div><div><br></div><di=
v>- Does someone succeeded at enchancing Docker Swarm with WireGuard?</div>=
<div>- My it be netns-related thing? Should we place Docker ingress network=
 and wg0 interface into same namespace?</div><div><br></div><div>Any help a=
ppreciated.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_sign=
ature"><div dir=3D"ltr"><div>Best regards,<br>Kirill Kovalev</div></div></d=
iv></div></div>

--000000000000a538a5057ae83d4e--

--===============7182670195562656354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7182670195562656354==--
