Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46621396
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 17:38:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96ee8191
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 17:38:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d9e8061
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 17:37:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3bb2c01f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 17:37:02 +0000 (UTC)
Date: Mon, 25 Jun 2018 19:43:41 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180625` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b9a6437166de1df9@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180625`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * receive: don't toggle bh
  
  The last snapshot caused a big performance regression, which we partially
  revert here. This general matter, though, will be revisited in the future,
  perhaps by switching to NAPI.
  
  * main: test poly1305 before chacha20poly1305
  * poly1305: give linker the correct constant data section size
  
  While the default bfd linker did the right thing, gold would sometimes merge
  section incorrectly because of an incorrect section length field, resulting in
  wrong calculations.
  
  * simd: add missing header
  
  Fixes a compile error on a few odd kernels.
  
  * global: fix a few typos
  * manpages: eliminate whitespace at the end of the line
  * tools: fix misspelling of strchrnul in comment
  
  Cosmetic fixups.
  
  * global: use ktime boottime instead of jiffies
  * global: use fast boottime instead of normal boottime
  * compat: more robust ktime backport
  
  We now use the equivalent of clock_gettime(CLOCK_BOOTTIME) for doing age
  checks on time-limited objects, such as ephemeral keys, so that on systems
  where we don't clear before sleep (like Android), we make sure to invalidate
  the objects after the proper amount of time, taking into account time spent
  asleep.
  
  * wg-quick: android: prevent outgoing handshake packets from being dropped
  
  Recent android phones block outgoing packets using iptables while the system
  is asleep. This makes sense for most services, but not for a tunnel device
  itself, so we work around this by inserting our own iptables rule.

This snapshot contains commits from: Jason A. Donenfeld and Jonathan 
Neuschäfer.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180625.tar.xz
  SHA2-256: d9bedeb22b1f83d48581608a6521fea1d429fbeb8809419d08703ef2ec570020
  BLAKE2b-256: 00c97585c6f3ccfaad5f2f19ab7fb70c8a24e8df0cf4025ac212fbf31b683a08

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlsxKakQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrnEmD/9nkrdO/kw625mZ0mOmz+re+4Ml5T3k6qeh
xMmrr6qi8HXKPxyH8lhqaIrlo3CpdTNqWctuig8Z0saIiHsy9/tBgDluoqXrFFXH
pKsU1WF98442uxvJr7UkQ+c+qsococnlTANLwIvp4dN4Y+w4ljqFzMDrpNAc+R0H
FDBNYS0IpoawVG+/sx8i5GsUNY4o6tsrK4/JqKGQG9H0wyUPqFYfkUAiAXCurrZd
Q9LWtAq/Iitpr/tRTRXx+fsI+CKBvntD5SZWo4564BtEtL/KnWol2sIlRH9k6849
aJaD49ETJowwvOir5K4cqwc2RkbpcVsXjoWAsaiP/B66msGLYLWkAQFHB/pReut9
CmoPEn6mKR/7BF0Pc/wQAVVLn/hK3m2P4G5N6obm2WLPh5VxrvM0lw1tGCCDgHtj
Q3nwlgS3DtS8lOZxKLdImmBE8dGZL3zoF9PxTwy1+I41+tmyO6BqTa3zdtdDeM85
Vc9fVieC01EF2iDb0bLuWb7HUe/6U0HeiM5/ZJMQvFRSskfRpcB5tDbnStNWkg0k
DjdHsUWsIpykKSJk1il+DK4fjHTn5pEivThact1xCHQpW8ccxMG+pVNIcQs5cfcB
qaqgs+IQ2Eu7PNJktiltQZxrwyFBDBb9mARc8PggMvdEZv8TOJ78sFe6vUL3H4dS
hHiQOJpy4A==
=U9LN
-----END PGP SIGNATURE-----
