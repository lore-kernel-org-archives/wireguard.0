Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C00C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:43:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 788F5218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=anatoli.ws header.i=@anatoli.ws header.b="FwrmLspi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 788F5218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1337455;
	Wed, 20 Mar 2019 22:42:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cde392a0
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2019 20:54:41 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e667298
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Mar 2019 20:54:41 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id AA5671E0016A
 for <wireguard@lists.zx2c4.com>; Mon, 18 Mar 2019 20:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=5s7aopj1ad; t=1552942484;
 bh=a7g+/ybTgMlmWJuq0ytKReDd+jDnuWXEL/zw0MzgbS0=;
 h=To:From:Subject:Date;
 b=FwrmLspizlUPwlLl/F4ZwNrd3LncPGyhNf36R7nHy060VnGB3P8ntFUdASPILjHKU
 WkCDdmUpV4c5IX6FaMwYdLmwWxNXN12zvU95LRGMQt1q0G9ZAyz8kk+Bf5I8jaVvtI
 EZKK0cK2SbmevS8T2km/9qAawnLKpJYxRlpyY8zTWeJltATNdC9rslOjCaYeC9eDB4
 D2h4jAzlVpAgrP5u/amndqIr2UFmMfp6Q39he/Is2vFUtxD3DMYo0Z2aD4bHaqknnb
 2waOjRlSp+wKj/SqB18M4Rjy9I38eNWiEyPgBl9a7rLHmZ6D9K1yloW0vrcgNt4lyq
 Ub/JvxlQrgzlw==
To: wireguard@lists.zx2c4.com
From: Anatoli <me@anatoli.ws>
Subject: iOS push notification issues
Message-ID: <8de1afbc-d8c6-a474-c101-29840744f753@anatoli.ws>
Date: Mon, 18 Mar 2019 17:54:42 -0300
Mime-Version: 1.0
Content-Language: es-AR
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:42:51 +0100
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
Content-Type: multipart/mixed; boundary="===============1356470536530178517=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============1356470536530178517==
Content-Type: multipart/alternative;
 boundary="------------65B6419C1D8C62243DFBD45C"
Content-Language: es-AR

This is a multi-part message in MIME format.
--------------65B6419C1D8C62243DFBD45C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason, all.

I have detected some issues with iOS push notifications with WG while 
the device is in sleep mode (screen turned off).

First of all, in spite of having KeepAlive set to 10-30 seconds, iOS 
devices don't send keepalive packets at all while the screen is turned 
off. The only thing that is more or less always received on the server 
is the handshake, every 170 seconds.

It appears that from time to time WG@iOS is not receiving communications 
from the server – the device doesn't respond to any incoming connections 
(over the tunnel).

Due to this, the incoming push notifications don't reach the device via 
the tunnel: I see on the server incoming connections from WhatsApp and 
Apple servers, the WG@server tries to forward them to the device, on the 
underlying iface I see outgoing WG UDP packets to the client, but no 
reply from it.

The device awakes some moment later (probably for the handshake), WG@iOS 
communicates with WG@server, iOS establishes a connection to the APNS 
and receives the notifications. The effect is that the notifications 
enter with a delay (up to 2-3 min) and some incoming calls are lost 
(i.e. not answered on time due to lack of notification).

Also, sometimes iOS devices are trying to connect to 17.0.0.0/8 network 
(which belongs to Apple and is related to APNS) /outside/ the tunnel. 
After this connection fails (due to the firewall not allowing anything 
outside VPN), the devices start disconnecting from the WiFi.

Any idea why this happens? I know there are issues with iOS devices 
entering sleep, this is a huge problem for OpenVPN Connect app. WG on 
iOS somehow manages to work during sleep, but not always. Most (about 
80%) of the notifications are received correctly during sleep, but some 
fail.

Regards,
Anatoli

--------------65B6419C1D8C62243DFBD45C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body smarttemplateinserted="true">
    <div id="smartTemplate4-template">
      <div style="font-size:10.0pt;font-family:Verdana,Arial"> Hi Jason,
        all.<br>
        <br>
        I have detected some issues with iOS push notifications with WG
        while the device is in sleep mode (screen turned off).<br>
        <br>
        First of all, in spite of having KeepAlive set to 10-30 seconds,
        iOS devices don't send keepalive packets at all while the screen
        is turned off. The only thing that is more or less always
        received on the server is the handshake, every 170 seconds.<br>
        <br>
        It appears that from time to time WG@iOS is not receiving
        communications from the server – the device doesn't respond to
        any incoming connections (over the tunnel).<br>
        <br>
        Due to this, the incoming push notifications don't reach the
        device via the tunnel: I see on the server incoming connections
        from WhatsApp and Apple servers, the WG@server tries to forward
        them to the device, on the underlying iface I see outgoing WG
        UDP packets to the client, but no reply from it.<br>
        <br>
        The device awakes some moment later (probably for the
        handshake), WG@iOS communicates with WG@server, iOS establishes
        a connection to the APNS and receives the notifications. The
        effect is that the notifications enter with a delay (up to 2-3
        min) and some incoming calls are lost (i.e. not answered on time
        due to lack of notification).<br>
        <br>
        Also, sometimes iOS devices are trying to connect to 17.0.0.0/8
        network (which belongs to Apple and is related to APNS) <i>outside</i>
        the tunnel. After this connection fails (due to the firewall not
        allowing anything outside VPN), the devices start disconnecting
        from the WiFi.<br>
        <br>
        Any idea why this happens? I know there are issues with iOS
        devices entering sleep, this is a huge problem for OpenVPN
        Connect app. WG on iOS somehow manages to work during sleep, but
        not always. Most (about 80%) of the notifications are received
        correctly during sleep, but some fail.<br>
        <br>
        Regards,<br>
        Anatoli<br>
      </div>
    </div>
  </body>
</html>

--------------65B6419C1D8C62243DFBD45C--

--===============1356470536530178517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1356470536530178517==--
