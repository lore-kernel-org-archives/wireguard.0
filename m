Return-Path: mrgranthaywood@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95dfcbd5
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 00:27:06 +0000 (UTC)
Received: from mail-yb0-x22d.google.com (mail-yb0-x22d.google.com
 [IPv6:2607:f8b0:4002:c09::22d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7b7192d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 00:27:06 +0000 (UTC)
Received: by mail-yb0-x22d.google.com with SMTP id x128-v6so1921019ybg.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Jun 2018 17:32:03 -0700 (PDT)
MIME-Version: 1.0
From: Grant Haywood <mrgranthaywood@gmail.com>
Date: Thu, 21 Jun 2018 17:31:51 -0700
Message-ID: <CAPayrd5VfXza42ef1kVj+G54DmRswczVYAdnjXn9r34eAk4nNA@mail.gmail.com>
Subject: connection errors in container while wireguard is up
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000288ccd056f302916"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000288ccd056f302916
Content-Type: text/plain; charset="UTF-8"

when running wireguard on a docker build host with a wg peer configured as
the default gateway ( AllowedIPs =  0.0.0.0/0 )
some (not all) networking connections during a docker build fail. this
occurs with pip installs and curl in some cases
an example curl error inside the container is:
OpenSSL SSL_connect: SSL_ERROR_SYSCALL in connection to
repo.saltstack.com:443

I believe this only happens with some specific hosts
for example, I can curl http and https for google.com, but not
repo.saltstack.com from inside the container

wget also fails, for both http and https , and gives the following output
inside the container:
wget http://repo.saltstack.com
--2018-06-22 00:24:26--  http://repo.saltstack.com/
Resolving repo.saltstack.com (repo.saltstack.com)... 138.197.226.47,
2604:a880:400:d0::2:e001
Connecting to repo.saltstack.com (repo.saltstack.com)|138.197.226.47|:80...
connected.
HTTP request sent, awaiting response...

 wget https://repo.saltstack.com
--2018-06-22 00:24:39--  https://repo.saltstack.com/
Resolving repo.saltstack.com (repo.saltstack.com)... 138.197.226.47,
2604:a880:400:d0::2:e001
Connecting to repo.saltstack.com (repo.saltstack.com)|138.197.226.47|:443...
connected.

(Notice no "HTTP request sent" on the https request)

these same requests succeed on the same host when not run in the container.
these same requests succeed in the same container on the same host when
wireguard is down

does anyone have a suggestion for further debugging I could do to
understand whats happening?

--000000000000288ccd056f302916
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">when running wireguard on a docker build host with a wg pe=
er configured as the default gateway ( AllowedIPs =3D=C2=A0 <a href=3D"http=
://0.0.0.0/0">0.0.0.0/0</a>=C2=A0)<div><div>some (not all) networking conne=
ctions during a docker build fail. this occurs with pip installs and curl i=
n some cases</div><div>an example curl error inside the container is:<br>Op=
enSSL SSL_connect: SSL_ERROR_SYSCALL in connection to=C2=A0=C2=A0<a href=3D=
"http://repo.saltstack.com:443">repo.saltstack.com:443</a><br></div></div><=
div><br></div><div>I believe this only happens with some specific hosts</di=
v><div>for example, I can curl http and https for <a href=3D"http://google.=
com">google.com</a>, but not <a href=3D"http://repo.saltstack.com">repo.sal=
tstack.com</a> from inside the container</div><div><br></div><div>wget also=
 fails, for both http and https , and gives the following output inside the=
 container:</div><div><div>wget <a href=3D"http://repo.saltstack.com">http:=
//repo.saltstack.com</a></div><div>--2018-06-22 00:24:26--=C2=A0 <a href=3D=
"http://repo.saltstack.com/">http://repo.saltstack.com/</a></div><div>Resol=
ving <a href=3D"http://repo.saltstack.com">repo.saltstack.com</a> (<a href=
=3D"http://repo.saltstack.com">repo.saltstack.com</a>)... 138.197.226.47, 2=
604:a880:400:d0::2:e001</div><div>Connecting to <a href=3D"http://repo.salt=
stack.com">repo.saltstack.com</a> (<a href=3D"http://repo.saltstack.com">re=
po.saltstack.com</a>)|138.197.226.47|:80... connected.</div><div>HTTP reque=
st sent, awaiting response...<br><br></div></div><div><div>=C2=A0wget <a hr=
ef=3D"https://repo.saltstack.com">https://repo.saltstack.com</a></div><div>=
--2018-06-22 00:24:39--=C2=A0 <a href=3D"https://repo.saltstack.com/">https=
://repo.saltstack.com/</a></div><div>Resolving <a href=3D"http://repo.salts=
tack.com">repo.saltstack.com</a> (<a href=3D"http://repo.saltstack.com">rep=
o.saltstack.com</a>)... 138.197.226.47, 2604:a880:400:d0::2:e001</div><div>=
Connecting to <a href=3D"http://repo.saltstack.com">repo.saltstack.com</a> =
(<a href=3D"http://repo.saltstack.com">repo.saltstack.com</a>)|138.197.226.=
47|:443... connected.</div></div><div><br></div><div>(Notice no &quot;HTTP =
request sent&quot; on the https request)<br><br>these same requests succeed=
 on the same host when not run in the container.=C2=A0<br>these same reques=
ts succeed in the same container on the same host when wireguard is down</d=
iv><div><br></div><div>does anyone have a suggestion for further debugging =
I could do to understand whats happening?</div><div><br></div></div>

--000000000000288ccd056f302916--
