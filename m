Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16203C2BD09
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Jul 2024 09:52:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 336f416b;
	Tue, 9 Jul 2024 09:51:56 +0000 (UTC)
Received: from iedub0.y7.hu (iedub0.y7.hu [2a05:d018:563:7900::25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b99662a5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jul 2024 09:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=wg-ml-rkaofgr.redir.email; s=may2017; h=Message-ID:Content-Type:
 MIME-Version:Subject:To:From:Date:List-Unsubscribe;
 bh=iDMNDs1K3Kzc6ymI9sq4OhMiPh2UTtaqtHsl87OIpXw=; b=Fz/psihKzZUUoB3GcE3REyA15c
 vYGeTbGblRxtRm/HLhi0IEnU42gxw5B7rn3ggvG066rzrvfBO86ceJm0wNtp99LQBjCEO75fG5Wkw
 M9RUshDiBidLGIboY6s2j1/QD6Clwgiq+VQWSnHaNzk76/Exoizx3VyVV/XcjWSrydN6DPWse9x5Y
 rjt9TLdzO3JAhJlRGOU7AleSMeWX6sg7zb+MPQuO7oRqkAB82elz20O8PwqYTDaPTSuLWhD/wn6ej
 IO+uZNUu/7SWbCdsWnQgFeAzpCmCmsjt6yHAncQiYXdthLNAwiAm3zgm3M28kaGfv8Od+aeEJWyY9
 zVRlG+sQ==;
Received: from localhost ([::1]) helo=localhost by localhost with ESMTPSA 
 id c0b24e8e56a672859849ebdd1563ba38 for wireguard@lists.zx2c4.com;
 Tue, 09 Jul 2024 09:51:52 +0000
Date: Tue, 9 Jul 2024 09:51:51 +0000
From: Endre Szabo <endre.szabo@wg-ml-rkaofgr.redir.email>
To: wireguard@lists.zx2c4.com
Subject: Re: disable roaming?
References: <5f5fe5f9-fa9d-4d11-a33f-9d7e326823f5@heinlein-support.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5f5fe5f9-fa9d-4d11-a33f-9d7e326823f5@heinlein-support.de>
Message-ID: <b0c372e700d94979c6f6fd600e12a197@wg-ml-rkaofgr.redir.email>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Sounds like these routers are multihomed, so it might be a perfect fit for =
use of a routing protocol.

On Tue, Jul 09, 2024 at 10:23:10+0200, Robert Sander wrote:
> Hi,
>=20
> I want to setup a wg tunnel between an office and a pair of routers which
> use keepalived for a service IP.
>=20
> The office router would have the service IP in its config.
>=20
> As soon as the IP failover happens between the two routers the office rou=
ter
> gets a new peer address for its connection (which is not reachable).
>=20
> How do I disable the wireguard roaming on the server side?
>=20
> Wireguard on the office router should always connect to the service IP.
> Both routers have the same private/public key so that should be possible.
>=20
> Regards
> --=20
> Robert Sander
> Heinlein Consulting GmbH
> Schwedter Str. 8/9b, 10119 Berlin
>=20
> https://www.heinlein-support.de
>=20
> Tel: 030 / 405051-43
> Fax: 030 / 405051-19
>=20
> Amtsgericht Berlin-Charlottenburg - HRB 220009 B
> Gesch=C3=A4ftsf=C3=BChrer: Peer Heinlein - Sitz: Berlin
