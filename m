Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC066C43143
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 06:41:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1FD2089A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 06:41:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="mtLhUUEG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB1FD2089A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c35a953;
	Tue, 2 Oct 2018 06:41:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47eee84c
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 06:41:06 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd3401ab
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=Ujiur3SK/k2OeZQgHGbok4AonsglQgSHFGiawD5BVv0=; b=mtLhUUEG6hYz7pqfi46sZI3aJJ
 xMsB+S8fKi18WHy9WkNcRS2hKvIi8sc+g55j+5HsWRs/vWwNXrb36rSpnnSo06QkTH/Yefps0sS5d
 GPKYYYAyNz20DOVU/38PvyQ8WlKfjMuVh39AeqZr5nRhcin0g0EQfF+pOUr8RhOfgdn5zGpPl3+Us
 g/pDjUeWt9uJsEb0IvtML2hDlp1nE/cXQFJgAZ16EPo0X32mbD6jlXsVASDU3SgUQ+eRuBklGVp4j
 I7+wVCv1cz5H5mg3W5U/PXJ5wTZV/59OuUShVghaZK4MLgpuswy6ROLnI5cmRyy0rqZ1pbweZKXCM
 bW/6n/NOB85SvNq7bXSIMwAXkePM78QHO02JzwJGchctvxhTCE98XDOCxMrqUL6o6HVf9TBnE1dQk
 LNT+wp5munTMdQ0/rg1S4HJRwiHGtOXSxkxNoevXLb/TlmdjJ5nKh9kF65lCq5r2xOITfCwXJjsTB
 55eAa6ePPOjNcVw+z+v/pzvYe664cQkYHinwnTVKCGRwPPn3uZPeXrci4sNJR6YSNqr20OoazPAu/
 zxZYKB4+PNWhgLGSQgVk8krKIwaLCoa4xnX8ddGovcIgeK7laia1SuGqM/qvZB8Z5V1CVJ05EYT+1
 gwmjctu9LmioaQolx8ePmEiAywNUCw+by72oQS8H4=;
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1g7EMA-000M9S-AA
 for wireguard@lists.zx2c4.com; Tue, 02 Oct 2018 08:40:30 +0200
Subject: Re: [feature request] To support "Wireguard over raw TCP"
To: wireguard@lists.zx2c4.com
References: <CAKVinOU6xpbJNfCPAecX7kOgk_PbCzThYtER9d3ax1h6k3DGTw@mail.gmail.com>
 <CA+7UkwJ2UsVZMwnc_vZzDU0W-cBWjEKffTE5uBn9yqrBC0zmMQ@mail.gmail.com>
 <CACVet5Hm5HFDtNgTpk2q2r_8Qzt3xTH4sb63RcuyDTj7vdPacA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <75a25a9d-cf7d-1036-41b3-7d128d415b4a@urlichs.de>
Date: Tue, 2 Oct 2018 08:40:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CACVet5Hm5HFDtNgTpk2q2r_8Qzt3xTH4sb63RcuyDTj7vdPacA@mail.gmail.com>
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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
Content-Type: multipart/mixed; boundary="===============8953056227771272348=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8953056227771272348==
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="C0kAIfTYMvvPQqg01QafCvvIuELSOTRnZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C0kAIfTYMvvPQqg01QafCvvIuELSOTRnZ
Content-Type: multipart/mixed; boundary="THYpBBUeImsue0n8MzqelDfy8o8EK9De5";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <75a25a9d-cf7d-1036-41b3-7d128d415b4a@urlichs.de>
Subject: Re: [feature request] To support "Wireguard over raw TCP"
References: <CAKVinOU6xpbJNfCPAecX7kOgk_PbCzThYtER9d3ax1h6k3DGTw@mail.gmail.com>
 <CA+7UkwJ2UsVZMwnc_vZzDU0W-cBWjEKffTE5uBn9yqrBC0zmMQ@mail.gmail.com>
 <CACVet5Hm5HFDtNgTpk2q2r_8Qzt3xTH4sb63RcuyDTj7vdPacA@mail.gmail.com>
In-Reply-To: <CACVet5Hm5HFDtNgTpk2q2r_8Qzt3xTH4sb63RcuyDTj7vdPacA@mail.gmail.com>

--THYpBBUeImsue0n8MzqelDfy8o8EK9De5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: de-CH

On 25.09.2018 18:29, Breus Blaauwendraad wrote:
> Could someone tell whether or not TCP would be a future additional
> option for WireGuard, and why (not)?

Which of the umpteen available/possible ways of encapsulating UDP
packets in TCP (and possibly obfuscating them in some way) would you
want Wireguard to natively implement?

The answer is simple: None of them. Bind to localhost, and use a
separate program for forwarding UDP packets.

Also: Any performance gain from supporting TCP natively (as opposed to
going through userspace) is easily dwarfed by the fact that congestion
control requires occasionally dropping packets =E2=80=93 specifically, th=
e
packets queued to the TCP socket. TCP cannot do that. Even more
complexity in the kernel? not likely.

--=20
-- Matthias Urlichs



--THYpBBUeImsue0n8MzqelDfy8o8EK9De5--

--C0kAIfTYMvvPQqg01QafCvvIuELSOTRnZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEe156i1ZztbbthlARBsCEUtiHyJYFAluzEtcACgkQBsCEUtiH
yJYF+w//fYMsVxESUQV3L4v2y8PQmLqIf/iBHy7E5elMV5CIYyoxkmaBsGliDVBo
wL0umNPUuTNQAAKAzrnAAdvwMnePdZVjDzWQRfnxPct9DmZW5BrCqzVT1Owg0P2a
5BmWTIH6UG791ULsjw7ETb+8VPzFKdUPzpS0GSxN250y5VKTz1QYyih9hv/1pqxW
ziizu+MQ/2ahDKKODKup1F7fpBOYlswj+f8TdVjcbJ6SyEbtYRiUM0wOxoHoWEee
dRF86JzDGEFV7mhSSv2+hnEf5vbQZTcP9IGu76Ikzr68sgpHRkDBB6Gjuww3T4mc
KL6nu/dUrLKzWlxGy6hVMX5NYj7b0Epyg9kSNmHEBJMts8oZM8LcS1mGEvnB00gS
/DND8rhtlCRDB/32WA2P1UM51IoGxL6qAcyMrnIIwRHN8OWKVNaibIm0Up/9kwcd
sgNaTr/fLBCur/mHhSBeqMZSk1p4dbCmxkUUYJNwU2jXkd9AXye1VAbJ7oh1gDKR
j8mCDJaTr9ENShuUX7JawDq5zd8p33b/1coWBRdODc5rw9jJ5Szi52EqLYYo/33h
gZmz3ri//3M1tGw0OGb59AlBGx8blbsCPTCFy4igj/z/6blciTOFicGYHQPazNrG
JWtNmZY893Hjg8HhXkvmR39HjIsJ7ih/kaSFW+08jGWRVeiUAG4=
=OuJV
-----END PGP SIGNATURE-----

--C0kAIfTYMvvPQqg01QafCvvIuELSOTRnZ--

--===============8953056227771272348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8953056227771272348==--
