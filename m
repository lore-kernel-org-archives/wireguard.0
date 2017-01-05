Return-Path: mailing-porcus@porcus.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aab2fc84
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 22:40:02 +0000 (UTC)
Received: from mel.porcus.ch (mel.porcus.ch [46.20.250.35])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4e6805a
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jan 2017 22:40:02 +0000 (UTC)
Received: from [172.16.4.13] (85-195-240-19.fiber7.init7.net [85.195.240.19])
 by mel.porcus.ch (Postfix) with ESMTPSA id 476D61A2AAF
 for <wireguard@lists.zx2c4.com>; Thu,  5 Jan 2017 23:56:17 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Maximum number of interfaces + Debug 
From: Will van Gulik <mailing-porcus@porcus.ch>
In-Reply-To: <698F0489-3376-4D52-A48E-A4C9F344D817@porcus.ch>
Date: Thu, 5 Jan 2017 23:49:03 +0100
Message-Id: <9F550D1D-A374-48D6-881E-D626BB250E8F@porcus.ch>
References: <698F0489-3376-4D52-A48E-A4C9F344D817@porcus.ch>
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Everyone,

I went a bit further and did compile the module with debug rather than =
using the repo's version, and I get a :
wireguard: Invalid packet from xxxx:yyy
in my dmesg. I would have hoped to get something more clear, but would a =
module version mismatch be an issue or does this mostly looks like a key =
issue ? I would be strange because I reissued them several times.

Any clue, ideas, else ?

Cheers,

Will

> On 03 Jan 2017, at 09:52, Will van Gulik <mailing-porcus@porcus.ch> =
wrote:
>=20
> Hi,
>=20
> I'm trying to use multiple wireguard tunnel in one VM at the same =
time, but it seems that only the first two I configured are working. I'm =
currently trying with 5 interfaces, I see the incoming packet in tcpdump =
but no reaction of the destination host with all the wg interfaces.
>=20
> I'm not sure there is a limitation on that, I could totally have =
missed that. Should I use 1 interface with multiple peers rather than =
multiple interface ?
>=20
> I'm testing that on a Debian with 4.8.7-1, running on a KVM host.
>=20
> Any insight ?
>=20
> Kind regards,
>=20
> Will
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
