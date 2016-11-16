Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bea1e384
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 20:45:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0ffb338
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 20:45:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fe09f581
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 20:45:45 +0000 (UTC)
Date: Wed, 16 Nov 2016 21:48:35 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <cec8808b1779fac9@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161116.1`
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

A new experimental snapshot, `experimental-0.0.20161116.1`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  The earlier snapshot today broke some builds on kernels <= 4.3. Packagers only
  need to bump versions for this single commit if distribution kernels use <=
  4.3. Sorry for the inconvenience.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161116.1.tar.xz
  SHA256: 730d9d919e1942cf83e59dcb8c6ee6ac6696c62ce363c4802474774a5db8238d

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYLMYdEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA67lEQ//
cnsPZPkxaKPCPOB1e26QJgH9SrCVvNanQA7EZTqWd7nH9n6u86TtrFFoGu3uqLR6
PqHczaEkYzH0rWXwX+tQgtMS6IbprA54hEzMMAFBiTfymkYpbU5A5oDAUTOfuZNm
T4wnCE1VVtzc7aac2gx4FOOewJL2imV7+TvtSvvOgycWA3EKD1KmKfp89nv9QzRo
NDhGMjBzTjZ2LZt/V3+TCbo8War2eNNaz9TuFN10iMCrrJd1c1B8Sst67fjqS6F5
uDv0cCTYqrE11q7HWlFri77A3KcG/rp/DwDBBFEpjIXpoTlD7OWCctxdsT0W9bsZ
3uACS+wBmnqoDWe4zDtx5jSUq+reRgbcdGeA0hkhq2Z+nD7CAqkS1FyRpqOQGrxc
4XUt2agTPxCe/E3PctZ3eDSNf2scL+kX+d1VbDhcq/++Wr/KhaUwj+FysdYL70Bk
pb0Yl/E8Xqp9aMmdR9OteQxGU/VUcNq/1rO1HmyFbJbafKEyDNN/JPVs8PX1EzW7
YGPHz8gb6GB6OFLyIOUNq8NhtXNZb4s529jAoPFdnHFroQHZAiv0hi9E5iMICECl
qmc4pWI8KRcbLujiordT1Eld1RDr+J9MHXvGpJt9xpmaok5PaD8u3sivbhzWRlVB
5zSRWJ0CzXPRdJS1r3Ep/TRhL5dij6AvpCM6+myDFag=
=bJmA
-----END PGP SIGNATURE-----
