Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5700315d
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 04:11:39 +0000 (UTC)
Received: from mx03a-out01ag.rit.edu (mx03a-out01ag.rit.edu [129.21.3.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5c4be07
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 04:11:39 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pf0-f198.google.com with SMTP id t25so35906658pfg.15
 for <wireguard@lists.zx2c4.com>; Fri, 04 Aug 2017 21:33:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 5 Aug 2017 00:32:58 -0400
Message-ID: <CAA8CD9vz8FQpgK4P7Je7txuoQBfi-=OSXpT=siXTQKhGgw1Nng@mail.gmail.com>
Subject: Query regarding the metric of comparison in Wireguard white
 paper(Section 8)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c6a1ed6d0ac0555fa1b70"
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c6a1ed6d0ac0555fa1b70
Content-Type: text/plain; charset="UTF-8"

Hi,
In section 8, Throughput and Ping Time is used for comparison of WireGuard
with IPsec etc.

So my questions are:
1. How you test both metrics with IPSec protocol? Do you have
implementation of IPSec with you? Same for OpenVPN?
2. I have install the flent and run ping command between to laptop to see
some sample results.
But can you point out which source files or command utility I should used
to measure the  Bandwidth, Memory,Energy both in communication and packet
processing,throughput and latency.
3.  How can I control the number of packets send per unit time or recieved
per unit time in tool? If not flent then any tool is well come for that
matter.
4. If I ping from two machine running wireguard at the same time to third
machine having server configuration. Will it process ping packet in serial
order or parallel order?



Regards
Sahil Gupta

--f403045c6a1ed6d0ac0555fa1b70
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>In section 8, Throughput and Ping Time is used for =
comparison of WireGuard with IPsec etc.<div><br></div><div>So my questions =
are:<br>1. How you test both metrics with IPSec protocol? Do you have imple=
mentation of IPSec with you? Same for OpenVPN?<br>2. I have install the fle=
nt and run ping command between to laptop to see some sample results.<br>Bu=
t can you point out which source files or command utility I should used to =
measure the=C2=A0<span style=3D"font-size:12.8px">=C2=A0Bandwidth,=C2=A0</s=
pan><span style=3D"font-size:12.8px">Memory,Energy both in communication an=
d packet processing,throughput=C2=A0and latency.</span><br></div><div>3.=C2=
=A0 How can I control the number of packets send per unit time or recieved =
per unit time in tool? If not flent then any tool is well come for that mat=
ter.<br>4. If I ping from two machine running wireguard at the same time to=
 third machine having server configuration. Will it process ping packet in =
serial order or parallel order?</div><div><br></div><div><br></div><div><br=
></div><div>Regards</div><div>Sahil Gupta</div></div>

--f403045c6a1ed6d0ac0555fa1b70--
