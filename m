Return-Path: <SRS0=IEsR=F5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3735C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 22:17:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF7E207AA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Dec 2020 22:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF7E207AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86242459;
	Fri, 25 Dec 2020 22:07:46 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [2001:780:107:b::b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 033c7345
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.Com>;
 Fri, 25 Dec 2020 22:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=LpjGufxTywlob7kH9uVPMNRo6mea/qY+p+DkCHMQ/iM=; b=nP+aVaJjk9IW6Xf+VA3lnHzi39
 3VeWOgxPXU7DAxwYfnw6rgYlYiSrG1B4jzgY3VVUwWEFVmofWBgiYzQRkPc9plHqAV1UoxWympJUf
 Q5D05b85jPACqffdmX95OsvkF1btP6lfLNLOADo4FlWGKm0BhoQYT8lJZ/MkcYTiIp3pZC2Ivjlhf
 MN/8Kfll3BKu61lvg6Nbq2bMRFue6vcSuWe7ie8AdospqFo9XVk2D2Fi2lEtT8nqc+I5UI3IpZQy5
 mEgpcmKb4FqHKtUAjxRN5/+hBcE9l7+SZGmo1uFO17WBSYVkGHg7dcnYOa+BkWwiLF/88CxxWD4rF
 DC8hEBhAc/Wu8Te4rVK3zUOHpwbjVSJ8KjwmxFJd7VQU+A8KvZIPJKBmPnFl2Gf7ueeC11mKoBbDB
 e59YVaVjxX0TDulljV9f1bhB11Y1cUYYgcDmHEIjDcYaYBEtnoMBOuGuMk9qbYIb1FzA5/nhb9baw
 Br7sS4dvUAue5f7GufjbcCpyoYI93rgj6un0hUCd+cBvBFjMmep9HdmvXP4uWBj85Mn9WSVr7TnzO
 OVawbjyN9UtTKPLH3a3vd/ylJCN6waNNT9HAe1kjJiHATaDcb6+fcnUQ0q+Egb8mKDCRHnP1XUwBd
 DXHJieYs6RnpND5nH5WKbIe7T7RZOPX3bXC47j63s=;
Received: from asi.s.smurf.noris.de ([2001:780:107:200::a])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <matthias@urlichs.de>) id 1ksvO4-00020F-F4
 for wireguard@lists.zx2c4.com; Fri, 25 Dec 2020 23:16:40 +0100
Subject: Re: How to verify a wireguard public key?
To: wireguard@lists.zx2c4.com
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <dfec7de6-8f7d-4e89-4e90-3865aa6b7d04@urlichs.de>
Date: Fri, 25 Dec 2020 23:16:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1y4FysqIQP1etTjaPTcPNm7gJJyTunFzm"
X-Smurf-Spam-Score: 0.0 (/)
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1y4FysqIQP1etTjaPTcPNm7gJJyTunFzm
Content-Type: multipart/mixed; boundary="WCPPUwW4KmHwdH5EUFKi4Y8AxMZEPlDZa";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <dfec7de6-8f7d-4e89-4e90-3865aa6b7d04@urlichs.de>
Subject: Re: How to verify a wireguard public key?
References: <87k0t75h3e.fsf@ungleich.ch>
 <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>
In-Reply-To: <CAB5G8p9nCdxkikyubjfjJ4bB4+9LXNrEbCN+ONfZn28g26WE0Q@mail.gmail.com>

--WCPPUwW4KmHwdH5EUFKi4Y8AxMZEPlDZa
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

On 25.12.20 00:42, Adam Stiles wrote:
> "How do I validate Curve25519 public keys?"

You send a handshake packet to the owner of the corresponding private=20
key and observe whether it accepted it.

The question is, why do you think you need a different/additional way of =

verifying the public key?

--=20
-- Matthias Urlichs



--WCPPUwW4KmHwdH5EUFKi4Y8AxMZEPlDZa--

--1y4FysqIQP1etTjaPTcPNm7gJJyTunFzm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENzGcEL8EYxehRDgJ+GyybHbBwWUFAl/mZMcFAwAAAAAACgkQ+GyybHbBwWWB
AhAAiRK5xsXXtKRtHhwm1ysslho8JURkwggo4iRowYGVL2Y6EsF1gPhrzDyCEP8COkVf8YsV4j30
J5/0SXlA0M7Vl95Sy54JvTPx4ziduhcXtiBV9YuB9XkgxjMNLU0lRb6VTNZVPs9AmAQo92YJUyKG
mdp1Mxl3By7FJTvRMTqXgAX9OtXDis3hYAzu2g62gPnsPkNYWKyZK+Rh/TP7vuVooyKrGCIru/pF
QG/oNdn1crr0fObimhs9AJd6mf3OIaWfxJxqmNBJGJpxQ1SsQa7rmTp2HyMqPef37BYjIMqtl+aR
jmpxzdqc97feW31bw8zTqPHHNhIkNhWoCWu+HkLq5zPI3GWfM3x+BzSLhnzrWvIdRSy4SVf54XCU
2YxPwTKgwlyNI8Dmitep8ltCnwwqaPkAcmEoW2jJUuVdezz+abaTX+aUUzvmj4dnTU/R2cehmlVK
lo+Gb5MjmX75HhiF1k4rUFqCnKLADoqg9Ugxc1t6vs15GFLcRku3wmc5xt3Xf+tOduYJBhQFvfJZ
bogOab/HzJzKX6UW04OBV7tfc0Y8QLnzk3P9h8ICXKaEpavSGhu5lGB99jSGiE43SVd6UXgVs+5C
/3GSXhZ2N4iQjDSSoSC6dSOhBrP4ieM2GVeDBF3YrgPBW3jYG3beHXyhjq8R5s5g4WfZfE9tw9tQ
l1k=
=mtI5
-----END PGP SIGNATURE-----

--1y4FysqIQP1etTjaPTcPNm7gJJyTunFzm--
