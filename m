Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6C7C5B543
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Jun 2025 10:27:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 201131d1;
	Thu, 5 Jun 2025 10:27:27 +0000 (UTC)
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [2a00:1450:4864:20::641])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 24b5a469
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jun 2025 10:27:24 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-ad8a8da2376so131501166b.3
 for <wireguard@lists.zx2c4.com>; Thu, 05 Jun 2025 03:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxpowered-net.20230601.gappssmtp.com; s=20230601; t=1749119244; x=1749724044;
 darn=lists.zx2c4.com; 
 h=in-reply-to:autocrypt:from:references:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1vypAM5ot+ExmaoaXWmXzyU8JGJO6/mDzSj8BxJQILU=;
 b=Sg4/pBz3z/HZi1zSkd8LVz7oc6KLLbsE7q7zpf+/xtoqQHnQGfqLbdP6D2Rofogl8Y
 rkWRmoLX4Bq79QcyPelBQw+e+XWOhnY5VanghWKq1+cBLSiQ0bH731otXnV8UIvSxIiC
 I25EkhrRFkXwjvdHfGu/tmnlhj8zEa32Cf0iYH27jLxLlmMP3D4Cwwt0H581Gr3eFdQt
 ynhPQJQlc/3wFji7Q8Siy1td/r6jFgxnR3gz5pezqargK8aWEoc7q8wqetBrNuFLIOpb
 3WEKtZ0aWvpp3g8PrV5mb0q2R7oH7Cz+plOYLgjYczTRApg2iKoXpKHEM88MXGlEQXd2
 J6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749119244; x=1749724044;
 h=in-reply-to:autocrypt:from:references:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1vypAM5ot+ExmaoaXWmXzyU8JGJO6/mDzSj8BxJQILU=;
 b=J7uf2tbod38cNdwuULPBhsmDjTx7wt1VXoic1FAR/hiXzXgKbjKS3mEX4QUl+xssOA
 b+IR4KMlHAu+sGRtAKLajeAo/xRfcERuErH0UloTjANKC1vfyGBZKpN8BhIeG8HkE2yI
 6kV368f8UyuyIvK0KqBm3TerZNMma17NOsiGEdRXTfTRojg6td5jk6AkRFQl41m0ZIEt
 GptOBZ1hB8MYssOajhE5nYTiSne16v3dBrRwz8CdKFWqY5gvN8slB8PbM1h3P/9SJeQI
 t4FQFHwC+kfF0+AvhjAev7QVXPPy06lLM8Wg9bk3gHbog9S6koMuWor2JEAUoEGg9ITW
 U5DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjmHDtEdLaxir55ysor8FFHl2LXIaO43NwZOeJJg/V8gEs2/vG2Bo3VWMreLBqi+9uWp1jbhUMKSM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzAuGT4uIDa3LZNQhrpc/4frows2WuIsmOlvACwckt0z+wxrkch
 nCdgAJptBjtfhZeXAlMhKwku1ywuDEJbtV79p/h+CZ+wIU2hrYSPeVub93xefxxlP4giY1gb2Vx
 vpPm4VcMhHw==
X-Gm-Gg: ASbGncuqfk7rx9S5JtvtQ6U4vncMQkfz32sOjHoFuqYFPEMMupRqCMxaskGFv+FJDEe
 C4x6O1ZTCAHx8kkDCcDO3Xc+ZIjuUKiipljqGYTiGtapl3UA1tl2BWowA9nXOLkjzvX1Ks5xEXJ
 qxYVaO3V3mQUKXkV7y6URYqUiTO6NqG9+SWnsa521l60gu3u6ZXrvyMA7xl4UMMaN/lZsJjI3M8
 FY5IRzCwpf/FqgUda5QSglWSr6tbAQ1CEXBjsV/v+ojcK8btRZTR+E5wpmpK7WsUykWP22/gKYt
 vgV16S+pvL+SrZeLnWL8/Ns06al/chHBBAXzun5zklItvBc0BRJfXsfF7xNX5F6oSEdOVKLdtYn
 qbfvwt0W/pdFUjEnVadGTr0U91GChkhoJhUkdfqCCU8dRfCPD
X-Google-Smtp-Source: AGHT+IGbw/7lFwjhYQnuJA/YUQ5aE8OjunCTpjOa5cL/XnC5gMMgMciJ3z8aPN6TLvlG5HW42LogCA==
X-Received: by 2002:a17:907:3c87:b0:ad8:8719:d64d with SMTP id
 a640c23a62f3a-addf8d1eff4mr557735966b.26.1749119243721; 
 Thu, 05 Jun 2025 03:27:23 -0700 (PDT)
Received: from [192.168.178.107]
 (149.233.169.68.dynamic-pppoe.dt.ipv4.wtnet.de. [149.233.169.68])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adb390f09c8sm985569466b.45.2025.06.05.03.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:27:23 -0700 (PDT)
Message-ID: <8e9f8b10-f438-40d5-a03a-85ef64632b11@tuxpowered.net>
Date: Thu, 5 Jun 2025 12:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: are WG clients expected to automatically handle it when the
 endpoint is within the AllowedIPs
Content-Language: en-GB
To: Christoph Anton Mitterer <calestyo@scientia.org>, wireguard@lists.zx2c4.com
References: <1a897464d3fb56184b83cb6ac7b4a2407047b10e.camel@scientia.org>
From: Kajetan Staszkiewicz <vegeta@tuxpowered.net>
Autocrypt: addr=vegeta@tuxpowered.net; keydata=
 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
 Wbiwhrslf0hn78s=
In-Reply-To: <1a897464d3fb56184b83cb6ac7b4a2407047b10e.camel@scientia.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dOTDL5EDjSBsWj2EHFimYh07"
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
--------------dOTDL5EDjSBsWj2EHFimYh07
Content-Type: multipart/mixed; boundary="------------I6bEVb4rA6BNDN0fOws6U8CS";
 protected-headers="v1"
From: Kajetan Staszkiewicz <vegeta@tuxpowered.net>
To: Christoph Anton Mitterer <calestyo@scientia.org>,
 wireguard@lists.zx2c4.com
Message-ID: <8e9f8b10-f438-40d5-a03a-85ef64632b11@tuxpowered.net>
Subject: Re: are WG clients expected to automatically handle it when the
 endpoint is within the AllowedIPs
References: <1a897464d3fb56184b83cb6ac7b4a2407047b10e.camel@scientia.org>
In-Reply-To: <1a897464d3fb56184b83cb6ac7b4a2407047b10e.camel@scientia.org>

--------------I6bEVb4rA6BNDN0fOws6U8CS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2025-05-23 00:36, Christoph Anton Mitterer wrote:
> (re-posting, now that the list seems to work again)
>=20
>=20
> Hey folks.
>=20
> In science/education, many organisations (I could find the total list
> only in the Android app, but there it seems to be several 1000) use
> eduVPN to provide VPN access to their users.
> It comes with a client which, AFAIU, either sets up some OpenVPN or WG
> VPN.
>=20
> I've previously used the OpenVPN profile files successfully with
> NetworkManager but now wanted to switch to WG, and again I don't wanna
> use the eduVPN client, because I think this should be done with the
> native tools that integrate nicely into the system (e.g. NM for desktop=

> environments, ifupdown/systemd-networkd/etc. for servers).
>
> =E2=80=A6
>=20
> Using that config with NM fails

NetworkManager's Wireguard implemmentation already has a way of
supporting it by using fwmarks. It's just that the fwmark operation is
not automatically turned unless the tunnel is configured with
AllowedIPs=3D::/0

See my comment and a workaround which always forces the fwmark operation
on
https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/115=
7#note_2426757


--=20
| pozdrawiam / regards | Powered by Debian and FreeBSD  |
| Kajetan Staszkiewicz |   www: http://tuxpowered.net   |
|                      | matrix: @vegeta:tuxpowered.net |
`----------------------^--------------------------------'

--------------I6bEVb4rA6BNDN0fOws6U8CS--

--------------dOTDL5EDjSBsWj2EHFimYh07
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEfSEIcxY9kDeZvSZsgKrXf6bzAFMFAmhBcQoFAwAAAAAACgkQgKrXf6bzAFNT
xxAAtbXG0Z21umYoMpBbQf78XIG8Pk8a9taHSloHqQR/zIi0X9GBvlVCgxInQrbU3IxCYaW7aWVx
b2pUHuxgNezUqAy4mJqS5oloJBllDOaPrLRk63TBzz6KIhMN1vdEH4PMKGP7oNR9ZBRawzGnYz34
eTSzSXAkc/GF3dvlsH7W0aBOT6gyGxefLkheN1hpqwIR5KLhcdQjL/R2rj1Mecv7mUyia5rJ0c72
kN789x2iLj18GTjvGZXgPNwDwsLVxY8nm1k7SoigrtVIWQ3Kr1gz8Gb+SmPPzB1I7QtYYyjxZofq
VFCYV+3FbUtn0tG+ADGvbLsekov2Qs0daRmjm5bklspz+LHpyqaHP9+ELw0Ryci6eYT1N2QuF2j1
CS9wAqcYEJXsLy2CD0BBs6GAAzQV1E4S7EIRKKovexzwqg/ob8cFjo0eVVucgqlXdBZAViURBsX+
6JyBolDhfTJYuFHaaVYMZo01u7xdr3AIPCqoEU8VuC8uERXD7gqGPNfdqT7Ue1g6fFvP3Tgldddh
s7ONXB9Y9EIvYBgw6OGxCol8Qwh8aqyvZ5WFmg5y8dSglTiFCKiwwC7nIwMkCzfdWfUagWrvhbPC
GaS6s8jRSCFT5U315FcDlQ0wBBH5JqbDkn+h10+bdOA15M0n61eaFET3v2jNtHjFGoft2gCThuzT
A5o=
=1Nss
-----END PGP SIGNATURE-----

--------------dOTDL5EDjSBsWj2EHFimYh07--
