Return-Path: rolf.sommerhalder@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec327fd
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jul 2018 11:14:57 +0000 (UTC)
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
 [209.85.217.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c283d5b0
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jul 2018 11:14:57 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id k25-v6so173627uao.11
 for <wireguard@lists.zx2c4.com>; Sat, 07 Jul 2018 04:21:55 -0700 (PDT)
MIME-Version: 1.0
From: Rolf Sommerhalder <rolf.sommerhalder@alumni.ethz.ch>
Date: Sat, 7 Jul 2018 13:21:17 +0200
Message-ID: <CAG9f2fhr6Sw2GL_WzB2kZHK7emDTX_Tx9LDct90C5Sgqmp=L8Q@mail.gmail.com>
Subject: Consul Connect and WireGuard?
To: wireguard@lists.zx2c4.com, consul-tool@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

(Cross-posting on Consul's Google group and WireGuard's mailing list.)

Hello,

After watching the keynotes [1], are you also asking yourself if
Consul's Service Mesh is a cloud-native Control Plane for dynamic
overlay (mesh) networks, and if mTLS with certificates could not be
replaced by WireGuard [2] with private/public keys in the Data Plane?

Could such a combination become be a light-weight (elastic)
alternative to network-centric (static) overlays, such as VxLAN or
EVPN?
Or, Consul could be a much more comprehensive Control Plane for
WireGuard, compared to WireGuard-p2p [3] that uses ad-hoc Distributed
Hash Tables (DHT) for "Service Registration & Discovery"?

Eventually, the user-space Go implementation of WireGuard could be
included into Consul, as HashiCorp already did for its PKI (parts
taken from Vault). This would make the alternate Data Plane portable
to platforms other than Linux, much in line with the idea of running
Consul agents on each node providing a "dial-tone".

However, running Consul on each node might be a chatty and large
Control Plane that may be harder to lock down, compared to WireGuard
network overlays and proxies in the Data Plane. For the Data Plane,
Consul Connect provides nice security controls, such as key
management, or Service Graphs with ACLs and Intentions. As everything
is identity-based and independent of IP addresses, this would fit Zero
Trust Network designs.

Is this idea viable at all and worth further exploration, or do I miss
something?

Thanks,
Rolf

[1] https://www.hashicorp.com/resources/hashidays-2018-full-keynote-armon-mitchell
[2] https://www.wireguard.com
[3] https://github.com/manuels/wireguard-p2p
