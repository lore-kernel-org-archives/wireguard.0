Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94649C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 857AF65004
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 15:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 857AF65004
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5038c545;
	Sun, 7 Mar 2021 15:43:30 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [2001:780:107:b::b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2803c72c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Mar 2021 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
 From:References:To:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K5d23ch7qlDoxogoUlftFvMzdAqRqKJwe772EzPB0/E=; b=FzM9/qqyT7FqYLhIZPlMB8Lv7O
 93+T/gE35JWaoQE4V3jVYLHBHw3d4rQWtP/kZZFz79MqL0+HccPwuhjav2NzSx6vmcNI3KJyM6aWM
 PkW/6bNErqHR8+UFCyDjSzb2vDT+PcqRqQsZxAsJMw00n1KJ/G7v6JDyBLx726+zIZ4A93hGnK9AL
 fPC/GGCwQRCcJNuy1A91SF+0CiBjrz/bVJRriGfAYybtJS28SghN5kN3yWTzhmfeK6H+lEuaelgNL
 4TNzqA9KSg0yGIpNbMGnvEt+41GqBIjZ/8eswv91eJEeYnEuGdtYglN6lKQoIuAI/O50CnaH8bZ2O
 bcCkavmiFMz4P2G87kn3M2nbxgk1y0B7M45ovVPypOciNuSnyUBuX5cBhk963eIQ5m8UoNGkVvi0Y
 V+VvdI18Sw4IRguX5EsLwRWJLLiwEhnEayEn4YZgI9efPUVOIpg3mBrWQaN535xoUnUlk/tyju6nG
 +viaCSLKH98VfXu880eq6TWrlRweHvkWi3PyveLRnr+lccvqTM4eDI+XIEoZsaH3CuICtXZtmzEF5
 AYl6UIiD7DMH04xJSHh2oXz3XTx9WaKyvway8hrSkst03tEblsJxBW/WLTlF3hBSYv1k+46DnoNsm
 BgBPrbCCph6M++W/5MfnKbvYem+7+03y4PSlocclo=;
Received: from asi.s.smurf.noris.de ([2001:780:107:200::a])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <matthias@urlichs.de>) id 1lHjmu-0007x8-4a
 for wireguard@lists.zx2c4.com; Thu, 04 Mar 2021 09:56:56 +0100
To: wireguard@lists.zx2c4.com
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
Message-ID: <398590d0-70b6-db89-c53c-a9169b0a6fb2@urlichs.de>
Date: Thu, 4 Mar 2021 09:56:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Z90TK5hMFcONBvrW36ECnL7i3Gd7GlvRI"
X-Smurf-Spam-Score: 0.0 (/)
X-Mailman-Approved-At: Sun, 07 Mar 2021 15:43:28 +0000
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
--Z90TK5hMFcONBvrW36ECnL7i3Gd7GlvRI
Content-Type: multipart/mixed; boundary="1cUYzz2gLokpPxSNaKfRbWBUc3krIQOJv";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <398590d0-70b6-db89-c53c-a9169b0a6fb2@urlichs.de>
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
In-Reply-To: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>

--1cUYzz2gLokpPxSNaKfRbWBUc3krIQOJv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

On 25.02.21 18:48, i iordanov wrote:
> The "nested" tunnel does not get established.

That's a generic problem. Usually you want to ensure that encrypted=20
packets don't themselves go through the tunnel. This is difficult if not =

impossible on Android unless you rooted your device.

Also, you would need a per-route MTU. Linux can do that, but again you=20
don't have the privileges on Android.

--=20
-- Matthias Urlichs



--1cUYzz2gLokpPxSNaKfRbWBUc3krIQOJv--

--Z90TK5hMFcONBvrW36ECnL7i3Gd7GlvRI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENzGcEL8EYxehRDgJ+GyybHbBwWUFAmBAoLsFAwAAAAAACgkQ+GyybHbBwWW7
bw/+KFRfaIXYB8VPEbBs4+esBvDuXpu1UqYxB5HfcXyy51j0/Hc+kZKq1jg/mNafst6N9LzYNOdx
kwOV82MLl8AYCXfUlJSybKxG0pDDUAekkSU0t0Nl5lIiPzvEPyMp5483USfu+26xpB5bTarxf8hW
lqSst87dufUpWAGgPYVubKVLt8CZ4N3AMFfT5UQGp7JlhvLGwDi2tA3KU8EeQwt940yADNHgbWQZ
BN5nh519RejaPXX2CokQCrfrQfzFBouboI/bY1Pnl43phtWPcOLhrL3lNXKPbCri0fv4lq/0r/B1
ySB9TV6czbPRF8KD1LU8LLuZabMIng47kSkkoneKJNebDgjog+r760V+UE6gPx/CX9ElK65sjMfZ
jxur4WRiBsZJ+jAajWoq5g4Zl0eO00m9L6vRx4t3HoorwSlWxkZl3IgOYD7mG69Orhc3Gl8bLFKs
FG4OtcguOBeZopnHimfRzOr0odMXWy9WO5UUZB6u8xqndUjSDhsy3a/3QJCgul/jpA+3oxR51+CT
nRNy/tjw5QktemnN05Fkci2bKGTB85deXbzTZxyovMUnu9LNydHe6jwKaKbP4vvae19cKdlNt2Ch
KeD1S77ChoPfngAOts2DoFLZYTeW9glMORW8BvE8mFz15ll0qnsQPGp+eAx7qoJrXYK/fYDkuKFU
CTU=
=Jxqj
-----END PGP SIGNATURE-----

--Z90TK5hMFcONBvrW36ECnL7i3Gd7GlvRI--
