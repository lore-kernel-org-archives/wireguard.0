Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7691C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:20:54 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C605611C8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 20:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C605611C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=geonerco.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de9d4d4c;
	Fri, 24 Sep 2021 20:18:58 +0000 (UTC)
Received: from mail.geonerco.com (mail.geonerco.com [50.106.31.114])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a25e970
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 20:17:30 +0000 (UTC)
Received: from mail.geonerco.com (127.0.0.1) id h9op5g0171sn for
 <wireguard@lists.zx2c4.com>;
 Fri, 24 Sep 2021 13:17:28 -0700 (envelope-from <jandreini@geonerco.com>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=geonerco.com; s=corp.apr2020; i=@geonerco.com; h=Received:From:
 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
 References:In-Reply-To:Accept-Language:Content-Language:
 Content-Type:Content-Transfer-Encoding:MIME-Version; bh=vtBXZ8Bi
 Q5X/g84cdpZbyuNJYLMHxzKDfafuxXsYfrk=; b=IX0p7wVKOwIbokA9ydCHl4oJ
 m6h6AvY9CLwFw7bsC927UMcg77K3V1+Fbdq0eRAxcvtxSUNAgHkcjmm1MB41gvzS
 jJA/hD643q1Cn80br/hE+typx0Y2bdDA45xbtXPM11QVk8gci5b7bMBZke2AuYfF
 jaGK0BOPeCvuq+LEByHb2vpoFEJtFWEapZCpXUQdpYPa31ZmCuzVnCaf9QaOJPG8
 tmsePRCIBc23p0p3rPYEikY01Tr0GGE7lOwTpbE9GKYKBd+BDcJB52SFK7a7tZrA
 oIJGawC05SqNYPRgDy0VVsvihOmZ8VADlSBtBgBJ57aX3ATsVMB7c2aR2kBk7A==
Received: from mail.geonerco.com ([192.168.10.31])
 by mail.geonerco.com ([192.168.10.12]) (mailfilter)
 with ESMTPS (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256/256)
 id o202109242017280030248-2; Fri, 24 Sep 2021 13:17:28 -0700
From: John-Paul Andreini <jandreini@geonerco.com>
To: Arlo Clauser <Arlo@StarcubeDesign.com>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>
CC: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>, Joshua Sjoding
 <joshua.sjoding@scjalliance.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: RE: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
Thread-Topic: Windows stuck in boot after WireGuard update (switch to
 WireGuardNT?)
Thread-Index: AQHXsWx8AA+aVdoKL02LZ8bR6OQxTKu0D8yAgAAEmwD//4rG0A==
Date: Fri, 24 Sep 2021 20:17:27 +0000
Message-ID: <d63dde47ad8d4a28b7dd48fe83f15841@geonerco.com>
References: <e0d4dcbb-b0c8-1214-ff0c-c856d168d67f@physik.uni-bonn.de>
 <CAHmME9oSSzJU4H8jc__HiFsexpB6jJUKM84kN+_9WesoTSMMsQ@mail.gmail.com>
 <CAHmME9rknanKEdk8L5PJxbg1OZejN59z5xuh5y54O7y+zWb1nw@mail.gmail.com>
 <3A98C85E-26A7-4A7B-84E3-2A512DE1C3BA@StarcubeDesign.com>
In-Reply-To: <3A98C85E-26A7-4A7B-84E3-2A512DE1C3BA@StarcubeDesign.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.10.63]
x-disclaimit-status: OrgId:8ed448aef47945d0bc6ef1193d166f0b;
 AppliedRule:d2c881bc5d3f4c1eabc6c7e6f2e207e5
x-disclaimit-agent: Server:GMEx2; Version:5.40.540
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Mlf-DSE-Version: 6611
X-Mlf-Rules-Version: s20210826060337; ds20200715013501;
 di20210826182925; ri20160318003319; fs20210920224820
X-Mlf-Smartnet-Details: 202109242017280030248
X-Mlf-Smartnet-Version: 20210917223710
X-Mlf-Envelope-From: jandreini@geonerco.com
X-Mlf-Version: 10.0.10.6443
X-Mlf-License: BSV_C_AP_T_R
X-Mlf-UniqueId: o202109242017280030248
X-Mailman-Approved-At: Fri, 24 Sep 2021 20:18:51 +0000
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

I'll roll it as well. If you see a news item about a murdered IT admin you'=
ll know the change didn't work this time and my users have sought retributi=
on.

John-Paul

IMPORTANT/CONFIDENTIAL:  This e-mail and any attachments may contain confid=
ential information protected by the attorney-client privilege or other priv=
ileges, and intended for use only by the intended recipient(s).  If you hav=
e received this e-mail in error, please do not read, reproduce or distribut=
e the contents, but rather, immediately notify the sender, delete the e-mai=
l and destroy all copies of the e-mail and any attachments.  Pursuant to co=
rporate policy and resolutions, E-mail correspondence is insufficient to am=
end or modify contracts.
-----Original Message-----
From: Arlo Clauser <Arlo@StarcubeDesign.com>
Sent: Friday, September 24, 2021 1:16 PM
To: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Oliver Freyermuth <freyermuth@physik.uni-bonn.de>; Joshua Sjoding <josh=
ua.sjoding@scjalliance.com>; John-Paul Andreini <jandreini@geonerco.com>; W=
ireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Windows stuck in boot after WireGuard update (switch to WireGu=
ardNT?)

CAUTION - This message originated outside of the Company.

My trouble cases are installing it now. Thanks!

> On Sep 24, 2021, at 3:59 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Fri, Sep 24, 2021 at 11:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>> I'm going to cut a new release in the next few hours here. When
>> that's released
>
> v0.4.10 is now released.


