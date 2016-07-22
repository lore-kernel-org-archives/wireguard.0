Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67983d8f
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 23:12:47 +0000 (UTC)
Received: from fifthhorseman.net (unknown [108.58.6.98])
 by che.mayfirst.org (Postfix) with ESMTPSA id BB226F99B
 for <wireguard@lists.zx2c4.com>; Fri, 22 Jul 2016 19:14:53 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <87bn1pmjda.fsf@alice.fifthhorseman.net>
References: <87bn1pmjda.fsf@alice.fifthhorseman.net>
Date: Fri, 22 Jul 2016 19:08:16 -0400
Message-ID: <87oa5pl19b.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Subject: Re: [WireGuard] new build process doesn't work with debian's dkms
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Fri 2016-07-22 17:51:45 -0400, Daniel Kahn Gillmor wrote:

> i'm trying to package wireguard experimental-0.0.20160722 for debian, and it looks
> like the new Kconfig/Kbuild/Makefile revamp from
> 3106d632de4235f8c6d63d602fe2fa9e0175d690 causes the version of dkms to
> not be able to build it automagically.

uh, please chalk this up to lack of sleep and general delirium, it's all
working fine when i remember to actually ship Kconfig and Kbuild :)

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXkqdgXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKVqEQAI5Xe0geY6JKSLck9MUQePDT
EHt9c20WusUIt7/agHv6i37Ztapf7Bt0EB9VzoHYEKXMfcSoNt84iRGc0juV8DR0
+zsOHdQMSn+s7L+/Tff6eoRQG3+vMQ4An8Z6zP0W33kklGmf5CelOcmGIZqG+UUh
DYtZdM+DbkhuFL1e6UKzO792aPxhan3W+7A3yYa3+IMTIY39GvMjTuOiwhFOfEO8
BjKMLNAN8y5QvLfbGSTYUsrhJZH6hTjeyJ0ZUMwsw3T70q0Wa9acsAXR3TUr2BZ8
PauJ7DM6fS7JyVBmcBHMJ+jpXoPap96NC6Mb9MUaTvuU5zRLS+5zGtliyg/Iq7DF
OD52lLUx7vkX3GVmcm7cOd1RpRJXVY60JJHIIT69I9LLXqHE8eqZ0D3L7fIx2SLG
3dfJEpIMvLwlWkD4F2fjILYWoV99d1pPoOvp/lv3Xs6tlhA43cjhlO7+1KPdLznV
hWamYNdNT+2kXVHkPPUBI6yjFJA7wDMZWaooFL8zRDin5T6s2k6A0n6JcrtZHlnf
7TDZ47RkgCoVrQjc64XT/Ko8GaIsCPcWOm/uAzY50WeXy3+vrTSpDOwzp068kAb2
w+R0hLe6S8h8psrtVaPoExYrTdJ5ylsDgwNqywBwG44cEqF0Kc0T75a2whIUDcdR
h6i9mj3fazmkCtfKUYlH
=u1Yx
-----END PGP SIGNATURE-----
--=-=-=--
