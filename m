Return-Path: henningreich@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20c45acd
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 08:58:27 +0000 (UTC)
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
 [209.85.223.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3eb37c2
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 08:58:27 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id m11so1237475iob.2
 for <wireguard@lists.zx2c4.com>; Wed, 07 Feb 2018 01:04:24 -0800 (PST)
MIME-Version: 1.0
Sender: henningreich@gmail.com
From: Henning Reich <henning.reich@gmail.com>
Date: Wed, 7 Feb 2018 10:03:43 +0100
Message-ID: <CAOAVeL3iu+xrhSLdNcLkR7X0nLQz8Uyb+dGAeecFtv3ArL=7Pw@mail.gmail.com>
Subject: wg-quick systemd service does not work directly after boot
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a113fe188db9e7505649b9410"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113fe188db9e7505649b9410
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm not sure if this a problem of wg/wg-quick or my system but maybe
somebody can help.

I have a wg0.conf for wg-quick and enabled the systemd service (systemctl
enable wg-quick@wg0).
After a reboot, I have the following status of this service:
--
Feb 07 08:15:13 domain.de systemd[1]: Starting WireGuard via wg-quick(8)
for wg0...
Feb 07 08:15:14 domain.de wg-quick[335]: [#] ip link add wg0 type wireguard
Feb 07 08:15:14 domain.de wg-quick[335]: [#] wg setconf wg0 /dev/fd/63
Feb 07 08:15:14 domain.de wg-quick[335]: Name or service not known: `
remote.de:25555'
Feb 07 08:15:14 domain.de wg-quick[335]: Configuration parsing error
Feb 07 08:15:14 domain.de wg-quick[335]: [#] ip link delete dev wg0
Feb 07 08:15:14 domain.de systemd[1]: wg-quick@wg0.service: Main process
exited, code=exited, status=1/FAILURE
Feb 07 08:15:14 domain.de systemd[1]: wg-quick@wg0.service: Failed with
result 'exit-code'.
Feb 07 08:15:14 domain.de systemd[1]: Failed to start WireGuard via
wg-quick(8) for wg0.

It looks for me like wireguard can't resolve my remote site at this moment.
I tried a static resolv.conf file and also systemd-resolved. Both sites
have dynamic IPs so I can't use direct IPs.
If I run "systemctl restart wg-quick@wg0" it works as expected, so my
workaround is to add a 'sleep 5' to the service file.

Any better solutions or is this a "bug"?

Merci

--001a113fe188db9e7505649b9410
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I&#39;m not sure if this a problem =
of wg/wg-quick or my system but maybe somebody can help.</div><div><br></di=
v><div>I have a wg0.conf for wg-quick and enabled the systemd service (syst=
emctl enable wg-quick@wg0).</div><div>After a reboot, I have the following =
status of this service:</div><div>--</div><div><div>Feb 07 08:15:13 <span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial;float:no=
ne;display:inline">domain</span>.de systemd[1]: Starting WireGuard via wg-q=
uick(8) for wg0...</div><div>Feb 07 08:15:14 <span style=3D"color:rgb(34,34=
,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-=
style:initial;text-decoration-color:initial;float:none;display:inline">doma=
in</span>.de wg-quick[335]: [#] ip link add wg0 type wireguard</div><div>Fe=
b 07 08:15:14 <span style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:small;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">domain</span>.de wg-quick[335]: [#]=
 wg setconf wg0 /dev/fd/63</div><div>Feb 07 08:15:14 <span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">domain</span>.de wg-quick[335]: Name or service not known: `<a href=3D"=
http://remote.de:25555">remote.de:25555</a>&#39;</div><div>Feb 07 08:15:14 =
<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">domain</span>.de wg-quick[335]: Configuration par=
sing error</div><div>Feb 07 08:15:14 <a href=3D"http://domain.de">domain.de=
</a> wg-quick[335]: [#] ip link delete dev wg0</div><div>Feb 07 08:15:14 <a=
 href=3D"http://domain.de">domain.de</a> systemd[1]: wg-quick@wg0.service: =
Main process exited, code=3Dexited, status=3D1/FAILURE</div><div>Feb 07 08:=
15:14 <span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:small;font-style:normal;font-variant-ligatures:normal;font-variant-cap=
s:normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px;background-col=
or:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:ini=
tial;float:none;display:inline">domain</span>.de systemd[1]: wg-quick@wg0.s=
ervice: Failed with result &#39;exit-code&#39;.</div><div>Feb 07 08:15:14 <=
a href=3D"http://domain.de">domain.de</a> systemd[1]: Failed to start WireG=
uard via wg-quick(8) for wg0.</div></div><div><br></div><div>It looks for m=
e like wireguard can&#39;t resolve my remote site at this moment. I tried a=
 static resolv.conf file and also systemd-resolved. Both sites have dynamic=
 IPs so I can&#39;t use direct IPs.</div><div>If I run &quot;systemctl rest=
art wg-quick@wg0&quot; it works as expected, so my workaround is to add a &=
#39;sleep 5&#39; to the service file.=C2=A0</div><div><br></div><div>Any be=
tter solutions or is this a &quot;bug&quot;?=C2=A0</div><div><br></div><div=
>Merci</div><div><br></div><div><br></div></div>

--001a113fe188db9e7505649b9410--
