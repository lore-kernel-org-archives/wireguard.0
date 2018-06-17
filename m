Return-Path: riccardo.kyogre@live.it
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0a2f5c7
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Jun 2018 21:53:25 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092068010.outbound.protection.outlook.com [40.92.68.10])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1320a82
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Jun 2018 21:53:25 +0000 (UTC)
From: Riccardo Paolo Bestetti <riccardo.kyogre@live.it>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: OOB and accounting - state of things
Date: Sun, 17 Jun 2018 21:57:49 +0000
Message-ID: <AM5PR0802MB2450469DD1D288D25ADA636CFF720@AM5PR0802MB2450.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I would like to explore the possibility to integrate this into a large-scal=
e (XaaS or corporate) solutions (mostly for curiosity - for now). The main =
extra functionality I'm seeking is IP address management and accounting opt=
ions. These are currently achieved in OpenVPN with various configuration op=
tions and --client-connect/--client-disconnect hooks. While it isn't a part=
icularly clever system, it usually gets the job done: it helps to receive I=
P configuration from the remote side, it provides a mechanism for authoriza=
tion (username/password/static challenge) and it spits out notifications on=
 peer connect and disconnect.

A more clever (and less messy) way to go at this it probably to just implem=
ent an OOB communication and let userspace software deal with all of this. =
Ideally, this would work even before IP configuration. (For reference, it w=
as suggested here [1] that a bootstrap IP address could currently be used t=
o obtain an analogous result - I disagree, as it is not OOB and it is devio=
us.)
As a (prospected) systems integrator, this would be a terrific tool to have=
, especially because existing solutions either suck (OpenVPN) or are not pa=
rticularly widespread (tinc).

Examples of how this could work:

A. Client "road warrior" access to a network, with "push" IP configuration.
The client userspace program (CUP?) would send the network's WireGuard peer=
 through the OOB interface a request to access the network. The server user=
space program (SUP? ^^) would reply by requesting whatever authorization in=
formation it wants (username/password/2FA/OAuth/whatever). The CUP would pr=
ovide that, and the SUP, upon verification of the information, would provid=
e the client with IP configuration (wg interface IP address, routes, etc.),=
 and would dynamically configure the Cryptokey Router to begin accepting pa=
ckets from that IP address, from the particular client. After that, a keepa=
live mechanism could be used, and upon failure, the SUP could reconfigure t=
he Cryptokey Router to stop accepting such packets (i.e. annul the authoriz=
ation).

B. Site-to-site access to a network
This is a use case I currently have with a client of mine. They use IPsec a=
nd it's a configuration nightmare, especially when we need to change IP add=
resses on our side (we can't use NAT because of poor strongSwan support, wh=
ich is btw something that is fixed for free with the transparent wg network=
 interfaces, and also because their SaaS provider still needs transparent a=
ccess to some addresses on the client's side).
This could work similarly to the previous example (possibly without authori=
zation - it wouldn't make that much sense in a more static setup), except t=
he CUP could be able to advertise a new IP configuration on its side and th=
e SUP would configure the Cryptokey Router (and the system routing table, i=
f needed) accordingly.

What do you think? Is there any work being done already?

BR,
Riccardo


[1] https://lists.zx2c4.com/pipermail/wireguard/2017-February/001056.html
