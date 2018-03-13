Return-Path: paul@makrotopia.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a125390f
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 11:04:55 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org [185.142.180.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c084c5f
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 11:04:55 +0000 (UTC)
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.90_1) (envelope-from <paul@makrotopia.org>)
 id 1evhtc-0005IT-6z
 for wireguard@lists.zx2c4.com; Tue, 13 Mar 2018 12:15:08 +0100
Date: Tue, 13 Mar 2018 12:15:02 +0100
From: Paul <paul@makrotopia.org>
Subject: Re: Lineage OS (Android) Support
To: wireguard@lists.zx2c4.com
Message-Id: <1520939702.663.1@mail.makrotopia.org>
In-Reply-To: <1520793735.1523.0@mail.makrotopia.org>
References: <1520793735.1523.0@mail.makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On So, M=E4r 11, 2018 at 7:42 PM, Paul <paul@makrotopia.org> wrote:
> Hi all,
>=20
> I'm new to the list and hope this wasn't discussed in length here=20
> before. If so, please give me a direction, I couldn't find anything=20
> related.
>=20
> For the last days I tried to find a Lineage OS [1] compatible kernel=20
> with wireguard included, sadly there is none. Instead of installing a=20
> custom kernel, could Lineage include the < 4000 lines of code in=20
> their build root? Have there been any efforts on this?
>=20
> Thank you very much for all further information.
>=20
> Best regards,
> Paul Spooren
>=20
> [1] http://lineageos.org/

I asked the Lineage OS maintainer of my current phone and he responded=20
to use the native VPN interface of Android. Are there any plans on that?

> https://developer.android.com/reference/android/net/VpnService.html
>=20
> That has many pros:
> 1. runs on any Android 4.0+ device (NO root required)
> 2. all VPN code (except network interface of course) is running in=20
> userspace (in case of exploitation only VPN app is compromised)
> 3. decoupled from OS and easy to upgrade

Thanks for all further information!

Best,
Paul
=
