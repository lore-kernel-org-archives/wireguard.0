Return-Path: <SRS0=bcN2=E6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2946C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 08:44:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A53C2076B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 08:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="i1LyV8N6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A53C2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 643db5a4;
	Tue, 24 Nov 2020 08:38:46 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d9f250c3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Nov 2020 08:38:43 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id A08FD2400FC
 for <wireguard@lists.zx2c4.com>; Tue, 24 Nov 2020 09:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1606207451; bh=2WeGFip1YDe01/zxQkHaJH1To/dNHmUkzLUHCxG+2j4=;
 h=Subject:To:From:Autocrypt:Date:From;
 b=i1LyV8N6nAdotm2bFdoTwIeQMKF0OGIkJJU2sxJ5acT1d8EFzbkIpmQokEdvmz39Y
 dOfkNakNHhuvf0eXtdkvm4tadUzUVlPeMgWTVMwdU0j2H+GiTaVOFk8CrRU3fmOeaZ
 lesb/awJxlJCRX7N+KbuL3YOEf65xnHsl5UPiq0o3tkTfYlq5wCuv+bpIzcaSOOdgz
 BZ58c70+2xjZh6+nbaMwJjnhd8ybgDDH9WeCin4na90Z0zc+/UVPclxPtS+qhLxI6C
 gL6UWnz0/JcbngFFLjoJsmbSHcvlCKJqk8llfyIW6MN56efdMmzQzPuThx/h5HQ7nN
 LyxCiwzf0fpGQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4CgHcq1Hp6z6tmL
 for <wireguard@lists.zx2c4.com>; Tue, 24 Nov 2020 09:44:11 +0100 (CET)
Subject: Re: "roaming" between source ports does not work
To: wireguard@lists.zx2c4.com
References: <d8f3a1a9-1f5e-ce1e-06c7-5aab45396d97@westermo.com>
 <20201124075737.GA18512@matrix-dream.net>
From: Eicke Herbertz <wolletd@posteo.de>
Autocrypt: addr=wolletd@posteo.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <5b25bec2-4073-0139-fc4a-b179bd40828d@posteo.de>
Date: Tue, 24 Nov 2020 09:44:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124075737.GA18512@matrix-dream.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NfVLBUtS6TSPXD1l4IDeL6ONIyamMNTkP"
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
--NfVLBUtS6TSPXD1l4IDeL6ONIyamMNTkP
Content-Type: multipart/mixed; boundary="ypJAf63nTvW0mxOwyfWgy5MNPu2KsrIHH"

--ypJAf63nTvW0mxOwyfWgy5MNPu2KsrIHH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I agree that something simple as changing the source port would have
been reported. However, I have very similar issues occasionally with
some of my systems that are all behind NAT. They are remote, so I can't
access their status information on error. Rebooting the devices usually
works and iirc, just disconnecting network for some time works, too.

I don't know if that's far fetched, but I actually suspect the cause of
this issue not in WireGuard, but in some buggy NAT-implementation out
there. This would only hold true though, if you are also able to fix
your issue by replacing related networking hardware.

My central point being however is, that I've probably experienced the
same issue.

Regards,
Eicke

Am 24.11.20 um 08:57 schrieb Ivan Lab=C3=A1th:
> Hello,
>=20
> are you sure changing of source port is the issue?
> Seems like something that would be reported a long
> time ago.
>=20
> Wireguard handshake fails, if your timestamps aren't
> monotonically increasing - maybe this is the issue?
>=20
> For confirmation - does connection fail on wg restart without
> a device power cycle, or if you change the source port
> while the tunnel is running?
>=20
> If your device is power cycling on a schedule, without a RTC,
> you should arrange an increasing nonce/time, if you can save
> data, maybe use NTP or a workaround may be to remove and
> re-add the peer on the server on a compatible schedule,=20
>=20
> Regards,
> Ivan
>=20
>=20
> On Sun, Nov 08, 2020 at 11:00:30PM +0100, Matthias May wrote:
>> Hi
>>
>> =3D=3D Premise
>> * I've recently implemented support for wireguard in our LTE-router.
>>
>> =3D=3D Source Environment
>> * The basis is OpenWRT.
>> * Used versions:
>> * On the client/initiator:
>>  * wg
>>   * 1.0.20200908
>>   * ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9
>>  * wg-tools
>>   * 1.0.20200827
>>   * 51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd
>> * On the server/responder:
>>  * Debian stretch (9.13), installed from repository
>>  * deb http://deb.debian.org/debian/ unstable main
>>  * # wg --version
>>  * wireguard-tools v1.0.20200827
>>  * I don't really know what the version of the build dkms is
>>
>> =3D=3D Issue
>> * We've implemented an automated test that seems to have a problem.
>>  * Each night, the device is configured to connect to the debian box.
>>   * This works fine the first time.
>>   * However it doesn't work anymore after this first time.
>>
>> =3D=3D Observerion
>> When the "client" connects the first time, wg-output on the "server"
>> looks like this:
>>> interface: wg1
>>>   public key: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=3D
>>>   private key: (hidden)
>>>   listening port: 51821
>>>
>>> peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=3D
>>>   endpoint: 172.29.42.230:38442
>>>   allowed ips: 10.0.41.3/32
>>>   latest handshake: 44 seconds ago
>>>   transfer: 8.01 MiB received, 7.96 MiB sent
>>
>> and on the "client:
>>> interface: wg1
>>>   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=3D
>>>   private key: (hidden)
>>>   listening port: 38442
>>>
>>> peer: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=3D
>>>   endpoint: 172.29.60.13:51821
>>>   allowed ips: 10.0.41.0/24
>>>   latest handshake: 1 minute, 3 seconds ago
>>>   transfer: 187.06 KiB received, 189.96 KiB sent
>>
>> Ports and IPs match, everything works.
>>
>> However on the second run of the test:
>> On the "server" still:
>>> peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=3D
>>>   endpoint: 172.29.42.230:38442
>>>   allowed ips: 10.0.41.3/32
>>>   latest handshake: 4 minutes, 52 seconds ago
>>>   transfer: 8.05 MiB received, 7.99 MiB sent
>>
>> But the "client" shows:
>>> interface: wg1
>>>   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=3D
>>>   private key: (hidden)
>>>   listening port: 47858
>>
>> The client device has been restarted in between.
>>
>> Since the listen-port is set to 0, it obviously has now a new,
>> different, source-port.
>> The server doesn't pick this up.
>> Since peers may roam between IPs, i was under the impression, that it
>> would also roam between ports.
>>
>>
>> Is this working as intended?
>> If yes: How should the configuration look like to support clients doin=
g
>> a power-cycle?
>>
>>
>> I'm aware, that i could set a static port on the client, but this won'=
t
>> work when going through NAT with port-scrambling.
>> So i don't really have control over the source-port of the connection
>> anyway.
>> I suppose this would also apply when a router/firewall inbetween has
>> some aggressive killing of states where the keepalive is not fast
>> enough, and source-port scrambling is done.
>>
>> But the main usecase i'm looking at here is: restart of a device.
>>
>> BR
>> Matthias


--ypJAf63nTvW0mxOwyfWgy5MNPu2KsrIHH--

--NfVLBUtS6TSPXD1l4IDeL6ONIyamMNTkP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEysrPy4/39JJpWQvjrB2FpvudpmIFAl+8x9oACgkQrB2Fpvud
pmIbFg/+JT/U9JKbpoIw3+qq1QFzqZ1pR78DOLYmnkVN/JaNRnyfU7kyTN5lwk2p
T2lankdNs3ab/winRLlbrJx76ZkE0eG1qdtaLjbDkdeu0v+h00ftgkyMdTn4u25O
09jmwYy0XjqirR5V1GHlwCoyPPGaQ/DJl16DuQ2PlaOmZa8kmBOpu3NO9IYXO2Oi
/S4Bp8ggsJi9ZqEgJflQrkbYskS47mEPPGh99LIcMTMj0GUClq9DQKCV45HM+XGj
zTx5+wgMnncEkYlJE04KVHtV8hYwPJmu3/nvc389wamqC8KLVh5ue2qABTXVoO2z
AyUyOp/xQCAcwJj9x4w4d8G9Evt/SYhEwIYS8VMuqLQXoSkdkdYj6urmOiyDZn+u
GGuDHV2gXQUU6EJr3rPWVnVZPZCayZHjLX+ROS23cZql06HXU4aYUB4SCOgd/V+x
A1HzIezoBheEC87s6IMQWv+xC4roC3/enqzanXj7lN3+kiO6synGjzWLoaKA4sam
IezAGhSGPwM0uSxp1M2F/1cf5RZmrvRH3uk7bzEMH1I+G6pS5GcgaRqGUSCVEOyI
LXLl7UcIZKFpDQ/sBgEg5spxiVhqyqh+cNLDn+//Ak/ehdA4ItzR2aJSdG4XhG2+
Pz6vEKkz9gHg77kE6gtP4ZbGF7u0Y/B4ssdgDNEuPoBcoAi6oMA=
=G+6o
-----END PGP SIGNATURE-----

--NfVLBUtS6TSPXD1l4IDeL6ONIyamMNTkP--
