Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66563C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:16:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 36003c0a;
	Mon, 14 Mar 2022 17:11:45 +0000 (UTC)
Received: from m239-4.eu.mailgun.net (m239-4.eu.mailgun.net [185.250.239.4])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fa740537
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Feb 2022 00:59:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=steel-hub.co.uk;
 q=dns/txt; 
 s=mta; t=1645664385; h=Content-Transfer-Encoding: Content-Type:
 Mime-Version: Reply-To: Message-Id: Date: Subject: To: From: Sender;
 bh=iUNyU2vC2CgfmmpY5PonP5xZ5t7YDWIWsr+qqmQkGHc=;
 b=PoIpHYMWnyCN13BtMiJC5X40sbjzvr/mMwgcrdAxLFkkyMxPIWKciI6Z1j6RA9CSTnJUEQvW
 vu2sCFraonbEhPyxCy9y98kWuXHxWqu8BWUNZbYsH7lfafO4bth1bpelUZHfgRXbqfquCw8w
 sIYMvdviGnMeqZ7BpKuNL6l127Y=
X-Mailgun-Sending-Ip: 185.250.239.4
X-Mailgun-Sid: WyI5NTViNiIsICJ3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tIiwgIjNhNWUiXQ==
Received: from [10.10.10.64] (host81-139-198-54.in-addr.btopenworld.com
 [81.139.198.54]) by smtp-out-n02.prod.eu-central-1.postgun.com with SMTP id
 6216d88083284d24fb797441 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Feb 2022 00:59:44
 GMT
From: "peter@steel-hub.co.uk" <peter@steel-hub.co.uk>
To: wireguard@lists.zx2c4.com
Subject: Windows Client - high packet loss after fragmented packet
Date: Thu, 24 Feb 2022 00:59:45 +0000
Message-Id: <ema686fe7b-eca9-46e4-9d80-a6ec02d74c9d@jarvis>
User-Agent: eM_Client/8.2.1659.0
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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
Reply-To: "peter@steel-hub.co.uk" <peter@steel-hub.co.uk>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I am using the wireguard windows client (v0.5.3) and driver (v0.10.1).

Whenever I send data that is larger than the mtu, packet loss goes=20
through the roof.  Some packets get through, but almost all of them=20
(about 98%) are lost. This will continue until I deactivate and then=20
reactivate the tunnel in the windows client.

This does not seem to happen when receiving large packets. However, I=20
haven't spent much time testing that.

I tested using an android wireguard client connected to the same server.=20
It had no problems.

I used large ping requests to replicate the issue while capturing the=20
traffic on the wg and eth interfaces for both the client and server.

When I send a large packet (e.g. 1700 bytes), the client wg interface=20
shows two frames: the first frame length equals the mtu (1420 bytes) and=20
the second makes up the difference + overhead (328 bytes). However, the=20
eth interface on the client only shows the first frame. This is=20
confirmed on the server which only receives the first frame. After a=20
significant delay, the second frame seems to be sent and a response=20
received, but the request has already timed out by then.

After that, packets still come and go but there is some kind of delay=20
between packets being received on one interface and appearing on the=20
other. By the time the response comes in, the packet is already=20
considered lost. For example, normal-sized ping requests mostly showed=20
as timed out on the command line but I could see that a response was=20
eventually received on the wg interface.

The more large packets I send through the tunnel, the worse it gets. If=20
I just send one large packet, there is a delay and most requests=20
time-out. After more large packets are sent, I stop receiving responses=20
at all on the wg interface. At this point the wireguard client will=20
start reporting handshake failures.

As before, deactivating and reactivating the tunnel restores normal=20
operation.

Here are some logs that demonstrate the problem: =20
https://we.tl/t-qb1ChyWDIC

There are three systems to note:

10.106.15.10 =3D windows client (win-client)
10.106.0.2 / 10.106.15.1 =3D wireguard server, debian 11 (server)
10.106.0.3 =3D test system accessible on lan attached to server, debian 11=
=20
(host)


Thanks,
Peter.



