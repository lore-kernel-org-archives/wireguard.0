Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecbf30c9
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:53:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94a9acf2
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:53:29 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3fc491d9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:53:29 +0000 (UTC)
Date: Wed, 02 Nov 2016 11:54:34 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <fffffffff74c1112@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161102`
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

A new experimental snapshot, `experimental-0.0.20161102`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * peer: kref is most likely to succeed
  * data: do not allow usage of keypair just before hash removal
  * kref: elide checks
  
  These fix a potential race condition that could trigger kernel warning
  messages.
  
  * tools: everybody hates automatic stripping
  * tools: abstract pkg-config to PKG_CONFIG
  
  Distributions should now have an easier time using the tools Makefile.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161102.tar.xz
  SHA256: faecddc28dc4261eaf4652e3f7953ed7c81b71acd1b7b173988caa73b38a8f53

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYGcXhEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66cGQ//
fUUUFxaFBZyJ/y4ZvRlaq1htc5TqQKyvD8h3qVjv2W/Lq4ckm+U3A+pzzDgI/UHV
cFgTaixq4KFSLos9PKk1zAz4zUD9iCtZoqklQAlRjmxh6Fomy5GpLZqkfa9edRG8
wEtdwWB2L8sbVafD/twxW41m257xUsZXsIovuyQBS/qonTl4VNKtBO7pfTdgiZuu
OiJ6H7wfrIMhu94D5+dr87HIEPnEhU3mRSBEmdDqaQja4x+LM+2GmZ/wYURe3yzn
rV8c19cHNZpiDwh+yWUZp4JjwEpdsT6OORGBpGVgXbN1gkkdyal9Y+1B4WU8Hj8e
UCop72zlc3owgxhMk/saj8sHUVz3tPaCNN1spVadLFuPEmkIxB9w6iZNy38vQv0/
4iPLepy79VTEsBHCH9MmDHyRmC2TNSLa1pd05cDNGTFb5T1a3f7Q/K/xkqF5PHM2
TvafJixU/KNcahja80ab9pIzsmWg0kD1jWFiynMlfR+F4fIZ9TBpiiEeatEPf3Qc
aTEfo7fBubzyTnViI+YW2fPT9dTJSqpSrxD1OT7eu/VgQik47bfR6Npygd4RFlCy
GegrW/FVKQnIEg54NEekBGcvgB8zBDJE5HaKSdxPoo9fOF6aEZ4QbqkA3oD6elcC
wPf43tupk+MJf10/gtfwg5s+a9oF2Ts09+/BpUWMN5c=
=q1Rv
-----END PGP SIGNATURE-----
