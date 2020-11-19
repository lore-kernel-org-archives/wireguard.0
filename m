Return-Path: <SRS0=zozX=E2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A208C63777
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 07:43:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0007822256
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 07:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lavabit.com header.i=@lavabit.com header.b="gI4uQexc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0007822256
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=lavabit.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbe85a84;
	Fri, 20 Nov 2020 07:38:05 +0000 (UTC)
Received: from lavabit.com (66-38.147.122.lavabit.com [38.147.122.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4753758
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 17:11:15 +0000 (UTC)
Received: from localhost.localdomain (lavabit.com [136.33.194.23])
 by lavabit.com with ESMTP id VEX8I3C17C36
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 11:16:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lavabit.com; s=bazinga;
 t=1605806168; bh=VZweGTmFhDp+OWzAcmN5LgacftsvP5E4D2h+dRTxbO4=;
 h=Subject:To:References:From:Message-ID:Disposition-Notification-To:
 Date:User-Agent:MIME-Version:In-Reply-To:Content-Type;
 b=gI4uQexcP4tY37K8Md+iBHRg5/rkuxe71iz2uqcHCr6MVlDhWwutufcGXNELcwZqA
 r2Av0wz2FYdVcXUAPOoAJ/9D3W1bWSQAq1H0yEmiI927fTKN7b0D6c4qxv7D4mGQh8
 KMk9XUI9nh6vXPbKOLxxwpkkQkltYLiEEEJnypcsJs+Fik2tEajkbS/mxtXwH1Gqlg
 F2VBKUiJrkyVIPTs+Bx8VAlH4wsHYqtSZvYKt1L6E4jsdDMuH4TEB7+cMxbzkRWm/1
 QajHWZwbdbOYYpKgN6sosiwaRYL1WQvB1VGjDxCbbTCfqZKrhxCSZ3G4vIlmk4VUCo
 z1JRQIWQ9eTJw==
Subject: Re: Should we sunset Windows 7 support?
To: wireguard@lists.zx2c4.com
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
 <20201112090313.GB3500@trivini.no>
 <CAH8yC8=azrpN=EOP9XsTDe2NwmqQquSpEuqidtS2rVFw8x+5Ew@mail.gmail.com>
 <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
From: akloster <akloster@lavabit.com>
Message-ID: <5dc5657d-271d-0951-9eba-8cb302c6d5bb@lavabit.com>
Date: Thu, 19 Nov 2020 11:16:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IzRMtngEVAnqFpTFjbcVmr8tpuAt9Ho4X"
X-Mailman-Approved-At: Fri, 20 Nov 2020 08:38:04 +0100
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
--IzRMtngEVAnqFpTFjbcVmr8tpuAt9Ho4X
Content-Type: multipart/mixed; boundary="ES5JJijxp6MwTKfjzMGmuOktl17zY4Mod";
 protected-headers="v1"
From: akloster <akloster@lavabit.com>
To: wireguard@lists.zx2c4.com
Message-ID: <5dc5657d-271d-0951-9eba-8cb302c6d5bb@lavabit.com>
Subject: Re: Should we sunset Windows 7 support?
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
 <20201112090313.GB3500@trivini.no>
 <CAH8yC8=azrpN=EOP9XsTDe2NwmqQquSpEuqidtS2rVFw8x+5Ew@mail.gmail.com>
 <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
In-Reply-To: <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>

--ES5JJijxp6MwTKfjzMGmuOktl17zY4Mod
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

unsubscribe

On 11/19/20 10:59 AM, Jason A. Donenfeld wrote:
> So, the emphatic takeaway here seems to be that we're not going to
> suddenly ditch 25% of people. So, the recent v0.2.y series released
> has amped up support for Windows 7, including automatic detection of
> KB2921916.
>
> We'll revisit the discussion in some amount of time if the market
> share seems to be decreasing.
>
> I did notice, in the course of using Windows 7 to develop for it, that
> every once in a while, the whole screen will fill up with a notice
> saying WARNING, WINDOWS 7 IS EOL'D or something to that extent. We'll
> see what effect that has.
>
> Jason


--ES5JJijxp6MwTKfjzMGmuOktl17zY4Mod--

--IzRMtngEVAnqFpTFjbcVmr8tpuAt9Ho4X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSziGFxYPys/Hd74z++t9q7cUbBcgUCX7aoVwUDAAAAAAAKCRC+t9q7cUbBcowG
AQCEPW7wO/obfAoAip6H5Cc10nfcTJU+oF6OEdFidb477QD8CwfiFky+4+fnHNygBKiAraU4/ZGD
JrXofkLPE15fGgg=
=j4v2
-----END PGP SIGNATURE-----

--IzRMtngEVAnqFpTFjbcVmr8tpuAt9Ho4X--

