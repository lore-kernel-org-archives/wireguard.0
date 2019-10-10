Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AD23FA372B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021B520659
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjElVYAw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021B520659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4319637e;
	Wed, 16 Oct 2019 20:15:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23aa8333
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Oct 2019 13:01:35 +0000 (UTC)
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb4210dd
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Oct 2019 13:01:35 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id u8so13428027iom.5
 for <wireguard@lists.zx2c4.com>; Thu, 10 Oct 2019 06:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:subject:message-id:date:to;
 bh=nm9LNgBBuXojIy1NVP96LcQCR5NI1SG773nv3uXc6Sc=;
 b=KjElVYAw56ic4QzmTKmW0r/XUs+qybo+n2LaM8X1yPq8cVpvdBqCLLR+SFVwumtCms
 cwCatpZpuH6iAaooOy50MbNBO1O/U0LBLc/Jzmixlfr4zEk9YEtanLPbsD4FGgMC459P
 s5PaTOyuKDIC5iTYTvuOFzCyDhN9nKLxzEOFnUHALa2aSKrIQ4rZI6MchOXRaXhqyO4b
 7QTGyuWIJu3NhYzec8OVXR+hJDWBsaOOyOsM+McFdyoGIAKm+YjD2jLxcHHDCi1Z2FfN
 Kw8MdxVBLY/feHcB/FqJL3HQP1Q4MNCjo6CSfYHNZtRZQ51Wc6gh54Lw4mljuz+5DMRz
 EZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=nm9LNgBBuXojIy1NVP96LcQCR5NI1SG773nv3uXc6Sc=;
 b=t/nddMQEt0PKtZ/39VC8e5BV8roelxXp4uJ4Lj1IXn+YD533GZTYc9J6YVGi3KQ+sv
 y2Yj9B3lMDAabDLVRugvc6r1+EcXDZaQrmeyx0E8pA4nvm3BaKswhfCGfH8qquWzjgUT
 fNpFyYZGAgbd08Lp+OvuU0d4jv060tb8KUqidOCeMukN9OMChDUUIonxfy+p14p0RZWn
 hEJHdfIeoygoRd5rdcVcxrHeVPzqUHS/8kO+gZ3O48oPyUpUoaIWI90psR3ZDl6ojapF
 VJjsIHAkdF2HK9zAl5apXSGvuEonQqhZHGtor+/dQ65gFBVt5PR+hm3ohWxJUqmnvIv2
 mojA==
X-Gm-Message-State: APjAAAWMpVs0H+7OdYnojfypIgU6glnTY3wncBsJb4cRLyJC8qTGMVWN
 2tV0FR9FVuROptkJLmtHFpIRuvtr
X-Google-Smtp-Source: APXvYqx0WmIy2S83EkPGxQ6+k9Ukki3mfix1or7HkGPInAuuTNNqaD7pp2FbsgvBIv72+e1/AoiFoA==
X-Received: by 2002:a02:a90b:: with SMTP id n11mr10357961jam.13.1570712493901; 
 Thu, 10 Oct 2019 06:01:33 -0700 (PDT)
Received: from [10.2.1.78] (c-68-32-4-44.hsd1.mi.comcast.net. [68.32.4.44])
 by smtp.gmail.com with ESMTPSA id t4sm1202330iln.82.2019.10.10.06.01.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:01:32 -0700 (PDT)
From: Chris Gaffney <gaffneyc@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Wireguard on MacOS Catalina randomly deletes config
Message-Id: <761368C4-83F7-41E0-85BD-EDFC51D3F3A0@gmail.com>
Date: Thu, 10 Oct 2019 09:01:32 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3594.4.19)
X-Mailman-Approved-At: Wed, 16 Oct 2019 22:15:27 +0200
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
Content-Type: multipart/mixed; boundary="===============2820795407888704201=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============2820795407888704201==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EBE463B3-23A0-4C57-AF09-0901CC2F88BC"


--Apple-Mail=_EBE463B3-23A0-4C57-AF09-0901CC2F88BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

Version: MacOS App Store 0.0.20190610 (13)
Go Version: 0.0.20190517

I=E2=80=99ve been using Wireguard on MacOS for the last couple of months =
without issue. Two days ago I upgraded to MacOS 10.15 Catalina and =
everything had been working fine up until this morning when Wireguard =
randomly deleted its configuration.

I had connected to my Wireguard server and had an ssh session going over =
the tunnel when my connection stopped working. Checking Wireguard showed =
that the tunnel I had been using was no longer listed in the tunnel =
manager. I tried restating Wireguard but the configuration didn=E2=80=99t =
come back and had to be recreated.

Logs: https://gist.github.com/gaffneyc/624ea733e1cfa42adabfa2fcbecaf1c8

- Chris Gaffney
@gaffneyc


--Apple-Mail=_EBE463B3-23A0-4C57-AF09-0901CC2F88BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi,<div class=3D""><br class=3D""></div><div =
class=3D"">Version: MacOS App Store 0.0.20190610 (13)</div><div =
class=3D"">Go Version:&nbsp;0.0.20190517</div><div class=3D""><br =
class=3D""></div><div class=3D"">I=E2=80=99ve been using Wireguard on =
MacOS for the last couple of months without issue. Two days ago I =
upgraded to MacOS 10.15 Catalina and everything had been working fine up =
until this morning when Wireguard randomly deleted its =
configuration.</div><div class=3D""><br class=3D""></div><div class=3D"">I=
 had connected to my Wireguard server and had an ssh session going over =
the tunnel when my connection stopped working. Checking Wireguard showed =
that the tunnel I had been using was no longer listed in the tunnel =
manager. I tried restating Wireguard but the configuration didn=E2=80=99t =
come back and had to be recreated.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Logs:&nbsp;<a =
href=3D"https://gist.github.com/gaffneyc/624ea733e1cfa42adabfa2fcbecaf1c8"=
 =
class=3D"">https://gist.github.com/gaffneyc/624ea733e1cfa42adabfa2fcbecaf1=
c8</a></div><div class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px;" =
class=3D""><br class=3D"Apple-interchange-newline">- Chris =
Gaffney</div><div style=3D"color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;" class=3D"">@gaffneyc</div>

</div>

<br class=3D""></div></body></html>=

--Apple-Mail=_EBE463B3-23A0-4C57-AF09-0901CC2F88BC--

--===============2820795407888704201==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2820795407888704201==--
