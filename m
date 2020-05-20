Return-Path: <SRS0=qtc0=7C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48EB9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 17:53:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFF8206B6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 17:53:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=msfjarvis.dev header.i=@msfjarvis.dev header.b="XJOdJS79"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFF8206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 582f49f3;
	Wed, 20 May 2020 17:38:41 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 88644174
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 17:38:37 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: a=rsa-sha256;
 b=XJOdJS792cEYFqRCnFT42B9PYEEDrhrKjvd6rcxRZyvcZ1Gg4cVXPHWOOctD1xTkJcHkAFSFwlOKcTZdZ6HPSShQKuyL3p8bCx5RaatHu/yd4q/wsaxOGzJwbYLj4lwyZbPvO08Iaabg6gIAG8bc7iz6rVMpE0Q8+w62aSygIm1GXmjT3Q8pL9Et39EgZB655ZnJtacWiw0dm2GIaP/BeQoYdE4hxeloGTK98D82fHclR/uU8HC4rIuq4p3PxKzAlY5Gnz+ltJNT7Um82Dx2d9f9UmPlz4uYsq6Gj3wVYURE1tnXnuFbhvN0IqoO5p4XnZ2F9FXprn3UuSshcVY8mw==;
 s=purelymail3; d=msfjarvis.dev; v=1;
 bh=KYo3An4bS8gGYfnuQd+S9JJa62nx8sq6RNRmxk1RGLs=; h=from:to:received; 
Authentication-Results: purelymail.com; auth=pass
X-UserIsAuth: true
Received: from 103.46.202.79 (EHLO ryzenbox) ([103.46.202.79])
 by ip-172-30-0-42.ec2.internal (JAMES SMTP Server ) with ESMTPA ID -1501579707;
 Wed, 20 May 2020 17:53:02 +0000 (UTC)
Date: Wed, 20 May 2020 23:23:00 +0530
From: Harsh Shandilya <me@msfjarvis.dev>
To: Jose Marinez <jedi_papi@yahoo.com>
Cc: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <7CE4203F-F77E-479D-8F0B-E67A366F1EB3@getmailspring.com>
In-Reply-To: <1587211445.2302354.1589995651547@mail.yahoo.com>
References: <1587211445.2302354.1589995651547@mail.yahoo.com>
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



On May 20 2020, at 10:57 pm, Jose Marinez <jedi=5Fpapi=40yahoo.com> wrote=
:

> Hi Guys,
> =20
> Can you tell me if this is working as it should=3F...
> =20
> I have a phone with Wireguard on. I share the connection via
> tethering/hotspot. When I check the IP on the tethered device I don't
> see the same IP as my Wireguard endpoint. What I do see is an IP from
> the phone's mobile=C2=A0network, the one running Wireguard.=C2=A0
> =20
> Is this right=3F Does this=C2=A0mean that traffic from that tethered de=
vice
> not using the Wireguard connection=3F I'm confused.
> =20
> =20
> Thanks,
> Jose
> =20

At least on Android, tethering data is *not* routed through your VPN. If
you want that to happen, you will have to use the WireGuard kernel
module which requires a rooted device and a custom kernel. On some
supported devices
(https://github.com/WireGuard/android-wireguard-module-builder/tree/maste=
r/kernels)
you can use root access to install the required module automatically
through the app, on your stock kernel.

Harsh
