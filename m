Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a83b55a8
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 18:44:49 +0000 (UTC)
Received: from fifthhorseman.net (c-174-62-194-216.hsd1.ct.comcast.net
 [174.62.194.216])
 by che.mayfirst.org (Postfix) with ESMTPSA id C0AA8F98B
 for <wireguard@lists.zx2c4.com>; Sat,  2 Jul 2016 14:47:54 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat, 02 Jul 2016 14:47:53 -0400
Message-ID: <8760snzxk6.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [WireGuard] stricter inputs for wg genkey, genpsk, and pubkey
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

i've just done a bit of cleanup for wg that makes it stricter for
genkey, genpsk, and pubkey, with the goal of making it explicitly reject
accidental misuse and catch user error.

I've published those changes on the "stricter-inputs" branch on
https://anonscm.debian.org/git/collab-maint/wireguard.git because i'm
not sure whether a series of 6 small changes, with each changeset pretty
small is appropriate for the mailing list.

Please let me know if it's ok to just send this sort of series directly
to the list -- i'd be happy with that approach, but i don't know whether
others on the list would dislike it.

If there was a test suite for the non-kernel parts of wg, i'd normally
integrate failing and succeeding tests as a part of the series, to avoid
a future regression.  Is there interest in a simple test suite for those
parts?

        --dkg
