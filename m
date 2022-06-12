Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B760CC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 11:39:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c2ce04d4;
	Fri, 17 Jun 2022 11:39:51 +0000 (UTC)
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b341a83f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Jun 2022 21:34:14 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4LLnyX5fFHz9s4M
 for <wireguard@lists.zx2c4.com>; Sun, 12 Jun 2022 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1655069652; bh=acr+0KtLpeZnAdK181NS6Fb5BDxK52F2pYDDgGkWQak=;
 h=From:To:Subject:Date:Reply-To:From;
 b=tQ6REXYbnHuy1v+r8jZEbKJF/7yIaa02JSQQPVS6F89pjnK1lKd+50la9kwlz2/4S
 ov8dmD/A/dvxuRlO1oyU/R0FYCKRfT1X1Pk+fOhV4ttBduNEg2LAsOE3MI84DO9KjT
 VeUyXnC2mg7jJ4asZ/K7rbHo9RYXrKTQUiOZhmSg=
X-Riseup-User-ID: 3073ACBB20DE7EEF8DF8798A91EC627BF88BFDBEBA4C431020CFCF4A10A14825
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4LLnyW4bzrz5w35
 for <wireguard@lists.zx2c4.com>; Sun, 12 Jun 2022 21:34:11 +0000 (UTC)
From: enlight <enlight@riseup.net>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: [question] wireguard-windows wfp issue
Date: Sun, 12 Jun 2022 21:34:08 +0000
Message-Id: <em1e5036cb-2ace-44db-80c1-23772d981c13@8507782e.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 17 Jun 2022 11:39:46 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Reply-To: enlight <enlight@riseup.net>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

when enabling wireguard kill-switch, it creates aggressive wireguard=20
firewall rule on windows, it creates rule on windows filtering platform=20
(WFP).  The rule is to block all inbound/outbound traffic not for or=20
from wireguard interface.

i want to modify current wireguard wfp rule to premit inbound/outbout=20
traffic to additional interfaces,  like vmware interface. There are=20
several network interfaces in my system active, like "Yggdrasil" ->=20
adapter name in Network and sharing center (it uses wintun driver to=20
create).

I tried to modify "wireguard-windows/tunnel/firewall/blocker.go"  inside=20
EnableFirewall( ) to add:
```
var adapter *driver.Adapter
var luid2 winipcfg.LUID

adapter, err =3D driver.OpenAdapter("Yggdrasil")  -> gives error here
luid2 =3D adapter.LUID()
err =3D permitTunInterface(session, baseObjects, 12, uint64(luid2))
```

the error is: ```Failed to find matching adapter name: Element not=20
found. (Code 0x00000490)
Unable to enable firewall rules: Firewall error at=20
golang.zx2c4.com/wireguard/windows/tunnel/firewall/blocker.go:148:=20
Element not found.```

how can i solve the issue ?

