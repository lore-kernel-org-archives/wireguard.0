Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bbc2820
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 15:27:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae911662
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 15:27:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d1bb081
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 15:27:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f3a026b2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 15:27:27 +0000 (UTC)
Date: Thu, 23 Feb 2017 16:28:31 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170223` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <a17b7cb91c4ebaeb@frisell.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20170223`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * device: disable ICMP redirects
  
  We now no longer send ICMP redirect messages when forwarding packets between
  two WireGuard peers on the same interface.
  
  * socket: do not try to create v6 socket when disabled
  
  This allows WireGuard to work on systems booted with ipv6.disable=1.
  
  * wg-quick: allow config files without trailing newline
  * tools: give "off" value for fwmark
  * tools: fix bash completion spaces
  
  * tools: add wg show [interface] dump
  
  The wg(8) command learns a new way of dumping information, which should be a
  boost for script writers.
  
  * contrib: add wg-json utility
  
  Using the aforementioned new dump command, it's trivial to transform into JSON
  using a bash script, so this is provided as an example.
  
  * extract-keys: respect compat directives
  
  The extract-keys helper now builds with the new compat system, which should
  enable wireshark dissectors and such to work.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170223.tar.xz
  SHA2-256: 6d2c8cd29c4f9fb404546a4749ec050739a26b4a49b5864f1dec531377c3c50d
  BLAKE2b-256: bb6167ea4a2f54127912947161fd0dc785b388017bfabb0b64debd7fc2d12fbc

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAliu/5gQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Druf/EAC9bRArn/2M1xVUmB0r9FJddtjfaDAhe/Ub
1q8xYE8My1PrO8R47vHs/jluX70sCQUwsHq1O7IxOAbDJR6bQWiyAFpPwRQ49UgR
kyoJaL04t9OBkhUcwcP62iHSgPuB/EIprDpO0Jm8XvfYZHTSVJSHOw688rqcUlNW
TmKf1WoDVzRFfCjXeoEa6tj4nPfJ668/5OOQzQv3cM7dXF+bkZhvq76mS0PNE7zW
tTAIc/OuxhCeKc3LW2dtRgDNGGOoSg8+mrjas7XB8STR8TZC4b+m5hfGhoq7y8nJ
tJ6Z70qJgXOHUTHuCE4ER/kFNGc/sPB0TxQOGkQR62M3B0uYZmBE8ODr90N6/8yc
r4aPz8SqFRNk4C3VfKegpvRNfX/P4ASHJtBf9+G4NbmPuuWOOocegL9632drlURp
aI89VeL2pRgTbTfePr+1wy6zhs8vSJ4l3/bPVunMnN0DsiTWvYlUqulD3uYND2ta
zTkz5RuO8kkTjemksNQHEIiadlzaUURW55YGtzCu/eNe+mborGQRpjLIxY2blFTj
57o3+TX2N12QrEAXTfEVxR2ZeFK04ja3VRVZHB2Qn9nozQ/gAmRRFxWEcReZR7Fe
NHI4kgvVPS8IUgIH20ohvXUZtYrothTjb9l7syrPK/6OqKF0U/e1qBj7pfKEHJ42
6rEPq2qYHA==
=XKuH
-----END PGP SIGNATURE-----
