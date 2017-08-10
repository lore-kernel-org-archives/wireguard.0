Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccade3fb
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 23:58:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8c5d41f
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 23:58:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f443900
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 00:17:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f168032b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 00:17:11 +0000 (UTC)
Date: Thu, 10 Aug 2017 02:20:06 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170810` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <c571e33604f58858@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170810`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * jason: leaving for short trip
  
  This is the last snapshot I'll be making for the next 3 or so weeks,
  as I'll be going on a short vacation mostly off-the-grid. (If any
  Icelandic WireGuarders are reading this, feel free to shoot me
  an email if you'd like some stickers.) When I return, development
  will resume at an even faster rate than before.
  
  * android: fix readme
  * contrib: move Android tools to wireguard-android repo
  
  All the Android tools have been moved to an Android-specific repo,
  which, in addition to having all the wg-quick CLI things, will also
  have a nice UI that Samuel, one of our GSoC students, has been
  working on. Stay tuned, exciting things coming.
  
  * socket: move print function from compat
  * compat: work around odd kernels that backport kv[mz]alloc
  * compat: get rid of warnings on frankenkernels
  * compat: support grsecurity with our compat padata implementation
  * netns: work around linux 3.10 issues
  
  The usual set of compat fixups for weird kernels. With regards to
  Grsecurity, we make a change that _should_ make this part of the
  compat layer work with Grsecurity, but unfortunately I really have
  no way of knowing, since I don't actually have access to their
  source code. I assume, though, if this doesn't work, I'll receive
  more complaints and will take another stab in the dark. The general
  situation saddens me, as I really liked that project and wish I
  could still play with it.
  
  * recieve: cleanup variable usage
  * receive: single line if style
  * recieve: pskb_trim already checks length
  * receive: move lastminute guard into timer event
  * selftest: more checking in ratelimiter
  * blake2s: satisfy sparse
  * routingtable: unbloat BUG()
  * timers: rename confusingly named functions and variables
  * noise: infer initiator or not from handshake state
  
  Usual set of code quality cleanups.
  
  * tools: stricter userspace ipc parsing
  * netns: explictly test reply to sender routing
  * timers: do not send out double keepalive
  
  Some logic fixes and a more expansive test suite.
  
  * hashtables: allow up to 2^20 peers per interface
  * hashtables: if we have an index match, don't search further ever
  
  This allows for nearly 1 million peers per interface, which should be
  more than enough. If needed later, this number could easily be increased
  beyond this. We also increase the size of the hashtables to accommodate
  this upper bound. In the future, it might be smart to dynamically expand
  the hashtable instead of this hard coded compromise value between small
  systems and large systems. Ongoing work includes figuring out the most
  optimal scheme for these hashtables and for the insertion to mask their
  order from timing inference.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170810.tar.xz
  SHA2-256: ab96230390625aad6f4816fa23aef6e9f7fee130f083d838919129ff12089bf7
  BLAKE2b-256: efd0c65b6d18ce4009a62fa08c4c82ce9850ddb736b389c5d1bd14414dfce142

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlmLpdgQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgyfD/991kMeNobaCB6E9bsJ1mHc+lXWsE+2JPDY
TtezEzBS+kS635s/vD/9nS38wss0BJZxxAUl+tcrFjE6MvIWb7dv07KFqUuLsVip
hGdXNwZtWvI2cduyehgHT8oavZUxyRTtYA8oxCIbdaRg8aOtlyW1HNzyeRhzzRxf
qRbkcToUyStcaC5bzCWcr/cRh2mndPjT4reT+n2tg/RHS00aFmkgtJ7GWTeJyEhv
JaLfEo+fTPvepBBOiDamZQCqBt/jWjUxub2xb8M6dXzdC6Yzg/n70tT1ABf8uS1q
zQpOLi6RaD2cZ/jAXqW0XDX8rhz0IwzM+OY18B43LHZZ6TUyCqiS1/TdxmLNhLho
IQBFnaBII12F6ZYiXl3j7fwgaF1LhzEm7itIFGNHDEJ4RxCcNoq4azLV6acBHCqS
dnHrHCs0/uisx0qPdKT97b7faTPabO8mlXCtqV3F+MRVBtytRhUo/PTZ62JfYfYb
QqgRY9WhOFwmnPgZOvPyPhgrsm/qCjhT8Y48DZVKpJ/d5PdW35AClq6VTi6U416O
XG71UJx+2psrS5poL7mtRHo+UN1HKiPOU2VAI+kno4e4FBRmqClsUeHvXgeIFrGk
o40vbVEihx7QEoUV8z0edwNTPXaPTGEbZFW6sYe0MVQlR9C8TY7rDEWi90MFAp5C
nLF80s0z+w==
=zr1b
-----END PGP SIGNATURE-----
