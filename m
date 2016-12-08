Return-Path: admin@hda.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7089364
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 13:03:56 +0000 (UTC)
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 915545f2
 for <wireguard@lists.zx2c4.com>; Thu, 8 Dec 2016 13:03:56 +0000 (UTC)
Date: Thu, 08 Dec 2016 14:09:17 +0100
From: Anonymous Anonymous <admin@hda.me>
To: <Jason@zx2c4.com>,  <mail@eworm.de>
Message-Id: <158de8d60c9.e6f422435156.9189443751533510604@hda.me>
In-Reply-To: 
Subject: Re: [PATCH 1/1] make the systemd unit example more general
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_12110_813111491.1481202557136"
Cc: mail@eworm.de, wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_12110_813111491.1481202557136
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

It will be super cool if ip/netmask functionality will be addressed by wgconf
Currently we testing this systemd units for wireguard ppa:
: wireguard.service
# This service is actually a systemd target,
# but we are using a service since targets cannot be reloaded.

[Unit]
Description=WireGuard service
After=network.target

[Service]
Type=oneshot
RemainAfterExit=yes
ExecStart=/bin/true
ExecReload=/bin/true

[Install]
WantedBy=multi-user.target

:wireguard@.service
[Unit]
Description=WireGuard connection to %i
PartOf=wireguard.service
ReloadPropagatedFrom=wireguard.service
Before=systemd-user-sessions.service

[Service]
Type=oneshot
EnvironmentFile=-/etc/default/wireguard

# %i is your connection name created from .conf files in /etc/wireguard
# For ex.: Use systemctl enable wireguard@server.service to enable server example setup
# You can store unlimited amount of various connections in /etc/wireguard

ExecStart=/bin/ip link add dev wg%i type wireguard
ExecStartPre=/bin/sh -c "/bin/systemctl set-environment ip=$(/usr/bin/head -1 /etc/wireguard/%i.conf | awk '{print $2}')"
ExecStart=/bin/ip address add ${ip} dev wg%i
ExecStart=/usr/bin/wg setconf wg%i /etc/wireguard/%i.conf
ExecStart=/bin/ip link set up dev wg%i

# We can't predict routing in your environment, but we can make it easier to setup in /etc/default/wireguard
#ExecStart=/bin/ip route add $0_1 dev wg%i
#ExecStart=/bin/ip route add $128_1 dev wg%i
#ExecStart=/bin/ip add $demo via $common_router dev eth0
#ExecStart=/bin/ip route add 
#ExecStart=/bin/ip route add 
#ExecStart=/bin/ip route add 
#ExecStart=/bin/ip route add 

ExecReload=/bin/ip link del dev wg%i

[Install]
WantedBy=multi-user.target
:/etc/default/wireguard
# Common values could help you setup routing faster
# You can set routing rules in /lib/systemd/wireguard@.service file

0_1="0.0.0.0/1"
128_1="128.0.0.0/1"
# demo.wireguard.io
demo="163.172.161.0/32"
common_router="192.168.1.1"

And test files:
: server.conf
# 192.168.177.1/24
# Since you need to set ip address manually with ip or ifconfig we use workaround and read ip/netmask from first line of every config file
[Interface]
    # You can generate own public and private keys with: wg genkey | tee privatekey | wg pubkey &gt; publickey
    # Its strongly recomended for you to generate own keys!
    PrivateKey = qFstR3l2HG5WQJ0qoQG0G87c039kXR5zN7vV+bUKb0Q=
    ListenPort = 41414

[Peer]
    PublicKey = 40UuwEq4H1gaY1rpmwuW0hUyOnGvXuoQIMctOyOrEAs=
    # Outside world access blocked in example setup
    AllowedIPs = 127.0.0.1/32
    #AllowedIPs = 0.0.0.0/0
:client.conf
# 192.168.4.5/24
# Since you need to set ip address manually with ip or ifconfig we use workaround and read ip/netmask from first line of every config file
[Interface]
    # You can generate own public and private keys with: wg genkey | tee privatekey | wg pubkey &gt; publickey
    PrivateKey = WEAuaVuhdyscyTCXVfBDJR6nf9zxD75jmJzrfhkyE3Y=

[Peer]
    PublicKey = Uha1fHzOY6hPhq54fcrElVdNF/XQDzQ90rDT7+IqIgA=
    Endpoint = demo.wireguard.io:12912
    AllowedIPs = 0.0.0.0/0
    PersistentKeepalive = 25

After some talking with ">Egbert, I think to move routing to separate unit, but still read routing configuration from conf files. I just like ovpn way, when for user is just enough to copy single configuration file.
If ip/netmask and routing will be done with wgconf, and will be located inside single config file, this will be huge success for all users.



------=_Part_12110_813111491.1481202557136
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><head>=
<meta content=3D"text/html;charset=3DUTF-8" http-equiv=3D"Content-Type"></h=
ead><body ><div style=3D'font-size:10pt;font-family:Verdana,Arial,Helvetica=
,sans-serif;'>It will be super cool if ip/netmask functionality will be add=
ressed by wgconf<br>Currently we testing this systemd units for wireguard p=
pa:<br>: wireguard.service<br># This service is actually a systemd target,<=
br># but we are using a service since targets cannot be reloaded.<br><br>[U=
nit]<br>Description=3DWireGuard service<br>After=3Dnetwork.target<br><br>[S=
ervice]<br>Type=3Doneshot<br>RemainAfterExit=3Dyes<br>ExecStart=3D/bin/true=
<br>ExecReload=3D/bin/true<br><br>[Install]<br>WantedBy=3Dmulti-user.target=
<br><br>:wireguard@.service<br>[Unit]<br>Description=3DWireGuard connection=
 to %i<br>PartOf=3Dwireguard.service<br>ReloadPropagatedFrom=3Dwireguard.se=
rvice<br>Before=3Dsystemd-user-sessions.service<br><br>[Service]<br>Type=3D=
oneshot<br>EnvironmentFile=3D-/etc/default/wireguard<br><br># %i is your co=
nnection name created from .conf files in /etc/wireguard<br># For ex.: Use =
systemctl enable wireguard@server.service to enable server example setup<br=
># You can store unlimited amount of various connections in /etc/wireguard<=
br><br>ExecStart=3D/bin/ip link add dev wg%i type wireguard<br>ExecStartPre=
=3D/bin/sh -c "/bin/systemctl set-environment ip=3D$(/usr/bin/head -1 /etc/=
wireguard/%i.conf | awk '{print $2}')"<br>ExecStart=3D/bin/ip address add $=
{ip} dev wg%i<br>ExecStart=3D/usr/bin/wg setconf wg%i /etc/wireguard/%i.con=
f<br>ExecStart=3D/bin/ip link set up dev wg%i<br><br># We can't predict rou=
ting in your environment, but we can make it easier to setup in /etc/defaul=
t/wireguard<br>#ExecStart=3D/bin/ip route add $0_1 dev wg%i<br>#ExecStart=
=3D/bin/ip route add $128_1 dev wg%i<br>#ExecStart=3D/bin/ip add $demo via =
$common_router dev eth0<br>#ExecStart=3D/bin/ip route add <br>#ExecStart=3D=
/bin/ip route add <br>#ExecStart=3D/bin/ip route add <br>#ExecStart=3D/bin/=
ip route add <br><br>ExecReload=3D/bin/ip link del dev wg%i<br><br>[Install=
]<br>WantedBy=3Dmulti-user.target<br>:/etc/default/wireguard<br># Common va=
lues could help you setup routing faster<br># You can set routing rules in =
/lib/systemd/wireguard@.service file<br><br>0_1=3D"0.0.0.0/1"<br>128_1=3D"1=
28.0.0.0/1"<br># demo.wireguard.io<br>demo=3D"163.172.161.0/32"<br>common_r=
outer=3D"192.168.1.1"<br><br>And test files:<br>: server.conf<br># 192.168.=
177.1/24<br># Since you need to set ip address manually with ip or ifconfig=
 we use workaround and read ip/netmask from first line of every config file=
<br>[Interface]<br>&nbsp;&nbsp;&nbsp; # You can generate own public and pri=
vate keys with: wg genkey | tee privatekey | wg pubkey &gt; publickey<br>&n=
bsp;&nbsp;&nbsp; # Its strongly recomended for you to generate own keys!<br=
>&nbsp;&nbsp;&nbsp; PrivateKey =3D qFstR3l2HG5WQJ0qoQG0G87c039kXR5zN7vV+bUK=
b0Q=3D<br>&nbsp;&nbsp;&nbsp; ListenPort =3D 41414<br><br>[Peer]<br>&nbsp;&n=
bsp;&nbsp; PublicKey =3D 40UuwEq4H1gaY1rpmwuW0hUyOnGvXuoQIMctOyOrEAs=3D<br>=
&nbsp;&nbsp;&nbsp; # Outside world access blocked in example setup<br>&nbsp=
;&nbsp;&nbsp; AllowedIPs =3D 127.0.0.1/32<br>&nbsp;&nbsp;&nbsp; #AllowedIPs=
 =3D 0.0.0.0/0<br>:client.conf<br># 192.168.4.5/24<br># Since you need to s=
et ip address manually with ip or ifconfig we use workaround and read ip/ne=
tmask from first line of every config file<br>[Interface]<br>&nbsp;&nbsp;&n=
bsp; # You can generate own public and private keys with: wg genkey | tee p=
rivatekey | wg pubkey &gt; publickey<br>&nbsp;&nbsp;&nbsp; PrivateKey =3D W=
EAuaVuhdyscyTCXVfBDJR6nf9zxD75jmJzrfhkyE3Y=3D<br><br>[Peer]<br>&nbsp;&nbsp;=
&nbsp; PublicKey =3D Uha1fHzOY6hPhq54fcrElVdNF/XQDzQ90rDT7+IqIgA=3D<br>&nbs=
p;&nbsp;&nbsp; Endpoint =3D demo.wireguard.io:12912<br>&nbsp;&nbsp;&nbsp; A=
llowedIPs =3D 0.0.0.0/0<br>&nbsp;&nbsp;&nbsp; PersistentKeepalive =3D 25<br=
><br>After some talking with  <span title=3D"Egbert Verhage <egbert@eggieco=
de.org>">Egbert, I think to move routing to separate unit, but still read r=
outing configuration from conf files. I just like ovpn way, when for user i=
s just enough to copy single configuration file.<br>If ip/netmask and routi=
ng will be done with wgconf, and will be located inside single config file,=
 this will be huge success for all users.<br></span><br></div></body></html=
>
------=_Part_12110_813111491.1481202557136--
