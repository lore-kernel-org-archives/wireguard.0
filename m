Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ab1dfae
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 07:59:48 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3926f660
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 07:59:47 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx103
 [212.227.17.174]) with ESMTPSA (Nemesis) id 0MfEsY-1dN9Sv3jNi-00On3j for
 <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 10:10:16 +0200
Date: Wed, 10 May 2017 10:10:13 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: Re: SSH stuck
Message-ID: <20170510101013.715986f0@msi.defcon1>
In-Reply-To: <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
References: <20170510003254.2f810c1d@msi.defcon1>
 <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 10 May 2017 08:31:12 +0100
Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk> wrote:

> Hi Jean-Yves,

Hi Jo,

> On 09/05/17 23:32, Bzzzz wrote:
> > 1- I solved the LAN being unreachable apart the endpoint and the
> > internet being completely unreachable with an iptables rule:
> >    iptables -t nat -I POSTROUTING -s 10.11.12.0/24 -o eth0 -j
> > MASQUERADE is this right? (if not, why?)
>=20
> I don't think this is Wireguard specific. That rule essentially allows
> that machine to act as a NAT gateway, the same as for e.g. an OpenVPN
> server.

Fine, in fact I was using this for OpenVPN
but WG is much faster.

> > 2- When I want to ssh any LAN machine, wireshark only sees 4 packets:
> > 	client announce
> > 	server ACK
> > 	client key negociation
> > 	server key negociation
> >    and that's all.
> >    Is it a limitation (non-TCP packets) or is there another reason
> > for ssh not working as expected? (connecting to any machine http srv
> > works perfectly)
>=20
> SSH over a Wireguard interface works as expected for me. You might have
> some luck seeing what's going on with `ssh -v` (and increasing the
> verbosity with further `v`s, e.g. `ssh -vvvv`).

No, I even tried 'ssh -vvvvvvvvvvvvvvvvvv' just in case, but I do not
see anything special; last lines before being stuck 30" and closed by
server, are:
=E2=80=A6
debug2: kex_parse_kexinit: first_kex_follows 0=20
debug2: kex_parse_kexinit: reserved 0=20
debug2: mac_setup: setup umac-64-etm@openssh.com
debug1: kex: server->client aes128-ctr umac-64-etm@openssh.com none
debug2: mac_setup: setup umac-64-etm@openssh.com
debug1: kex: client->server aes128-ctr umac-64-etm@openssh.com none
debug1: sending SSH2_MSG_KEX_ECDH_INIT
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
Connection closed by 192.168.1.50

I use publickey ssh only.

A LAN ssh (working, of course) continues:

debug2: kex_parse_kexinit: first_kex_follows 0=20
debug2: kex_parse_kexinit: reserved 0=20
debug2: mac_setup: setup umac-64-etm@openssh.com
debug1: kex: server->client aes128-ctr umac-64-etm@openssh.com none
debug2: mac_setup: setup umac-64-etm@openssh.com
debug1: kex: client->server aes128-ctr umac-64-etm@openssh.com none
debug1: sending SSH2_MSG_KEX_ECDH_INIT
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
debug1: Server host key: RSA <redacted>
debug3: load_hostkeys: loading entries for host "mybigserver" from file "/r=
oot/.ssh/known_hosts"
debug3: load_hostkeys: found key type RSA in file /root/.ssh/known_hosts:1
debug3: load_hostkeys: loaded 1 keys
debug3: load_hostkeys: loading entries for host "192.168.1.50" from file "/=
root/.ssh/known_hosts"
debug3: load_hostkeys: found key type RSA in file /root/.ssh/known_hosts:2
debug3: load_hostkeys: loaded 1 keys
debug1: Host 'mybigserver' is known and matches the RSA host key.
debug1: Found key in /root/.ssh/known_hosts:1
=E2=80=A6

I double-checked the the only difference between a LAN ssh and a VPN
ssh is the VPN one stucks just after the "expecting SSH2_MSG_KEX_ECDH_REPLY"
line without an obvious reason :/
Note that it is also the case with any other LAN machine when the VPN
is in use.

Don't worry if I don't answer, I'm out for sleep a few hours.

Thanks & regards,

Jean-Yves
