Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 824b9ab8
 for <wireguard@lists.zx2c4.com>; Thu, 7 Sep 2017 14:22:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b6439ec
 for <wireguard@lists.zx2c4.com>; Thu, 7 Sep 2017 14:22:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f33e524
 for <wireguard@lists.zx2c4.com>; Thu, 7 Sep 2017 14:41:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a18b557f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Sep 2017 14:41:08 +0000 (UTC)
Date: Thu, 07 Sep 2017 16:47:39 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170907` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <c5818a3870ab158c@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170907`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * socket: improve reply-to-src algorithm
  
  This follows an extensive discussion on the mailing list.
  
  We store the destination IP of incoming packets as the source IP of
  outgoing packets. When we send outgoing packets, we then ask the routing
  table for which interface to use and which source address, given our
  inputs of the destination address and a suggested source address. This
  all is good and fine, since it means we'll successfully reply using the
  correct source address, correlating with the destination address for
  incoming packets. However, what happens when default routes change? Or
  when interface IP addresses change?
  
  Prior to this commit, after getting the response from the routing table
  of the source address, destination address, and interface, we would then
  make sure that the source address actually belonged to the outbound
  interface. If it didn't, we'd reset our source address to zero and
  re-ask the routing table, in which case the routing table would then
  give us the default IP address for sending that packet. This worked
  mostly fine for most purposes, but there was a problem: what if
  WireGuard legitimately accepted an inbound packet on a default interface
  using an IP of another interface? In this case, falling back to asking
  for the default source IP was not a good strategy, since it'd nearly
  always mean we'd fail to reply using the right source.
  
  So, this commit changes the algorithm slightly. Rather than falling back
  to using the default IP if the preferred source IP doesn't belong to the
  outbound interface, we have two checks: we make sure that the source IP
  address belongs to _some_ interface on the system, no matter which one
  (so long as it's within the network namespace), and we check whether or
  not the interface of an incoming packet matches the returned interface
  for the outbound traffic. If both these conditions are true, then we
  proceed with using this source IP address. If not, we fall back to the
  default IP address.
  
  * tools: fix removal of psk
  
  Small bug fix for some leftovers of moving from interface-psk to peer-psk way
  back when.
  
  * wg-quick: only bash complete existing interfaces for down
  
  Bash completion is smarter now.
  
  * compat: fix padata to work with 4.13
  
  WireGuard now works with the newly released 4.13 kernel.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170907.tar.xz
  SHA2-256: a1ee12d60662607e4c5a19f84b5115e56f083e2600053882e161537f12d963fd
  BLAKE2b-256: 02c5df230e1177d7b153eaec1710b378a680538f4c82913a27baf1f1eca989dc

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlmxW2gQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtZcEACINeolEROr76GlkH+zy1AAWSAY9m3uuula
3V8yEs1MGEuyG4NUPj07Oz+kcAAVT/28pFAgoxbCbArO3lJztXB0mLwmLgZz3a/U
TwTqcjVQYzSbI6qzDSmUmEREzTaP7IzOjV5CRr8LtYOivRP1ts4IDqy48YHbDCD6
HgT9YrHBXafLxZWBevWLVwxHVjpnMqvRhof+FVu2ywhWiZyTnN9Nmog0XjOng2wW
NmykpBfJMjLSG3JGeZmo4Q1uMlwLq1TNrp3R86Bis5QI+fc4q2884XiUpJvmAekT
0y9oiaPke/AUBmqAB3oUi0O4XlIz7jrV191lGNYcgy7Y9WeZmMklrNtzKWCLz+Kd
KS/1vxelSSdahLM3Qiti974kTRuPAnLAKUse+gFLRvJ2t5ZxpbHwltkJnbPv+XMp
PE8pSsj/4Bt1aezEYc2PwfhmLX4ircpXvuiJ+25VpiUg24Ys3GAMpRMK8moipSKx
y5Vjbi5wFAbNl1sNULiq1/tBxYnSHLfuzO6HaZXi5nDEJi5XfrPVuTaJQFdf4/XG
zKQvVhaVswm+pmUYdGTzjx1LU/ZEXZKSb0xtRlPEEEv9SjU/t5LfLzpPI6jfCZWY
tSalLGwaAIz/yCWPfrLrguZ09L9PWM8VRpGY+0yk4T1IYreT64rDHR9VekvhImqA
C9L7WlmQNQ==
=nFpu
-----END PGP SIGNATURE-----
