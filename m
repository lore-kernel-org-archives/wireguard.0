Return-Path: <SRS0=qPON=AZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35175C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 13:50:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3DD7224B1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 13:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xand.uk header.i=@xand.uk header.b="Q1UuqOA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3DD7224B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xand.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e6abcfc;
	Tue, 14 Jul 2020 13:29:00 +0000 (UTC)
Received: from bean.xand.uk (bean.xand.uk [2001:8b0:193:1::165])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2cacce87
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jul 2020 13:28:57 +0000 (UTC)
Received: from kronos.xand.uk ([2001:8b0:193:1::162])
 by bean.xand.uk with esmtps (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <xand@xand.uk>) id 1jvLKK-0003yC-FG
 for wireguard@lists.zx2c4.com; Tue, 14 Jul 2020 14:50:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xand.uk;
 s=selector1; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
 References:To:Subject:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=V7fnHHgqAsIeFeCzIufhbpizggz75U+8n0FCiZiFafE=; b=Q1UuqOA3CmZf/q8ilJL7B2QEW2
 1/MN8tgk2egj0/GRxpiptc1ThswVWFrsUIVspuho67SBTH/hy5JQSKqMezHgTbmtkTuU8q3YJinoE
 Qc+psHHerC8j9lRaBZr/jt8CYYzORtphQzdjYIPCVigiTZxRSMJHuCjSxZp/kkz0N64I=;
Received: from rainbow.xand.uk ([2001:8b0:193:2::10])
 by kronos.xand.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92.3) (envelope-from <xand@xand.uk>) id 1jvLKK-00020f-A9
 for wireguard@lists.zx2c4.com; Tue, 14 Jul 2020 14:50:32 +0100
Subject: Re: AW: two client connections -> crash?
To: wireguard@lists.zx2c4.com
References: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
 <1594720777.ugfhft3s9b.astroid@morple.none>
 <09a201d659e4$c6e01c80$54a05580$@lindenberg.one>
From: Xand Meaden <xand@xand.uk>
Autocrypt: addr=xand@xand.uk; prefer-encrypt=mutual; keydata=
 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
 fqkLTbFhIxZmBcyDfW1HzGA=
Message-ID: <41f52bae-6caf-75b4-3b69-c0a2e10451db@xand.uk>
Date: Tue, 14 Jul 2020 14:50:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <09a201d659e4$c6e01c80$54a05580$@lindenberg.one>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="uhq7pUNjJ7cKPlyN6UvCiwP8eQU2oEtkO"
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
--uhq7pUNjJ7cKPlyN6UvCiwP8eQU2oEtkO
Content-Type: multipart/mixed; boundary="9nFkHyuJvBUwNrGfeqDNclj2elyNqhzDh"

--9nFkHyuJvBUwNrGfeqDNclj2elyNqhzDh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

"AllowedIPs" is the list of IP addresses/subnets that should be routed
via that wireguard tunnel. In your case you've set both tunnels to be
default route (0.0.0.0/0) for IPv4 traffic.

So it depends on what is the other end of each tunnel - and what you
want the tunnel to be used for. AllowedIPs might just be the private IP
address of each peer if you just want to communicate with that.

Xand

On 14/07/2020 14:43, Joachim Lindenberg wrote:
> Good observation. I never really understood  what IPs I should put ther=
e and also didn=C2=B4t find a good  documentation on that. And obviously =
with one connection it wasn=C2=B4t that important to get it right. What I=
P addresses or network should AllowedIPs refer to? Client? Server? Tunnel=
?
> Thanks, Joachim
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: M. Dietrich <mdt@emdete.de>=20
> Gesendet: Tuesday, 14 July 2020 12:11
> An: wireguard@lindenberg.one; 'WireGuard mailing list' <wireguard@lists=
=2Ezx2c4.com>
> Betreff: Re: two client connections -> crash?
>
>
> Quotation from wireguard@lindenberg.one at Juli 13, 2020 20:53:
>> I am trying to configure one client system (Ubuntu 18.04.4 LTS=20
>> (GNU/Linux 5.3.0-62-generic x86_64)) against two servers. The=20
>> configuration is very similar:
>>
>> root@Mailcow:/home/joachim# cat /etc/wireguard/wg0-client.conf=20
>> [Interface] Address =3D 10.200.200.2/24 PrivateKey =3D *** DNS =3D 8.8=
=2E8.8=20
>> #10.200.200.1
>>
>> [Peer]
>> PublicKey =3D qn6CTz578gbrYpzYkvV2okoqkIFHKye+mRj4i/I8Sz8=3D
>> Endpoint =3D fire.lindenberg.one:51820
>> AllowedIPs =3D 0.0.0.0/0
>> PersistentKeepalive =3D 21
>>
>> root@Mailcow:/home/joachim# cat /etc/wireguard/wg1-client.conf=20
>> [Interface] Address =3D 10.200.201.2/24 PrivateKey =3D *** DNS =3D 8.8=
=2E8.8=20
>> #10.200.200.1
>>
>> [Peer]
>> PublicKey =3D QAJANxtuAvdT+HR3fP1I2DXq0Azl0T3jF5s+cW7foSA=3D
>> Endpoint =3D nc.lindenberg.one:51820
>> AllowedIPs =3D 0.0.0.0/0
>> PersistentKeepalive =3D 21
>>
>> Wg-quick up wg0-client ist at system startup. Now unfortunately when I=
=20
>> do wg-quick up wg1-client the network stack kind of crashes. The=20
>> command does not terminate, and connectivity on all interfaces is=20
>> broken.
>> Is this a configuration issue? Should I change ports to be different? =

>> Is there some other issue?
> The ports are fine because the IPs are different. You use the same Allo=
wedIPs for both. And they cover the whole network.=20
> This cannot work. What is the intention of that config?
>
>> Do I have to define two interfaces or could I have just one with=20
>> multiple peers? But how could I then specify which tunnel to use?
> Depends on what you want to achieve. Sure you can use multiple peers fo=
r one interface.
>


--9nFkHyuJvBUwNrGfeqDNclj2elyNqhzDh--

--uhq7pUNjJ7cKPlyN6UvCiwP8eQU2oEtkO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEVy5ZREGPoYoDU9vApTw/wGTQewcFAl8NuCcACgkQpTw/wGTQ
eweULhAAoDftJz5H+bYu29NlEXeGgNFaFsmJa/iQ0QY1zVWmfW3nrdnK9Eua7eO2
36m5mLlunPrhriuIH8Wlwc0gEyibGpFRu0h0UYrbZW9PPprlTIX7c/RDsi84BrBi
J6KcXFVNhOF9/NKwbzoY0YFTG3Y5plrhzAtPRgqUWIe90HALaBTKaTJspYBBQ2MI
OSFu0NRD/5n7CMYr6tnCEHl0yt0ddd0lYtwrc5D7rtRbXdVspxyq8MrX9eCsOsax
SObuWMC+ZeFvQ8LCFf7MC6LryWMmbDxMA5A5ncQRwjYbQNNe34qY5tzWIIFtj1NC
zcytEMMQ6eee5AriYVI2CeXUdbZTqOqlboRbhtt1gYD2Vk0q9Ir0igLdPCJz7Rn0
beF18YlSepi/ltc4wxl8IJk1otkcwiuBvLHQQuz+GxLkVfKS34tZYRlSUn+9VPvb
dBduY507XAT5Zhi/F/8bB8dcI6ZR/gOSs6fVsOfvSZ4yTPlPw5QYWYMToVxwsQk4
gJkb23xwtcikBuYD+YlExpjIeOdeHh+hlYl67wfrzHeSPh4rqiW/TRdEG+RKVn6K
MOMDZr39o8hshVPAkvqxAJ7EorosdmT7i8358SntrtL8VeEnBRRDo0cURF+humV0
5thC/DzrAcnZbw7dlH1uCIdktesQ8PURHUiNTaeHYJT+PqlNJBg=
=ex3N
-----END PGP SIGNATURE-----

--uhq7pUNjJ7cKPlyN6UvCiwP8eQU2oEtkO--
