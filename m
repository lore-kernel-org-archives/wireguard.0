Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b51913e
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 15:21:39 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c46aa29
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 15:21:39 +0000 (UTC)
Date: Thu, 15 Mar 2018 11:31:51 -0400
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: Allowed IPs Toggling
Message-ID: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: Gianluca Gabrielli <tuxmealux@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

I was setting two peers on the server, but every time I re-add one of these=
 two the other one is shown with (none) on "allowed ips" field. Of course t=
hat blocks communications with that peer.
If I try to re-add it, then the other peer loses its configuration, same pr=
oblem.=20

I also uploaded a screenshot to show what happen: http://b1.ge.tt/thumbnail=
/9mHe41p2/0/user-FmSzCRxxFYeJWFrs22ANXjgqdUW3IX7GvUIDb-/0x675.png

I'm pretty sure that is not a bug, but my fault about some misconfiguration=
.... anyone knows what I'm doing wrong??

Cheers,
Gianluca
