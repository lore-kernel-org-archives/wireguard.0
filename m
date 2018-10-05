Return-Path: <SRS0=6kAx=MR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A39C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 15:54:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89B212084D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Oct 2018 15:54:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cZDp3xxf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89B212084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef1d45a2;
	Fri, 5 Oct 2018 15:53:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cae7aa72
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 15:53:05 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a94a7837
 for <wireguard@lists.zx2c4.com>; Fri, 5 Oct 2018 15:53:05 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id z8-v6so14248371qto.9
 for <wireguard@lists.zx2c4.com>; Fri, 05 Oct 2018 08:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=A4Q4bcq4XjoKfQ+agtqC+HLdZBlOx91f7VCyZ2nsx78=;
 b=cZDp3xxfHf+5yKD8afUFVBj5dCVsOfVNWZUMRPV+bM4N94kbaRF1z4H0nq+OK33N3G
 5QTVKOPmRvBVxNV8B4sZP1JaSys7GUP19dn+teQW3OwE42OLx7fCpxavhvYMN3IKAUmL
 hbb3srWB+rBzz+m/7FowRMM6KGHhxR13V6R9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=A4Q4bcq4XjoKfQ+agtqC+HLdZBlOx91f7VCyZ2nsx78=;
 b=tcUY5cnmVx/7bTFlFCREBHXwx0Pw6Kv1jqLSRfAYrL1hiplcZXVY7wlT25SgLqkGk6
 rAUOAe6RHXosCD2TfNMgv5FsLnSY4P4iQzqyc8eFueoUZDJ4zYIUCA9MwVCYr5VshmET
 p0IE0g5WELnNhah3htR0YJdpOi6aLqKIlZdzQ5iVwE3Si2v6p666DGs7IeElTWz6cvAq
 IDow3VENGNhFufBO4v5AbbGCvZJzC1mrmgU7AxQgjGLIMvTrKcGmJq91fsPiQaI+ikZ+
 TF6Fpq9uV2Van/wldkPPAZ72DKkEfPLvx7yq5aYKxa/rnvFBpoebpmeovmHRefj7xhKS
 C7OQ==
X-Gm-Message-State: ABuFfohLbtKpLsPZyb3VpRYwrfu7ulMAaqoLa08JUD5Hib66BADhETCK
 8NmYHFLq8M3pEqPYDSPrme/gxUkIbWm/uQ==
X-Google-Smtp-Source: ACcGV61agH2GTG65xapHLkgm2GEX4/DNFkod6i7sTBEnhR13931Aln7KDdhMr6EJYccfYvMwypdgmQ==
X-Received: by 2002:ac8:2875:: with SMTP id
 50-v6mr10322991qtr.54.1538754810767; 
 Fri, 05 Oct 2018 08:53:30 -0700 (PDT)
Received: from puremoods (192-0-230-179.cpe.teksavvy.com. [192.0.230.179])
 by smtp.gmail.com with ESMTPSA id s13-v6sm4682149qtc.95.2018.10.05.08.53.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 05 Oct 2018 08:53:30 -0700 (PDT)
Date: Fri, 5 Oct 2018 11:53:28 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: Re: Sending just ssh traffic via wg
Message-ID: <20181005155328.GB22501@puremoods>
Mail-Followup-To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20181004155359.GA5957@puremoods>
 <CAHmME9rt2irKq1JFkkWdNLKFTJapCKopkUCpnyXugN=dUWqW=A@mail.gmail.com>
 <874le0d82v.fsf@toke.dk>
MIME-Version: 1.0
In-Reply-To: <874le0d82v.fsf@toke.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2887746906806511710=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============2887746906806511710==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5I6of5zJg18YgZEa"
Content-Disposition: inline


--5I6of5zJg18YgZEa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 05, 2018 at 12:03:04PM +0200, Toke H=C3=B8iland-J=C3=B8rgensen =
wrote:
> > When you're doing policy routing with packets that are being forwarded
> > by the system -- a router, for example -- then the prerouting table is
> > sufficient. But for locally generated packets, you have to use the
> > OUTPUT table and also probably MASQUERADE. I just reproduced
> > everything here and confirm this works:
> >
> > ip route add default dev wg0 table 2468
> > ip rule add fwmark 1234 table 2468
> > wg set wg0 peer [...] allowed-ips 0.0.0.0/0
> > sysctl net.ipv4.conf.wg0.rp_filter=3D0
> > iptables -t nat -A POSTROUTING -p tcp --dport 22 -m addrtype
> > --src-type LOCAL -j MASQUERADE
> > iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1234
>=20
> Any reason why you can't just do
>=20
> ip rule add dport 22 lookup 2468

Yeah, this works, too, and is quite a bit simpler. Jason, any reason why
I wouldn't use this?

To help explain the use-case here, here's what I'm trying to achieve.

We currently require that all admin-level access goes through 2-factor
authentication. For ssh, we require using SmartCard-capable hardware
tokens (Yubikey, Nitrokey), such that the private key for establishing a
connection is never exposed to the main OS -- so all our ssh connections
are inherently 2-factor authenticated.

However, that is not a mechanism we can use for accessing non-ssh things
such as various web-management interfaces on internal networks.
Therefore, we require that the VPN connection itself goes through
2-factor authentication step -- admins put in their password and their
TOTP/HOTP token value when establishing a connection. This works, but is
annoying to have to do when most of the time all an admin needs is ssh.
Every time there is a network blip, the admin loses their OpenVPN link
and, if they don't re-establish it quickly enough (typing in their
username, password, TOTP token value), then their ssh sessions reset.
Quite possibly the worst thing to happen to an admin in the middle of
troubleshooting something.

Similarly, if there's an alert in the middle of the night that requires
checking something out, it's annoying to have to first establish an
OpenVPN connection before being able to ssh in to a system.

So, we're working on a new setup where admins would have an always-on
WireGuard connection to the infra, but that connection only allows ssh
traffic. In this case, don't need 2-factor on the wireguard link, just
packet encapsulation. But should the admin need to bring up the OpenVPN
link for accessing something like an iDrac interface on a Dell, they
need to be able to do this without needing to shut down their WireGuard
tunnel first (since both WG and OpenVPN provide routing to the same
internal ip ranges). Therefore, I was looking for a way to *only* send
port 22 traffic on the wg link.

The following achieves what we need:

[Interface]
PrivateKey =3D [omitted]
Address =3D [omitted]
DNS =3D 127.0.0.1
Table =3D 2468
PostUp =3D ip rule add to 10.10.0.0/16 dport 22 lookup 2468
PostDown =3D ip rule del to 10.10.0.0/16 dport 22 lookup 2468

[Peer]
PublicKey =3D [omitted]
AllowedIPs =3D 10.10.0.0/16
Endpoint =3D [omitted]

This achieves what we need *quite* nicely!

Thanks for your help!

-K

--5I6of5zJg18YgZEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCW7eI9gAKCRC2xBzjVmSZ
bJiEAP4xKppwLOUOkYnPirlYuW8GW8gO6lHuSYwCe/YQCsk+KwD+I4lTX875GmMF
55sgbkyiCMibTlG/KZ8XBINwKyBoFwA=
=hmiX
-----END PGP SIGNATURE-----

--5I6of5zJg18YgZEa--

--===============2887746906806511710==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2887746906806511710==--
