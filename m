Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,HTML_OBFUSCATE_05_10,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9149C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:14:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F3182081B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=farmwald-com.20150623.gappssmtp.com header.i=@farmwald-com.20150623.gappssmtp.com header.b="ijiyK69z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F3182081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=farmwald.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec61f8ed;
	Sun, 4 Nov 2018 17:09:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbacd54a
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Oct 2018 17:46:11 +0000 (UTC)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 442bea1b
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Oct 2018 17:46:11 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id k132-v6so5417732ybc.2
 for <wireguard@lists.zx2c4.com>; Tue, 30 Oct 2018 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=farmwald-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=FC2EfPN89rkN6g3SOwvGCbg8MKHuELGvikbPAgHDKnU=;
 b=ijiyK69zLDwdEtc8x3Us7y8ayyF8cKn5vLcwQV5sVBB+ZRmqW21cCEhUk6OA0/wcwQ
 6Fjiec5JoBoeFTr00cyd+MjJ0cnFZB3Ox0YVV7OIcrhGxLTCH76v2RPkA+2TnRUIMRPR
 p8X6xZx6vaVp/fmeYcUaD9cbXbXlV4v5oJmwo2SlUkmrX3Sf18hQIIyYKruF0SJqsI/q
 rAIlfsqIO58hMbeQGjPZC3fO6m9U00UmbCUinlMdnr3GpLL1z4kaHtw8l2h6ktghJN86
 xbF/1fuoi7h6BikQ0vPPxvDjr9bqTC3vUHSzzvyANtzPHU7iGnEzttw23U7FywHyKqLJ
 Uz6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FC2EfPN89rkN6g3SOwvGCbg8MKHuELGvikbPAgHDKnU=;
 b=jFIKM3SJ8WYFrLmB6imnD+RfFQoNJyuDU6ndQFaKxMoN5/RkLcgj7gVwo3dZvmOXqC
 bg9oF0jSrlsVnPZpSRS5Fu3hwvtj3PVP+YcpYh8+w7H19tn7KD/fmmzfM/kyscG9Boru
 CqF6r+uZEkuWFBcp8mNTbhT7EOvM+i4TqqUC6SWcI/9U9B3vL6D/AX/Zb2RhiRL2cF73
 VJuH2o8QlmnZlHItXEKDnJTln7rVDs6kTLfo/SPKIszhBB7a4zw4cps75tw0v99Y6wgt
 RjaSTAUwefyL216ZKS7VjhY9GnmlZ0YI5lk1YyYl/FYtHYmCJpi7r9EtJKgD70zc0hLC
 YdEA==
X-Gm-Message-State: AGRZ1gJDSzl2DBD85YuBNhHTi/cYABHNGJRDihcWq+A7BHwYfNfYhR0o
 8irQS575KUgOP6jsZV5OBm7bPHi8p//AhZKfgHCb4Sjr12htFg==
X-Google-Smtp-Source: AJdET5csipPOjlFFveQcpco9nlYBg+3mMy9aQRdOE8UqgXkrX9kGpZ6AfERRsQXhIkc5NFTFMdgI+Iqlj9XNQ2GuYBY=
X-Received: by 2002:a25:ac50:: with SMTP id
 r16-v6mr18915091ybd.73.1540921780826; 
 Tue, 30 Oct 2018 10:49:40 -0700 (PDT)
MIME-Version: 1.0
From: "mike@farmwald.com" <mike@farmwald.com>
Date: Tue, 30 Oct 2018 10:49:30 -0700
Message-ID: <CAC35giupDN6M2hhj_kgpwSX4zO3OMWdC+XZzKqJCkkKJCdrwzw@mail.gmail.com>
Subject: Could there be an error message on lack of entropy?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:09:58 +0100
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
Content-Type: multipart/mixed; boundary="===============6726690930900675229=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6726690930900675229==
Content-Type: multipart/alternative; boundary="0000000000005f8b3c057975cf2f"

--0000000000005f8b3c057975cf2f
Content-Type: text/plain; charset="UTF-8"

I've been trying to use wireguard on OpenWRT (using a Turris Omnia without
wireless.)

The wg interface would not send packets, but there was no indication of
why. I've been trying to debug this (intermittently) since May. Someone on
the OpenWRT mailing list today suggested that a lack of entropy might be
the problem. Adding "haveged " fixed the problem and the interface now
seems to work just fine.

It would be *very* helpful if wireguard reported in the system log that it
can't come up due to a lack of entropy.

Thanks.
Mike

--0000000000005f8b3c057975cf2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve been trying to use wireguard=C2=A0on OpenWRT (usi=
ng a Turris Omnia without wireless.)<div><br></div><div>The wg=C2=A0interfa=
ce would not send packets, but there was no indication of why. I&#39;ve bee=
n trying to debug this (intermittently) since May. Someone on the OpenWRT m=
ailing list today suggested that a lack of entropy might be the problem. Ad=
ding &quot;<span style=3D"font-family:Helvetica,Arial,sans-serif;font-size:=
14px">haveged</span><span style=3D"font-family:Helvetica,Arial,sans-serif;f=
ont-size:14px">=C2=A0&quot; fixed the problem and the interface now seems t=
o work just fine.</span></div><div><span style=3D"font-family:Helvetica,Ari=
al,sans-serif;font-size:14px"><br></span></div><div><span style=3D"font-fam=
ily:Helvetica,Arial,sans-serif;font-size:14px">It would be *very* helpful i=
f wireguard=C2=A0reported</span><span style=3D"font-family:Helvetica,Arial,=
sans-serif;font-size:14px">=C2=A0</span><span style=3D"font-family:Helvetic=
a,Arial,sans-serif;font-size:14px">in the system log</span><span style=3D"f=
ont-family:Helvetica,Arial,sans-serif;font-size:14px">=C2=A0that it can&#39=
;t come up due to a lack of entropy.</span></div><div><span style=3D"font-f=
amily:Helvetica,Arial,sans-serif;font-size:14px"><br></span></div><div><spa=
n style=3D"font-family:Helvetica,Arial,sans-serif;font-size:14px">Thanks.</=
span></div><div><span style=3D"font-family:Helvetica,Arial,sans-serif;font-=
size:14px">Mike</span></div><div><span style=3D"font-family:Helvetica,Arial=
,sans-serif;font-size:14px"><br></span></div></div>

--0000000000005f8b3c057975cf2f--

--===============6726690930900675229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6726690930900675229==--
