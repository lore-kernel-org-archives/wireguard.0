Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58EEC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:18:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDA7861107
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDA7861107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eaa5a65f;
	Fri, 24 Sep 2021 20:18:55 +0000 (UTC)
Received: from w1.tutanota.de (w1.tutanota.de [81.3.6.162])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dbd7c2dd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 10:23:16 +0000 (UTC)
Received: from w3.tutanota.de (unknown [192.168.1.164])
 by w1.tutanota.de (Postfix) with ESMTP id 8EE1FFA0D4E
 for <wireguard@lists.zx2c4.com>; Fri, 24 Sep 2021 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1632478996; 
 s=s1; d=tuta.io;
 h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
 bh=nEQIG9WaRHH/siTjfciafsD3SFb2OP1yPOCehjCnxmc=;
 b=jBX/EiWia8QLInTRvqjRyZ2Oj8j/h4hdrcvKXsbQb3x2ea+CEZ9tRCeAscBT5Ryn
 Z/IKJChm4pL3Acd9KBAIPviJ1jVXtzFL0PvKj8+BTHi4zixAoX3+gAelmyZsbHlWJmR
 JLOxPOkgaF4XKeeeDK6k4KPqji/C1f4GT5oirEUnxVu7n48QggCSvGvj5fwZ9RH8IAe
 3/ll+aO91lvjWBEOYijaolfYz/nWSUy5fDWB3LG5rh5VtqWoR0+X/FQv66PcKbKAmN9
 xxkuzDka7DG4LQZvV0od7sy+NES+QILfZQda0ufb+vYXFmzAo73bO0cJLJ87wkaeJ8p
 3e1pAU9X8Q==
Date: Fri, 24 Sep 2021 12:23:16 +0200 (CEST)
From: nekochan@tuta.io
To: wireguard@lists.zx2c4.com
Message-ID: <MkMK9M9--3-2@tuta.io>
In-Reply-To: <EBVVZQ.U9BF94AEV1NE@dumke.me>
References: <EBVVZQ.U9BF94AEV1NE@dumke.me>
Subject: Re: Wireguard massive amount data
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 24 Sep 2021 20:18:51 +0000
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

This is sending telemetry to Fedora.


Sep 23, 2021, 13:47 by daniel@dumke.me:

> Hi,
>
> I am trying to connect to a Mullvad Wireguard Host with my Fedora Linux using nmcli, as soon as I up the connection (nmcli con up Mullvad) massive amounts of data are sent through the tunnel (according to wg 1.4 GiB in the first 20 secs).
>
> Any hints on why this huge amount of data is transfered?
>
> Daniel
>
> '''
> root@lenovo# wg
> interface: wg1
>  public key: zr0q0pxcOfSoiKWjXEfuHqM58GMjE4HBLr8FzQIHYxM=
>  private key: (hidden)
>  listening port: 40360
>  fwmark: 0xcbdf
>
> peer: C2TUHPoZlT08iceLM2coBDTbcfg9tTKrUt7tRBWP0nk=
>  endpoint: 45.8.223.195:51820
>  allowed ips: 0.0.0.0/0, ::/0
>  latest handshake: 20 seconds ago
>  transfer: 4.23 KiB received, 1.39 GiB sent
>  persistent keepalive: every 33 seconds
>
>
> root@lenovo# route
> Kernel IP Routentabelle
> Ziel            Router          Genmask         Flags Metric Ref    Use Iface
> default         _gateway        0.0.0.0         UG    50     0        0 wg1
> default         _gateway        0.0.0.0         UG    600    0        0 wlp0s12f0
> _gateway        0.0.0.0         255.255.255.255 UH    20050  0        0 wg1
> 10.0.2.0        0.0.0.0         255.255.255.0   U     600    0        0 wlp0s12f0
> 192.168.122.0   0.0.0.0         255.255.255.0   U     0      0        0 virbr0
>
>
> '''
>

