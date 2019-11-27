Return-Path: <SRS0=1Eb4=Z6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA76EC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:41:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCBA206D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:41:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cs.umd.edu header.i=@cs.umd.edu header.b="fFO1r9Cq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCBA206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cs.umd.edu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 975bc729;
	Sun, 8 Dec 2019 10:41:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9d1a8ac
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 17:21:22 +0000 (UTC)
Received: from mrouter00.cs.umd.edu (mrouter00.cs.umd.edu [128.8.128.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2157eb6
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 17:21:22 +0000 (UTC)
Received: from barracuda.cs.umd.edu (barracuda00.cs.umd.edu [128.8.128.201])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mrouter00.cs.umd.edu (Postfix) with ESMTPS id 02A4182D6A81
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 12:21:20 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cs.umd.edu;
 s=mrouter00; t=1574875282;
 bh=WvUItQ5bGdvYpY0oIFV2IDPXy6H/DCwI0TE4cJOjd/I=;
 h=Date:From:To:Subject;
 b=fFO1r9Cq2D9ovrJ8DQCL98zXKCYS0qCadWzGyEe47KZRiU7qIrOdCkvrxZNQlporG
 9tAo17maHwo4XWU0Mwl66OdHy920WbIsuvazk9hVN1iW9JhSfmb/zsxYBwteGmax7N
 3PX1YutUFZ7Ur3q8ykY+3+ryZrqbRg1ZJqUuFXCQ=
Authentication-Results: mrouter00.cs.umd.edu;
 arc=none smtp.remote-ip=128.8.128.201
ARC-Seal: i=1; a=rsa-sha256; d=cs.umd.edu; s=csmx; t=1574875282; cv=none;
 b=UQq0m/paT/mdm9+Z3nUHZ7vTFZ6VlmJ+xCzhQodw+uGEt+SRnZSPTAClq9fo8x6nZrDvlcKtkKjx2zeLpuiFQVqSKRm/OcQ0P2MUXDaX/mv4PF6u5qBwve/H2YLYMMy4M+EKmCFhEOOPF5nbF/WDuasss0TvWXcyhkaey0lVn+A=
ARC-Message-Signature: i=1; a=rsa-sha256; d=cs.umd.edu; s=csmx; t=1574875282; 
 c=relaxed/simple;
 bh=WvUItQ5bGdvYpY0oIFV2IDPXy6H/DCwI0TE4cJOjd/I=; 
 h=X-ASG-Debug-ID:Received:X-Barracuda-Envelope-From:
 X-Barracuda-Effective-Source-IP:X-Barracuda-Apparent-Source-IP:
 Received:MIME-Version:Content-Type:Date:From:To:Subject:User-Agent:
 X-ASG-Orig-Subj:Message-ID:X-Sender:X-Barracuda-Connect:
 X-Barracuda-Start-Time:X-Barracuda-URL:X-Virus-Scanned:
 X-Barracuda-Scan-Msg-Size:X-Barracuda-BRTS-Status:
 X-Barracuda-Bayes:X-Barracuda-Spam-Score:X-Barracuda-Spam-Status:
 X-Barracuda-Spam-Report;
 b=D1v2Nqc6m0yLsJk1YolWEblC8PVym1xhBHelCar2WgvQASr+8rXvPP6Pomw1dVs9haPEhCPyUIqEacDRBNOZRotGJJr8+XB+F9TCKYsPZAQOxXlWpqXn5YToPAAmpgiobu1TfpaPNL8mbODSJo/byRSp5BWfOF/QrQiPCGaokoY=
ARC-Authentication-Results: i=1; mrouter00.cs.umd.edu;
 dkim=none (no signatures found);
 x-return-mx=pass (MX Record found) header.domain=cs.umd.edu
 policy.org_domain=umd.edu policy.is_org=no;
 x-return-mx=pass (MX Record found) smtp.domain=cs.umd.edu
 policy.org_domain=umd.edu policy.is_org=no; x-trusted-ip=pass
Authentication-Results: mrouter00.cs.umd.edu; dkim=none (no signatures found);
 x-return-mx=pass header.domain=cs.umd.edu policy.org_domain=umd.edu
 policy.is_org=no (MX Record found); 
 x-return-mx=pass smtp.domain=cs.umd.edu policy.org_domain=umd.edu
 policy.is_org=no (MX Record found); x-trusted-ip=pass
X-ASG-Debug-ID: 1574875280-08e7f528513aea450001-KOqj8r
Received: from smtp03.cs.umd.edu (smtp03.cs.umd.edu [128.8.127.45]) by
 barracuda.cs.umd.edu with ESMTP id bNFY7rEvbDq4ifTJ for
 <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 12:21:20 -0500 (EST)
X-Barracuda-Envelope-From: seriv@cs.umd.edu
X-Barracuda-Effective-Source-IP: smtp03.cs.umd.edu[128.8.127.45]
X-Barracuda-Apparent-Source-IP: 128.8.127.45
Received: from webmail.cs.umd.edu (jubjub.cs.umd.edu [172.24.0.33])
 (Authenticated sender: seriv)
 by smtp03.cs.umd.edu (Postfix) with ESMTPSA id 46A29801F18E
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 12:21:19 -0500 (EST)
MIME-Version: 1.0
Date: Wed, 27 Nov 2019 12:21:19 -0500
From: Sergey Ivanov <seriv@cs.umd.edu>
To: wireguard@lists.zx2c4.com
Subject: RHEL-8.1 compile problem
User-Agent: Roundcube Webmail/1.4.0
X-ASG-Orig-Subj: RHEL-8.1 compile problem
Message-ID: <6c0d375eec6dddfcff8040df3a34e69a@cs.umd.edu>
X-Sender: seriv@cs.umd.edu
X-Barracuda-Connect: smtp03.cs.umd.edu[128.8.127.45]
X-Barracuda-Start-Time: 1574875280
X-Barracuda-URL: https://barracuda01.cs.umd.edu:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cs.umd.edu
X-Barracuda-Scan-Msg-Size: 2556
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No,
 SCORE=-2.02 using per-user scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=1000.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.78298
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Approved-At: Sun, 08 Dec 2019 11:41:06 +0100
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
Content-Type: multipart/mixed; boundary="===============7924459130853804172=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)

--===============7924459130853804172==
Content-Type: multipart/signed;
 protocol="application/pgp-signature";
 boundary="=_779f76d26194576724dfdd25a88beced";
 micalg=pgp-sha1

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)

--=_779f76d26194576724dfdd25a88beced
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8;
 format=flowed

Hi,
I have used wireguard version 0.0.20191012 on RHEL-8.0, but after
upgrade to RHEL-8.1 with kernel 4.18.0-147.el8.x86_64 dkms failed
to install to the new kernel. I am trying now to reinstall
manually compiling from tag 4.18.0-147.el8.x86_64:
===
sh-4.4$ git clone https://git.zx2c4.com/WireGuard
Cloning into 'WireGuard'...
...
Resolving deltas: 100% (8471/8471), done.
sh-4.4$ cd WireGuard/
sh-4.4$ git checkout 0.0.20191127
Note: checking out '0.0.20191127'.
...

HEAD is now at 7fc30dd version: bump snapshot
sh-4.4$ git checkout -b b_0.0.20191127
Switched to a new branch 'b_0.0.20191127'
sh-4.4$ cd src/
sh-4.4$ make
   CC [M]  /var/home/seriv/work/git/WireGuard/src/main.o
In file included from <command-line>:
/var/home/seriv/work/git/WireGuard/src/compat/compat.h:342:20:
error: static declaration of ‘rng_is_initialized’ follows
non-static declaration
  static inline bool rng_is_initialized(void)
                     ^~~~~~~~~~~~~~~~~~
In file included from
/var/home/seriv/work/git/WireGuard/src/compat/compat.h:330,
                  from <command-line>:
./include/linux/random.h:40:13: note: previous declaration of
‘rng_is_initialized’ was here
  extern bool rng_is_initialized(void);
              ^~~~~~~~~~~~~~~~~~
In file included from <command-line>:
/var/home/seriv/work/git/WireGuard/src/compat/compat.h:835:23:
error: redeclaration of enumerator ‘NLA_UNSPEC’
  #define NLA_EXACT_LEN NLA_UNSPEC
                        ^~~~~~~~~~
./include/net/netlink.h:184:2: note: in expansion of macro
‘NLA_EXACT_LEN’
   NLA_EXACT_LEN,
   ^~~~~~~~~~~~~
In file included from ./include/net/rtnetlink.h:6,
                  from ./include/net/sch_generic.h:17,
                  from ./include/linux/filter.h:24,
                  from ./include/net/sock.h:64,
                  from ./include/linux/tcp.h:23,
                  from ./include/linux/ipv6.h:106,
                  from ./include/net/ipv6.h:16,
                  from 
/var/home/seriv/work/git/WireGuard/src/compat/compat.h:874,
                  from <command-line>:
./include/net/netlink.h:166:2: note: previous definition of
‘NLA_UNSPEC’ was here
   NLA_UNSPEC,
   ^~~~~~~~~~
make[2]: *** [scripts/Makefile.build:313:
/var/home/seriv/work/git/WireGuard/src/main.o] Error 1 make[1]:
*** [Makefile:1547:
_module_/var/home/seriv/work/git/WireGuard/src] Error 2 make: ***
[Makefile:38: module] Error 2
-- 
   Regards,
   Sergey Ivanov

--=_779f76d26194576724dfdd25a88beced
Content-Type: application/pgp-signature;
 name=signature.asc
Content-Disposition: attachment;
 filename=signature.asc;
 size=836
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJd3rCPAAoJEDJw2arZLRXOrdEP/iZ3SjgxVTSs8r7+8KqijMzq
+hOdbxLxVRYvuL5X60IMJvd0I1THg3CjdXJwtgTjZxNzGUhXfKNHsXZh5yLjZsmG
HGGnkMv6WtBORGyLtsaEwmYUZmuXTvZ4kXiC6pNOfL14WTE+KyO0SzBYDLfvheYL
34MHC5qJjoP+WFiISiSF98v7irPYEiYf+APiyXm6X9z2epCahyRY+zslZvbt3ZV9
avUS9ADdus6yq2n4Wp1SLc4TMnDxIgdlRJbnzr93GiSM0SfE+Q97IqK0iNXBDS+B
06UilDmIjST2hMjBCPUwmLDppTBoeT+HIo3CGrEcKjbtJvzwGZiEfRm19Cu4d9gp
eli7rXuH5MjrYF0osdID3/dP9Yg3R7WI5T3HuXEvQij+F/NpgFKyM4ZAHwP6e6if
MSqflhxlSKmwASBQ2qDTMsfLN2DsF5HI8e4XJ9LMrTUdaMuKrXG3ezVbfSkVIfnL
h7n/HsAisZpnS5T3PLqHHcO5q+bJRNyURAmgOoMUJC4+GFTlpM/bm7h3Iu18m122
rXO5zj+iY9Ez1j3nRoiDGzRn0VM26zDTa1UlGDRUWMlKc/7JXUSRnu8i9oy8L4yp
gg/1e0+sWkWQMnmt0kWS+C/rQgqdEoutEMFPNxYRfulxcmyxUwFa3TQ2pQmY4/6O
5StPE7omlUgGEmcdqeUh
=ZpPg
-----END PGP SIGNATURE-----

--=_779f76d26194576724dfdd25a88beced--

--===============7924459130853804172==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7924459130853804172==--
