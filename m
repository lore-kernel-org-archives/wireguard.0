Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 768A0C35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 08:01:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5A1208C3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 08:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5A1208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libassi.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8ae9dd1;
	Sun, 23 Feb 2020 07:57:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb6e3752
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 07:57:21 +0000 (UTC)
Received: from smtp2.outgoing.loopia.se (smtp2.outgoing.loopia.se
 [93.188.3.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de688473
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 07:57:21 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id 5BD0C2E7921C
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 09:00:34 +0100 (CET)
Received: from s499.loopia.se (unknown [172.22.191.6])
 by s807.loopia.se (Postfix) with ESMTP id 3DBD82E275DA
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 09:00:34 +0100 (CET)
Received: from s474.loopia.se (unknown [172.22.191.6])
 by s499.loopia.se (Postfix) with ESMTP id 39D831CDAF00
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 09:00:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s500.loopia.se ([172.22.191.6])
 by s474.loopia.se (s474.loopia.se [172.22.190.14]) (amavisd-new, port 10024)
 with LMTP id XgQbQpnRRTZF for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:00:33 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: peter@libassi.se
X-Loopia-Originating-IP: 78.82.164.216
Received: from [10.79.0.17] (c-d8a4524e.03-77-73746f30.bbcust.telenor.se
 [78.82.164.216]) (Authenticated sender: peter@libassi.se)
 by s500.loopia.se (Postfix) with ESMTPSA id C45BB1E1472E
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 09:00:33 +0100 (CET)
From: Peter Libassi <peter@libassi.se>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: FreeBSD wireguard wg-quick remote IP address assignment is incorrect
Message-Id: <01F8520D-6F1E-4DFB-BC07-80D9838EF35D@libassi.se>
Date: Sun, 23 Feb 2020 09:00:33 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Content-Type: multipart/mixed; boundary="===============7986278478160020029=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============7986278478160020029==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A9E46623-1B30-4A81-93A0-5F2FBFF08E6F"


--Apple-Mail=_A9E46623-1B30-4A81-93A0-5F2FBFF08E6F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

local wg interface does not respond due to the wg-quick script sets up =
the interface by reusing the local address as the remote address in the =
ifconfig command:

root@bsd2:~ # wg-quick up wg0
[#] wireguard-go wg0
INFO: (wg0) 2020/02/20 09:45:16 Starting wireguard-go version =
0.0.20200121
[#] wg setconf wg0 /tmp/tmp.87viEAsK/sh-np.YdRfI6
[#] ifconfig wg0 inet 192.168.2.2 192.168.2.2 alias

On linux setting up an IP address on a tun interface does not require a =
remote address:
[root@vpn2 wireguard]# wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 192.168.2.2/24 dev wg0

In the wg-quick script function add_addr() is where the assignment is =
made:
=20
 cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias

I verifed this by replacing remote address with localhost:

 cmd ifconfig "$INTERFACE" inet "$1" "127.0.0.1" alias

Now local ping works. You can give any address I suppose since the =
=E2=80=9Dremote address=E2=80=9D of the ifconfig of a tun interface is =
not really used by wireguard.

I also filed this as FreeBSD bug 244330.

/Peter=

--Apple-Mail=_A9E46623-1B30-4A81-93A0-5F2FBFF08E6F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><pre =
class=3D"bz_comment_text" style=3D"white-space: pre-wrap; width: 50em; =
padding-left: 0.5em; padding-right: 0.5em; caret-color: rgb(0, 0, 0); =
color: rgb(0, 0, 0);"><font face=3D"Helvetica" class=3D"">local wg =
interface does not respond due to the wg-quick script sets up the =
interface by reusing the local address as the remote address in the =
ifconfig command:

root@bsd2:~ # wg-quick up wg0
[#] wireguard-go wg0
INFO: (wg0) 2020/02/20 09:45:16 Starting wireguard-go version =
0.0.20200121
[#] wg setconf wg0 /tmp/tmp.87viEAsK/sh-np.YdRfI6
[#] ifconfig wg0 inet 192.168.2.2 192.168.2.2 alias

On linux setting up an IP address on a tun interface does not require a =
remote address:
[root@vpn2 wireguard]# wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 192.168.2.2/24 dev wg0

In the wg-quick script function add_addr() is where the assignment is =
made:
=20
 cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias

I verifed this by replacing remote address with localhost:

 cmd ifconfig "$INTERFACE" inet "$1" "127.0.0.1" alias

Now local ping works. You can give any address I suppose since the =
=E2=80=9Dremote address=E2=80=9D of the ifconfig of a tun interface is =
not really used by wireguard.</font></pre><div class=3D""><br =
class=3D""></div><div class=3D"">I also filed this as FreeBSD bug =
244330.</div><div class=3D""><br class=3D""></div><div =
class=3D"">/Peter</div></body></html>=

--Apple-Mail=_A9E46623-1B30-4A81-93A0-5F2FBFF08E6F--

--===============7986278478160020029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7986278478160020029==--
