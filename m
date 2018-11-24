Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A33FC04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:20:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E46A3205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="Ljzg552g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E46A3205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ba254c3;
	Thu, 6 Dec 2018 23:08:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0af93d06
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Nov 2018 22:27:42 +0000 (UTC)
Received: from pv33p03im-asmtp002.me.com (pv33p03im-asmtp002.me.com
 [17.143.180.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b06942b3
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Nov 2018 22:27:42 +0000 (UTC)
Received: from process-dkim-sign-daemon.pv33p03im-asmtp002.me.com by
 pv33p03im-asmtp002.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) id <0PIP00100YHM5900@pv33p03im-asmtp002.me.com> for
 wireguard@lists.zx2c4.com; Sat, 24 Nov 2018 22:34:21 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=04042017;
 t=1543098861;	bh=DZLEgOAJEr4y8yQtgA0bz1X/1FGnQHs7+zHHMipTu3c=;
 h=From:Content-type:MIME-version:Subject:Message-id:Date:To;
 b=Ljzg552geBj60cQlCmYeXRN7Qi/v0zzBOF+MyrqzOCNEIy049VjkFV1LPJSozAz6f
 w8xxUVYWcypY5xpJU8gdhRCdA1zG0e1ryBsSQHE5Suw/lv5VdzyfpYkUQkD4F0UWS+
 nP646VUHr3mxgrzkdFy6B8XjVT8LjITLMy8UTU2jv9A4iA4sfS3M0OAti4u3J2FimK
 eK8Z/3CWdcWxSEaam4Y8DhQ1CNYldMJMoSVS4epEpjUbcRk8S98jP0n2Fm38kSgP7Z
 PQO4NW467LMlVIK5xGYNN6/B0O4+P44PSlbkcftTZppOJlXDutSu0bwpUnoEguAYVn
 zVXxC48ncW7SQ==
Received: from icloud.com ([127.0.0.1]) by pv33p03im-asmtp002.me.com
 (Oracle Communications Messaging Server 8.0.2.2.20180531 64bit (built May 31
 2018)) with ESMTPSA id <0PIP008LMYP5VR10@pv33p03im-asmtp002.me.com> for
 wireguard@lists.zx2c4.com; Sat, 24 Nov 2018 22:34:20 +0000 (GMT)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxscore=0
 mlxlogscore=953 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1807170000 definitions=main-1811240213
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,,
 definitions=2018-11-24_19:,, signatures=0
From: Lee Yates <rainmakerraw@icloud.com>
MIME-version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: 'Forgotten' interface names
Message-id: <C6A2AF48-EEDF-4257-BF1F-3E28A6A4FB74@icloud.com>
Date: Sat, 24 Nov 2018 22:34:16 +0000
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3445.101.1)
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:08:53 +0100
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
Content-Type: multipart/mixed; boundary="===============8489985199684990950=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8489985199684990950==
Content-type: multipart/signed;
 boundary="Apple-Mail=_30103047-1B79-41BD-BB01-2AA2C079E142";
 protocol="application/pgp-signature"; micalg=pgp-sha256


--Apple-Mail=_30103047-1B79-41BD-BB01-2AA2C079E142
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi everyone,

I=E2=80=99ve been using wg-quick on macOS for quite some time now, and I =
install/update using Homebrew (in case that=E2=80=99s relevant). When my =
MacBook Pro recovers from sleep, or has been connected to a tunnel for a =
long while, the output of =E2=80=98sudo wg show=E2=80=99 changes and - =
lacking a better way to explain - has =E2=80=98forgotten=E2=80=99 the =
interface/VPN name.

For example, if I connect to AzireVPN and issue =E2=80=98sudo wg show=E2=80=
=99 I will see:

interface: azirevpn-uk1
  public key: OEvWF8cPiqsBxevKubnz/AbMxsZmBJvBRE35PItYZUw=3D
  private key: (hidden)
  listening port: 53821

But after recovering from sleep, or if the tunnel has been up a long =
time, it changes to:

interface: utun1
  public key: OEvWF8cPiqsBxevKubnz/AbMxsZmBJvBRE35PItYZUw=3D
  private key: (hidden)
  listening port: 53821

Is this a bug, a feature, or something else? It=E2=80=99s not the end of =
the world, but since I have access to multiple VPN endpoints I always =
end up having to =E2=80=98curl ipinfo.io=E2=80=99 to remind myself to =
which service I=E2=80=99m connected (eg if I=E2=80=99m doing something =
that needs a public IP, or an IP in a particular country). It=E2=80=99d =
be nice if the interface name was always remembered, as it is on Linux.

Best wishes,

Lee

--Apple-Mail=_30103047-1B79-41BD-BB01-2AA2C079E142
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEExF+G9PyiAB1cKHnz7yXLzDsoqZIFAlv50egACgkQ7yXLzDso
qZIxjgf/QsVnRVRhJATU4CcFbXVSzGWwfLVzz1A7sumOT6BrURaK+XmJ2UV22of9
2lB7fz9xn5xqk5YkFsT7B+uK17Ta2tZvyHv8o7JmhGy2VrVIfIJ+Xlt6okbZffk6
c8AJv+H6lw8eypT6nIvlnb9hrRZPW2yYl8Hz6KWxxKgd2EcXdWzeH2b+3274bhNH
SR96qxug9574/kN/bCtjeFu8ZXL5PnmpfrVnTIdOEVAu+zOswSAm9/unY8IVUrHy
vX15t9fIsuCk8mUy5krlAu4rK5j+WvrdJHLYJW9AO897u5tIcb8tkiO/lM5z8iZL
Y5///xEInBYZeBWFNxGBlfUUmWlOGg==
=wCvA
-----END PGP SIGNATURE-----

--Apple-Mail=_30103047-1B79-41BD-BB01-2AA2C079E142--

--===============8489985199684990950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8489985199684990950==--
