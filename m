Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1447C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:53:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0886A20709
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 01:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="H1iOx8Tf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0886A20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cfe7ddf6;
	Thu, 21 May 2020 01:38:42 +0000 (UTC)
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b770f905
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 May 2020 17:31:12 +0000 (UTC)
Date: Tue, 19 May 2020 17:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1589910334;
 bh=zR2+imR3YODh+Odi+ZIg0yse5IcgAbsPndC5gHc/9Gs=;
 h=Date:To:From:Reply-To:Subject:From;
 b=H1iOx8TfVdlsufDdxl422qIZCiHiXc/56a3i4lxWbz5ZmekuOENjii1zt8Csnu3oC
 ucxZSn1GqiDC/izpmWg00dLJDMsSbDi1VMDhOziLASRoNhL+jNS/Kc60+DDW2OuMrx
 pYVUEzsKrxJ0ip/wznnNQMMQzUxaqoKecoUA55cU=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: "-.-" <alias84@protonmail.com>
Subject: Wireguard to route server traffic on same machine
Message-ID: <Q2IXfYGQfHXsOOP3PhQHnbhg-d6qZS0tVCOMjNsmLL7u3hOiNCQsRs2Tbhve0PhhgNWmKJK6lbSQ6V0Hqn0zMg7DbYLewOtv3cM6Ft4Enlk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 21 May 2020 03:38:39 +0200
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
Reply-To: "-.-" <alias84@protonmail.com>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Dear all,

I am trying to configure WG to run in a docker, maybe through portainer to =
route all the traffic of a nextcloud server on the same machine (raspberry =
pi 4).

I have managed to have the sever, the containers with WG running (?) on it.=
 Can i ask you support on the .yaml config (server or client) and the confi=
g of WG per se?

script.yaml used:

version: "2.1"

services:

wireguard:

image: linuxserver/wireguard

container_name: wireguard

cap_add:

- NET_ADMIN

- SYS_MODULE

environment:

- PUID=3D1000(pi)

- PGID=3D1000(pi)

- SERVERURL=3D   "Address of my server, the same of raspberry"

- SERVERPORT=3D51820

- PEERS=3D1

- PEERDNS=3D[ ]"Address of my server, the same of raspberry"

volumes:

- /path/to/appdata/config:/config

- /lib/modules:/lib/modules

ports:

- 51820:51820/udp

sysctls:

- net.ipv4.conf.all.src_valid_mark=3D1

restart: unless-stopped

thanks in advance,
sincerily.

