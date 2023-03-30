Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A7EC761AF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Apr 2023 22:41:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89cddc39;
	Mon, 3 Apr 2023 22:39:29 +0000 (UTC)
Received: from mail.redxen.eu (chisa.nurnberg.hetzner.redxen.eu
 [157.90.22.104])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 09c9a7a0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Mar 2023 07:16:44 +0000 (UTC)
Received: from localhost (p578bcf22.dip0.t-ipconnect.de [87.139.207.34])
 by mail.redxen.eu (RedXen Mail Postfix) with ESMTPSA id BD60C5FA60
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 07:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=redxen.eu;
 s=2021.05.31.01-mail; t=1680160603;
 bh=TmdwgmSTcNTaaMIswDXgIEP965TEQnBmTFtiIa006hg=;
 h=Date:To:Subject:From;
 b=YN+/Qq9N/ZRb50A569qlfPrLF2jLSi9dYOK74x2np41wjwyI+d9VGb5uWSy8XKfpH
 L4K+ZLX7AuUbKDZWuRCU9g6gpWY8YJbCUTUW53iKqlb33sCxnx4Ly6bcK565DOZv0+
 48Tmlq+YlkrRcuwvArk4CtYcnOdejEGSix2kghsHcGa7knBGn/9YWAJdkAdqcv5k7I
 O05a4+3NKda5Hp2P1s6TOhFhSIHroifLo622m3WaI4r2D+r0IS5PMgXbgJxiScgEok
 dnPwkHQ7vLFMhwafFvymjPphyCcmujthb+SAl7sjN9CXtbZBX8SndK4zSwZ3uIj8CB
 mSY7EMgKQwSeQ==
Authentication-Results: mail.redxen.eu;
 auth=pass smtp.auth=caskd smtp.mailfrom=caskd@redxen.eu
Date: Thu, 30 Mar 2023 07:16:42 +0000
To: wireguard@lists.zx2c4.com
Subject: wg config and interface address
From: caskd <caskd@redxen.eu>
Message-Id: <21QN43YXI27DJ.3G5P6T4FS5WOA@unix.is.love.unix.is.life>
User-Agent: mblaze/20220328-3140-g8658ea6aef
MIME-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="----_=_489befd066338cde7cbde644_=_"
X-Mailman-Approved-At: Mon, 03 Apr 2023 22:39:27 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

------_=_489befd066338cde7cbde644_=_
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_09f3164d1990032f3a3b9739_=_"

This is a multipart message in MIME format.

------_=_09f3164d1990032f3a3b9739_=_
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

i've run into a interesting edgecase where if the wireguard config is loade=
d with `wg setconf` at the same time as a address is added via iproute2's `=
ip` tool, the address simply disappears without any notice or error. The ad=
dress addition "succeeds" but is not persisted. I've been able to semi-pers=
istently replicate it but the scheduler gets in the way. Is this a known is=
sue?

--=20
Alex D.
RedXen System & Infrastructure Administration
https://redxen.eu/

------_=_09f3164d1990032f3a3b9739_=_--

------_=_489befd066338cde7cbde644_=_
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQJEBAABCgAuFiEE2k4nnbsAOnatJfEW+SuoX2H0wXMFAmQlN1gQHGNhc2tkQHJl
ZHhlbi5ldQAKCRD5K6hfYfTBczXcD/4+7HxnlaLN0wyVlmQynP8f4TCJBIHizxyZ
jg1W7hXl3t3tFZMOovLUvDrBWw6GG4Gy/XiPD3h1poDLJgHGBfARyhK9RnnzHUjc
nXo/b8dwXc68mG1VwXC5yQ8YlM3W/jE98kHzHQUFZxIWZ2yszRGcBw8FajynkFFM
qt8oHVugxKd0z0Ts0IureGrzMCw7CAQ+4SY/1vtPO770rO7W7Cb/uniGIalNZBBi
L5CmW5Wg0OSZg6cKJTPkfUT45RIeww+itb084gbDDDpPWPtaFtzy3kdODT2qcypZ
LEm5LOYO6DDZTzoc4Vk0keJrymMbB36vvKFZ7SpxC/LdEEWozP8XSx6qJB+VyJZ9
Itt6PugdTXq7vExjgQi/keN9mOc3J3xUvLzkNkXTvGkV+G28mo+PJ6Sp+MsB8gkt
4RYE+5U7fIJo2TztWWQUDH4VLn6LkE/j647SKEjw4Zitjy+kjp7G3yhqFRSj8OG+
kL4hzSZkZx4QNMUAJgu0KYAnyTOJTsW9sFLMRm3Iq1DDKCivFzvS7226pJ7fY+7L
nPl96rPlCWfPPwVYbG0PGAL3OQLSTHVb0S2U7SWdlE7VMJD0Kh1tDQA6IGd+SV7L
F+8f4mvqiOggW5pQs/EaKMNsFfPmE8DkRSYulpLwzAKB64z0cik1SEbQo9sCvs9M
hh97pOe2Kg==
=//fP
-----END PGP SIGNATURE-----

------_=_489befd066338cde7cbde644_=_--
