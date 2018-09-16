Return-Path: rspazzol@redhat.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id febfb129
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 12:19:35 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c35ab0c
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Sep 2018 12:19:35 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id l15-v6so10879986lji.6
 for <wireguard@lists.zx2c4.com>; Sun, 16 Sep 2018 05:21:04 -0700 (PDT)
MIME-Version: 1.0
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Sun, 16 Sep 2018 08:21:02 -0400
Message-ID: <CACOeLq+PG-SFUhSZUejCVWc+uMnBq1ATRwUFFLQZBTCU6JMSew@mail.gmail.com>
Subject: what to do when the peers use different IPs to transmit and receive
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000011a16e0575fc17d7"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000011a16e0575fc17d7
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to build an encrypted tunnel between two Kubernetes clusters.
The distribution of Kubernetes that I use is OpenShift, so I'll make my
examples in OpenShift although the problem that I'm seeing is really more
general.

The nodes that comprise the cluster in OpenShift have an IP in what we'll
call the enterprise network. Also they establish between each other an SDN.
The SDN will have a separate CIDR from the enterprise network and the pods
that OpenShift starts receive an SDN IP. Each node manages a subnet of the
SDN CIDR.

What I'd like to do is to make the IPs of two different OpenShift SDNs
routable over and encrypted tunnel.

In my design each node of cluster A sees as its VPN peers the nodes of
cluster B. So this creates a sort of a meshed VPN.

Wireguard fits very well this series of requirements, but I have an issue.

Normally the nodes of a cluster are not directly exposed to the internet.
This is for security reasons. Whether the cluster is in the cloud or on
premise, normally what customers do is to use private internal addresses.
To access the cluster one can use VIPs. Especially in the cloud Kubernetes
makes it easy to create VIPs in an automated fashion. VIP are public IPs
that can be used to loadbalanced backed services. UDP VIPS are supported.

So if we assume that the two clusters that we want to connect using
wireguard are in two different geographies and can only be talk over the
internet and through VIPs, then the IP that a  node uses for its outbound
connection is not the same that its peer need to use for its inbound
connections.

Each node can have a dedicated VIP that peers need to use for its inbound
connection and then it will use the node's private IP for its outbound
connection.

In this situation wiregaurd assumes that the peer has changed IP (built-in
roaming feature) and it updates the peer endpoint value. This doesn't work
for my setup.

What can I do to fix this issue?
Or alternatively would it be reasonable to add a flag to make a peer
configuration immutable?



Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717

--00000000000011a16e0575fc17d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying to build an =
encrypted tunnel between two Kubernetes clusters.</div><div>The distributio=
n of Kubernetes that I use is OpenShift, so I&#39;ll make my examples in Op=
enShift although the problem that I&#39;m seeing is really more general.</d=
iv><div><br></div><div>The nodes that comprise the cluster in OpenShift hav=
e an IP in what we&#39;ll call the enterprise network. Also they establish =
between each other an SDN. The SDN will have a separate CIDR from the enter=
prise network and the pods that OpenShift starts receive an SDN IP. Each no=
de manages a subnet of the SDN CIDR.</div><div><br></div><div>What I&#39;d =
like to do is to make the IPs of two different OpenShift SDNs routable over=
 and encrypted tunnel.</div><div><br></div><div>In my design each node of c=
luster A sees as its VPN peers the nodes of cluster B. So this creates a so=
rt of a meshed VPN.=C2=A0</div><div><br></div><div>Wireguard fits very well=
 this series of requirements, but I have an issue.</div><div><br></div><div=
>Normally the nodes of a cluster are not directly exposed to the internet. =
This is for security reasons. Whether the cluster is in the cloud or on pre=
mise, normally what customers do is to use private internal addresses. To a=
ccess the cluster one can use VIPs. Especially in the cloud Kubernetes make=
s it easy to create VIPs in an automated fashion. VIP are public IPs that c=
an be used to loadbalanced backed services. UDP VIPS are supported.</div><d=
iv><br></div><div>So if we assume that the two clusters that we want to con=
nect using wireguard are in two different geographies and can only be talk =
over the internet and through VIPs, then the IP that a=C2=A0 node uses for =
its outbound connection is not the same that its peer need to use for its i=
nbound connections.=C2=A0</div><div><br></div><div>Each node can have a ded=
icated VIP that peers need to use for its inbound connection and then it wi=
ll use the node&#39;s private IP for its outbound connection.</div><div><br=
></div><div>In this situation wiregaurd assumes that the peer has changed I=
P (built-in roaming feature) and it updates the peer endpoint value. This d=
oesn&#39;t work for my setup.</div><div><br></div><div>What can I do to fix=
 this issue?</div><div>Or alternatively would it be reasonable to add a fla=
g to make a peer configuration immutable?</div><div><br></div><div><br></di=
v><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr=
"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><d=
iv dir=3D"ltr">Thanks,<div>Raffaele</div><div><br></div><div>Raffaele Spazz=
oli</div><div>Senior Architect - <a href=3D"https://www.openshift.com" targ=
et=3D"_blank">OpenShift</a>, <a href=3D"https://www.redhat.com/en/services/=
consulting/paas" target=3D"_blank">Containers and=C2=A0PaaS Practice</a></d=
iv><div>Tel: +1 216-258-7717</div><div><br></div><div><br></div></div></div=
></div></div></div></div></div></div></div></div></div></div></div></div></=
div>
</div>

--00000000000011a16e0575fc17d7--
