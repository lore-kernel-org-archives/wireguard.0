Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c9d537c
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 19:17:12 +0000 (UTC)
Received: from mx03b-out01ag.rit.edu (mx03b-out01ag.rit.edu [129.21.3.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96a65129
 for <wireguard@lists.zx2c4.com>; Sat, 5 Aug 2017 19:17:12 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pf0-f198.google.com with SMTP id j83so51961720pfe.10
 for <wireguard@lists.zx2c4.com>; Sat, 05 Aug 2017 12:38:41 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 5 Aug 2017 15:38:39 -0400
Message-ID: <CAA8CD9t8YCR__Ee2F3Sb5H=78O9PTi5j+K1iXHsU7PS4pTKAwA@mail.gmail.com>
Subject: RTNETLINK answers: Operation not supported
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eric Light <eric@ericlight.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045c6a1eb36c61055606c2f0"
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045c6a1eb36c61055606c2f0
Content-Type: text/plain; charset="UTF-8"

Hi,
I am not able to setup Wireguard interface on Raspberry pi.

Error:
RTNETLINK answers: Operation not supported


See the stack:
"
pi@raspberrypi:~ $ cd /etc/wireguard/
pi@raspberrypi:/etc/wireguard $ l
-bash: l: command not found
pi@raspberrypi:/etc/wireguard $ ls
publickey  wg0.conf
pi@raspberrypi:/etc/wireguard $ history | grep wg0
   15  history | grep wg0
pi@raspberrypi:/etc/wireguard $ ip link add wg0 type wireguard
RTNETLINK answers: Operation not permitted
pi@raspberrypi:/etc/wireguard $ sudo su
root@raspberrypi:/etc/wireguard# wg-quick up wg0
Warning: `/etc/wireguard/wg0.conf' is world accessible
[#] ip link add wg0 type wireguard
RTNETLINK answers: Operation not supported
`wg0` is not a valid WireGuard interface
Usage: wg show { <interface> | all | interfaces } [public-key | private-key
| listen-port | fwmark | peers | preshared-keys | endpoints | allowed-ips |
latest-handshakes | transfer | persistent-keepalive | dump]
root@raspberrypi:/etc/wireguard# wg show
root@raspberrypi:/etc/wireguard# wg show all
root@raspberrypi:/etc/wireguard#

"

Any pointers will be appreciated.

Thanks
Sahil Gupta

--f403045c6a1eb36c61055606c2f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>I am not able to setup Wireguard interface on Raspb=
erry pi.<br><br>Error:<br>RTNETLINK answers: Operation not supported<div><b=
r><br>See the stack:<br>&quot;<div><div>pi@raspberrypi:~ $ cd /etc/wireguar=
d/</div><div>pi@raspberrypi:/etc/wireguard $ l</div><div>-bash: l: command =
not found</div><div>pi@raspberrypi:/etc/wireguard $ ls</div><div>publickey =
=C2=A0wg0.conf</div><div>pi@raspberrypi:/etc/wireguard $ history | grep wg0=
</div><div>=C2=A0 =C2=A015 =C2=A0history | grep wg0</div><div>pi@raspberryp=
i:/etc/wireguard $ ip link add wg0 type wireguard</div><div>RTNETLINK answe=
rs: Operation not permitted</div><div>pi@raspberrypi:/etc/wireguard $ sudo =
su</div><div>root@raspberrypi:/etc/wireguard# wg-quick up wg0</div><div>War=
ning: `/etc/wireguard/wg0.conf&#39; is world accessible</div><div>[#] ip li=
nk add wg0 type wireguard</div><div>RTNETLINK answers: Operation not suppor=
ted</div><div>`wg0` is not a valid WireGuard interface</div><div>Usage: wg =
show { &lt;interface&gt; | all | interfaces } [public-key | private-key | l=
isten-port | fwmark | peers | preshared-keys | endpoints | allowed-ips | la=
test-handshakes | transfer | persistent-keepalive | dump]</div><div>root@ra=
spberrypi:/etc/wireguard# wg show</div><div>root@raspberrypi:/etc/wireguard=
# wg show all</div><div>root@raspberrypi:/etc/wireguard#=C2=A0</div></div><=
div><br></div><div>&quot;</div><div><br></div><div>Any pointers will be app=
reciated.</div><div><br></div><div>Thanks<br>Sahil Gupta</div></div></div>

--f403045c6a1eb36c61055606c2f0--
