Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC263C04A95
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Sep 2022 09:32:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 111a9126;
	Wed, 28 Sep 2022 09:32:11 +0000 (UTC)
Received: from sonic310-57.consmr.mail.ir2.yahoo.com
 (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1cc408f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Sep 2022 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664357528; bh=MWStikvWB2ozF0VMaHvMr0ixdv06Wkei6FO7jyd9EVk=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=Lf7+37Bz8ToiJ5IAugaXtMzu9dC37IUYY+pppV3g+zoEqS3RvmQM/+bYMxAi8ME4+sWW5IIBAKZIWlPhvfDZ7uv0SU/rwl67S7v4TsSJYD1WQoGixEBOtMvLo7PLvYvN70cH1g35DhcSso8Hsp0HcDCL0z7Gpm4WEMEhFiFGtddSo8kSQk7WG94XA3Spxi+PftX1pREcUsdkixviDFVar+24CAr+p68vZGqBhPoOAcFzdYod1ZGzAXc/89OY5BnYrkphnbuCrRfURTjrvinxnvgNX/6ZRLEM6sw0QN1BDDSD3gmeUsxYVj5o89EIw9ckQQ+yG/VBElE3+kKafaKNlg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1664357528; bh=wCSHfSP86Nx2P/AdflxbqWfdPmb0Vbjp3R5IoEA4a+U=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=MeIQFYRgTxshifF2r2YE0ulqCi9Lrr/BJPK/roLUnr/wXKCdhLlEwbuNQ4PaSNZoPZ9IVUIaEOAVHNw2CYOh1iK3FX7DvWKGZbH/jV4N36GFl42XizdX9GCwfOX4vCcIdT7Kum/YFvwYfAU8Q2MpJBPGyDGLTvFfoUUZoaYwY4nwNq0i5kstiZ0MKenNeALdBRzxPnT9nTZ45AbzpTKPm7hr57sPSqajvOfnmdSnjviYUbmaVFvK9cRRgzgpOydqw1AWJWH8/v2L9CZlor79hWGOAekOBs5BQiWWn7MANXu4Sp4YCKIifZSCeEOCPBiP8JD0NzbQR34lF+CGxj5+Gw==
X-YMail-OSG: Bfy8FG8VM1lCW422lT1tQ8m.mkcvFCvOBRf8Jm8RAbRNbLYueESpNWy_kznORk2
 n4cc0BIekotQamZ3GUojK1_kPmPFI3DUBSCAobO3oHIK1PR0zzUA0pnoQH48DJyFTwahLDrSNXga
 QU5J30_vstSKjMHBmJjUgOl49QldjdjcCAfAixs7QC3OilceXSDh92ZhwcCz21XrVI2.bEIhCuDE
 lk6gUGYIPEflyXX2drUnxwI8nkyRvheR3l.N1kQ_6IvEj13qNsm6CmlpOM7nGhn99Xo8Zv65swjD
 ZN8TiY4bFXxRe9V2lRae1zUR_gN1Gd__Qa6LF_5jniL_Ppj90id5UMT6.WdzduFd1fJCCQa2T_A5
 md7RV6NXDItcuzMYU1oXY_bFFPUNAWWTz2E.ucByOsGElqj7WiPzheeubeZyJxH0qBzxDTN6T1Sm
 yx4TOXbWz5oj71Ww3RY7WWiyCXN2gfnNRx_2GGQXBaK4ySPV41ilk98qKh_anFg3MATxrGUujW7D
 JQzUwCexl1God0vbKO0obUNgoSqwsPFAMK0r0jZh1G5lRpntMCliPQ2_aqLOMAJHq74vVjXylz34
 MzfQ_yvSAoH6CDTO6EQsoFBFEGp6TJ7_gVVVllAox.vXtirTK7duW9cu8oYbJLIjEdDpCCcGeOPY
 oX5fxFly6YrW72b15Oe7.vdenchZ0I2N1vJIpXmd6.xdprbJeanPVZeRve9rSkzeGL2qQXd1JwAv
 MCGf54udzw7zza0qDzmLT0L5wSlRGwzLdL0Smfe5lEBrgR4GhYccK0PnYOyagVPyAFljRxTDmbLR
 K5o7sArU55o0GMpLm0zqMF5KVBhkzsLM7rptqXKSynNIq6yzW9y049vdvSOvV3LC.wFW3z9vGzqe
 yXcX9vNKT3ifXLEWQm7s7HaCP90yRmvjKSIC2434LMGjbLM2lDHfY3uy.XWRQ71XdvaxDzUxuhaf
 8jPLtA6JwEitNz9i1wNcZkfXd6HEWCSxqGt2zxtzul_2xZYYLDSp4pwyruLDlQjrIb7u9HPJrRyl
 gjIpTNaDnBNnBCGvhSWOKm7AMmETNajaW5LoayCtKVrwFsVPOvdsKbxwkRWRzDGFnfIxqs1uoEBk
 TXN_v90liskbKK4k_3NpdCFV8nIfgqv5HIktUTTo9dqv49H.MDpHNvvBgdZ13LTmqWU8XiyMjV1s
 jYpC3m0jorp2USIBSv5_5HsxjsGurfoDoYFfZczgl6pBjbQAlqrcSU6mmCYSBqKzEUjOClblllo9
 6VQNU3zLHhHkIuvxjoxwH93B5QDNq3M2gx.k8IWk2NRwUQgyttqOlnltPvVBO3WrNSlehBwZEps_
 nfD.HUOHH1hCJdEb7b0O6mCoOCNhZg_SO.faZcD4WH5GUN_ZHN.EOAVYteyloLGK2JLmqFb4THxP
 VKbybATk58R4SSWBwmQ6Vis7IaiTAGVl.0Qc.PluET324In67qaBKc6AbzTalNyhOjUcsm2y_jRc
 bzEnWZNtlBHxZqQZfjghYqXtHLmXzb8Jh2iNBj4GHIlu5Wk4usARCj68.8mJLhkEQTPpKVDenSbO
 aNkTUveLCH4.CYblgWm4WYtPOjTETDbluH4hLKPI0Ijrkx4UjWPjcrmiT2zr_FQxhhAAWntZWTrT
 bbdCgV6yBMKDe2D333xxKaJSGcdMyjF1sMWP_QVG2JHEnfAf2jA5weVY4ryGx0AGEOM7.NxwQscv
 Ln9vkWg5w4HsxkAodz8XOQghEc5mgfooFie1eH.mhCdWitFiTVAWZRMl2eHzlw5mwELQ.z2rb0k2
 4.w5575U1sYxEVq6Yicr1xJ.RfitfNBaUV7qVwtd8rksI8a2nkFsbcxsCEaMyIAFCk5NuKBvmpQG
 lyctTXZetO_9iQwr9x__WVoeaVWEOcs_h9AmNpyQFb1BiVgLj6RlCBwhdGINVZ0vOb94setmIvqu
 GayMlw0h_p0nRWAzR4K7VN86JvesItgxREa6xlTwUyUTrMjXTMJ1iX2yfvFw4UrLEWXkrSnv7JK2
 eqXWty1IKHc9OlhMf_7RHrDZv2IXrdBhBCnr7aK93JIJN7Wd_0eWvW1dDhxwwgQg1PRMMMY6YnAX
 NZ2ClhUs.D4TMyCKS5He8jFR_j4.I1FNTK1tIszVZ8EyC1txmk83eQ82jDaUWg02CI5CeYriGJ9g
 IeOfIl3rUMbzlfeBjepHaKojBGI5P3Hs0PTJNR4.XvwoMvq73xvAQOTmZPQ--
X-Sonic-MF: <powergame_coder2@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ir2.yahoo.com with HTTP; Wed, 28 Sep 2022 09:32:08 +0000
Date: Wed, 28 Sep 2022 09:32:04 +0000 (UTC)
From: Mehdi Haghgoo <powergame_coder2@yahoo.com>
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <561370843.2818033.1664357524603@mail.yahoo.com>
Subject: Wireguard does not work in Iran
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <561370843.2818033.1664357524603.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.20702 YMailNorrin
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

Hi,

It seems that Wireguard does not work at all in Iran.
I used to use it with nmcli on Linux, but recently it just does not work, even with ADSL Internet (Mobile internet is mainly shut down).

I suspect it is not because UDP is completely blocked, because I see some other VPNs are working with UDP. Could the co

Are there any suggestions to make Wireguard work under recent harsh Internet crackdowns?

An example of the Wireguard conf I used to import into NetworkManager is as follows:

[Interface]
PrivateKey = xxxxxxxxxxxx
Address = 10.2.0.2/32
DNS = 10.2.0.1

[Peer]
PublicKey = xxxxxxxxxxxxxxxx
AllowedIPs = 0.0.0.0/0
Endpoint = x.x.x.x:51820

Best regards,
M.
