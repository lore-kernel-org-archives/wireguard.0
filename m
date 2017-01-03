Return-Path: mailing-porcus@porcus.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d1352f7
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 08:43:29 +0000 (UTC)
Received: from mel.porcus.ch (mel.porcus.ch [46.20.250.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ad2cdc0
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 08:43:29 +0000 (UTC)
Received: from [10.8.100.198] (unknown [46.20.248.4])
 by mel.porcus.ch (Postfix) with ESMTPSA id DC6191A0939
 for <wireguard@lists.zx2c4.com>; Tue,  3 Jan 2017 09:59:00 +0100 (CET)
From: Will van Gulik <mailing-porcus@porcus.ch>
Content-Type: text/plain; charset=us-ascii
Subject: Maximum number of interfaces ?
Message-Id: <698F0489-3376-4D52-A48E-A4C9F344D817@porcus.ch>
Date: Tue, 3 Jan 2017 09:52:14 +0100
To: wireguard@lists.zx2c4.com
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I'm trying to use multiple wireguard tunnel in one VM at the same time, =
but it seems that only the first two I configured are working. I'm =
currently trying with 5 interfaces, I see the incoming packet in tcpdump =
but no reaction of the destination host with all the wg interfaces.

I'm not sure there is a limitation on that, I could totally have missed =
that. Should I use 1 interface with multiple peers rather than multiple =
interface ?

I'm testing that on a Debian with 4.8.7-1, running on a KVM host.

Any insight ?

Kind regards,

Will=
