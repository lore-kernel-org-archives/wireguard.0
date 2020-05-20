Return-Path: <SRS0=qtc0=7C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C64C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 18:40:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8196206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 18:40:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="EuDSzZML"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8196206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 928e2bed;
	Wed, 20 May 2020 18:26:07 +0000 (UTC)
Received: from sonic315-54.consmr.mail.gq1.yahoo.com
 (sonic315-54.consmr.mail.gq1.yahoo.com [98.137.65.30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 14fdcd79
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1590000036; bh=+dEvb2ySUpYJTIv5mmXXxAt1u/2VniIXccBWvrHWf7M=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=EuDSzZMLmPOJVRavC90eqgM5s8+W5eW9ZgUNr6Y80t1i/1yRyzc/seANb4F+A0v2NLH5149TvzQtOMOGX72FyEsOkwyUbqCIpZeaNMIsXA++9MzI20rdEztK1jN3x4N2dYftovTdVzkcFozGWH7LzD88T3hK5/Fj82Lc0XxI1QDR5qEfOEy5j2x2h7yWkAP24DBXA67MNvey1GEQJGkOoHfJBY/ifKeW1p9FLl8g+LJjG0ki9WERimW/YPlaVMtfOrXi+7o4NeNZhEpB3imAFbnwr4coAmM9ouvHEyLyCEyNliPD//s5m98q0C0mkCT6VyP8o3zqJSV43dOng1vFAQ==
X-YMail-OSG: 5dJF1REVM1mJSix4NSaijNbgbHJVoArVjDk17sPFO3.RFN3roePG1q7BeoM2H2j
 RLekE_xUSugyvu3DYgwCjlm4gNracyb8z0YpIRJCRC3.0F7.iX17org00AWUh5w.eGic9JTX1Q_u
 S.Lg2htcSqbuBuFzZ56In1Xx6KdmYR.OBaY1G9h04LXldwzXu4VzZqNrW8h_9hjLURK4c09MKcOj
 Jkkb8LFPdOPHWU1BqKWVftRH5mkksRkD2tbvGtJNVU5mfFzejuqjIJvVGSBsjyK6wWlZJ6HNS7la
 4EAvJCOBTpPuI4r2pNVz7PbjcMgs0btaoDNYo5KGADD6kjPqhz.APTaTtroyyyQz60f1fMh6SQRx
 E2bifcAGXU0eku5SF9f.MULk6foI08HRWl44eJMSJg.PZhiCYyhD0h42v7YkgirV35A9ax7W5E1u
 iNH.F8FfqzpllKb4rmzEG0TVLK8FfgczgNf8gfmI7x5S7JH4clURMScaAGvoYu6ryKBweLF.abrV
 KU72ic4bWaWRvB6szsYqNiA_aIKxiH9Cti_zTCidFbQI4eWVC4eiHgYQT1kU89okR3IhzioL_Zz7
 NRhOh7hUS2tdsEvJWr3FNz5.07Vc899ew98UgVI4bBZOwq.6WqKdEu3lNzmBk6RHDv9GCf5UTJ9k
 By7oxHxvLCVjMW9p5lxgEivFrOWCiFbuWCLwCMzHgUp2Iu0lXHWy_q67rMRLQTXetHPqatfF7Ujf
 bs1AVQFCUmAHso7JZ4grNVbcfKPd_q1thNQZtIOxByxzkMaidIJu6.SiapE_vDtBXzN8ZAZbDxVM
 X0uO0PJYK0JSfSw2V2pW21O8yHHRwIaO6yhI5PliZKT.mcGodtDfIYAanx8UWhFWZP8olaZeXCVV
 cfpz0ONmbc8wUGcMlwXFbp1wsStUutPJQaClVH8qpnX9.q3exV.zPjNqTEOL.dQgqDxsGVGA0LOH
 SyjpkbSEQJ0nKj9zrX3LsRhIxJIWcL9ZZwoMUQKhsu2n2__q7Ch8CFIFfbWxseg.fHMMNUv6MJAD
 bhfUAZFdTGI155PmriyRN3NL2dkIshuo_pR4xIhPzDzB0ejPbOhl1XaRa8cHBVuHulIxHStb1wkR
 rpH_h.2lbHE22fshNyuztebDVRnw.404_kKw1rTFLpGn3H.AVVQGGyDYLrzdFprG1XKWoR8IUp4e
 D.CbR5UrcEHlFGi3RqhNU0HQvl3FrMLKnnfL3hJsLwgV9OVvD5qdNPwz2kh6xQGFNHA5Sh2SG6YV
 l8XbdTP_0r3QPFSahLQ_VXxTN40f8_vyGLzDxOHD0bULQOhEpBvjofjoEEa7v623CPBJP77u5Lnv
 MNwWdRVXLk19gNyMfRdvpK6HjjraY0oLW63tr4qnGTg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Wed, 20 May 2020 18:40:36 +0000
Date: Wed, 20 May 2020 18:40:31 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <1737830936.2355235.1590000031565@mail.yahoo.com>
In-Reply-To: <7CE4203F-F77E-479D-8F0B-E67A366F1EB3@getmailspring.com>
References: <1587211445.2302354.1589995651547@mail.yahoo.com>
 <7CE4203F-F77E-479D-8F0B-E67A366F1EB3@getmailspring.com>
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

Thank you all or the responses.

Wow. This seems like a big issue for Android and iOS. How many people like =
me that are tethering, go about convinced their devices are inheriting the =
VPN connection? Are there channels to communicate with both Google and Appl=
e about this?=C2=A0

@Harsh - I do have a rooted Android device with Wireguard on I can use for =
tethering. Say I build my kernel module from the list you sent. How do I go=
 about integrating it into the Wireguard Android app?

Thanks,
Jose

On Wednesday, May 20, 2020, 1:53 PM, Harsh Shandilya <me@msfjarvis.dev> wro=
te:
>=20
>=20
> On May 20 2020, at 10:57 pm, Jose Marinez <jedi_papi@yahoo.com> wrote:
>=20
>> Hi Guys,
>>=C2=A0=20
>> Can you tell me if this is working as it should?...
>>=C2=A0=20
>> I have a phone with Wireguard on. I share the connection via
>> tethering/hotspot. When I check the IP on the tethered device I don't
>> see the same IP as my Wireguard endpoint. What I do see is an IP from
>> the phone's mobile=C2=A0network, the one running Wireguard.=C2=A0
>>=C2=A0=20
>> Is this right? Does this=C2=A0mean that traffic from that tethered devic=
e
>> not using the Wireguard connection? I'm confused.
>>=C2=A0=20
>>=C2=A0=20
>> Thanks,
>> Jose
>=20
>>=C2=A0=20
>=20
> At least on Android, tethering data is *not* routed through your VPN. If
> you want that to happen, you will have to use the WireGuard kernel
> module which requires a rooted device and a custom kernel. On some
> supported devices
> (https://github.com/WireGuard/android-wireguard-module-builder/tree/maste=
r/kernels)
> you can use root access to install the required module automatically
> through the app, on your stock kernel.
>=20
> Harsh
>>=20
