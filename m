Return-Path: raulbe@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acb9df2f
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 02:08:39 +0000 (UTC)
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d655e8be
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 02:08:39 +0000 (UTC)
Received: by mail-qt0-f170.google.com with SMTP id b40so40353433qtb.2
 for <wireguard@lists.zx2c4.com>; Fri, 07 Jul 2017 19:26:29 -0700 (PDT)
MIME-Version: 1.0
From: raul <raulbe@gmail.com>
Date: Sat, 8 Jul 2017 07:56:28 +0530
Message-ID: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
Subject: Early Feedback on Container Networking, Resilience,
 Json Config and AcceptedIPs
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a113f458cc6d93a0553c51332"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113f458cc6d93a0553c51332
Content-Type: text/plain; charset="UTF-8"

Hi Jason,

First, this is a stunning piece of work.

I am working on a container networking project with vxlan and peervpn at L2
and quagga at L3 with a smattering of nearly all Linux networking tunnels
and testing Wireguard has been a revelation.

Vxlan is not useful without multicast. BGP may be overkill for simple route
management, most other tunnels require intensive management at scale.
Peervpn is nice and has autodiscovery of nodes but like most current
encrypted tunnels has a performance penalty. Ipsec doesn't but adds config
complexity. Wireguard brings something fresh to the table.

My early Wireguard Iperf tests show near line speed, 942Mbps without and
870-890Mbps with Wireguard. Around 120Mbps for Peervpn. CPU usage is at
around 100% on one core for Peervpn and around 50-60% across 4 cores for
Wireguard for sending and 35-40% receiving . These tests are on low power
1.5Ghz quad core Apollo lake Celeron J3455 clusters on Ubuntu Xenial.

You have been able to hide a tremendous amount of complexity to expose a
simple, flexible but powerful front end and I am certain this must have
taken extraordinary talent, experience, time and engineering.

I have been running a number of scenarios mainly around container
networking and service discovery across multiple clouds and systems and am
glad to report its is much more robust than I expected and just works.

There are 4 things I wanted to bring up.

1. Do you anticipate a situation where differing Wireguard versions across
distributions and kernels do not inter-operate? This introduces a huge
amount of complexity to managing clusters. I faced this with Gluster and it
is a significant pain and blocker.

2. Would you consider supporting a json configuration file? The current
Wireguard ini format has duplicate entires for 'Peers' and the python ini
parser for instance does not support duplicate section heads.

3. While the allowed IPs construct is powerful it can sometimes feel a bit
unintuitive. The way I understand it the 'AllowedIP config on the Wireguard
server is for shared networks from the client and on the client for
accepted networks. This is so the server knows where to route (and thus
there cannot be duplicate IPs, subnets or any subnet overlapping in the
server config) and the client can only receive traffic from acceptedips
recorded on the client side config.

My mindset may be a bit too container orientated with hosts sharing
internal container networks across systems at the moment, and Wireguard has
a much broader use case but the share/accept construct seems slightly more
intuitive though I could be wrong.

4. The Wireguard server is a single point of failure in a star topology. If
the server host goes down your network goes down with it. How can we add
more resilience in a simple way? A backup server in L2 with identical keys
and a floating internal IP?

Thanks for Wireguard!

Raul

--001a113f458cc6d93a0553c51332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Jason,<br><br></div>First, thi=
s is a stunning piece of work. <br><br>I am working on a container networki=
ng project with vxlan and peervpn at L2 and quagga at L3 with a smattering =
of nearly all Linux networking tunnels and testing Wireguard has been a rev=
elation.<br><br>Vxlan is not useful without multicast. BGP may be overkill =
for simple route management, most other tunnels require intensive managemen=
t at scale. Peervpn is nice and has autodiscovery of nodes but like most cu=
rrent encrypted tunnels has a performance penalty. Ipsec doesn&#39;t but ad=
ds config complexity. Wireguard brings something fresh to the table.<br></d=
iv></div><div><br></div><div>My early Wireguard Iperf tests show near line =
speed, 942Mbps without and 870-890Mbps with Wireguard. Around 120Mbps for P=
eervpn. CPU usage is at around 100% on one core for Peervpn and around 50-6=
0% across 4 cores for Wireguard for sending and 35-40% receiving . These te=
sts are on low power 1.5Ghz quad core Apollo lake Celeron J3455 clusters on=
 Ubuntu Xenial. <br></div><div><br>You have been able to hide a tremendous =
amount of complexity to expose a simple, flexible but powerful front end an=
d I am certain this must have taken extraordinary talent, experience, time =
and engineering.<br><br>I have been running a number of scenarios mainly ar=
ound container networking and service discovery across multiple clouds and =
systems and am glad to report its is much more robust than I expected and j=
ust works.<br><br></div></div>There are 4 things I wanted to bring up.<br><=
br></div>1. Do you anticipate a situation where differing Wireguard version=
s across distributions and kernels do not inter-operate? This introduces a =
huge amount of complexity to managing clusters. I faced this with Gluster a=
nd it is a significant pain and blocker.<br><div><div><div><br></div><div>2=
. Would you consider supporting a json configuration file? The current Wire=
guard ini format has duplicate entires for &#39;Peers&#39; and the python i=
ni parser for instance does not support duplicate section heads.<br><br></d=
iv><div>3. While the allowed IPs construct is powerful it can sometimes fee=
l a bit unintuitive. The way I understand it the &#39;AllowedIP config on t=
he Wireguard server is for shared networks from the client and on the clien=
t for accepted networks. This is so the server knows where to route (and th=
us there cannot be duplicate IPs, subnets or any subnet overlapping in the =
server config) and the client can only receive traffic from acceptedips rec=
orded on the client side config.<br><br>My mindset may be a bit too contain=
er orientated with hosts sharing internal container networks across systems=
 at the moment, and Wireguard has a much broader use case but the share/acc=
ept construct seems slightly more intuitive though I could be wrong.<br><br=
></div><div>4. The Wireguard server is a single point of failure in a star =
topology. If the server host goes down your network goes down with it. How =
can we add more resilience in a simple way? A backup server in L2 with iden=
tical keys and a floating internal IP?<br></div><div><br></div><div>Thanks =
for Wireguard!<br><br></div><div>Raul<br></div><div><br><div><br><br><br><b=
r><br></div></div></div></div></div>

--001a113f458cc6d93a0553c51332--
