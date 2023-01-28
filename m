Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A57C6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:33:02 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 303079e8;
	Tue, 7 Feb 2023 04:29:46 +0000 (UTC)
Received: from einhorn-mail-out.in-berlin.de (einhorn.in-berlin.de
 [192.109.42.8])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 65d6d33f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Jan 2023 13:20:17 +0000 (UTC)
X-Envelope-From: philipp@tiesel.net
X-Envelope-To: <wireguard@lists.zx2c4.com>
Received: from x-berg.in-berlin.de (x-change.in-berlin.de [217.197.86.40])
 by einhorn.in-berlin.de  with ESMTPS id 30SDKHei709770
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Sat, 28 Jan 2023 14:20:17 +0100
Received: from [2a0a:4580:1018:451:9c90:3f7b:265d:f1cf] (helo=smtpclient.apple)
 by x-berg.in-berlin.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <philipp@tiesel.net>) id 1pLl7w-0003Xj-Q8
 for wireguard@lists.zx2c4.com; Sat, 28 Jan 2023 14:20:16 +0100
From: "Philipp S. Tiesel" <philipp@tiesel.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Wireguard packets over IPv6 are not fragmented to path MTU 
Message-Id: <CA8508EC-5233-4DA4-B9FC-0301C2BA9593@tiesel.net>
Date: Sat, 28 Jan 2023 14:20:06 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

Hi,

I have an issue with Wireguard and IPv6 fragmentation where the kernel =
implementation keeps constantly emitting UDP packets which are too large =
for the path-MTU despite I see a correct path-MTU in the route cache.

Setup details:
- Tunnel endpoint A has an interface MTU of 9000
- Path between A and B does not block ICMPv6
- Path MTU is 1500
- First hop on the way from A to B hats an MTU of 9000 and correctly =
emits ICMPv6 Packet Too Big
- Tunnel endpoint B has an interface MTU of 1500

As I have some customer traffic through the tunnel that requires an MTU =
of 1500, I would like to have the tunnel endpoints to correctly fragment =
packets. This works as long as the interface MTU is equal to the path =
MTU, but fails otherwise.
If I switch from the Linux-kernel to the Go implementation, =
fragmentation also works as expected.

Does anyone have hint where to start digging why the Linux =
implementation does not correctly fragment the UDP frames of the =
Wireguard tunnel if the path-MTU is smaller than the interface-MTU?

Software version on endpoint A:
- Debian Bookworm
- Debian Kernel 6.1.0-1-cloud-amd64
- wireguard-tools v1.0.20210914

AVE!
  Philipp S. Tiesel
-- =20
Philipp S. Tiesel
https://philipp.tiesel.net/



