Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3de4b987
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 02:41:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d43bf73d
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 02:41:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfcdbd61
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 02:41:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74ecbcf7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 02:41:20 +0000 (UTC)
Date: Thu, 05 Jan 2017 03:50:21 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `0.0.20170105` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <79cef0703bec324a@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170105`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * tools: add bash completion for wg(8)
  * tools: add wg-quick
  * tools: add makefile instructions
  * tools: add systemd unit and auto-detection
  
  This is an all-tools release. The new wg-quick tool
  could use some testing and exposure, so we're posting
  this snapshot a bit early to solicit feedback.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170105.tar.xz
  SHA2-256: 1bd990eeae6fbf599ccddde81caa92770f58623ad9705f875bcfab8254583896
  BLAKE2b-256: f379135a162e37e1b76a6510396ae9ceeae1f9f6d7b1b1cc198942447b7f5382

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlhttEwQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drg7iEACrwA/2KuVUi5dxzkrq6Lss1GkNIqpy2ecg
nXH9A2IhnKv4uuf8oENdmQCEC/1P1kJaWXpV8GitbPAimAYLMfKciqX/Vag9h3XO
u61pPO+BrqHFjEiZTe8RAA4GAW1Szd8L2JcpCtXqjuau+KcbQKiPXwJaYMX7NH3R
GqQep+S5fzI4yAVJgf8Lfj0/1CfXtZ7Wgf2hMGagnPN6ihSBWyZCbQHDiSECDoKG
cSMZRAsEl62c7w+C0qFZYRgTwfIynw3KaiZPyF6dnZ9FtyU9xTBHN5hOjOtVEaDA
C0NpedM2CvvVx0/tZrNm+ktdBwPbgTM55bPV1gimggmWCrHsb1+EJ63KaHZHhAGn
dQPkJaqiZ6QB5M/zbUoLS5LyJ6pBSEsdOXZFIXdJ4u2aLFDT4z4vwncUAqWbivdY
Q9+Xs2aY5YgSD1c/bvifUKWvA/bDd6RLtT3XeV1zlkvV1BCk0gpXwzM0SF86Ce9z
cA6ov4V6rBKrKt7alQ5yY0Atrb9STkRbldHmUs/iUBFCgV7y1mSqfKBUxdI/0hgO
4W8NjYR7r13whkk/d19ErrzPZQIq9M8PH149+MlPHJd1E/vL+h0la3g2M+Tj43P7
Zw2nq7wdUd/heOMJZf7a5TWa6BhfKNqMVYb5JfGqutisJO/ct3zvwhKBJWLgmKxe
Ig1Ie8kkGg==
=35v5
-----END PGP SIGNATURE-----
