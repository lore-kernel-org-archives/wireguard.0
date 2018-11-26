Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B710C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DC6220657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:36:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mysterium-network.20150623.gappssmtp.com header.i=@mysterium-network.20150623.gappssmtp.com header.b="NoknePF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DC6220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mysterium.network
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 943be42a;
	Wed, 16 Jan 2019 16:32:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0817bca5
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Nov 2018 12:29:18 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85c9e2b2
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Nov 2018 12:29:18 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id m19so13782806ioh.3
 for <wireguard@lists.zx2c4.com>; Mon, 26 Nov 2018 04:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mysterium-network.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=R8JrF+TizKVP9DpF5NcxTuf2FbbkrcCEhQwSlwar5PQ=;
 b=NoknePF18L6S55r3x+xbE+EcY2PPNmHCfQ/h1WgKXS95zupmSjS+cdEGLp2hBVglJh
 5rSBYl9mamsBmLzdf5n5unxthvDSitG6heiQIy9B7xgbysD8RU+k6YCTT0ZDq1EIGPcg
 E0mBGwpBTYLSQYmDQIY8iLZdAdoRcOyQVtOQGuym/aCUVBt1ZbUMN/+SuNlOrNtPRrPD
 GG0lqJtam5nB7NOO0GcpaMBerR4NjY3DsJxd1CrSCntYFrvjsnpAnRbZDHD6hzshvSfl
 AWPf40ret27l1C7x6qKfopWPnhlfksKIpwtbe/hiyDaC6ZU2WLXM+LWXvs/HR8fSQVq8
 2rDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=R8JrF+TizKVP9DpF5NcxTuf2FbbkrcCEhQwSlwar5PQ=;
 b=UYjooFmDrO2wHokWSiHiTgPOU3vH4KfFm4uBOo80nFsYHbiISoX8lvcH8k7/zukM8C
 oGCf4iPmAqn81quKYiULB1jq0J1Rfl5IuyFlMXB8vWUJR5ffKVAKZqmddOf+DX2cFmQ0
 0F07to65xij/LdDzO1nX+UtKZS47N06RnpZfrQPwAsey8XApMKs8F/Slqs6AtukAJYm+
 0jeYdn8LonxP16sPyjuDRu+DZNc6oKOz5d5R69Rifvo2TUAkhHyqw9+37KfqzTZU3BBE
 uWG2F/y6MvxlDUV2GMlPPDygtbob43wjU+cneFSjKCBFU2VQVNOlcMJZTqPrua3zmlbC
 yS/g==
X-Gm-Message-State: AA+aEWbP794Ps9Cz4BWgeCUqkq66d2vhC90bTfquJ9OveUW7atZm2Ss+
 PSV8zcuO6bk5le7QXAONZCdNSZImWowSTuCDS8VuCQjnFeoF6g==
X-Google-Smtp-Source: AFSGD/UM5zcJxC2IiU9y/tJU8gFX7F+t8FQIHcK//2c/Ql6ZLDIMClHTyH6Y3+VjjU1ByFHEpTph0pj3Qx+GebrjZ68=
X-Received: by 2002:a5e:940c:: with SMTP id q12mr18653294ioj.228.1543235770449; 
 Mon, 26 Nov 2018 04:36:10 -0800 (PST)
MIME-Version: 1.0
From: Antanas Masevicius <antanas@mysterium.network>
Date: Mon, 26 Nov 2018 14:35:59 +0200
Message-ID: <CAMqxwLhT48GqCbLwNdBOpg0+BCVwoP4kHjqczZ6o9j3Jui5fyA@mail.gmail.com>
Subject: wireguard-go as a library
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 16 Jan 2019 17:32:07 +0100
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
Content-Type: multipart/mixed; boundary="===============4161556532575939564=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4161556532575939564==
Content-Type: multipart/alternative; boundary="000000000000e71aeb057b909322"

--000000000000e71aeb057b909322
Content-Type: text/plain; charset="UTF-8"

Hello,

I am from Mysterium Network project team. We are open source dVPN project.
Currently we use OpenVPN as our VPN transport, but started works to
integrate WG too. Since we try to support all major OSes we would like to
use wireguard-go for win, ios, darwin and android.

Currently this project does not fit to be used as a library. We would like
to contribute to this project, making it a bit more friendly to be used as
a library. Would you accept such contributions or it is meant to be as a
standalone binary type project?

Is there any contribution guidelines for such improvements? Would it be ok
if we would make a pull request in a github? This way all details regarding
proposed code could be worked out.

best regards,

Antanas
Mysterium Network

--000000000000e71aeb057b909322
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,=C2=A0<div><br></div><div>I am from Mysterium Networ=
k project team. We are open source dVPN project. Currently we use OpenVPN a=
s our VPN transport, but started works to integrate WG too. Since we try to=
 support all major OSes we would like to use wireguard-go for win, ios, dar=
win and android.</div><div><br></div><div>Currently this project does not f=
it to be used as a library. We would like to contribute to this project, ma=
king it a bit more friendly to be used as a library. Would you accept such =
contributions or it is meant to be as a standalone binary type project?=C2=
=A0</div><div><br></div><div>Is there any contribution guidelines for such =
improvements? Would it be ok if we would make a pull request in a github? T=
his way all details regarding proposed code could be worked out.</div><div>=
<br></div><div>best regards,</div><div><br></div><div>Antanas</div><div>Mys=
terium Network</div></div>

--000000000000e71aeb057b909322--

--===============4161556532575939564==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4161556532575939564==--
