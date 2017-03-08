Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id deeea760
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 15:57:26 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01de0857
 for <wireguard@lists.zx2c4.com>; Wed, 8 Mar 2017 15:57:26 +0000 (UTC)
Date: Wed, 8 Mar 2017 17:00:04 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Subject: Re: [wireguard-devel ] traffic shapping
Message-ID: <20170308160004.GA21799@tuxmachine.polynome.dn42>
References: <CADdae-hV6TSfo+1JqgKYE9TUTXhK9MzHHLKYf3SU6Yd5eMa1QA@mail.gmail.com>
 <CADdae-hrvCdqrnGJeKf_6swqd_dWhn7kzTx3NfM3iOtGzn5vHQ@mail.gmail.com>
 <CADdae-hYMwuJO2jR6MUmQFKuMka8Hq8nmqUcKAVKBweG8=wgzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
In-Reply-To: <CADdae-hYMwuJO2jR6MUmQFKuMka8Hq8nmqUcKAVKBweG8=wgzA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

For posterity, can you be more specific about how you solved your issue?
You were simply missing traffic shaping support for IPv6 in your kernel?
Which symbols were needed?

Thanks,
Baptiste

On Wed, Mar 08, 2017 at 02:39:23PM +0100, Nicolas Prochazka wrote:
> hello,
> to close, it's working perfectly well in ipv4 and then when i correctly
> configure my kernel, perfectly well for ipv6.
> Regards,
> Nicolas
>=20
> 2017-03-08 12:26 GMT+01:00 Nicolas Prochazka <nicolas.prochazka@gmail.com=
>:
>=20
> > Hello again,
> > So i verify my configuration,
> > - on a virtual tap , traffic shaping is ok with same configuration
> > - on physical card, traffic shaping is ok
> > - on wg0 , all traffic are going to default queue,filter seems to be not
> > applied ,  tcpdump on wg0 is ok with my queue definition, only differen=
ce
> > is wg0 is configured as ipv6 tunnel.
> >
> >
> > Regards,
> > NIcolas
> >
> >
> >
> > 2017-03-06 18:40 GMT+01:00 Nicolas Prochazka <nicolas.prochazka@gmail.c=
om>
> > :
> >
> >> Hello,
> >> is there an incompatibilty between wireguard and traffic shaping or i
> >> misconfig something  ?
> >>
> >> After configuring Qos , I need to add filter to flow
> >>
> >> If i'm trying with simple tc command :
> >> tc filter add dev wg0 protocol ip parent 1: prio 10 u32 match ip dport=
 80
> >> 0xffff flowid 1:10
> >>
> >> or If i'm trying with tc + iptables,
> >>
> >> tc filter add dev wg0 protocol ip parent 1: prio 1 handle 6 fw flowid =
1:10
> >> and iptables mark rules,
> >>
> >> traffic seems to be not "apply" to queue .
> >>
> >> Regards,
> >> Nicolas Prochazka.
> >>
> >> -----
> >> Example :  after this configuration, traffic on wg0 on port 80,443,8080
> >> are going to 1:30 ,not to 1:10
> >> _trafficShappingMaxRate=3D15
> >>
> >> tc qdisc del dev wg0 root
> >>
> >> tc qdisc add dev wg0 root handle 1: htb default 30
> >>
> >> # Base
> >> tc class add dev wg0 parent 1: classid 1:1 htb rate
> >> ${_trafficShappingMaxRate}mbit burst 15k
> >>
> >> # http/https
> >>
> >> # Class 1:10,
> >> tc class add dev wg0 parent 1:1 classid 1:10 htb rate
> >> ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate} burst 1=
5k
> >>
> >> # Class 1:20,
> >> tc class add dev wg0 parent 1:1 classid 1:20 htb rate
> >> ${_trafficShappingMaxRate}mbit ceil ${_trafficShappingMaxRate}mbit bur=
st 15k
> >>
> >> # Class 1:30, which has a rate of 1kbit. This one is the default class.
> >> tc class add dev wg0 parent 1:1 classid 1:30 htb rate 10kbit ceil 1mbit
> >> burst 15k
> >>
> >> tc qdisc add dev wg0 parent 1:10 handle 10: fq_codel quantum 300 noecn
> >> tc qdisc add dev wg0 parent 1:20 handle 20: fq_codel quantum 300 noecn
> >> tc qdisc add dev wg0 parent 1:30 handle 30: fq_codel quantum 300 noecn
> >>
> >> # --- associate queue with traffic
> >>
> >> #tc filter add dev wg0 protocol ipv6 parent 1: prio 1 handle 6 fw flow=
id
> >> 1:10
> >> # http/https
> >> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dpo=
rt
> >> 80 0xffff flowid 1:10
> >> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dpo=
rt
> >> 443 0xffff flowid 1:10
> >> tc filter add dev wg0 protocol ipv6 parent 1: prio 10 u32 match ip dpo=
rt
> >> 8080 0xffff flowid 1:10
> >> # ncfs
> >> tc filter add dev wg0 parent 1: protocol ipv6 prio 5 u32 match ip dport
> >> 16379 0xffff flowid 1:20
> >> # icmp
> >> tc filter add dev wg0 parent 1: protocol ip prio 1 u32 match  ip proto=
col
> >> 1 0xff flowid 1:30
> >>
> >> tc -s qdisc ls dev wg0
> >>
> >>
> >

> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAljAKnoACgkQvgHsIqBO
LkZdHxAAiwR+e8LeazCKLQGVXHnNQ+TXOWLWTWCSqIGlUBSyOZYnuiuGRanyxqdv
I/sdk9qvymSCuFUYs/wqOwUetliYUxe0ErnNfMMpufeFpoMjxhznhY9G1pcVVqJz
VE+4mD27jCYgeGOEjXbM2eMekvE+6TNiiwomPTMOtdo4AaanyAFYwX8EkBNUt+ky
gXVjCmLkM/TK0aaL4/+xHv/7S/kdHDP7/rUi0ts2UG1dX7vn6BqExZjZgZfBGueF
ofLlNBVcUZptsKuVDFjtlNW5effgYPL6iArnVi41zJ0EGSruQwlnTZFYSYlSdQbo
uv76NlJ7WA+KfmWsSlMf3K3jFL7eok3G4+8YkucRhVEIUSvEEKeD9vc+ecfYCEQH
gKACdG8yWOi0/lwMG9912cC3K15ZDaakt5in730HqUy93NqM+THsG0V4CTjrc3BS
cb4MOjiV+Zompo79AtP/EP6gjhGXRWuMGkxHmZ4B8T1DLLEYntOZwho0f6zCNvVG
7ilEDO9QsJnSKJqg8rtvg68h23u3GirLPHV2ExXccWMi1FFmiYiHNKpWLQ+2T2cs
m/e2IdNOeq9kg8NE8iZeMBBRm8nRySEBLDso1xzcavKG1f4EyOBAK0rpdF7i2WM9
zXo4Vur1IIammj5ZkgrG4oV56oO11oBvX8hjqP8ETnbKAGNrudg=
=fSn3
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
