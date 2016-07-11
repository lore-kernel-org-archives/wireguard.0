Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76584048
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 10:15:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b90520c4
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 10:15:19 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e10e5487
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 10:15:19 +0000 (UTC)
Date: Mon, 11 Jul 2016 12:15:58 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffb2da099a@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160711`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new experimental snapshot, `experimental-0.0.20160711`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * persistent keepalive: use authenticated keepalives
    This is by far the biggest and most important change of this snapshot, and
    indeed is the entire reason why we're releasing another one for folks to
    test out. It was pointed out on the mailing list that if keepalives aren't
    authenticated, it's impossible for the receiver to update the source IP/port
    of the sender. So, we make them authenticated, which means turning on the
    "persistent-keepalive" feature is basically saying "always hold an active
    session open". WireGuard is by default non-chatty -- there won't be an active
    session if you're not sending anything. So, if this is a problem with
    wanting to receive connections while idle and behind NAT, then you can use
    this feature for always maintaining an active session.
  * timers: rename *authorized* functions to *authenticated*
  * timers: do not consider keepalives to be data sent
  * examples: update ncat-client-server readme
  * keepalives: only queue keepalive when queue is empty
  * persistent keepalive: use unsigned long to avoid multiplication in hotpath
  * timers: document conditions for calling
  * timers: move timer calls out of hot loop
  * timers: apply slack to hotpath timers
  * receive: no need to test for !len
  * receive: assume we usually succeed with userspace

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160711.tar.xz
  SHA256: 4ab876642236abcac416f7b75cf5e9e28b8581d5b7741d36a437af08c42d8081

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQItBAEBCAAXBQJXg3GkEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA668dg/+
KJ53e4rRJfTolpDf10U8vRtPdcxRUH7j1+quPl+HpRlrW7CD0YGTB8POVL1FDRty
lc+UNtOvGgwcgLaZiMQ9WdOp+8fDawtG5O8OukadxPN3TGO0+AMzeRy85bfz3SAa
6HvytJ0aGfRFanb6NgNYChILNLL4shjidut3KhzPkP/MzzeGm8FPbkZkvlT4meWv
XA4OWmCTww3u3kZIFyAANagxArjSmcNeUK4tJyCAIQIena0wMg1Nz268rPPbnZMk
pjgcJRipJlHrVeN60IUC75bymgLGsQefNYanARL67EQo/Ya5lxzWdahXB5NnD0//
ko0vWh4gp+QmFUN0z1K73bC1kz61iEfIyBLh1hj/syDmfM6qLdva0xuBNZvR0USe
OGbqJgqIEYqqwQcVFaGfWmm7+VaMuiy79hZ/uuYDpnILr1HDsNF1EtMs7cYg3Q3D
k5ino/2eEztkXe7xszNKUXNvIKyNB+fczo26HzuNbUlxwamFwRly8RjrxUZ6HGC7
XwOdOZBV/Xy4ydxrYdeGOWHzEr/MWGyZkJ3E/kO1SWrXXw3xVmuET6EuseK5+gms
E59uTFgiaSdpZfq2KYW5CG1LSbBNqr0yUAGRkjxrSwdlD+Lq0pgy1ufU65Q1qmsc
AsQDN2c0vLJvsDZrQZ1aTUUdPjBFa+MLToIyOoZ3+Vw=
=8x+l
-----END PGP SIGNATURE-----
