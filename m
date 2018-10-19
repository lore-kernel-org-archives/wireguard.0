Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8C3C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:09:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8EB120685
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlrobertson.com header.i=@dlrobertson.com header.b="BSNy+tvM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8EB120685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa51de5e;
	Sun, 4 Nov 2018 17:05:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e052ba2a
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Oct 2018 15:46:42 +0000 (UTC)
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9979f400
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Oct 2018 15:46:41 +0000 (UTC)
Date: Fri, 19 Oct 2018 15:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlrobertson.com;
 s=protonmail; t=1539964129;
 bh=nLFH+I8Tsu05anp6dpak3/4Y5zjAJM2oqn0gXnRPWHw=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=BSNy+tvMM8vpMQs0FqD+AtMw2yfee1k4nclbclVQQYfRq/WEgpWaUVNmvmLm7NeLh
 7YLh/iRoyMeRfsafFLLqz8zKtNCBwWl+CNeZOMxTB6UdmwJJru7rdYz4jjeI4yq1b4
 fMj1sWv6heCbcT7RVgKPH0jhRXFk5qkTdT/QGAc0=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Dan Robertson <dan@dlrobertson.com>
Subject: [PATCH 0/1] wireguard-rs: Update use of ip_constructors
Message-ID: <dW6qiHhTqyO0PlNE0eiyMujCjXY-Ve1G972XViormw9QyImoOHg0w40ge8q0A_cmry6NCi9wyEadDP-Mk_FzjU9UtXpAisr_1GqiNfu6Dao=@dlrobertson.com>
Feedback-ID: pldPa1MRbNXVCGxDWw7m3Nt0HNNJc4Dznn8N5TjWcPVAEhnPrkGDWZYOSTid9RTyxeIOU_tmskSUoVAwqP1XWQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:05:01 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Dan Robertson <dan@dlrobertson.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3716441986393916676=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3716441986393916676==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------29354d705668c58a356a8ae7bf864a40"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------29354d705668c58a356a8ae7bf864a40
Content-Type: multipart/mixed; boundary="---------------------450a57cbeab5fbb5d96c35679165f7d5"

-----------------------450a57cbeab5fbb5d96c35679165f7d5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

I only just started looking at wireguard, any feedback and/or
pointers are welcome.

Dan Robertson (1):
  Update use of ip_constructors

 src/interface/peer_server.rs | 2 +-
 src/lib.rs                   | 1 -
 src/message.rs               | 6 ++++++
 src/udp/mod.rs               | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

-- =


2.19.1

-----------------------450a57cbeab5fbb5d96c35679165f7d5--

-----------------------29354d705668c58a356a8ae7bf864a40
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail
Comment: https://protonmail.com

wsFcBAEBCAAQBQJbyfzbCRBFxKZSxH5CpQAA4C4P+gI1/NPLswu5G9igJhFj
QnENQb9tBwMbygB6YZJav2w95rkkMPdv/nXH76JEQS3fMp/FkjppWIVRaNHF
OlMcPa0En5wDkaJxC6ZJWk36bRa73mkttCQzBDhNyrh1GH/XrDbK3NwchQ/Q
+GJhYQnPHoVsTHhaBUSHdF8E6Qb20XjGJQ/ubztAL2yFgQ8BDgXcYE7UV0AK
78Fio6awFdReN5JKXzpSA4KvdXRZF2zdgoCt8jVFajF4hmihLINCdP/exWMT
8mW4/H39RnJ4aKdbdMnL0G0LWdUsOThvb/nSau3njqFmBvPCSl2F/Q+w1P2s
W5UcN8/dDGgNa1Q/UtZXRATgwS8TqaKmujy7vHGWU6DvlK9CZFUY3QQR3GpV
KUTAjdH5LHFtM3muIcM+tdSN29xrXRhHOOHmlRVkfcRWMQTSlJtPYDW5VYGp
wm1V3TWVT+kXVKwUTm7fikqcIugchYqU+0GLt2AvOARYqYovH1XmopoWkVHl
ZMIAjsKPVZiWiTC6jF2RJEkGHNffgyowYE6QCa4560HJY/k5NxosdQteezwp
3240rTzT5DdsncFmUWHIkX8gDT7Fxg74WTYlqfWd6NCqm3bh+F+Sr3iv6VXL
B8LY60uyOAf6U9KUrlPBwaW4F1+Dmenbd9iO8RAnMfvQBg10FdhZVF595Zx7
qT7Y
=Wart
-----END PGP SIGNATURE-----


-----------------------29354d705668c58a356a8ae7bf864a40--


--===============3716441986393916676==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3716441986393916676==--

