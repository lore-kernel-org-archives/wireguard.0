Return-Path: pete@port.direct
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3705b02a
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jul 2016 13:56:19 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id i5so118116460wmg.0
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jul 2016 06:57:52 -0700 (PDT)
Return-Path: <pete@port.direct>
Received: from [192.168.125.52] ([87.246.78.46])
 by smtp.gmail.com with ESMTPSA id a2sm16914800wma.2.2016.07.18.06.57.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jul 2016 06:57:50 -0700 (PDT)
Date: Mon, 18 Jul 2016 14:57:49 +0100
From: Pete Birley <pete@port.direct>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-Id: <1468850269.6953.2@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qYu3yWrG64Qbr6kpeTLi"
Subject: [WireGuard] Kubernetes/Neutron support
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-qYu3yWrG64Qbr6kpeTLi
Content-Type: text/plain; charset=utf-8; format=flowed

Hi,

I'm investigating using Wireguard to provide a network solution for 
Kubernetes via a CNI or exec network driver - has anyone done anything 
on this already?

We currently have about 500 pods, on 30 nodes, in our production 
cluster (though plan to scale to about 20-30 times this), and use a 
combination of OpenvSwitch (gre+IPsec tunnels between hosts) and 
Flannel (Each host has a sub-net on a standard Linux bridge) to provide 
connectivity. Though need to both improve availability and east-west 
traffic distribution, especially when pods may be located is different 
geographic regions, and are migrating to a solution based on OpenStack 
Neutron with Dragonflow as the SDN layer.

Does anyone have any advice on the best way to implement such a 
solution? We plan to implement a reasonably 'intelligent' strategy 
where by our Neutron plugin identifies the most appropriate link for 
each compute node, and so expect WireGuard to only be utilized for 
inter-dc connections. In particular any input on the number of 
connections a single node can take (ie full-mesh style topology), 
before dedicated network nodes and a hub and spoke topology makes 
sense? Any advice would be appreciated, and if we find that Wireguard 
fits our needs then I'd love to get involved in the project.


Cheers


Pete Birley

--=-qYu3yWrG64Qbr6kpeTLi
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I'm investigating using Wireguard to provide a netwo=
rk solution for Kubernetes via a CNI or exec network driver - has anyone do=
ne anything on this already?</div><div><br></div><div>We currently have abo=
ut 500 pods, on 30 nodes, in our production cluster (though plan to scale t=
o about 20-30 times this), and use a combination of OpenvSwitch (gre+IPsec =
tunnels between hosts) and Flannel (Each host has a sub-net on a standard L=
inux bridge) to provide connectivity. Though need to both improve availabil=
ity and east-west traffic distribution, especially when pods may be located=
 is different geographic regions, and are migrating to a solution based on =
OpenStack Neutron with Dragonflow as the SDN layer.</div><div><br></div><di=
v>Does anyone have any advice on the best way to implement such a solution?=
 We plan to implement a reasonably 'intelligent' strategy where by our Neut=
ron plugin identifies the most appropriate link for each compute node, and =
so expect WireGuard to only be utilized for inter-dc connections. In partic=
ular any input on the number of connections a single node can take (ie full=
-mesh style topology), before dedicated network nodes and a hub and spoke t=
opology makes sense? Any advice would be appreciated, and if we find that W=
ireguard fits our needs then I'd love to get involved in the project.</div>=
<div><br></div><div><br></div><div>Cheers</div><div><br></div><div><br></di=
v><div>Pete Birley</div>=

--=-qYu3yWrG64Qbr6kpeTLi--
