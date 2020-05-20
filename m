Return-Path: <SRS0=qtc0=7C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A439C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 20:53:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A709F20756
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 20:53:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="b5dAXhC6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A709F20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 577a21a6;
	Wed, 20 May 2020 20:39:20 +0000 (UTC)
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 593259f0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 20:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590008027; bh=JJsUK6c3+cxfAOen8njC4y131xS0QqSo0rhB08P5Dnw=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=b5dAXhC6Upqu5X/9dsijMIU80xSAxBmJj/5IjHwXBncAs6B5AzUNHT3BbvGFkHHwpzQr3wCpCTo/RRCgy+7yTimKPNbpbG0L3j9Glw+xuDOjmN+KSNxGYQYpmoXjrBG7ij2iTrx+ojb0sURGUbkXdawTyi0i2v2aNEo8ZoGGBAXdCPqxS+OqLrULUPyZOETw27yMoKghmT5x7Cd0tlyJMdCAqwOhYWmDO77uXepA/Ioc+miiJIcUJ8D6SjRf1W9teXr2CRhqy8GERpKsSPfKf1kAIhz8bWK9CMTNUGA8cYltB0csGNMLu/fcjDYXajOg7g4PQe/ZDGPuuNfr6VaY4w==
X-YMail-OSG: ARStaOwVM1mpe3GSlup36sESSlv6qAJCeDdviOQrODzK2YXpXbhoSua6Z4lwwm_
 zMjnQj_imMgO8xpCF8x6wzrQZUejmo33owaF6hObKyilaUlgeWgdCRj82qeko1P8t_UKfqSC02m_
 On_qa4UFkOzndjl_l.2wcLuMbFy6pIJ.3MFeK8AUtlYhCRkxkcHfMWW5VLkfveg2W_Ru8CoM0UTe
 oisVz6cE7QdA45lKN6eQLJr79lPZxiVxXAl7h7zQMuVH8xG0fsl0OGC26qCvJcx9uKuK1Km4SZkH
 mwA8ZF4H_XeX3G2ROIJmqy_5KyAKUpIbU5ItoIeucBKOBQRBAhWRoue82qKaGISl1ty8EcTFSEU8
 POIvNmqI6qYdgOxJOPBQv92z2_guddYkyBuRNO5_KPSPEC7TV13bE6I9zcaIBfoCCF.RwVsQ0mlj
 a.11QAmJnHYSOgAn_afdZUKyHj4rZMfBwyxrmRufCn8ejQ3xKfcgYbG8F8b3kFQq_gXrydEgNDm8
 bxRZgAJuY.6aHLNYS7NJyy2DHtIcIoLnFqUYje_jNXNXqeDi9nZsLhrrvpFjfWo58K0EdMDBZzVR
 qTAJ0w_.X0X7xx5U2q.Cmw.dEK5H0nQlWu5vcY6NnRx11Q8asfblxY7ia6J0wghD1pxFcctz80uL
 x4ArISn5RngRO1rEX4xj6j1uY8WUcGBwss5rdoVPnoJiXoaI8VV56diSpSCDVuJI_aUeZBNZXhxN
 hbMJGTJTaetO1K3rh5nx.KNKmw9ahBNq5bm.uOVx3z8ectvAkyDYF3PujxA775u2Nyxe1znuHeLv
 CCAw22wPO579Y5TG2oatwhUwoLIIx52QPPRhqsG33KpMYi0hqViZhNLHVskM57yPwDWwnXrFc4Ky
 mbIyf8cGrP.rirVGcBs2s0sq3N9Uo80nL_lM5CRDFOciHrpqX3Scvk_FglmxY_C8YLaRTQeWHL3W
 uhsvZCHQopWK2w1Tq0.GdA0UBb7NrtSnaJP.J4M8YvBqBsLxxM3WMMXcx_MmtRuf2QSo8jJOMpWy
 EUQk5iKm7LMw5Pa9KSeQduyYtpx2ZLnSD3Bj1V1CYbBxn3IiFWusXUTK2axNg6CyVJirQnT_aetC
 4rr4RUTCoWICVrH638pg7X97HOE2j_66yUnFb0tBYrUshg9nLDq.m7FJKHCaK8GaDkn_yt0uMjF2
 uOu7vEpG9uQBhJouro0PszxPpPVyqMEpD1PhcQNyGi9h04bRC80nNjnGnVsMZoQUNFF311hgH8eV
 1SfSgkJPAoJv4pVEkrdxWl2JeaCqhE2IwspVZAuKg3Y_dwdf5_CtY7ajFyrJ3ygC4TnRfiIKA4JU
 kLu8SfJzbk.HaQWqEL5Q8EN3kNs4-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 20 May 2020 20:53:47 +0000
Date: Wed, 20 May 2020 20:53:42 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: wireguard@lists.zx2c4.com, Harsh Shandilya <me@msfjarvis.dev>, 
 Mehdi Sadeghi <mx@43.yt>
Message-ID: <1693606427.2437935.1590008022682@mail.yahoo.com>
In-Reply-To: <81BFEC8F-2985-447E-9B08-5671682DBD3E@43.yt>
References: <1587211445.2302354.1589995651547@mail.yahoo.com>
 <7CE4203F-F77E-479D-8F0B-E67A366F1EB3@getmailspring.com>
 <1737830936.2355235.1590000031565@mail.yahoo.com>
 <81BFEC8F-2985-447E-9B08-5671682DBD3E@43.yt>
Subject: Re: Shouldn't devices tethered to a device using Wireguard share
 the same IP?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15960 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/13.1 Safari/605.1.15
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

Thanks Mehdi. I'll take a look.

@Harsh,

Thank you for the clarification. I will reach out to both. I know that on m=
acOS Catalina, Apple implemented new APIs for loading kernel modules now th=
at the core of the OS is read-only. Not sure if they've done the same for i=
OS. Perhaps they'll announce that next month.

> @Harsh - I do have a rooted Android device with Wireguard on I can use
> for tethering. Say I build my kernel module from the list you sent.
> How do I go about integrating it into the Wireguard Android app?

>>>The app will automatically detect the kernel module and work with it,
>>>there's no user-facing work to be done.

Let me see if I understand you correctly. Are you saying that if I take my =
rooted phone make the /kernels folder add the manifest.xml and correspondin=
g version kernel, the regular Wireguard app in the Play Store will utilize =
it? I'm trying to make sure I follow.

Will it show this extended UI in Settings?

Thanks again,
Jose







On Wednesday, May 20, 2020, 03:00:18 PM EDT, Mehdi Sadeghi <mx@43.yt> wrote=
:=20





Hi Marinez and the list,

There is a very nice open source app that can share the VPN connection of a=
 rooted device with clients on Android. Here is the link:

https://github.com/Mygod/VPNHotspot/blob/master/README.md

Cheers,
Mehdi

Am 20. Mai 2020 20:40:31 MESZ schrieb Jose Marinez <jedi_papi@yahoo.com>:
>=C2=A0=C2=A0Thank you all or the responses.Wow. This seems like a big issu=
e for Android and iOS. How many people like me that are tethering, go about=
 convinced their devices are inheriting the VPN connection? Are there chann=
els to communicate with both Google and Apple about this?=C2=A0@Harsh - I d=
o have a rooted Android device with Wireguard on I can use for tethering. S=
ay I build my kernel module from the list you sent. How do I go about integ=
rating it into the Wireguard Android app?Thanks,JoseOn Wednesday, May 20, 2=
020, 1:53 PM, Harsh Shandilya <me@msfjarvis.dev> wrote:>=20
>>=20
>> On May 20 2020, at 10:57 pm, Jose Marinez <jedi_papi@yahoo.com> wrote:
>>=20
>>>=C2=A0=C2=A0Hi Guys,
>>> =C2=A0=20
>>> Can you tell me if this is working as it should?...
>>> =C2=A0=20
>>> I have a phone with Wireguard on. I share the connection via
>>> tethering/hotspot. When I check the IP on the tethered device I don't
>>> see the same IP as my Wireguard endpoint. What I do see is an IP from
>>> the phone's mobile=C2=A0network, the one running Wireguard.=C2=A0
>>> =C2=A0=20
>>> Is this right? Does this=C2=A0mean that traffic from that tethered devi=
ce
>>> not using the Wireguard connection? I'm confused.
>>> =C2=A0=20
>>> =C2=A0=20
>>> Thanks,
>>> Jose
>>=20
>>> =C2=A0=20
>>=20
>> At least on Android, tethering data is *not* routed through your VPN. If
>> you want that to happen, you will have to use the WireGuard kernel
>> module which requires a rooted device and a custom kernel. On some
>> supported devices
>> (https://github.com/WireGuard/android-wireguard-module-builder/tree/mast=
er/kernels)
>> you can use root access to install the required module automatically
>> through the app, on your stock kernel.
>>=20
>> Harsh
>>>=20

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet.
