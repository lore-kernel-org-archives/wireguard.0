Return-Path: gzxmx94@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fe4852b
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jan 2018 13:19:39 +0000 (UTC)
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id def74d42
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Jan 2018 13:19:38 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r78so25925660wme.0
 for <wireguard@lists.zx2c4.com>; Sat, 27 Jan 2018 05:24:14 -0800 (PST)
MIME-Version: 1.0
Sender: gzxmx94@gmail.com
In-Reply-To: <CAMEMCs+3EJXzOdtU7r1WN9uvzoR91TpLD__JYqY8uGM0Mx7pAw@mail.gmail.com>
References: <CAMEMCsKxKHtn2ARFchYVTrj2r_ArHQ4DeqaaSYUh96ZKrVk3GA@mail.gmail.com>
 <CAHmME9oZ=4fEB+CTPPXLz=b=HZCOkVy02dVfVh4=Ri=bH80UjQ@mail.gmail.com>
 <CAMEMCs+3EJXzOdtU7r1WN9uvzoR91TpLD__JYqY8uGM0Mx7pAw@mail.gmail.com>
From: =?UTF-8?Q?Rafa=C5=82_Grasman?= <grasmanek94@gmail.com>
Date: Sat, 27 Jan 2018 14:24:13 +0100
Message-ID: <CAMEMCsJ3Rc7SY5c+BQv5xcs9hkM=uKEaL4e2HRD4KXJ19ZyASA@mail.gmail.com>
Subject: Fwd: Bridging wg and normal interfaces?
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c1a1a00d4db170563c1ed17"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1a1a00d4db170563c1ed17
Content-Type: text/plain; charset="UTF-8"

Ah alright thanks for the info, I finally figured out everything by myself
though I still have one small problem.

For reference, here's everything I have done:

<begin>

Isolated VM's DHCP: 172.16.1.0/16

Switch wg0: 172.16.0.2/30
Switch ens3: 172.16.1.1/16
Switch ens2: 192.168.2.xx/24 gw 192.168.2.254/24

Router wg0: 172.16.0.1/30
Router eth0: 35.224.54.65/32

# both machines
echo "deb http://deb.debian.org/debian/ unstable main" >
/etc/apt/sources.list.d/unstable-wireguard.list
printf 'Package: *\nPin: release a=unstable\nPin-Priority: 150\n' >
/etc/apt/preferences.d/limit-unstable
apt update
apt-get install -y linux-headers-$(uname -r) wireguard

# both machines /etc/sysctl.conf
net.ipv4.ip_forward=1
net.ipv4.conf.all.proxy_arp = 1

# post up (ens3 of switch) and (eth0 of router) run (wg-quick up wg0)

####isc-dhcp-server (on switch ens3):
option domain-name "pcr";
option domain-name-servers 8.8.8.8, 8.8.4.4;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style none;

authoritative;

subnet 172.16.0.0 netmask 255.255.0.0 {
  range 172.16.1.2 172.16.255.253;
  option routers 172.16.0.1;
}

############### lan vm /etc/wireguard/wg0.conf
[Interface]
PrivateKey = *************
ListenPort = 12345
Address = 172.16.0.2/30
PostUp = ip route add 172.16.0.1/32 via 172.16.0.2 dev wg0 ; route del
default gw 192.168.2.254 ; ip route add 192.168.2.254 dev ens2 ; route add
default gw 172.16.0.1 dev wg0 ; ip route add 35.224.54.65 via 192.168.2.254
; iptables -A FORWARD -i ens3 -o wg0 -j ACCEPT ; iptables -A FORWARD -i wg0
-o ens3 -j ACCEPT

[Peer]
PublicKey = *************
Endpoint = 35.224.54.65:12345
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 1


############### google vm /etc/wireguard/wg0.conf
[Interface]
PrivateKey = *************
ListenPort = 12345
Address = 172.16.0.1/30
PostUp = ip route add 172.16.0.2/32 via 172.16.0.1 dev wg0 ; ip route add
172.16.0.0/16 via 172.16.0.2 dev wg0 ; iptables -A INPUT -i eth0 -p tcp -m
tcp --dport 22 -j ACCEPT ; iptables -t nat -A POSTROUTING -o eth0 -j
MASQUERADE ; iptables -A FORWARD -i wg0 -j ACCEPT

[Peer]
PublicKey = *************
AllowedIPs = 0.0.0.0/0

<end>

Now the problem I face: whenever I run 'wg-quick up wg0' on a Google Cloud
Engine VM, I can't SSH to it anymore from the WAN side, but the weird thing
is, from the 'switch' I can ping the router just fine, they have a
connection, I can even SSH (sometimes not).

Now what's weird is, when I do all configuration steps with commands (ip ..
wg set .. blabla), and make it with those commands just like the config,
everything works fine. so I have a script that just does the commands.. but
wg-quick should work, everything is the same. Yet this happens.. anything I
can do to debug this behaviour?

On 25 January 2018 at 12:08, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> WireGuard is layer 3, not layer 2, so bridging is not what you want.
>
> Instead, do ordinary IP routing between different subnets. As you
> appear to already have different subnets, this shouldn't be a problem.
>
> If you'd like to overlap within the same subnet, there's always proxy
> arp, but I'd caution against that approach.
>
> Lots of people run into this confusion about layer 2 vs layer 3. We
> can probably walk you through getting things rolling for your
> particular setup in #wireguard on Freenode, if you have IRC.
>
> Jason
>

--94eb2c1a1a00d4db170563c1ed17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">Ah alright tha=
nks for the info, I finally figured out everything by myself though I still=
 have one small problem.<div><br></div><div>For reference, here&#39;s every=
thing I have done:</div><div><br></div><div>&lt;begin&gt;</div><div><br></d=
iv><div><div>Isolated VM&#39;s DHCP: <a href=3D"http://172.16.1.0/16" targe=
t=3D"_blank">172.16.1.0/16</a></div><div><br></div><div>Switch wg0: <a href=
=3D"http://172.16.0.2/30" target=3D"_blank">172.16.0.2/30</a></div><div>Swi=
tch ens3: <a href=3D"http://172.16.1.1/16" target=3D"_blank">172.16.1.1/16<=
/a></div><div>Switch ens2: 192.168.2.xx/24 gw <a href=3D"http://192.168.2.2=
54/24" target=3D"_blank">192.168.2.254/24</a></div><div><br></div><div>Rout=
er wg0: <a href=3D"http://172.16.0.1/30" target=3D"_blank">172.16.0.1/30</a=
></div><div>Router eth0: <a href=3D"http://35.224.54.65/32" target=3D"_blan=
k">35.224.54.65/32</a></div><div><br></div><div># both machines</div><div>e=
cho &quot;deb <a href=3D"http://deb.debian.org/debian/" target=3D"_blank">h=
ttp://deb.debian.org/debian/</a> unstable main&quot; &gt; /etc/apt/sources.=
list.d/<wbr>unstable-wireguard.list</div><div>printf &#39;Package: *\nPin: =
release a=3Dunstable\nPin-Priority: 150\n&#39; &gt; /etc/apt/preferences.d/=
limit-<wbr>unstable</div><div>apt update</div><div>apt-get install -y linux=
-headers-$(uname -r) wireguard</div><div><br></div><div># both machines /et=
c/sysctl.conf</div><div>net.ipv4.ip_forward=3D1</div><div>net.ipv4.conf.all=
.proxy_arp =3D 1</div><div><br></div><div># post up (ens3 of switch) and (e=
th0 of router) run (wg-quick up wg0)</div><div><br></div><div>####isc-dhcp-=
server (on switch ens3):</div><div>option domain-name &quot;pcr&quot;;</div=
><div>option domain-name-servers 8.8.8.8, 8.8.4.4;</div><div><br></div><div=
>default-lease-time 600;</div><div>max-lease-time 7200;</div><div><br></div=
><div>ddns-update-style none;</div><div><br></div><div>authoritative;</div>=
<div><br></div><div>subnet 172.16.0.0 netmask 255.255.0.0 {</div><div>=C2=
=A0 range 172.16.1.2 172.16.255.253;</div><div>=C2=A0 option routers 172.16=
.0.1;</div><div>}</div><div><br></div><div>############### lan vm /etc/wire=
guard/wg0.conf</div><div>[Interface]</div><div>PrivateKey =3D *************=
</div><div>ListenPort =3D 12345</div><div>Address =3D <a href=3D"http://172=
.16.0.2/30" target=3D"_blank">172.16.0.2/30</a></div><div>PostUp =3D ip rou=
te add <a href=3D"http://172.16.0.1/32" target=3D"_blank">172.16.0.1/32</a>=
 via 172.16.0.2 dev wg0 ; route del default gw 192.168.2.254 ; ip route add=
 192.168.2.254 dev ens2 ; route add default gw 172.16.0.1 dev wg0 ; ip rout=
e add 35.224.54.65 via 192.168.2.254 ; iptables -A FORWARD -i ens3 -o wg0 -=
j ACCEPT ; iptables -A FORWARD -i wg0 -o ens3 -j ACCEPT</div><div><br></div=
><div>[Peer]</div><div>PublicKey =3D *************</div><div>Endpoint =3D <=
a href=3D"http://35.224.54.65:12345" target=3D"_blank">35.224.54.65:12345</=
a></div><div>AllowedIPs =3D <a href=3D"http://0.0.0.0/0" target=3D"_blank">=
0.0.0.0/0</a></div><div>PersistentKeepalive =3D 1</div><div><br></div><div>=
<br></div><div>############### google vm /etc/wireguard/wg0.conf</div><div>=
[Interface]</div><div>PrivateKey =3D *************</div><div>ListenPort =3D=
 12345</div><div>Address =3D <a href=3D"http://172.16.0.1/30" target=3D"_bl=
ank">172.16.0.1/30</a></div><div>PostUp =3D ip route add <a href=3D"http://=
172.16.0.2/32" target=3D"_blank">172.16.0.2/32</a> via 172.16.0.1 dev wg0 ;=
 ip route add <a href=3D"http://172.16.0.0/16" target=3D"_blank">172.16.0.0=
/16</a> via 172.16.0.2 dev wg0 ; iptables -A INPUT -i eth0 -p tcp -m tcp --=
dport 22 -j ACCEPT ; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE ;=
 iptables -A FORWARD -i wg0 -j ACCEPT</div><div><br></div><div>[Peer]</div>=
<div>PublicKey =3D *************</div><div>AllowedIPs =3D <a href=3D"http:/=
/0.0.0.0/0" target=3D"_blank">0.0.0.0/0</a></div></div><div><br></div><div>=
&lt;end&gt;</div><div><br></div><div>Now the problem I face: whenever I run=
 &#39;wg-quick up wg0&#39; on a Google Cloud Engine VM, I can&#39;t SSH to =
it anymore from the WAN side, but the weird thing is, from the &#39;switch&=
#39; I can ping the router just fine, they have a connection, I can even SS=
H (sometimes not).</div><div><br></div><div>Now what&#39;s weird is, when I=
 do all configuration steps with commands (ip .. wg set .. blabla), and mak=
e it with those commands just like the config, everything works fine. so I =
have a script that just does the commands.. but wg-quick should work, every=
thing is the same. Yet this happens.. anything I can do to debug this behav=
iour?</div></div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On 25 January 2018 at 12:08, Jason =
A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" targe=
t=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">WireGuard is layer 3, not layer 2, so bridging is not what you wa=
nt.<br>
<br>
Instead, do ordinary IP routing between different subnets. As you<br>
appear to already have different subnets, this shouldn&#39;t be a problem.<=
br>
<br>
If you&#39;d like to overlap within the same subnet, there&#39;s always pro=
xy<br>
arp, but I&#39;d caution against that approach.<br>
<br>
Lots of people run into this confusion about layer 2 vs layer 3. We<br>
can probably walk you through getting things rolling for your<br>
particular setup in #wireguard on Freenode, if you have IRC.<br>
<span class=3D"m_3536533898149672631HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span></blockquote></div><br></div>
</div></div></div><br></div>

--94eb2c1a1a00d4db170563c1ed17--
