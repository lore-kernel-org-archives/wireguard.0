Return-Path: <SRS0=PPAX=MS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033A0C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 02:43:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24B1920834
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Oct 2018 02:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="shn4On3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24B1920834
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7e75451;
	Sat, 6 Oct 2018 02:43:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f54460dd
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 02:43:07 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b175402
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 02:43:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02f22217
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 02:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:to:from
 :subject:mime-version:content-type; s=mail; bh=QXR8MlB5V+pvbbAB1
 Qyo3pHyKmc=; b=shn4On3AglyY8WcE9SpKTfsfpGwNLswWxpNZVAaDZ12BTNrSh
 TfiGzHn6pXVYAWB55jsfC4MoreeyIU3H7RR5NjMcqaaxYcvBeVtGL+mOflXTxIJC
 JfZiEuP8JWAC/O1Tf5nbTkPKsV9GEFufPDPMLh+M+tC+x0dgJ964w1XgbkSr2hVy
 iZMbVlgF2jQEdaH0eM/5QJFM6lP3esBFIr2JDMCGGRaf7ew5zd2dscmtLh1D+XL6
 G9+mn+oNBjZLqwrgICWaAVum/RVCXSf3XQC+LWyVRLPcGDIKTfOaqwzJDtDEZA6z
 nZyZaKz42pu64Y6jetFMJahfE2tcq782GZ75w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d45a298a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 02:43:07 +0000 (UTC)
Date: Sat, 06 Oct 2018 04:43:30 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20181006` Available
MIME-Version: 1.0
Message-Id: <6b30b44a408f5199@frisell.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20181006`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevant changes.

== Changes ==

  * Account for big-endian 2^26 conversion in Poly1305.
  * Account for big-endian NEON in Curve25519.
  * Fix macros in big-endian AArch64 code so that this will actually run there
    at all.
  * Prefer if (IS_ENABLED(...)) over ifdef mazes when possible.
  * Call simd_relax() within any preempt-disabling glue code every once in a
    while so as not to increase latency if folks pass in super long buffers.
  * Prefer compiler-defined architecture macros in assembly code, which puts us
    in closer alignment with upstream CRYPTOGAMS code, and is cleaner.
  * Non-static symbols are prefixed with wg_ to avoid polluting the global
    namespace.
  * Return a bool from simd_relax() indicating whether or not we were
    rescheduled.
  * Reflect the proper simd conditions on arm.
  * Do not reorder lines in Kbuild files for the simd asm-generic addition,
    since we don't want to cause merge conflicts.
  * WARN() if the selftests fail in Zinc, since if this is an initcall, it won't
    block module loading, so we want to be loud.
  * Document some interdependencies beside include statements.
  * Add missing static statement to fpu init functions.
  * Use union in chacha to access state words as a flat matrix, instead of
    casting a struct to a u8 and hoping all goes well. Then, by passing around
    that array as a struct for as long as possible, we can update counter[0]
    instead of state[12] in the generic blocks, which makes it clearer what's
    happening.
  * Remove __aligned(32) for chacha20_ctx since we no longer use vmovdqa on x86,
    and the other implementations do not require that kind of alignment either.
  * Submit patch to ARM tree for adjusting RiscPC's cflags to be -march=armv3 so
    that we can build code that uses umull.
  * Allow CONFIG_ARM[64] to imply [!]CONFIG_64BIT, and use zinc arch config
    variables consistently throughout.
  * Document rationale for the 2^26->2^64/32 conversion in code comments.
  * Convert all of remaining BUG_ON to WARN_ON.
  * Replace `bxeq lr` with `reteq lr` in ARM assembler to be compatible with old
    ISAs via the macro in <asm/assembler.h>.
  * Do not allow WireGuard to be a built-in if IPv6 is a module.
  * Writeback the base register and reorder multiplications in the NEON x25519
    implementation.
  * Try all combinations of different implementations in selftests, so that
    potential bugs are more immediately unearthed.
  * Self tests and SIMD glue code work with #include, which lets the compiler
    optimize these. Previously these files were .h, because they were included,
    but a simple grep of the kernel tree shows 259 other files that carry out
    this same pattern. Only they prefer to instead name the files with a .c
    instead of a .h, so we now follow the convention.
  * Support many more platforms in QEMU, especially big endian ones.
  * Kernels < 3.17 don't have read_cpuid_part, so fix building there.

This snapshot contains commits from: Jason A. Donenfeld and Nathan Chancellor.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181006.tar.xz
  SHA2-256: 9fe7cd5767eda65647463ec29ed707f917f4a77babaaf247adc4be7acaab4665
  BLAKE2b-256: 36bf22455e948a436820fe3701d6c932eb3df9a39df88a8983f1b05b2a281f69

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181006.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlu4IUUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drk2cEADG9ohn34/4DYH2Ix7eVF7gi9AjAIPULMsk
danY2JasKYyvmwPQcAKm95mSE459h3hPkx7NUfsCYx/a680TOH6JDslPeM2Xg1pd
G9Ot0KByvwNZT9pzeyvl+iJ3bNbX+apABxPvi+0Y1L9M3KBS2zYCg+Hwp0bps8vh
paFN53kfbXKRUTX9sR8tua1/bdVF5HiypApoOLuzhoVyBNRzP8zHpYP5tWtkXVUf
WCcFjWVLtL6uu1u1TXvg3SoNEz6GxzP8mrHXPntwJw31sdbgyGiuGlHAyWS5q70B
HFuENwKHmL+TXStFFR+fxu39RJtw815Jmo3wHo/P93itCqURscd0S+/mZel4M0Nb
MzbguRXChl0BPBN5N0JPOwX2RwFHqv3wqorOvFZvYzUvMYQRlyxEF1oE4eOlRhDi
8IgcoM2o8hOw7Y/8Ap6RGHV7Vs31L0J/gymJc4Au0yNHgqpNDiQweQWd4K01Kn9m
hKvfe4SmbxAyeOjCK4y3GYuCqPC1rBaQKeFXu0CcEomjxwqk+IYO4JX4mz2na7Ze
K8EUa8Gfl2PM9GQitg0VsZohIzix4IPYRySAS63aLJ3yPXeH9aes6qNfPvb9uiM0
sJt+sl+BPEPz6Ac8N7V/aPSVE6x/69a8zN2I+EDYpxMLMivKz7gLF1FCLsSY30n8
a1KYXxi0xQ==
=AmrD
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
