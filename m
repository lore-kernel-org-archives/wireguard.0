Return-Path: <SRS0=ZPJq=DX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79050C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:17:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 224B820848
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 16 Oct 2020 13:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="IZRyNtvc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 224B820848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a9048d2;
	Fri, 16 Oct 2020 13:16:50 +0000 (UTC)
Received: from forward104j.mail.yandex.net (forward104j.mail.yandex.net
 [5.45.198.247])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 26b3ff93
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Oct 2020 13:54:20 +0000 (UTC)
Received: from mxback3o.mail.yandex.net (mxback3o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::1d])
 by forward104j.mail.yandex.net (Yandex) with ESMTP id 38C8F4A050F
 for <wireguard@lists.zx2c4.com>; Sun, 11 Oct 2020 17:27:26 +0300 (MSK)
Received: from myt4-ee976ce519ac.qloud-c.yandex.net
 (myt4-ee976ce519ac.qloud-c.yandex.net [2a02:6b8:c00:1da4:0:640:ee97:6ce5])
 by mxback3o.mail.yandex.net (mxback/Yandex) with ESMTP id hmoNfsG4ih-RQQuvlEN; 
 Sun, 11 Oct 2020 17:27:26 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1602426446; bh=wA00yA3mTuXTVPnodQ6vYts4D/rnY1PzkvM/jY0rd5M=;
 h=To:Subject:From:Date:Message-Id;
 b=IZRyNtvc7uZIAF58XrFU8Zqrn2z7iq5/sgEeb1o3UuVNTwoAgv5RnjJQmx2fUElpG
 W1WCJws75kZAKkYJSCLdm9HwAa+89tV4bAB0L9JCeZeY7gwu3ELcd1X5OETc2PfCUm
 1MHfb0zDkzb4Xb/QlFS5ksxsL5UrtBzjyEIoQ43o=
Authentication-Results: mxback3o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by myt4-ee976ce519ac.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id haFuSay5iB-ROJufgOQ; Sun, 11 Oct 2020 17:27:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Sun, 11 Oct 2020 17:27:18 +0300
From: igo95862@yandex.ru
Subject: Is default MTU correct?
To: wireguard@lists.zx2c4.com
Message-Id: <I5K1IQ.Y6DHA6KNC1OF3@yandex.ru>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Mailman-Approved-At: Fri, 16 Oct 2020 15:16:50 +0200
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

Was thinking why my wireguards connection had MTU of 1420.

The default MTU is calculated here:
https://github.com/torvalds/linux/blob/master/drivers/net/wireguard/device.c#L255

Which results in MTU of 1420 for wg-quick and systemd-networkd.

The first issue at glance is that it does not account for extension 
headers. (as well as if client is behind MTU lower than 1500)

However, I decided to test what happends if I increase or decrease MTU 
and see what happends to packets with Wireshark. Wireshark can display 
the payload length of Wireguard.

These are the maximum packet (the outer IP packet) and payload (the IP 
packet inside Wireguard) sizes I saw. My endpoint MTU is 1500. (end 
point is not under my administration)

Default MTU of 1420:
  Incoming packet: length 1494, datalen 1420
  Outgoing packet: length 1494, datalen 1420

  As you can see there are 6 bytes missing from maximum MTU.


MTU of 3000:
  Incoming packet: length 1494, datalen 1420
  Outgoing packet: length 1498, datalen 1424

  I thought the connection would break or start fragmenting but it 
seems like there was
  somekind of Path MTU Discovery which determined the MTU to be 1498, 
much closer to the
  actual MTU of 1500. I guess the missing two bytes are because of some 
allignment.

MTU of 1350:
  Incoming packet: length 1434, datalen 1360 (two packets of 1494/1420)
  Outgoing packet: length 1424, datalen 1350

  The outgoing packet had the exact datalen of 1350, howver, the 
incoming packets added
  extra 10 bytes somehow.


As you can see there is a Path MTU Discovery that seems to be working.
The question is should the default even be set 1420?
If the kernel can determine the correct MTU of 1424 (not sure why 2 
bytes are missing)
why not set MTU to something really high and make kernel find the 
actual MTU?

Idealy kernel should find the MTU during initialization of Wireguard 
device.



