Return-Path: <SRS0=rhgd=YE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52029C47404
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Oct 2019 13:21:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9BE5206A1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 11 Oct 2019 13:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9BE5206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6974156d;
	Fri, 11 Oct 2019 13:21:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19279df4
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Oct 2019 13:21:33 +0000 (UTC)
Received: from smtp96.iad3a.emailsrvr.com (smtp96.iad3a.emailsrvr.com
 [173.203.187.96])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39c29d3e
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Oct 2019 13:21:33 +0000 (UTC)
X-Auth-ID: lev@openvpn.net
Received: by smtp21.relay.iad3a.emailsrvr.com (Authenticated sender:
 lev-AT-openvpn.net) with ESMTPSA id ADC8625134
 for <wireguard@lists.zx2c4.com>; Fri, 11 Oct 2019 09:21:32 -0400 (EDT)
X-Sender-Id: lev@openvpn.net
Received: from Levs-MacBook-Pro.local (nat3.panoulu.net [185.38.2.3])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA)
 by 0.0.0.0:465 (trex/5.7.12); Fri, 11 Oct 2019 09:21:33 -0400
Subject: Re: OpenVPN Windows client with Wintun
From: Lev Stipakov <lstipakov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAGyAFMV6=0XB+FxTeTM27v9PmLsd3_+VCTVnAQcUCmdaYXkBRw@mail.gmail.com>
Autocrypt: addr=lstipakov@gmail.com; keydata=
 xsFNBFqUY1MBEADYpFyflg2YE/Bh43C/2YxKBleqkRGQbFk/BX+djf7yJCwWdKNbQpd95+7x
 t4w04UDnSCx3N0zP5XykWDtukl7jjugV6b2YYMV+cHd7dJRw+9LVjxHzKk3jaRbSZLTBC3dL
 J4damW4apY7vnebTCpXmCctueT1+2cN/rqZQy0FX9VpnCZhB1BIyKyfJU8oNu5eHj5wS0VQl
 8TwLv9mB665hdnNtP92WG1sZUxEYlIT7Ww4HYYMk/6rX6hXgPBF9qCbWSxc3KdeVk/r3Hx7M
 nj26De3pZf+CBx08DCrY9H3NMEXDHHB5N91d/SKtp1DxJbg1VpEWIpgTMfGtnt2+apizvsAJ
 tziP8SRIjuVA+Sqq3OtXqvaAEosgaOA5y35E5llk5pliY3CymWqNgko6/rUfh4QpEttqBClU
 qEMksaLNa40PMLB8EpVd83gQZvaAbOXnuzhVJflzrbWsdxj3mGJAXvI0iW8JSIaZOUeTxuMS
 m5ASDSUOofaI0rnS4dYTwonCAP5C1/CRWBnHIs+w13JpdZ+cCkV9/kQaB3+CSt6L2ruEVr3f
 fJwOcH9Prt0clDsIAbyKJUu21wXqyQtTPk3jaCpivUdVO/rx33aulqDn9GBswEo7tF7RY7iL
 SO4RorHLpBSn8Xas30+I+PGU9mcsU8iQlkHGtKPEJ1dD4advGQARAQABzSNMZXYgU3RpcGFr
 b3YgPGxldkBsZXN0aXNvZnR3YXJlLmZpPsLBqwQTAQoAPhYhBL95qEXojvAGzpCxyP7d85dH
 bRaaBQJdnY/iAhsDBQkE6lpfBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAACEJEP7d85dHbRaa
 FiEEv3moReiO8AbOkLHI/t3zl0dtFpqsjw/9HHCfk32xIdCSZrxmUEfZ+D87x9BwHJDrP/V7
 li1hPhZUOZLqBP1cO2PpE/V2tRKTnd0ye11h5IQ9b460b5ztrs8/pPSGyQp7Gr1YIiDZNA9F
 fv2pyX3YOZUUWlHwurE8MwqSwms4j9wljPTrh52QEtf8JHRw07wInl5VQyiME911/OG6R90u
 WptpNq1QwFvFFJClSpMQ/Dp+qKw6Karxw4ugvVLcApfomnVwXLNp6Bo66uspipqCba1H+XXL
 XyXnlzrLHM348kP8z9S03AASQJj/xMolPxEsrP7B/TEMBh4B70d0QfGGe9D2KFvBbO3ggbfO
 6xma3ejJQa6XzU3CbNqfHUMHjSnCLkx/SMv8j4VLk/TwzKn48euWpPD5kjiEw/K5EdCLyh3I
 5rDlJHdGdNwsI80WFvjT+Nthdogk7gX3MzPut+tpg0xOqCQqrcK8N9fGRc9Cz94QTqiCoQbJ
 1aK00/b5d2auCFcjNcS+xsUxIs2DcEZwZ/5JabdZtejKoy5rhoM5VkUJywSB3DVfS/36/m6S
 5PjZCQspTRo2wurhIfghd9SFK9lisBRE5PxEJRcFBZ+TVSwWyiqDBOgwPlvSs00jCw2rxjIl
 WS1ZEyarRHRu8J3qNgPAHnlcKdBg2aMLSQAd3CG2eVSzj9HMCqq74XWTZZcFWTDmpAXNG2HO
 wU0EWpRkeAEQANZTBDts5z2kvRf1dCDITCZpA1lc3SKzdmtV1twanIvWJg3/c1L9wlzMHMYE
 GkcfYjQ/FAhX2OQHhiMsERbZFNOiN84GTEz+B3ZXt8o+Nhltbn9KQpo3P4NrBYIoTQpcJxJj
 oGny5q3fDcd9dzeOhkqDNWtbHD4FckYCfRJMOrpWcWBHPuBh97RV5G8WvJ29RHHLnFVSdvfF
 XObRv9KdW+BVTgHE1gOLSxAQRV7++/Jztj1cBU426hMQUzdzg/syA6kvc5ifblRlZgKqFoIK
 OoAf2dAKdyrgJgl61kZ45sBdUUK1kvyF7qEx5s9d88gjRgCG4/Gf0zJYUZUQLmK/bGhOl66h
 ujdSnd6fewnNSzXDOX7XYpw4GXIowz4HEjipdRoGsqfBkpl8vkOCejW0HGkkxoKpb5AgBEJh
 PrYSYE8gU/ztxAk9FR+CsIjx/cI1ZyCY+i6/18HhX7wKB/EXroFQD7S07xukvt1XruAxxjI+
 xSFApQdOoCvxMU6e4yq7826YgUwvahEwqR1OczortM4BN+y5tT39gPCA1GcSyygjQ1UvWO/Y
 OuSWNTebq7YmwwdbNQSeRqMpCT1C8+sFa4Ao70fuZLeWtWbZxWqP8iVn9PjrATPmpzmJKVlY
 jHWB9yrIUSQXg5EWxhZugrtaRCClrlNSdOq6zd27o7egUf9DABEBAAHCw+AEGAEIACYCGwIW
 IQS/eahF6I7wBs6Qscj+3fOXR20WmgUCXZ2PHQUJBOpeJQJuCRD+3fOXR20WmsGLIAQZAQgA
 HRYhBFtzh7Ddltwny6QEKohnC+JYucJYBQJalGR4ACEJEIhnC+JYucJYFiEEW3OHsN2W3CfL
 pAQqiGcL4li5wli1gxAAqaub8cD8Ho7EsnWbbmWCOPodeA8ygj5+6zjzIgAgpmsb24Ndo8i3
 dA4P4/O2nKlWoElZ8jocuOzlRhGyWpamXPq6kFxnp/d3Yo0LWD8XpdI4FSbq6/Ewt4Smzobw
 LxlRNXxHNHfBp6obdRZ3WQV2RT9gTZutFSkMQJsnRWCw+pJwOJ9zV8r0BVzOYUAdVmXvOAui
 FedqvvS41JoqAEafo6aIOCvd5/o3JrjHvwV6j/RIJkTFtCKZ+hKjmzs6kn2Ax5VOm+BlLdyJ
 vruusi77kRIGLETE7ODb2aBZxv89kWUcXIUYMrx7UqJoOwx0x8VIrPfMy/4vnq6G1Blin3X3
 DEBo2jZ2VcETr+7czkuHAdeDrpsCzZAqEQjYbZ+ZwKBuIn6JxKobewZyeyeFGyPjrDgbtc+X
 VpCwxQUNSezAIB4qkuJyq7p1Z9ARVcSZCvcEWENhVUudy/SBdlQk/uGA7U2hCpSOcYFftVJq
 wa3FiMIXv5VOgqM0nqSksLiHl9RdiO2xeulx/jNKlJGhRJ5bRjUKNUlctJnAueJXGV8OqER4
 V3fRKL4ra+SmxnywlV1DGzXyzuI1ji4gCmpue++nKRGl9OV086cHG82aMHJ1Iq7HHvSB5s3T
 aiRUuNBihHsv+5OA7QeOkeQthJ/Bh+WD0gxTfSziwVlyQVIlN5UONskWIQS/eahF6I7wBs6Q
 scj+3fOXR20WmnY9D/9k7DRwmEhTGU11dbneUHdrU/Bob6hRqYUisZSrW1mWCtOYf/13wLHf
 lMLtOLUYfY1OSDka0YVI9orOoJEW6CxQPHvTmU9S8Gs+m48AEzQkTpn2ibkjjpUHDJIUxRkb
 ngfpVg+Nz4SutUojcCV6OHJWgOBBqP/j6vJlFGqZmW+fVynQRZWZH/v2tWxaviQRpCiFq0J7
 x7RDm1jlyYb1KGR01O50Rml1StFcCcRnQUZzRrpZOC4flSJV+CYCJqRogivD2S2lDMAvJbQ5
 hb+gR9XJXjzQfQVOhSvcQ5/vlnFVQ1TElaQndjiXW8DKoHU4u0ZUpacXaWrsr0FwxfYFFcQr
 j1sMDOK8k+FITwsM+0+qs9wzCAEaVKQvqzeCvOFHn7upKIo0oxCu49ClJUkXDiFxc5nmaTaJ
 dyNgt2JlczviedSH7SPje0HRxklkz2pYHuG3C6n4SpSisWYz7FMnjLuwNVsbjeIvz9aKtnmo
 1BqJhl5xl/5svdwU/3visQVhuw6IEZ4y9i7EnQ0vlQn24Gh0zftOFPczA5i/2e7djTMJEIWa
 mmnPDAuNbXbI4S7tiW4ozBrSms7q+qJWyfyMNcawVGlkGQBQrKp190AlmhAHCZX/iQ5YNhJN
 3qrPzdMpZSY8tS1uLhvmGYpTS/9f45sPXzS/T8uYEUswfbAvEIfzg87BTQRalGNTARAAw5k8
 m2soyJoU77dkVKQJSwMT/vYtFS6MWfn4UNA31MtxAigs5ITRw7fPpLuhXtmHhfhKD6W8yRB7
 7DgAvNchGLlMfreuCobL5maxLQWhMheltP8Fz8exXPLhg41qTdN9o00tf+jyrWAB1W4AJfsR
 0gPuvH6P/nqOe5riWazBwpg4i2LW58G/MNK4qLnhXIDEhTYYdmhbax7cS7hXzK99RfbxBUZJ
 L9jDqursHkq3VDVEHKyJzxwTOQHot4ndogF4xm17XvogOnmx9fZoL5utZvw2n6FoN4QfOHGW
 mwTa1pZNlUD9Sf5L90DVyoXe4OcdqlpeuwfK+LYNeNu1+Iih4EwYoXPoOGmCrEQif6uzH6Nv
 vtJ4c1afCsuGOdCSOhEFla5DagTsXaQ66haZLT/I4PefxTuzqmUOKCL+GOq+jcXlA36wtJ3D
 0vI/og426ltZHk1O0ks3BXE4cBzFkpkPgBv6/DMay3JSIYNxYz2mijbwNf2pbn3XCaW4fqM5
 4MIAdgE+EygSVRy5iHv3VAxPpO1ztmewZrTi/xDlu5LmCuOGHQjntMr4W2wjdw70XYmMTOJl
 +eJoSB9Xx6g2qzWe6Q2xJQORCzFmuvfP+AO6HSvXPlyzwa1cSlPshJPOYHW4aupNhuLCppt3
 +Ma4gw72rcI3XqrlXo+kI8fiiI0MguEAEQEAAcLBkwQYAQgAJgIbDBYhBL95qEXojvAGzpCx
 yP7d85dHbRaaBQJdnYqaBQkE6lrHACEJEP7d85dHbRaaFiEEv3moReiO8AbOkLHI/t3zl0dt
 Fpq+ZxAAv6a+B9n+EH43XJ5du6z0RolTEkmmL9gcKPOZfp5+MVt+Fxa0qAmywQh9Q0sJdiJS
 PGKpYFcn9FiOz0qoahodZdIOsISpN+QRqQ7sXJ6BDchMfidEAXCOyKIB93jAScimQsI/jZrf
 4FHmoPxCYd1CDgm/Fve8Rc/mOb9gFbZ59wSnHAtqftidqMi1TJ8syNBsoRj3GmgoG+a7Pptr
 s4LYSfY1qe0lFI71ke5x5lkyWr2pLzcu664AGXBNzHf4dVeSszcWizwvbo743U80j4NhgClj
 CuyvD0iYYBuLhiKzMXEnIUJTkyLwQILsotJZJPYzqJqOsJ9mumX6ig9mSPJpybn+Kzcf6C92
 W7qGSMTdE7q70dGfW80U7TO68MJfVNuHXvYt0rqpkrJKdrAckqKEPzKvtPUEKZ2i3pFTE0ya
 +HL85txMsMbzoJDMGaqMVQ4BuSDDKaJKRDTF1R/Pc3PGKk88Jd9zfvC+NphzZ6X+r7uGvaH5
 F0gVt12W190sWbSAz6mRi5vCMFXr0wPyVsamRBxNNMwhwKhxGabFjtG7eiVb1olJHaeLjVM+
 atdL697dUndG8Q6fLKWDZ7lSrYOrwsujQ00NQ3hu0ISzmH/72230AnaZCgbXlEoULDc/2UTe
 r0Y730RRT9DNih2NszOPOT1ziKVQHyvIJ/GRjp0WXsQ=
Message-ID: <996dbd98-47f9-1cf6-fdbc-3fbee2ff2a64@gmail.com>
Date: Fri, 11 Oct 2019 16:21:29 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAGyAFMV6=0XB+FxTeTM27v9PmLsd3_+VCTVnAQcUCmdaYXkBRw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6663056043784048379=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6663056043784048379==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pV2PE5JenGaCFeBu3J1AIzKqMM1ki9Zml"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pV2PE5JenGaCFeBu3J1AIzKqMM1ki9Zml
Content-Type: multipart/mixed; boundary="BFietZViPHksYnltVAPR3xqMFSbBfOStt"

--BFietZViPHksYnltVAPR3xqMFSbBfOStt
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I have bumped Wintun version to 0.7 and signed openvpn-gui installer
with OpenVPN Inc certificate,

http://staging.openvpn.net/openvpn2/openvpn-install-2.5_git-I607-Win10.ex=
e

To use wintun instead of tap-windows6, add "windows-driver wintun" to
your VPN profile.

Just re-tested on Windows Server 2019, works as expected.

-Lev



--BFietZViPHksYnltVAPR3xqMFSbBfOStt--

--pV2PE5JenGaCFeBu3J1AIzKqMM1ki9Zml
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEW3OHsN2W3CfLpAQqiGcL4li5wlgFAl2ggdkACgkQiGcL4li5
wliU7RAA06MdoVOvE/4CRECRsHCZySSReem27QKNzKTd3TttG3REUwmqeXoFhD/E
URchJynGnbZ4nUUXzWofF4QipeldovPafPRZxPmQBzSSI1kd1mkFII79m1vPNlDh
u0jbCpct0xPuTpwVCvR/eEn18IZcXBlRMndkzxYgVTCSnklA36mS1ejZ2IjPXh2K
xRgPjpYKoca3j0m1xWETd7KnMHmcvIWga2bqCxVdZt9MOxXH5Uz5zQCeR3el+0Nd
xSS8jKYCGDBU5hfPoPWaK1bqe2CioWlLYLXqbHw9Jqd9moYQC9aAnjkbqBR9+DkW
R42pwr0Uau78S9AnkQWsMl8sFsA3ZiVsBav396pXAmUohh0VOUc/dO5qu1OAe1SB
GXXXeKwqZSsGQ5ZNcvs4JfgQz0+ABDxPr+qlNS2A1im3KTVa3Vf7iOsUsjV+vtjH
C5Z/TJBM/G6YYTvS664cRHahau1VYmYiMIBxxAtbTFoPzZAKkZ3vhMCst/EUQ/RC
OSPtbt7Q3hBTbNOFS/oFcpKviM0Noqq19rJDJ8OWaiJ1oFpKHf7ZTrUDA+kMxpNT
9VZmt25BXv1qgmB9Ed8TnVog++zfG5WPSgqouvFOA6gaC7hLEiil4uU1Qzd5cRbb
idfekVNiT3xfUpnqXWI0qHB4SYcRWSmJjzmKc92l9g7JosIj2O8=
=GxVp
-----END PGP SIGNATURE-----

--pV2PE5JenGaCFeBu3J1AIzKqMM1ki9Zml--

--===============6663056043784048379==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6663056043784048379==--
