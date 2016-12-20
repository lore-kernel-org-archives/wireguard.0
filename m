Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1864c066
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 08:41:23 +0000 (UTC)
Received: from mx.sealand.io (mx2.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d823aa3
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 08:41:23 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: openwrt route_allowed_ips is inprecise
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
Date: Tue, 20 Dec 2016 09:52:04 +0100
Message-Id: <40FCA8CB-1FAA-42AF-B229-8692568F8226@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
 <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
 <CAHmME9popkFYu-am43TMCc6NcPtUA5dYRWPuTDJS-B69L73_cQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Regarding the initial preciseness issue, have you tested that on LEDE? I =
can't manage to get duplicate routes. However, outdated testing =
environment. Will rebuild and test again. I can't quite understand what =
the initial issue was. Wouldn't you get a "rtnetlink: file exists" when =
you try to add an route that already exists?

This also can only occur if someone uses static routes AND decides to =
use route_allowed_ips, right?

>> This is pretty straightforward with netlink
>=20
> No, it's much less straight-forward with raw netlink. Raw netlink
> involves hundreds of lines of code to do anything at all. A real mess.
> Fortunately there are wrapper libraries you can use from various
> languages to make it easier.

True. I was referring to the auto-route option I read on LKML a while =
ago. Of course, when done from userspace, netlink is not the ideal way.=20=


>=20
>> Regarding LEDE, netifd should track the routes being added and the =
extra routes do not really do harm.
>=20
> Alright then...
>=20
> Speaking of netifd, did you ever fix that netifd issue with the IP =
dependency?

I am on it. First version did add dependency for both protocols if the =
endpoint name had A and AAAA records. However, I find it cleaner to =
check which endpoint wg chose to use and only add that IP address as an =
depedency. Patch/PR comes when I am satisfied with stability.=
