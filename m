Return-Path: nnet@fastmail.fm
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8e4b135
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 23:55:49 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6f8acfd
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 May 2018 23:55:49 +0000 (UTC)
Message-Id: <1527119825.1012882.1382673952.168165E8@webmail.messagingengine.com>
From: nnet <nnet@fastmail.fm>
To: Jason Donenfeld <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Subject: [wireguard-android] 'roaming' from LTE to WiFi with version
 0.0.20180523
Date: Wed, 23 May 2018 16:57:05 -0700
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

Following up from IRC.=20

I've been looking for the WireGuard tunnel to move back to over WiFi from L=
TE with wireguard-android Play version 0.0.20180523 and Android 8.1 May 5th=
 Android Security Patch level. Here's a log extract from what I see with it:

05-23 14:30:50.215  3081  3209 D ConnectivityService: NetworkAgentInfo [WIF=
I () - 115] EVENT_NETWORK_INFO_CHANGED, going from null to CONNECTING
05-23 14:30:51.378  3081  3209 D ConnectivityService: NetworkAgentInfo [WIF=
I () - 115] EVENT_NETWORK_INFO_CHANGED, going from CONNECTING to CONNECTED
05-23 14:30:51.649  3081  3209 D ConnectivityService: Switching to new defa=
ult network: NetworkAgentInfo{ ni{[type: WIFI[], ...
05-23 14:30:51.667  3081  3209 D ConnectivityService: Lingering NetworkAgen=
tInfo [MOBILE (LTE) - 114] for 30000ms
05-23 14:30:51.668  3081  3209 D ConnectivityService: Sending DISCONNECTED =
broadcast for type 0 NetworkAgentInfo [MOBILE (LTE) - 114] isDefaultNetwork=
=3Dtrue
05-23 14:30:51.669  3081  3209 D ConnectivityService: Sending CONNECTED bro=
adcast for type 1 NetworkAgentInfo [WIFI () - 115] isDefaultNetwork=3Dtrue
05-23 14:30:51.777  8674  9978 D WireGuard/GoBackend/wireguard: Failed to s=
end authenticated packet to peer peer(AsMM=E2=80=A6SeWg)
05-23 14:30:51.778  8674  9978 I chatty  : uid=3D10104(com.wireguard.androi=
d) identical 1 line
05-23 14:30:51.778  8674  9978 D WireGuard/GoBackend/wireguard: Failed to s=
end authenticated packet to peer peer(AsMM=E2=80=A6SeWg)
...

It never recovers... I turn the tunnel off and back on to get a tunnel agai=
n.=20

I'm not having the same problem with (my own build) from tag 0.0.20180521. =
It doesn't 'roam' immediately as is expected with non-sticky sockets, it fl=
ows over WiFi it seems when the LTE interface is 'turned off' after a bit:

05-23 15:51:53.189  1088  1246 D ConnectivityService: registerNetworkAgent =
NetworkAgentInfo{ ni{[type: WIFI[], ...
05-23 15:51:53.189  1088  1254 D ConnectivityService: NetworkAgentInfo [WIF=
I () - 103] EVENT_NETWORK_INFO_CHANGED, going from null to CONNECTING
05-23 15:51:54.382  1088  1254 D ConnectivityService: NetworkAgentInfo [WIF=
I () - 103] EVENT_NETWORK_INFO_CHANGED, going from CONNECTING to CONNECTED
05-23 15:51:54.384  1088  1254 D ConnectivityService: Adding iface wlan0 to=
 network 103
05-23 15:51:54.623  1088  1254 D ConnectivityService: NetworkAgentInfo [WIF=
I () - 103] validation passed
05-23 15:51:54.629  1088  1254 D ConnectivityService: Switching to new defa=
ult network: NetworkAgentInfo{ ni{[type: WIFI[] ...
05-23 15:51:54.663  1088  1254 D ConnectivityService: Lingering NetworkAgen=
tInfo [MOBILE (LTE) - 102] for 30000ms
05-23 15:51:54.670  1088  1254 D ConnectivityService: Sending DISCONNECTED =
broadcast for type 0 NetworkAgentInfo [MOBILE (LTE) - 102] isDefaultNetwork=
=3Dtrue
05-23 15:51:54.672  1088  1254 D ConnectivityService: Sending CONNECTED bro=
adcast for type 1 NetworkAgentInfo [WIFI () - 103] isDefaultNetwork=3Dtrue
05-23 15:52:08.924  2520  2595 D WireGuard/GoBackend/wireguard: peer(dJuC=
=E2=80=A61/Ws) - Sending handshake initiation
05-23 15:52:09.173  1088  2592 D ConnectivityService: ConnectivityService N=
etworkRequestInfo binderDied(NetworkRequest [ LISTEN id=3D29, [ Capabilitie=
s: INTERNET&NOT_RESTRICTED&TRUSTED&FOREGROUND] ], android.os.BinderProxy@ba=
e392b)
05-23 15:52:13.459  1088  1561 D ConnectivityService: ConnectivityService N=
etworkRequestInfo binderDied(NetworkRequest [ LISTEN id=3D28, [ Capabilitie=
s: INTERNET&NOT_RESTRICTED&TRUSTED&FOREGROUND] ], android.os.BinderProxy@5e=
c2cc4)
05-23 15:52:13.946  2520  5094 D WireGuard/GoBackend/wireguard: peer(dJuC=
=E2=80=A61/Ws) - Sending handshake initiation
05-23 15:52:19.248  2520  4976 D WireGuard/GoBackend/wireguard: peer(dJuC=
=E2=80=A61/Ws): Handshake did not complete after 5 seconds, retrying (try 2)
05-23 15:52:19.249  2520  4976 D WireGuard/GoBackend/wireguard: peer(dJuC=
=E2=80=A61/Ws) - Sending handshake initiation
05-23 15:52:19.289  2520  4972 D WireGuard/GoBackend/wireguard: peer(dJuC=
=E2=80=A61/Ws) - Received handshake response
05-23 15:52:19.289  2520  4972 D WireGuard/GoBackend/wireguard: peer(dJuC=
=E2=80=A61/Ws) - Sending keepalive packet
05-23 15:52:24.623  1088  1254 D ConnectivityService: handleLingerComplete =
for NetworkAgentInfo [MOBILE (LTE) - 102]
05-23 15:52:24.624  1088  1254 D ConnectivityService: NetworkAgentInfo [MOB=
ILE (LTE) - 102] got DISCONNECTED, was satisfying 11

Thoughts on what's holding things up on the first non-sticky socket version=
 0.0.20180523? Perhaps the issue lies elsewhere?

I'd be curious to see someone your or someone else's logs of what happens w=
ith the latest 0.0.20180523 on going from LTE to WiFi.

Thanks!
