Return-Path: j0eblack@teknik.io
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4df2715c
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2017 10:53:30 +0000 (UTC)
Received: from mail.teknik.io (mail.teknik.io [50.247.95.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d48c80c
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Jan 2017 10:53:30 +0000 (UTC)
Mime-Version: 1.0
Date: Fri, 27 Jan 2017 11:05:21 +0000
Content-Type: multipart/alternative;
 boundary="--=_RainLoop_734_543737792.1485515121"
Message-ID: <91e1990891fb763b8090a2eed1321744@mail.teknik.io>
From: j0eblack@teknik.io
Subject: WIreGuard on embedded devices and traffic shaping question.
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


----=_RainLoop_734_543737792.1485515121
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Greetings people and robots,=0A=0AI'm sending this email with a positive =
feed-back of my experience with WireGuard and the embedded device that I =
used with it, also I want to thank the WireGruard dev team for the awesom=
e free software!=0A=0AWireGuard is running on a Olimex Lime A-10 board wi=
th Debian Jessie on it:=0A=0Alsb_release -a=0ANo LSB modules are availabl=
e.=0ADistributor ID: Debian=0ADescription: Debian GNU/Linux 8.6 (jessie)=
=0ARelease: 8.6=0ACodename: jessie=0A=0Auname -a=0ALinux lime-a10 4.8.4-s=
unxi #6 SMP Sun Oct 23 15:55:47 CEST 2016 armv7l GNU/Linux=0A=0AThe WireG=
uard packages were installed from the sid repo, everything went smoothly =
without any manual intervention for the setup.=0A=0AMy initial idea was t=
o use WireGuard as a open-vpn-type server-client setup.=0A=0AAfter readin=
g some of the mails from this list I was able to get two peers to talk to=
 each other and after that is was a matter of iptables rules to get one o=
f the peers to act as a 'exit server' and the other connected peers to it=
 as 'clients'.=0A=0AIf anyone is interested in this set-up I can write a =
short guide how you can achieve that and other people can point if any mi=
stakes were made during the setup.=0A=0ASomething that I want to do, and =
I was not able to find information about it in the mailing list or the do=
cs on the website is, can bandwidth (traffic shaping) limits be applied b=
etween connected peers?=0A=0AI have done this in the past with open-vpn a=
nd tc (per IP address shaping) and I am really curious if this can be don=
e inside WireGuard or not?=0A=0AWith regards,=0Aj0eblack

----=_RainLoop_734_543737792.1485515121
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><meta http-equiv=3D"Content-Type" content=3D"t=
ext/html; charset=3Dutf-8" /></head><body><html><body><div><div data-html=
-editor-font-wrapper=3D"true" style=3D"font-family: arial, sans-serif; fo=
nt-size: 13px;"> <signature></signature>Greetings people and robots,<br><=
br>I'm sending this email with a positive feed-back of my experience with=
 WireGuard and the embedded device that I used with it, also I want to th=
ank the WireGruard dev team for the awesome free software!<br><br>WireGua=
rd is running on a Olimex Lime A-10 board with Debian Jessie on it:<br><b=
r>lsb_release -a<br>No LSB modules are available.<br>Distributor ID: Debi=
an<br>Description: Debian GNU/Linux 8.6 (jessie)<br>Release: 8.6<br>Coden=
ame: jessie<br><br>uname -a<br>Linux lime-a10 4.8.4-sunxi #6 SMP Sun Oct =
23 15:55:47 CEST 2016 armv7l GNU/Linux<br><br>The WireGuard packages were=
 installed from the sid repo, everything went smoothly without any manual=
 intervention for the setup.<br><br>My initial idea was to use WireGuard =
as a open-vpn-type server-client setup.<br><br>After reading some of the =
mails from this list I was able to get two peers to talk to each other an=
d after that is was a matter of iptables rules to get one of the peers to=
 act as a 'exit server' and the other connected peers to it as 'clients'.=
<br><br>If anyone is interested in this set-up I can write a short guide =
how you can achieve that and other people can point if any mistakes were =
made during the setup.<br><br>Something that I want to do, and I was not =
able to find information about it in the mailing list or the docs on the =
website is, can bandwidth (traffic shaping) limits be applied between con=
nected peers?<br><br>I have done this in the past with open-vpn and tc (p=
er IP address shaping) and I am really curious if this can be done inside=
 WireGuard or not?<br><br>With regards,<br>j0eblack</div></div></body></h=
tml></body></html>

----=_RainLoop_734_543737792.1485515121--
