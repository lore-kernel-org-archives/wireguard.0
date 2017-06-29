Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38fd3c5c
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 16:15:58 +0000 (UTC)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
 [209.85.218.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51f3b164
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Jun 2017 16:15:58 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id l130so16175403oib.1
 for <wireguard@lists.zx2c4.com>; Thu, 29 Jun 2017 09:32:45 -0700 (PDT)
Return-Path: <reuben.m.work@gmail.com>
Received: from travesty.localnet ([75.98.116.245])
 by smtp.gmail.com with ESMTPSA id w189sm6626126oib.19.2017.06.29.09.32.43
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 29 Jun 2017 09:32:43 -0700 (PDT)
From: Reuben Martin <reuben.m.work@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: snapshot 0.0.20170628 broken?
Date: Thu, 29 Jun 2017 11:32:42 -0500
Message-ID: <5048519.4PQQ7nMoTV@travesty>
In-Reply-To: <15cf4a178a0.bc4b59ac191695.4048760488862053147@hda.me>
References: <15cf4a178a0.bc4b59ac191695.4048760488862053147@hda.me>
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

On Thursday, June 29, 2017 11:14:01 AM CDT HDA wrote:
> Did you use same snapshot version across all machines?

yes.

> Should we postpone snapshot update in Ubuntu PPA?
>=20
> On Thu, Jun 29, 2017, at 15:47, Reuben Martin wrote:
> > Something is off with this latest snapshot:
> >=20
> > - Computer-X sitting in the cloud accepting incomming connections.
> >=20
> > - Computer-A sits behind a masquerade NAT or a remote network. Computer=
=2DA
> > can
> > connect to Computer-X, and then create a TCP session with services on
> > Computer-X directly over the wg0 interface.
> >=20
> > - Computer-B is behind the same NAT as Computer-A. It can also create a
> > connection with Computer-X. It gets a response pinging Computer-X on it=
=E2=80=99s
> > wg0
> > address, but it cannont create a TCP session with services on Computer-X
> > over
> > the wg0 interface.
> >=20
> > The only thing I have found that might be relevant is that A was the
> > first to
> > connect, so the NAT port assigned is the same as the port that wireguard
> > on X
> > is listening to. Where-as B gets assigned a random port on the NAT side.
> > That
> > may just be coincidental though. Downgrading to 20170613 and TCP sessio=
ns
> > work
> > from all connections again.
> >=20
> > -Reuben
> > _______________________________________________
> > WireGuard mailing list
> > WireGuard@lists.zx2c4.com
> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
