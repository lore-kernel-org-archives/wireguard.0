Return-Path: <SRS0=sGqt=WP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EE0C3A5A0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Aug 2019 22:24:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C93B214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Aug 2019 22:24:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=permerror (0-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="3XgbL+3x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fifthhorseman.net header.i=@fifthhorseman.net header.b="hKOqSJKg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C93B214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fifthhorseman.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a21339c;
	Mon, 19 Aug 2019 22:24:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3755e7db
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 22:24:02 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6e24a69
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Aug 2019 22:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/simple; 
 d=fifthhorseman.net; i=@fifthhorseman.net; q=dns/txt; 
 s=2019; t=1566253441; h=from : to : subject : in-reply-to 
 : references : date : message-id : mime-version : 
 content-type : from; 
 bh=lVEZRjXdiz0GzhxZ4Opg1fwZrEf2gTJBPBymLtpv0lU=; 
 b=3XgbL+3x2yRnVZs5Fe81OmvAQpFK/CElO5BcxwgA8Gys96ldMnAk7nm6
 Y5NGMcic6VtDt3owMSWo1hRlFlsEAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fifthhorseman.net; 
 i=@fifthhorseman.net; q=dns/txt; s=2019rsa; t=1566253441; 
 h=from : to : subject : in-reply-to : references : date : 
 message-id : mime-version : content-type : from; 
 bh=lVEZRjXdiz0GzhxZ4Opg1fwZrEf2gTJBPBymLtpv0lU=; 
 b=hKOqSJKghvyxNSSF1hoawNL+bYBW38qy2IxJoZn447xYzooRZce0kY09
 I4BHLHeXOOgpz81iomRrOoGInCuuII+uYX/DjtPJvyBBaYnc87Bm+1tOoO
 /QmSUEXh4r++DVFJ4ihL6KPnhnF22mxSNQ5EXei2rGry0RylKpDbawopkW
 g8kRclC0VIM1Vz6vsAE/ONIYv0qMnN5IrMw8Caqqobc2Qp1ICRHO/n3hN0
 uvtmQTDsOrZvsMIP/Vz5mn4VhkgMvHhHcEyNXp22V1pnFtaFRNtVvIk6gJ
 mmejljuP0N/4g7MaGwDNqMVMrCflhChlH7rKmgnwEifiJ7J05SJBYg==
Received: from fifthhorseman.net (unknown [38.109.115.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by che.mayfirst.org (Postfix) with ESMTPSA id 58612F99D;
 Mon, 19 Aug 2019 18:24:01 -0400 (EDT)
Received: by fifthhorseman.net (Postfix, from userid 1000)
 id DA86920345; Mon, 19 Aug 2019 18:23:58 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Markus Grundmann <markus@activezone.de>, wireguard@lists.zx2c4.com,
 934763@bugs.debian.org
Subject: Re: Debian 4.9.0.9-amd64 :: DMKS failed
In-Reply-To: <a8490bd3-e273-6431-6ca5-5fc4bba0ce19@activezone.de>
References: <a8490bd3-e273-6431-6ca5-5fc4bba0ce19@activezone.de>
Autocrypt: addr=dkg@fifthhorseman.net; prefer-encrypt=mutual; keydata=
 mDMEXEK/AhYJKwYBBAHaRw8BAQdAr/gSROcn+6m8ijTN0DV9AahoHGafy52RRkhCZVwxhEe0K0Rh
 bmllbCBLYWhuIEdpbGxtb3IgPGRrZ0BmaWZ0aGhvcnNlbWFuLm5ldD6ImQQTFggAQQIbAQUJA8Jn
 AAULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBMS8Lds4zOlkhevpwvIGkReQOOXGBQJcQsbzAhkB
 AAoJEPIGkReQOOXG4fkBAO1joRxqAZY57PjdzGieXLpluk9RkWa3ufkt3YUVEpH/AP9c+pgIxtyW
 +FwMQRjlqljuj8amdN4zuEqaCy4hhz/1DbgzBFxCv4sWCSsGAQQB2kcPAQEHQERSZxSPmgtdw6nN
 u7uxY7bzb9TnPrGAOp9kClBLRwGfiPUEGBYIACYWIQTEvC3bOMzpZIXr6cLyBpEXkDjlxgUCXEK/
 iwIbAgUJAeEzgACBCRDyBpEXkDjlxnYgBBkWCAAdFiEEyQ5tNiAKG5IqFQnndhgZZSmuX/gFAlxC
 v4sACgkQdhgZZSmuX/iVWgD/fCU4ONzgy8w8UCHGmrmIZfDvdhg512NIBfx+Mz9ls5kA/Rq97vz4
 z48MFuBdCuu0W/fVqVjnY7LN5n+CQJwGC0MIA7QA/RyY7Sz2gFIOcrns0RpoHr+3WI+won3xCD8+
 sVXSHZvCAP98HCjDnw/b0lGuCR7coTXKLIM44/LFWgXAdZjm1wjODbg4BFxCv50SCisGAQQBl1UB
 BQEBB0BG4iXnHX/fs35NWKMWQTQoRI7oiAUt0wJHFFJbomxXbAMBCAeIfgQYFggAJhYhBMS8Lds4
 zOlkhevpwvIGkReQOOXGBQJcQr+dAhsMBQkB4TOAAAoJEPIGkReQOOXGe/cBAPlek5d9xzcXUn/D
 kY6jKmxe26CTws3ZkbK6Aa5Ey/qKAP0VuPQSCRxA7RKfcB/XrEphfUFkraL06Xn/xGwJ+D0hCw==
Date: Mon, 19 Aug 2019 18:23:58 -0400
Message-ID: <87d0h0g5fl.fsf@fifthhorseman.net>
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============6603894106800394727=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6603894106800394727==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

On Mon 2019-08-19 14:06:37 +0200, Markus Grundmann wrote:
> This is a new debian VM running on BHYVE. After the installation and
> upgrading operating system the following DKMS fails.

This is https://bugs.debian.org/934763, which i'll work around shortly
with the attached patch to the wireguard packaging in 0.0.20190702-2.
Thanks to Jason for supplying the attached patch to update the
compatibility checks.

Note that if you apply the attached patch to wireguard and build against
4.9.168-1+deb9u5, but then try to load the module on a system running
4.9.168-1+deb9u4, the module will fail to load with unrecognized
symbols, due to the weird state of the backported siphash (but no
hsiphash).

          --dkg


--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline;
 filename=0003-compat-fix-on-debian-4.9.168-in-sloppy-manner.patch
Content-Transfer-Encoding: quoted-printable

From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 15 Aug 2019 06:37:10 +0000
Subject: compat: fix on debian 4.9.168 in sloppy manner

Ben backported siphash but forgot to backport hsiphash,
which goes into the same .h and .o files, making a proper
compat layer for it kind of cumbersome and annoying. Since
he plans to backport hsiphash for 4.9.169, this commit is
a stop-gap solution for the Debian package.
=2D--
 src/compat/compat.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index 239fa58..7fc3145 100644
=2D-- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -844,6 +844,12 @@ static inline void skb_mark_not_on_list(struct sk_buff=
 *skb)
 #define cpu_have_named_feature(name) (elf_hwcap & (HWCAP_ ## name))
 #endif
=20
+#if LINUX_VERSION_CODE =3D=3D KERNEL_VERSION(4, 9, 168)
+#define hsiphash_2u32 siphash_2u32
+#define hsiphash_3u32 siphash_3u32
+#define hsiphash_key_t siphash_key_t
+#endif
+
 /* https://github.com/ClangBuiltLinux/linux/issues/7 */
 #if defined( __clang__) && (!defined(CONFIG_CLANG_VERSION) || CONFIG_CLANG=
_VERSION < 80000)
 #include <linux/bug.h>

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQTJDm02IAobkioVCed2GBllKa5f+AUCXVshfgAKCRB2GBllKa5f
+Ih3AQCtkqSWc1e93nPypBvbZ2+qlbkaiMRNDvVI/LJzu978BQD/bnPM49TxzIFW
9cZCzKIUQW/BWF2xLsXX8Gnmtocykw0=
=eFSW
-----END PGP SIGNATURE-----
--==-=-=--

--===============6603894106800394727==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6603894106800394727==--
