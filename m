Return-Path: <SRS0=0UwN=4E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36844C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 12:59:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 871F22084E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 12:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rvImUtlU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 871F22084E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad654411;
	Sun, 16 Feb 2020 12:57:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80234c30
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 12:57:03 +0000 (UTC)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5212a481
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 12:57:03 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id b79so8659670vsd.9
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=oaJGQS+h7DVzGgehCnfQvBZ7c+DyvOPrP85cv5H7gpw=;
 b=rvImUtlUZA5s2r7Pd5oAa9lo2mCyQV+ua3bswlSN9X561wRrVMO6AT1vS1a78xFsHq
 Qpd+5rV8g44I4bOyhNJkHjOEUJQVWUgFwHU/UTjnjtPOny0hLP65Dc15ncXCOPuQ6cC4
 3PEwTa5xUDNi6eOx/awy4qiSpbGwTgoHpIbrg/EynXqnLAA3RNXAK7zbrIfjNazMMgyd
 8NUxJDiz2e8eW4Y/Ply8tfchke3SExmYwzbvQmfR40oxDAvd6yyymvA49B1l8n8BTmdq
 4y39pLnAHB+/KggyKCwba1UCLfTqtTnWNPKcTks8LmzBY8WpOheI/v8o9FcqaLC4/7pj
 USbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=oaJGQS+h7DVzGgehCnfQvBZ7c+DyvOPrP85cv5H7gpw=;
 b=DSl1rHzHCMlRi5I4aJCQcj32rZ8ZzS9aBTvLgqDzhCOkY0jQXgMbuoIpC/ccKbK75p
 xvIRkzAGqKv6IMPvD955hlnIvESgg1GKar9PEnwQgYRtsO6pGMQebq5SZADnNtXlWmVK
 kYY5TJY+Rh2EZKnD3ASLTtwreEcX3PszAiClvKGAjexURbOtky8eh5im7c94B+WwusCL
 a9Q2nYG9K7uKGgoheJX+ucq4XS8L3cq2YPgNyfXnrj1BcqTy4rJe7o29oQ8zzw+1fRA6
 4MBVO8ifDJJP5VSb6vhR0qsCadc2GvkBUDj3D2b64Weu1bIPjUE/FTXP6/JE92ghxYr7
 fmow==
X-Gm-Message-State: APjAAAV8tUZ/fXiISlsoHlw4YFS78vNyx0+hP8jLaAYKmfgPs7pcwhXy
 St9X0XiU9v0a+vAWxcFGpOATtIqx5Ykgxf77l69qjThbETQ=
X-Google-Smtp-Source: APXvYqxVTH6yQCg1/OQRmnkFl/uR5L+1Oh9tGbuS61sAJFWp4zylqTKdCESIKXdTunL3aZG4ChABsw21uWD1PaPappM=
X-Received: by 2002:a67:ee46:: with SMTP id g6mr5709505vsp.153.1581857964139; 
 Sun, 16 Feb 2020 04:59:24 -0800 (PST)
MIME-Version: 1.0
From: Neal Becker <ndbecker2@gmail.com>
Date: Sun, 16 Feb 2020 07:58:48 -0500
Message-ID: <CAG3t+pEeJ_+AUUoA3NvpKPhtp_-G78DJTS3PGZyRHigMCSHyww@mail.gmail.com>
Subject: wireguard slow pings
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7216900343594366518=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7216900343594366518==
Content-Type: multipart/alternative; boundary="00000000000009b259059eb1027e"

--00000000000009b259059eb1027e
Content-Type: text/plain; charset="UTF-8"

I'm testing wireguard
wireguard-0.0.20191219-2.fc31.x86_64
between a Fedora 31 client and server, comparing to openvpn.

Openvpn is running between a linux client outside my lan and a server on my
router, which is running dd-wrt.
I'm pinging between that linux client and another linux client within my
lan.

wireguard is running between the same linux client outside my lan and the
same other linux client within my lan.  This
time router is simply forwarding packets via NAT.

Openvpn ping times are much lower (about 10ms) and much lower variance than
wireguard.  Wireguard pings
are all over the place.

Packets coming in from the WAN are traversing some firewall that I don't
control, which may be affecting results.  Openvpn
is config to use udp.

Any ideas?

Thanks,
Neal

-- 
*Those who don't understand recursion are doomed to repeat it*

--00000000000009b259059eb1027e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m testing wireguard<div>wireguard-0.0.20191219-2.fc3=
1.x86_64=C2=A0</div><div>between a Fedora 31 client and server, comparing t=
o openvpn.</div><div><br></div><div>Openvpn is running between a linux clie=
nt outside my lan and a server on my router, which is running dd-wrt.</div>=
<div>I&#39;m pinging between that linux client and another linux client wit=
hin my lan.</div><div><br></div><div>wireguard is running between the same =
linux client outside my lan and the same other linux client within my lan.=
=C2=A0 This</div><div>time router is simply forwarding packets via NAT.</di=
v><div><br></div><div>Openvpn ping times are much lower (about 10ms) and mu=
ch lower variance than wireguard.=C2=A0 Wireguard pings</div><div>are all o=
ver the place.</div><div><br></div><div>Packets coming in from the WAN are =
traversing some firewall that I don&#39;t control, which may be affecting r=
esults.=C2=A0 Openvpn</div><div>is config to use udp.</div><div><br></div><=
div>Any ideas?</div><div><br></div><div>Thanks,</div><div>Neal<br clear=3D"=
all"><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-=
smartmail=3D"gmail_signature"><div dir=3D"ltr"><i>Those who don&#39;t under=
stand recursion are doomed to repeat it</i></div></div></div></div>

--00000000000009b259059eb1027e--

--===============7216900343594366518==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7216900343594366518==--
