Return-Path: <SRS0=wTrR=3I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URI_HEX autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B384C33CB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Jan 2020 13:59:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622BF20684
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Jan 2020 13:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="PE8ikJ2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622BF20684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6f03395;
	Sun, 19 Jan 2020 13:59:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18d1d2f2
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Jan 2020 13:59:35 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6aa38701
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Jan 2020 13:59:35 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 7EE4E206AF
 for <wireguard@lists.zx2c4.com>; Sun, 19 Jan 2020 14:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1579442373; bh=p44NsxFcvSawRf2s3JsLe1kg0TlfD09et1DSHywQPyU=;
 h=From:To:Subject:Date:From;
 b=PE8ikJ2P/iV7sNO0C5X7U2DdfsNbJVSeXsHmGYotPgnwRpkyD/xrDJ07VQmGJs92S
 R4RCoBhkibrIMI29o2Sxp+uoIhvrmzEOEOEt76pYxAmZ7yKA7vzqiFIVWlIGKj1RzC
 NyLjzNfwVZHfeh/Ci4MPsqL//KlNtoFV9s8C41zE3H5qC5hxsXfty8PJ0MLSnyuq18
 vxDB2+IRX5j2WgdCbmJmYFIyDF1SYSrsuO/jgHl+IcNK6b1PevzcjQsVg2pJMc95V+
 jMOv9QRYXpoQ7aEyFI+68pYvqJ4Qe5+KAL2k/S+YU5a01iqtxm0XG43XakxGQGu6F6
 vzojLtUygX6MQ==
Received: by diamond.localdomain (Postfix, from userid 1000)
 id EDEFD13E0EBD; Sun, 19 Jan 2020 14:58:56 +0100 (CET)
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Trying to fix the address family problem
Date: Sun, 19 Jan 2020 14:58:56 +0100
Message-ID: <87iml7fsyn.fsf@ungleich.ch>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Good morning,

I am travelling between IPv6 only and IPv4 only networks on a daily
basis, which usually breaks the wireguard tunnel I have on my notebook,
as the previous address family is unreachable.

I wanted to write a script that checks "which address family of my
endpoint is reachable" and use wg set to update the configuration.

However, it seems it is not as easy as that: inside the tunnel I am
always using IPv6 networks and if wireguard is active with the IPv4
family endpoint, but when I am in an IPv6 only network, I cannot reach
the Internet due to the default rule of wg-quick:

[#] ip -6 route add ::/0 dev wgungleich table 51820
[#] ip -6 rule add not fwmark 51820 table 51820

So essentially I have to tear down the tunnel first to checkout which
address family can be used and then restart the tunnel.

My question to this list:

- is there any notion of adding multiple endpoints (even if it is the
  same host at the other end) in the future?
- is there a better way to check reachability without turning wireguard
  completely off?

I have attached the sketch of the script I was writing below in case it
helps anyone.

Best,

Nico

--------------------------------------------------------------------------------
#!/bin/sh
# 2020-01-19
# Nico Schottelius
# Periodically fix the wireguard endpoint

endpoint=vpn-2a0ae5c1.ungleich.ch
tunnel=wgungleich
config=/etc/wireguard/${tunnel}.conf

endpoint=$(grep -i ^endpoint ${config}  | cut -d= -f2)
host=$(echo $endpoint| cut -d: -f1)
port=$(echo $endpoint| cut -d: -f2)
publickey=$(grep -i ^publickey ${config}  | cut -d= -f2)

# If wireguard is up, but with the wrong endpoint
# (v4 address in an v6 only network or
# v6 address in an v4 only network) the routing of
# wireguard can break connectivity (i.e. AllowedIPs = ::/0
# breaks IPv6 connectivity)

# Thus we first need to shutdown the wireguard VPN to confirm
# it's not wireguard preventing us to access the endpoint itself.
# It would certainly be better to not needing to shut it down,
# however I don't see a reliable way without skipping the wireguard
# set `ip rule`

wg-quick down ${tunnel}

# Now do the DNS lookups, which should work without a tunnel up
# (they also might have been prevented by wireguard up in the incorrect
# address family)
v6_addr=$(dig +short $endpoint aaaa)
v4_addr=$(dig +short $endpoint a)

v6_ok=""
v4_ok=""

ping -c3 $v6_addr >/dev/null && v6_ok=yes
ping -c3 $v4_addr >/dev/null && v4_ok=yes

# Now verify/check what is reachable
if [ $v6_ok ]; then
    wg-quick up ${tunnel}
    wg set wgungleich peer ${publickey} endpoint ${v6_addr}:${port}
elif [ $v4_ok ]; then
    wg-quick up ${tunnel}
    wg set wgungleich peer ${publickey} endpoint ${v4!_addr}:${port}
else
    echo "The endpoint ${endpoint} is unreachable, try again later" >&2
    exit 1
fi


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
