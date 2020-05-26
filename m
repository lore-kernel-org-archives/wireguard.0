Return-Path: <SRS0=bqBh=7I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428C8C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 May 2020 16:14:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9702D206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 26 May 2020 16:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="bIUB2/Sd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9702D206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fdf3b04;
	Tue, 26 May 2020 15:58:51 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 99dab4a9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 May 2020 15:58:50 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=bIUB2/Sd9AYguQVZ6q8sOjyikYBBARV8k4YpMqNeX8UVelQBX194DfJYfg/c1uyPshJU+SlBZ2CawywotOjfNUSSLPhclNKTknUtmqZTtKA/vOQazobbatAkbNaepbIy8cCNk4qTZRhpVSRz8aiOvi/sTRsMev/6Q8yFK4A3HvPNfJycpgfcKqJRUg9SipRxW0WrUwaE+e1Eo+cSbU512F8Mrb9sR4NmRGJTuAIwmRa60rVh93njnT7CHdtvGveBdmIGfMlLevwzCaPsdkc5/BZtoZdI23zWR7D99Ny6vjR64BfVvYhvrLu5OMGNPVHfpEmlfhejbvKuEFxaM+V5GQ==;
 s=purelymail3; d=msfjarvis.dev; v=1;
 bh=jmVzubaRkUii0CBNBx03fbi6APxzuj1qPDjKeMlpqHQ=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 103.46.202.50 (EHLO ryzenbox) ([103.46.202.50])
 by ip-172-30-0-42.ec2.internal (JAMES SMTP Server ) with ESMTPA ID 470569226; 
 Tue, 26 May 2020 16:03:39 +0000 (UTC)
Date: Tue, 26 May 2020 21:33:36 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Jose Marinez <jedi_papi@yahoo.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <D4BEBCDB-9B63-419C-80BD-DA4342B5D55D@getmailspring.com>
In-Reply-To: <1911672182.4980335.1590508735704@mail.yahoo.com>
References: <1911672182.4980335.1590508735704@mail.yahoo.com>
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



On May 26 2020, at 9:28 pm, Jose Marinez <jedi=5Fpapi=40yahoo.com> wrote:=


> Hi Harsh,
> =20
> Here's the situation, there's a bunch of us that are using these Mi=46i=
s
> for use in China and HK. I'm sure you've heard in the news of what's
> happening in HK at the moment. I have a copy of the kernel but haven't
> managed to do the manifest.xml nor the other file. But what I did do
> was contact the manufacturer that is here in HK and they've agreed to
> collaborate. If I was the only one benefiting from this it wouldn't be
> fair. The manufacturer understands the severity but can't for obvious
> reasons push an OTA rooted kernel to all their devices. They've asked
> me if there's a way to patch their kernel tree with a Wireguard
> module. I told them I would ask and here I am.
> =20
> I have the kernel here, please disregard the ads:
> https://www.sendspace.com/file/79o6c8=C2=A0
> =20
> =20
> What can they do to get their kernel patched=3F

This repository will get Android kernels started in the most
straightforward fashion: https://git.zx2c4.com/android=5Fkernel=5Fwiregua=
rd/about/.

> There's a bunch of DOD people and families that will highly appreciate
> this. I will make certain a nice donation comes your way.
> =20
> Thanks,
> Jose
> =20
> On Thursday, May 21, 2020, 7:21 PM, Jose Marinez <jedi=5Fpapi=40yahoo.c=
om> wrote:
>> Thank you. I will try it out. =46ingers crossed=21=21=21
>> =20
>> =20
>> =20
>> =20
>> =20
>> =20
>> =20
>> On Thursday, May 21, 2020, 10:29:12 AM EDT, Harsh Shandilya
>> <me=40msfjarvis.dev> wrote: =20
>> =20
>> =20
>> =20
>> =20
>> =20
>> =20
>> On May 21 2020, at 7:52 pm, Jose Marinez <jedi=5Fpapi=40yahoo.com> wro=
te:
>> =20
>>> Thank you so much Harsh. What's the best way to make my kernel
>>> available to you=3F Even if you could allow me to push to the repo I
>>> wouldn't know where to save it.
>> =20
>> =20
>> The repo is maintained on GitHub so you will have to fork the reposito=
ry
>> and create a pull request with your changes, help.github.com has very
>> beginner friendly documentation if this is your first time around this=
.
>> =20
>> The process for adding a kernel is a bit involved and the documentatio=
n
>> isn't quite fleshed out. You can check the steps out here=5B1=5D and a=
n
>> example of adding a new device to the repository here=5B2=5D.
>> =20
>> 1: https://github.com/WireGuard/android-wireguard-module-builder=23add=
ing-your-phones-kernel
>> 2: https://github.com/WireGuard/android-wireguard-module-builder/pull/=
3/files
>> =20
>> =20
>>> =20
> 
