Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0465443
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 10:45:49 +0000 (UTC)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
 [209.85.128.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63fc1695
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Jun 2017 10:45:49 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id k67so142147916wrc.2
 for <wireguard@lists.zx2c4.com>; Mon, 26 Jun 2017 04:02:11 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
From: Tiago Condeixa <tcondeixa@veniamworks.com>
Message-Id: <805AA098-0286-4FF1-B977-2A1744595B52@veniamworks.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_FF16E53D-557D-4293-8DEA-C923DD41D8FA"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: openwrt reboot with high load using wireguard
Date: Mon, 26 Jun 2017 12:02:08 +0100
In-Reply-To: <CAHmME9qXR6_RByz5Uc8NhPUMwKU20tm=J5vZJsBYQEenEeQkVg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <7F8F2DEF-6394-4169-8232-75781A45CA7D@veniamworks.com>
 <CAHmME9qXR6_RByz5Uc8NhPUMwKU20tm=J5vZJsBYQEenEeQkVg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_FF16E53D-557D-4293-8DEA-C923DD41D8FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Jason,

I was using Wireguard version 20170517, but now I tried with wireguard =
from master branch (2f12227690cf9a979a9a148109c96ab4f6ee6c0e) to check =
results after IP address source issue correction and the reboot problem =
goes away.=20
If for some reason I detect some storage behaviour latter I will let you =
know, but right now it=E2=80=99s really good.


Thanks,
Tiago

> On 23 Jun 2017, at 22:05, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hi Tiago,
>=20
> That's odd. What's the memory like on the system? Are you able to
> capture a debug log via pstore or serial?
>=20
> Thanks,
> Jason


--Apple-Mail=_FF16E53D-557D-4293-8DEA-C923DD41D8FA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D"">Hi Jason,<div class=3D""><br class=3D""></div><div class=3D"">I=
 was using Wireguard version&nbsp;20170517, but now I tried with =
wireguard from master branch (<span style=3D"color: rgb(68, 77, 86); =
font-family: SFMono-Regular, Consolas, 'Liberation Mono', Menlo, =
Courier, monospace; orphans: 2; widows: 2; background-color: rgb(255, =
255, 255);" =
class=3D"">2f12227690cf9a979a9a148109c96ab4f6ee6c0e</span>)&nbsp;to =
check results after IP address source issue correction and the reboot =
problem goes away.&nbsp;</div><div class=3D"">If for some reason I =
detect some storage behaviour latter I will let you know, but right now =
it=E2=80=99s really good.</div><div class=3D""><br class=3D""></div><div =
class=3D""><br class=3D""></div><div class=3D"">Thanks,</div><div =
class=3D"">Tiago</div><div class=3D""><br class=3D""><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On 23 Jun 2017, at 22:05, Jason =
A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" =
class=3D"">Jason@zx2c4.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi =
Tiago,<br class=3D""><br class=3D"">That's odd. What's the memory like =
on the system? Are you able to<br class=3D"">capture a debug log via =
pstore or serial?<br class=3D""><br class=3D"">Thanks,<br =
class=3D"">Jason<br class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_FF16E53D-557D-4293-8DEA-C923DD41D8FA--
