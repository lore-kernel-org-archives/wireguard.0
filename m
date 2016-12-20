Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbe49794
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 14:46:45 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a8fab55
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 14:46:45 +0000 (UTC)
Received: from mail.toke.dk (localhost.localdomain [127.0.0.1])
 by mail.toke.dk (Postfix) with ESMTPS id 0F15328318
 for <wireguard@lists.zx2c4.com>; Tue, 20 Dec 2016 15:53:46 +0100 (CET)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Multicast over a wireguard link?
Date: Tue, 20 Dec 2016 15:53:44 +0100
Message-ID: <87fuli7itj.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Does Wireguard has a notion of multicast? I would like to eventually
replace my current VPN setup with wireguard. I currently run Tinc in
switch (layer 2) mode, and run the Babel routing protocol on top.

Babel announces itself via link-local multicast to everyone on the link.
Does this work with wireguard? I guess the equivalent semantics would be
"send this packet to all known peers"...

-Toke
