Return-Path: <SRS0=mHS8=2V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8701AC2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Dec 2019 14:33:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 948C7206DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Dec 2019 14:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 948C7206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0e7825d;
	Tue, 31 Dec 2019 14:32:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3e832c6
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Dec 2019 12:03:17 +0000 (UTC)
Received: from claranet-outbound-smtp06.uk.clara.net
 (claranet-outbound-smtp06.uk.clara.net [195.8.89.39])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8c0fdef
 for <wireguard@lists.zx2c4.com>;
 Tue, 31 Dec 2019 12:03:17 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:43070 helo=expanse.chelsea.private)
 by relay06.mail.eu.clara.net (relay.clara.net [81.171.239.36]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 id 1imGF0-0001G5-Kf  for wireguard@lists.zx2c4.com
 (return-path <barry@barrys-emacs.org>); Tue, 31 Dec 2019 12:03:15 +0000
From: Barry Scott <barry@barrys-emacs.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: wireguard broke with recent update on fedora 31
Message-Id: <F9761E5F-F69B-458F-A534-3249FCFBF5FD@barrys-emacs.org>
Date: Tue, 31 Dec 2019 12:03:13 +0000
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Tue, 31 Dec 2019 15:32:44 +0100
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

I had wireguard working but the recent update of somethng has broken it.

I'm happy to help debug, run test code.

My server end is fedora 31, which is up to date.

kernel-5.3.16-300.fc31.x86_64
wireguard-dkms-0.0.20191226-1.fc31.noarch
wireguard-tools-1.0.20191226-1.fc31.x86_64

The server has 2 phys interfaces, external that is connected to the internet (no NAT)
and internal that is home network. I uses systemd-networkd for the phys interfaces.
wireguard uses a service that runnings these commands to start it up.

    ip link add wg0 type wireguard
    wg setconf wg0 /etc/wireguard/wg0.conf
    ip -4 address add 172.16.4.1/24 dev wg0
    ip link set mtu 1420 up dev wg0

(I also tried a smaller MTU, 1280, with no change).

I use firewalld configured to allow access through wg0.
I have also turned off firewalld to eliminate iptables rules
as a source of problem.

$ wg
interface: wg0
  public key: KNwXI8p8zJVed81RI3WhHQuYEUxIe0/PDP77Z2YSKTI=
  private key: (hidden)
  listening port: 51820

peer: bXUXQRJ9e2RXuxpSofQPVsvGMb5idhZiiF3lTOs1PRQ=
  endpoint: 213.205.240.12:43029
  allowed ips: (none)
  latest handshake: 33 seconds ago
  transfer: 1.02 KiB received, 3.11 KiB sent
  persistent keepalive: every 30 seconds

peer: JGxzN0iT+WIL2rltsWfaKD1IFC/f7b/AxF9peecTDEU=
  allowed ips: (none)
  persistent keepalive: every 30 seconds

peer: hom+2y5nNr9UnsSeyNJvWS6RkvnbTQOWwd8Zopsuzwo=
  allowed ips: 0.0.0.0/0
  persistent keepalive: every 30 seconds

peer bX... is an Android phone running wireguard v0.0.20191220.

A tcpdump show 2 ways comms with the phone

$ tcpdump -n -i external port 51820
11:35:09.545035 IP 213.205.240.12.43029 > 86.19.118.184.51820: UDP, length 112
11:35:09.792170 IP 86.19.118.184.51820 > 213.205.240.12.43029: UDP, length 32
11:35:14.533234 IP 213.205.240.12.43029 > 86.19.118.184.51820: UDP, length 112
11:35:14.800147 IP 213.205.240.12.43029 > 86.19.118.184.51820: UDP, length 148
11:35:14.802647 IP 86.19.118.184.51820 > 213.205.240.12.43029: UDP, length 92
... etc...

But I see nothing for "tcpdump -i wg0". And these stats:

$ ip -s addr show wg0
4: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1280 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet 172.16.4.1/24 scope global wg0
       valid_lft forever preferred_lft forever
    RX: bytes  packets  errors  dropped overrun mcast
    180        2        1       0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    92         1        0       3       0       0


Run test from phone here. Turn on wireguard, attempt to browse to http://172.16.4.1.

$ ip -s addr show wg0
4: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1280 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet 172.16.4.1/24 scope global wg0
       valid_lft forever preferred_lft forever
    RX: bytes  packets  errors  dropped overrun mcast
    180        2        28      0       0       0
    TX: bytes  packets  errors  dropped carrier collsns
    188        4        0       3       0       0

The RX errors have increased. dmesg is dull.

Barry


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
