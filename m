Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d93298a1
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 08:37:07 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ea12cee
 for <wireguard@lists.zx2c4.com>; Fri, 1 Dec 2017 08:37:07 +0000 (UTC)
Received: from [172.23.184.97] (helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1eKgum-00070m-U6
 for wireguard@lists.zx2c4.com; Fri, 01 Dec 2017 09:43:20 +0100
Date: Fri, 1 Dec 2017 09:43:19 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Should I expect faster recovery after one side goes down
Message-ID: <20171201084319.GA30956@tuxmachine.polynome.dn42>
References: <20171127094931.GA3104@wolff.to>
 <CAHmME9q+giuOXVz1=hE-F34vFMP0GxzveMzLbzrjeXbbjnrGCQ@mail.gmail.com>
 <20171127134914.GA9392@wolff.to> <20171127173354.GA17685@wolff.to>
 <CAHmME9rq+eaLMZP+a1OAcu1=65X7Q_PrsMNBwAm7U2HaNWfUVQ@mail.gmail.com>
 <20171127182558.GA19220@wolff.to> <20171128061306.GA7842@wolff.to>
 <20171128064413.GA9218@wolff.to> <20171128084237.GA12292@wolff.to>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
In-Reply-To: <20171128084237.GA12292@wolff.to>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 28-11-17, Bruno Wolff III wrote:
> On Tue, Nov 28, 2017 at 00:44:13 -0600,
>  Bruno Wolff III <bruno@wolff.to> wrote:
> >
> >I think the correct fix is to know if I reboot the router for testing
> >something, I need to also restart wireguard to make sure it is sending
> >data to the expected port. This isn't going to be an issue in normal
> >operation.

It sounds like one of these situations where persistent keepalives would
be useful, doesn't it?

This way the laptop would create a new binding in your firewall.

> I found a way to make it work more automatically. The reason the port was
> getting reassigned was because the original connection packet was being
> tracked and was conflicting with the source nat mapping even though in
> reallity the connection was the same. By putting in CT --notrack rules I was
> able to block that traking and without the conflict the port doesn't get
> remapped. I don't need tracking or the original connection for my firewall
> rules so this should be OK. On testing it seems to work as expected. Now
> when I reboot my router, my laptop reconnects and the wireguard tunnel works
> without having to restart it.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlohFiEACgkQvgHsIqBO
LkYBQA//VpSXkRKCJ8D5saMKmXs5jJfBKe3oLr+sw7eSHr/S6qWvZ/whhriFVqxM
2p6OXZHFcafu9tkIwum3Y/bqxs166yAZQBcYajLjYn3pc+MPKGcnMpzJ6StAjueD
ro5nSC9VO93CVc+NI78qWfsD0JNzOESp8XOd1msvOvNCW8HriAAK4rSU06zQA2pf
TL8BYFDiys2b4ZWwZbY64ceTTwidKeUpa+3I4sFvRkhA1oUE+c2NQkLLsACivq0s
5/uUyzuT106KcBZlyTGYBdnGB5VTB/G0O+VJfkqv3YXQaQIdjFWkahXbSu2xQriG
Ea9E8So9R3UQEKstxSdqoMubW94kNQTGhcSmiNWfi2k5Lcl+l1C0unuu5J9PMaSr
fSgauKxAazoiio15bIiq+uTr9FlJWfAGikJMkvPtZP4I2mA1/i2YDEPErW6+O6Fj
WHcFDB2PwsBArN/NjMwfRU0daL2dINHQ1P/IHfghj1SI5GjrwJUTBsq2Sz+QOQqg
eYBgDZc9sRER2o/mQEIixlirVfLw4gFE8p/7YdTAkMDtptyhcgLLGsHy/noW1lUq
nKpLkzPLBapurM8wZPQstiTtudqVaotYU1Zov2WCb3K5WXvVq9xqUzMIaDiAqbKe
QXvTE9Tc4O+iHB8vUdiMfMsOig4hx6RFDGdUirr/6C8NE4pxB64=
=Fr73
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
