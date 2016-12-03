Return-Path: dave.taht@gmail.com
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
 [209.85.216.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f64e3626
 for <wireguard@lists.zx2c4.com>; Sat, 3 Dec 2016 18:43:20 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id c47so281058786qtc.2
 for <wireguard@lists.zx2c4.com>; Sat, 03 Dec 2016 10:48:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <e1085a46-e38f-c13c-86f5-de312b3a5c05@mib-infotech.co.nz>
References: <20161203115342.20950-1-list@eworm.de>
 <e1085a46-e38f-c13c-86f5-de312b3a5c05@mib-infotech.co.nz>
From: Dave Taht <dave.taht@gmail.com>
Date: Sat, 3 Dec 2016 10:48:15 -0800
Message-ID: <CAA93jw43GDaxc9z1cp7E_mrc4yrNMsSToTi65TK_+ky5-LNtJQ@mail.gmail.com>
Subject: Re: DMVPM appreciation
To: John Huttley <john@mib-infotech.co.nz>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I agree that wireguard is potentially a good substrate for what you
describe. There are messy details.

My personal goal is to also get it to do good congestion control
(adding fq_codel) next year while thinking hard about the problems
that tor had in that department.



On Sat, Dec 3, 2016 at 10:07 AM, John Huttley <john@mib-infotech.co.nz> wro=
te:
>
> When Wireguard was first announced, there were several comments like
> "Can you do DMVPM?"
>
> So
> What is DMVPN?
> Do we care?
> Can we do it better?
>
> DMVPN
> http://www.cisco.com/c/en/us/products/security/dynamic-multipoint-vpn-dmv=
pn/index.html
> Is a Cisco product to lets spokes create spoke-to-spoke links in an
> otherwise spoke-hub VPN architecture.
> If we have A<-> HUB <-> B    then we can get A <-> B  directly. This
> unloads the hub.
>
> So how do they do it?
> They document 3 things
> 1) mGRE tunnels.
> The tunnel is good old GRE on proto 47.
> For every endpoint you create an interface. So hub with 1000 spokes has
> int gre0 -> int gre999.
> Nope, not that dumb. They have a multipoint GRE, mGRE with one interface
> that can terminate all the tunnels.
> --Just like Wireguard.
>
> 2)Ipsec. But GRE is encapsulation only, so they protect it with ipsec.
> Presumably ESP transport mode.
> Wireguard doesn't need that.
>
>
> 3)NHRP.  https://en.wikipedia.org/wiki/Next_Hop_Resolution_Protocol
> This is a repurposed bit of the ATM suite. Sort of DB of remote internet
> addresses (endpoints) that spokes look up to set up tunnels.
> Wireguard. So much easier.
>
> There is a 4th part. The actually doing it and the policy for
> controlling it.
>
> When you look at it, a spoke-hub network that can overlay itself is a
> mesh network.
> So, do we care about DMVPN? No, it's vendor specific.
>
> Can we do it better? Sure, Jason has already done all the hard work.
>
> The key thought going forward is that that security doesn't matter. It's
> outside the scope.
> If A,B,C are /already/ in the VPN, they are /already/ authorised.
> A tunnel overlay does not impact /security/, it impacts /routing/.
>
> I suggest looking up
> Homenet https://www.irif.fr/~jch/software/homenet/howto.html
>
> So lets consider a simplified case
> A <-> B <-> C
>
> A is sending a lot of data to C.
>
> Policy triggers starting a direct A <-> C tunnel.
>
> We need public key and endpoint to set up a tunnel.
>
> First. A can talk to C just fine on the VPN. Thats all the
> authentication required.
> A and C swap public keys
> Endpoints? you could look up myip.com, but there is one perfect way.
> A asks B, because  if two nodes are peered, they always know the
> endpoint of their peer.
> In this case B knows how to contact A.
> B passes that back to A
> A then passes that to C along with A's public key
>
>
> Ok, UDP Rendevous and we have a A <-> C tunnel, no NHRP required.
> The routing daemon engages and a new route becomes active.
>
> --Dad
>
>
>
>
>
>
>
>
>
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
