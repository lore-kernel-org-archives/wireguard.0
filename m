Return-Path: nnet@fastmail.fm
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ca3865c
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 04:14:49 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 365c7fd5
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 04:14:49 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 6D4E421DA5
 for <wireguard@lists.zx2c4.com>; Thu, 24 May 2018 00:16:07 -0400 (EDT)
Message-Id: <1527135367.1083058.1382934352.4E96D38A@webmail.messagingengine.com>
From: nnet <nnet@fastmail.fm>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Subject: Re: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
In-Reply-To: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
Date: Wed, 23 May 2018 21:16:07 -0700
References: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> It never recovers... I turn the tunnel off and back on to get a tunnel ag=
ain.=20

So this is how it ends:

05-23 20:33:45.323  9600  9619 D WireGuard/GoBackend/wireguard: peer(AsMM=
=E2=80=A6SeWg) - Sending handshake initiation=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
05-23 20:33:45.326  9600  9619 E WireGuard/GoBackend/wireguard: peer(AsMM=
=E2=80=A6SeWg) - Failed to send handshake initiation write udp6 [::]:46719-=
>[]:41414: sendto: network is unreachable=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
05-23 20:33:45.326  9600  9619 D WireGuard/GoBackend/wireguard: peer(AsMM=
=E2=80=A6SeWg) - Awaiting keypair=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
05-23 20:33:50.367  9600  9678 D WireGuard/GoBackend/wireguard: peer(AsMM=
=E2=80=A6SeWg) - Sending handshake initiation=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20
05-23 20:33:50.376  9600  9678 E WireGuard/GoBackend/wireguard: peer(AsMM=
=E2=80=A6SeWg) - Failed to send handshake initiation write udp6 [::]:46719-=
>[snip]:41414: sendto: network is unreachable
05-23 20:36:10.188  9600 11291 D WireGuard/GoBackend/wireguard: peer(AsMM=
=E2=80=A6SeWg): Handshake did not complete after 20 attempts, giving up
05-23 20:39:12.258  9600  9677 D WireGuard/GoBackend/wireguard: :peer(AsMM=
=E2=80=A6SeWg) Removing all keys, since we haven't received a new one in 54=
0 seconds

Interestingly it's trying to send out to an IPv6 address. The peer endpoint=
 IP is IPv4 only (the LTE is IPv4-in-6).

On Wed, May 23, 2018, at 4:57 PM, nnet wrote:
> Hi Jason,
>=20
> Following up from IRC.=20
>=20
> I've been looking for the WireGuard tunnel to move back to over WiFi=20
> from LTE with wireguard-android Play version 0.0.20180523 and Android=20
> 8.1 May 5th Android Security Patch level. Here's a log extract from what=
=20
> I see with it:
>=20
> 05-23 14:30:50.215  3081  3209 D ConnectivityService: NetworkAgentInfo=20
> [WIFI () - 115] EVENT_NETWORK_INFO_CHANGED, going from null to=20
> CONNECTING
> 05-23 14:30:51.378  3081  3209 D ConnectivityService: NetworkAgentInfo=20
> [WIFI () - 115] EVENT_NETWORK_INFO_CHANGED, going from CONNECTING to=20
> CONNECTED
> 05-23 14:30:51.649  3081  3209 D ConnectivityService: Switching to new=20
> default network: NetworkAgentInfo{ ni{[type: WIFI[], ...
> 05-23 14:30:51.667  3081  3209 D ConnectivityService: Lingering=20
> NetworkAgentInfo [MOBILE (LTE) - 114] for 30000ms
> 05-23 14:30:51.668  3081  3209 D ConnectivityService: Sending=20
> DISCONNECTED broadcast for type 0 NetworkAgentInfo [MOBILE (LTE) - 114]=20
> isDefaultNetwork=3Dtrue
> 05-23 14:30:51.669  3081  3209 D ConnectivityService: Sending CONNECTED=20
> broadcast for type 1 NetworkAgentInfo [WIFI () - 115]=20
> isDefaultNetwork=3Dtrue
> 05-23 14:30:51.777  8674  9978 D WireGuard/GoBackend/wireguard: Failed=20
> to send authenticated packet to peer peer(AsMM=E2=80=A6SeWg)
> 05-23 14:30:51.778  8674  9978 I chatty  :=20
> uid=3D10104(com.wireguard.android) identical 1 line
> 05-23 14:30:51.778  8674  9978 D WireGuard/GoBackend/wireguard: Failed=20
> to send authenticated packet to peer peer(AsMM=E2=80=A6SeWg)
> ...
>=20
> It never recovers... I turn the tunnel off and back on to get a tunnel ag=
ain.=20
>=20
> I'm not having the same problem with (my own build) from tag=20
> 0.0.20180521. It doesn't 'roam' immediately as is expected with non-
> sticky sockets, it flows over WiFi it seems when the LTE interface is=20
> 'turned off' after a bit:
>=20
> 05-23 15:51:53.189  1088  1246 D ConnectivityService:=20
> registerNetworkAgent NetworkAgentInfo{ ni{[type: WIFI[], ...
> 05-23 15:51:53.189  1088  1254 D ConnectivityService: NetworkAgentInfo=20
> [WIFI () - 103] EVENT_NETWORK_INFO_CHANGED, going from null to=20
> CONNECTING
> 05-23 15:51:54.382  1088  1254 D ConnectivityService: NetworkAgentInfo=20
> [WIFI () - 103] EVENT_NETWORK_INFO_CHANGED, going from CONNECTING to=20
> CONNECTED
> 05-23 15:51:54.384  1088  1254 D ConnectivityService: Adding iface wlan0=
=20
> to network 103
> 05-23 15:51:54.623  1088  1254 D ConnectivityService: NetworkAgentInfo=20
> [WIFI () - 103] validation passed
> 05-23 15:51:54.629  1088  1254 D ConnectivityService: Switching to new=20
> default network: NetworkAgentInfo{ ni{[type: WIFI[] ...
> 05-23 15:51:54.663  1088  1254 D ConnectivityService: Lingering=20
> NetworkAgentInfo [MOBILE (LTE) - 102] for 30000ms
> 05-23 15:51:54.670  1088  1254 D ConnectivityService: Sending=20
> DISCONNECTED broadcast for type 0 NetworkAgentInfo [MOBILE (LTE) - 102]=20
> isDefaultNetwork=3Dtrue
> 05-23 15:51:54.672  1088  1254 D ConnectivityService: Sending CONNECTED=20
> broadcast for type 1 NetworkAgentInfo [WIFI () - 103]=20
> isDefaultNetwork=3Dtrue
> 05-23 15:52:08.924  2520  2595 D WireGuard/GoBackend/wireguard:=20
> peer(dJuC=E2=80=A61/Ws) - Sending handshake initiation
> 05-23 15:52:09.173  1088  2592 D ConnectivityService:=20
> ConnectivityService NetworkRequestInfo binderDied(NetworkRequest=20
> [ LISTEN id=3D29, [ Capabilities:=20
> INTERNET&NOT_RESTRICTED&TRUSTED&FOREGROUND] ],=20
> android.os.BinderProxy@bae392b)
> 05-23 15:52:13.459  1088  1561 D ConnectivityService:=20
> ConnectivityService NetworkRequestInfo binderDied(NetworkRequest=20
> [ LISTEN id=3D28, [ Capabilities:=20
> INTERNET&NOT_RESTRICTED&TRUSTED&FOREGROUND] ],=20
> android.os.BinderProxy@5ec2cc4)
> 05-23 15:52:13.946  2520  5094 D WireGuard/GoBackend/wireguard:=20
> peer(dJuC=E2=80=A61/Ws) - Sending handshake initiation
> 05-23 15:52:19.248  2520  4976 D WireGuard/GoBackend/wireguard:=20
> peer(dJuC=E2=80=A61/Ws): Handshake did not complete after 5 seconds, retr=
ying=20
> (try 2)
> 05-23 15:52:19.249  2520  4976 D WireGuard/GoBackend/wireguard:=20
> peer(dJuC=E2=80=A61/Ws) - Sending handshake initiation
> 05-23 15:52:19.289  2520  4972 D WireGuard/GoBackend/wireguard:=20
> peer(dJuC=E2=80=A61/Ws) - Received handshake response
> 05-23 15:52:19.289  2520  4972 D WireGuard/GoBackend/wireguard:=20
> peer(dJuC=E2=80=A61/Ws) - Sending keepalive packet
> 05-23 15:52:24.623  1088  1254 D ConnectivityService:=20
> handleLingerComplete for NetworkAgentInfo [MOBILE (LTE) - 102]
> 05-23 15:52:24.624  1088  1254 D ConnectivityService: NetworkAgentInfo=20
> [MOBILE (LTE) - 102] got DISCONNECTED, was satisfying 11
>=20
> Thoughts on what's holding things up on the first non-sticky socket=20
> version 0.0.20180523? Perhaps the issue lies elsewhere?
>=20
> I'd be curious to see someone your or someone else's logs of what=20
> happens with the latest 0.0.20180523 on going from LTE to WiFi.
>=20
> Thanks!
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
