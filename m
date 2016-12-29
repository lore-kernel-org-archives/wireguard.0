Return-Path: joerg@higgsboson.tk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a05c6d7
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Dec 2016 09:14:26 +0000 (UTC)
Received: from mail.higgsboson.tk (mail.higgsboson.tk [188.68.39.17])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2e3f297
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Dec 2016 09:14:26 +0000 (UTC)
Received: from [172.31.2.74] (p4FD3F6ED.dip0.t-ipconnect.de [79.211.246.237])
 by mail.higgsboson.tk (Postfix) with ESMTPSA id 8417550466
 for <wireguard@lists.zx2c4.com>; Thu, 29 Dec 2016 09:22:35 +0000 (UTC)
Subject: [WireGuard] Dual stack?
To: wireguard@lists.zx2c4.com
References: <A7E34EE0-F8F0-4F88-AA94-58434D0DF2BA@danrl.com>
 <CAHmME9r0tdR8=nnC4yPLJoOE8yU_7iJi0qEpx9POyM3OBZ3otQ@mail.gmail.com>
 <44DAF4D4-00A8-4903-8003-EB0215635B61@danrl.com>
 <CAHmME9qTLVPVrCnrusb3W32EtGYvLuKyyiGz+TWrXTxneVSrCA@mail.gmail.com>
 <7973130b-159b-a7c9-c2d8-24ca7afa8914@mmoya.org>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <e636afa1-7826-47b6-c442-af33d955760e@higgsboson.tk>
Date: Thu, 29 Dec 2016 10:22:34 +0100
MIME-Version: 1.0
In-Reply-To: <7973130b-159b-a7c9-c2d8-24ca7afa8914@mmoya.org>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2016-12-28 14:19, Maykel Moya wrote:
> Chiming in just to tell that my ip6 experience is a breeze since
> wireguard appeared.
>
> Right now I found myself advocating WG more as a simple-to-configure an=
d
> reliable-roaming ip6 tunnelling technology than a VPN itself.
>
> I've previously used HE (with a handcrafted mechanism to update my
> public ip4 endpoint whenever it changed) or SiXXs with a new daemon
> running in my system.
>
> With WG it's just setup and forget. Roaming is *reliable*, subjective
> performance is impressive (you've done the measures, I just browse and
> use services from the v6 internet without hassle).
>
> IMHO ip6 tunnelling is a(nother) good selling point of WG.
>
> Cheers,
> maykel
>
> ________

On the other hand switching between dual-stack/ipv4 only networks/ipv6 on=
ly networks
is problematic at the moment with the tools we have for roaming clients,
because wireguard only supports one endpoint of one address family at the=
 time.
This might be partially fixable in future by observing the availability o=
f default routes
in userspace (switch address family if it become unavailable). However th=
e optimal
solution would be something like the happy eyeballs protocol (https://too=
ls.ietf.org/html/rfc6555),
which is implemented in modern browser -
only because somebody got a v6/v4 default route does not mean it is also =
route able.
I don't know how the latter one would fit into the stateless concept of w=
ireguard.
I currently help myself by using an dedicated routing protocoll.
