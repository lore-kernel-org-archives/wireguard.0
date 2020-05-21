Return-Path: <SRS0=2ld3=7D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB98C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 07:05:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F7220748
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 May 2020 07:05:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="ZkejJ/MU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F7220748
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c251f81f;
	Thu, 21 May 2020 06:51:07 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e96c8eda
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 May 2020 06:51:05 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=ZkejJ/MUZG2gHniWLUcLG6sgPQpEmGnQB3Z1+pT31i4npg0AbDkzqHl9/4vzN8YwtvFj5iWXL0rUAY4eQKVMPzbI91yo4G75JHJ/RPh2PGwB/3E93kFVTy6UyHfAg8UbiU2PmN9OYe85AHL7ClWSbtvmOBhJO0TO/Tp+HTMYnOp9tOk50UgDM0f6BQ8D0WbDm9+FmPo1Jjwzsy8ckRtXSofNnud3N+iZsIL1+C1OGaZJ7lpZjbaXEHkYPnb2e+uwvxYWAg+QDiPIQf7wrGeNlFQml60kpOdMuCyzzoSViVSGeK/XU0TLtQdxkYK3VW8YGM/TOk69U2JpqDlFbvp//g==;
 s=purelymail3; d=msfjarvis.dev; v=1;
 bh=x700L8vQ9OP4DCZ7z5pSYf+R1dNeAt60wvlsvmxUGaM=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 185.200.118.103 (EHLO ryzenbox) ([185.200.118.103])
 by ip-172-30-0-208.ec2.internal (JAMES SMTP Server ) with ESMTPA ID 811190835; 
 Thu, 21 May 2020 07:05:31 +0000 (UTC)
Date: Thu, 21 May 2020 12:35:27 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Jose Marinez <jedi_papi@yahoo.com>
Cc: "=?utf-8?Q?wireguard=40lists.zx2c4.com?=" <wireguard@lists.zx2c4.com>, 
 Mehdi Sadeghi <mx@43.yt>
Message-ID: <220C4723-011D-4322-8213-820B36A15186@getmailspring.com>
In-Reply-To: <1693606427.2437935.1590008022682@mail.yahoo.com>
References: <1693606427.2437935.1590008022682@mail.yahoo.com>
Subject: Re: Shouldn't devices tethered to a device using Wireguard
 share the same IP?
X-Mailer: Mailspring
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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



On May 21 2020, at 2:23 am, Jose Marinez <jedi=5Fpapi=40yahoo.com> wrote:=


> Thanks Mehdi. I'll take a look.
> =20
> =40Harsh,
> =20
> Thank you for the clarification. I will reach out to both. I know that
> on macOS Catalina, Apple implemented new APIs for loading kernel
> modules now that the core of the OS is read-only. Not sure if they've
> done the same for iOS. Perhaps they'll announce that next month.
> =20
>> =40Harsh - I do have a rooted Android device with Wireguard on I can u=
se
>> for tethering. Say I build my kernel module from the list you sent.
>> How do I go about integrating it into the Wireguard Android app=3F
> =20
>>>> The app will automatically detect the kernel module and work with it=
,
>>>> there's no user-facing work to be done.
> =20
> Let me see if I understand you correctly. Are you saying that if I
> take my rooted phone make the /kernels folder add the manifest.xml and
> corresponding version kernel, the regular Wireguard app in the Play
> Store will utilize it=3F I'm trying to make sure I follow.

If you contribute your device's kernel to the repository I linked for
you, then we will build and host a signed kernel module for it. When you
go into the WireGuard app's settings page, you will find an option
titled, at least in English, =22Download and install kernel module=22.
Pressing that will attempt to locate the module previously created by
the WireGuard infrastructure and load it onto your device.

> Will it show this extended UI in Settings=3F
> =20
> Thanks again,
> Jose
> =20
> =20
> =20
> =20
> =20
> =20
> =20
> On Wednesday, May 20, 2020, 03:00:18 PM EDT, Mehdi Sadeghi <mx=4043.yt>=

> wrote: =20
> =20
> =20
> =20
> =20
> =20
> Hi Marinez and the list,
> =20
> There is a very nice open source app that can share the VPN connection
> of a rooted device with clients on Android. Here is the link:
> =20
> https://github.com/Mygod/VPNHotspot/blob/master/README.md
> =20
> Cheers,
> Mehdi
> =20
> Am 20. Mai 2020 20:40:31 MESZ schrieb Jose Marinez <jedi=5Fpapi=40yahoo=
.com>:
>> =C2=A0=C2=A0Thank you all or the responses.Wow. This seems like a big =
issue for
>> Android and iOS. How many people like me that are tethering, go about
>> convinced their devices are inheriting the VPN connection=3F Are there=

>> channels to communicate with both Google and Apple about this=3F=C2=A0=
=40Harsh
>> - I do have a rooted Android device with Wireguard on I can use for
>> tethering. Say I build my kernel module from the list you sent. How
>> do I go about integrating it into the Wireguard Android
>> app=3FThanks,JoseOn Wednesday, May 20, 2020, 1:53 PM, Harsh Shandilya
>> <me=40msfjarvis.dev> wrote:> =20
>>> =20
>>> On May 20 2020, at 10:57 pm, Jose Marinez <jedi=5Fpapi=40yahoo.com> w=
rote:
>>> =20
>>>> =C2=A0=C2=A0Hi Guys,
>>>> =C2=A0 =20
>>>> Can you tell me if this is working as it should=3F...
>>>> =C2=A0 =20
>>>> I have a phone with Wireguard on. I share the connection via
>>>> tethering/hotspot. When I check the IP on the tethered device I don'=
t
>>>> see the same IP as my Wireguard endpoint. What I do see is an IP fro=
m
>>>> the phone's mobile=C2=A0network, the one running Wireguard.=C2=A0
>>>> =C2=A0 =20
>>>> Is this right=3F Does this=C2=A0mean that traffic from that tethered=
 device
>>>> not using the Wireguard connection=3F I'm confused.
>>>> =C2=A0 =20
>>>> =C2=A0 =20
>>>> Thanks,
>>>> Jose
>>> =20
>>>> =C2=A0 =20
>>> =20
>>> At least on Android, tethering data is *not* routed through your
>>> VPN. If
>>> you want that to happen, you will have to use the WireGuard kernel
>>> module which requires a rooted device and a custom kernel. On some
>>> supported devices
>>> (https://github.com/WireGuard/android-wireguard-module-builder/tree/m=
aster/kernels)
>>> you can use root access to install the required module automatically
>>> through the app, on your stock kernel.
>>> =20
>>> Harsh
>>>> =20
> =20
> -- =20
> Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesend=
et.
> 
