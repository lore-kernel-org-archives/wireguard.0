Return-Path: admin@hda.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a498b2fd
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 15:57:30 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9259a6f7
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 15:57:30 +0000 (UTC)
Date: Thu, 29 Jun 2017 18:14:01 +0200
From: HDA <admin@hda.me>
To: "wireguard" <wireguard@lists.zx2c4.com>, "egbert" <egbert@eggiecode.org>,
 "Jason" <jason@zx2c4.com>
Message-ID: <15cf4a178a0.bc4b59ac191695.4048760488862053147@hda.me>
In-Reply-To: 
Subject: Re: snapshot 0.0.20170628 broken?
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Did you use same snapshot version across all machines?
Should we postpone snapshot update in Ubuntu PPA?
On Thu, Jun 29, 2017, at 15:47, Reuben Martin wrote:
> Something is off with this latest snapshot:
>=20
> - Computer-X sitting in the cloud accepting incomming connections.
>=20
> - Computer-A sits behind a masquerade NAT or a remote network. Computer-A
> can=20
> connect to Computer-X, and then create a TCP session with services on=20
> Computer-X directly over the wg0 interface.
>=20
> - Computer-B is behind the same NAT as Computer-A. It can also create a=
=20
> connection with Computer-X. It gets a response pinging Computer-X on it=
=E2=80=99s
> wg0=20
> address, but it cannont create a TCP session with services on Computer-X
> over=20
> the wg0 interface.
>=20
> The only thing I have found that might be relevant is that A was the
> first to=20
> connect, so the NAT port assigned is the same as the port that wireguard
> on X=20
> is listening to. Where-as B gets assigned a random port on the NAT side.
> That =20
> may just be coincidental though. Downgrading to 20170613 and TCP sessions
> work=20
> from all connections again.
>=20
> -Reuben
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
