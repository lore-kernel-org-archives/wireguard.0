Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc79c2cb
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 03:31:57 +0000 (UTC)
Received: from mx.sealand.io (mx1.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a45ef44
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 03:31:57 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: openwrt route_allowed_ips is inprecise
From: Dan Luedtke <mail@danrl.com>
In-Reply-To: <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
Date: Tue, 20 Dec 2016 04:38:52 +0100
Message-Id: <89D5D16F-84AF-4FC6-9AA1-55EFCB6A3B9E@danrl.com>
References: <CAHmME9q+aZNDDH5Nsnn1O7+4RxFm489f08oOmyGpWsVx1pLxwg@mail.gmail.com>
 <20161220011334.GB16814@tuxmachine.polynome.dn42>
 <CAHmME9rDK0MEFH2oOVjeTF0n=J6=Hsk9e5Hyj2GDnFk8V3LtwA@mail.gmail.com>
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



> On 20 Dec 2016, at 04:14, Jason A. Donenfeld <Jason@zx2c4.com>=20
> https://git.zx2c4.com/WireGuard/commit/?id=3D5838c950859f1b55ad344e81b77a0=
b71917ffd61
>=20
> Unless there are objections, that will ship with the next snapshot

No objection but a remark: It is now even more complex and I think shell scr=
ipt is not the right solution. This is pretty straightforward with netlink b=
ut a pain to solve in shell.

Regarding LEDE, netifd should track the routes being added and the extra rou=
tes do not really do harm.=
