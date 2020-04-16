Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8548CC3A5A9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B08F220658
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 11:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B08F220658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hanswkraus.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4bd6d6a;
	Mon, 4 May 2020 10:51:13 +0000 (UTC)
Received: from mx18lb.world4you.com (mx18lb.world4you.com [81.19.149.128])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80a66123
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Apr 2020 16:12:57 +0000 (UTC)
Received: from [178.189.218.72] (helo=robbe)
 by mx18lb.world4you.com with esmtpa (Exim 4.92.3)
 (envelope-from <hans@hanswkraus.com>)
 id 1jP7I5-0007PD-TT; Thu, 16 Apr 2020 18:23:02 +0200
Received: from [192.168.4.131] (unknown [192.168.4.131])
 by robbe (Postfix) with ESMTPS id B410D340460;
 Thu, 16 Apr 2020 18:23:01 +0200 (CEST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Hans Kraus <hans@hanswkraus.com>
Subject: Newbie - WireGuard per systemd on Debian Buster
Message-ID: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
Date: Thu, 16 Apr 2020 18:23:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: quoted-printable
X-Antivirus: Avast (VPS 200415-0, 15.04.2020), Outbound message
X-Antivirus-Status: Clean
X-AV-Do-Run: Yes
X-Mailman-Approved-At: Mon, 04 May 2020 12:51:11 +0200
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

I'm a newbie to wireguard and trying to install a working environment,
starting with one server and one client. First I used the example in
<https://github.com/pirate/wireguard-docs/tree/master/example-simple-client=
-to-server>
and got it working.

To get a more persistent installation I followed the example in
<https://wiki.debian.org/Wireguard>, with one server and one client,
"Step 2 - Alternative C - systemd". My server has a fixed ip4 address,
my client(s) get their addresses via DHCP (home network and road
warrior). My two "/etc/systemd/network" files on my server are:

/etc/systemd/network/wg0.netdev
---------------------------------------------
[NetDev]
Name=3Dwg0
Kind=3Dwireguard
Description=3DWireguard kraush

[WireGuard]
PrivateKey=3D<private key server>
ListenPort=3D#####

[WireGuardPeer]
PublicKey=3D<public key client>
AllowedIPs=3D<free range>.0/24
---------------------------------------------

/etc/systemd/network/wg0.network
---------------------------------------------
[Match]
Name=3Dwg0

[Network]
Address=3D<free range>.1/24
---------------------------------------------
I omitted the "Endpoint=3D<remote IP or hostname>:<remote port>" part
because I don't know (at least at server startup) the IP address of my
client(s).

That doesn't work. wg0 is up, ip addr show shows an address bound to the
interface. But it seems that the server doesn't recognize the peer
because "wg show wg0 peers" gives an empty list back.

Any help appreciated,
Hans

-- 
Diese E-Mail wurde von Avast Antivirus-Software auf Viren gepr=C3=BCft.
https://www.avast.com/antivirus

