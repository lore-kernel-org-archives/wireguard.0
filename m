Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceea5c4f
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 10:44:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b6d1a9b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 10:44:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acfd8cf5
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 10:43:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5a37361b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Feb 2017 10:43:59 +0000 (UTC)
Date: Tue, 14 Feb 2017 11:58:09 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20170214` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0a706c552ce5da44@frisell.zx2c4.com>
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

A new snapshot, `0.0.20170214`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * wg-quick: unquote fwmark for bash 4.3
  
  Whoops. This is a super quick snapshot to unbreak things on
  machines running old bash. Sorry about this.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20170214.tar.xz
  SHA2-256: 1e4ee213d2a5ac672c952c59e9c64d6d7d5dc3e21c003aee30d75208237e8bf5
  BLAKE2b-256: 1d3c934d020a2daa984d1002f7dbcebaa3c0f57d295e9b975b1322a0e6d74a4a

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlii4rwQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrtLoEACeA9oTyVMFMxDWnAtbqwln/qR0iPWu6XeJ
pcAwusz+1OrZGt446PJbMaohILa7IH0Fm33foJr2vRjKD4rJTvClk4cnUZDnl1hX
Pr0qKP+4vQVPwB4RlNxHKgJIgvTVJQysk/f90hHZQZth1+cNBV+VSbP/4rmoW8YZ
FKLFRqe5C+U7BAS1StGZLJA+PFmkKWRDHEDMc89CdvdqKFJ3F2UVNvbZ/s3iwies
+IQseT7Sqqow04blnvADqOcUvf3cWRyqA9LPkX9HLUG5C+1GeZ+/Cjlo+2H1bdrT
MQibWWv6UbZNfINeWUgrXwU6MKW1Yo4ZpuCsLG932zdESGkDHHpYQbl65Y0Av/On
n52nkaKxh5pkK9/10UtzCMYlhTV2sLlZ9Pz6+r5ZCcwGdNolykrg7+7iq6ZVTo7B
Xoeiu0RAuh9vlXWXIEEHzqlASXeRDr68qqYKnAu7JvE03qcFXx1ycVdCXfs8/ON8
7q5LsHte4AmKCj/pB2rPg3vJVkAVRKNsz4QJ316ToOBsfao6FLrE3M40u8TTDI8W
P76oObeOQ7bkivjjJDpWyvLmnVHwqR1CMLBY7d7N7yN1DATLvEShp23O82bvOcec
tfmeutPBBdHjwptNqAYD22jwem1RQjmWd4lE8trMHGtSWcpIAyqULxrWRldn33AC
7uxubU9HVw==
=3aw0
-----END PGP SIGNATURE-----
