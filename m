Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91e0e86e
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 13:24:05 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
 [209.85.128.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49838bc6
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 13:24:05 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id o88so1010320wrb.6
 for <wireguard@lists.zx2c4.com>; Tue, 07 Nov 2017 05:27:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
From: Reuben Martin <reuben.m.work@gmail.com>
Date: Tue, 7 Nov 2017 07:27:17 -0600
Message-ID: <CALJ2VGZzPmYvVDethJkeYzGq38g1Y4Nj6=QyscWcXVY+xnWXow@mail.gmail.com>
Subject: Re: Production usage of Wireguard
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="f403045f50f0acbb6c055d648771"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045f50f0acbb6c055d648771
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Nov 6, 2017 3:41 PM, "Ferris Ellis" <ferris@ferrisellis.com> wrote:

> Hello Wireguard mailing list!
>
> I have been very interested in the WireGuard project for a little while
> now and am in the process of evaluating it. While benchmarks and code
> reviews are useful, they don=E2=80=99t uncover many of the issues that ca=
n
> potentially wake one up at 3am. I=E2=80=99d hunted around on the web for =
a while
> but wasn=E2=80=99t able to find any articles on running WireGuard in a pr=
oduction
> environment. I know the project is still young but was wondering if anyon=
e
> on the mailing list had started using WireGuard in production? And, if so=
,
> if they=E2=80=99d be willing to share some details about their use case a=
nd
> experience.
>

I've been using it for about 6 months to tie together remote video
streaming servers in a star pattern with a vxlan overlay running on top of
the wireguard connections. I mostly push low latency video over the
connections.

I've only had an issue once which was a bug resulting from some refactoring
work, and Jason immediately pounced on it and had a fixed release out
within a few hours. Honestly, a project with a maintainer that takes
ownership of the code base like that imparts much more cred than any
"stable" or "production ready" label does.

-Reuben

--f403045f50f0acbb6c055d648771
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_extra" dir=3D"auto"><div class=3D"gma=
il_quote">On Nov 6, 2017 3:41 PM, &quot;Ferris Ellis&quot; &lt;<a href=3D"m=
ailto:ferris@ferrisellis.com" target=3D"_blank">ferris@ferrisellis.com</a>&=
gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"auto">Hello Wireguard mailing list!</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I have been very interested in the WireGuard project for a =
little while now and am in the process of evaluating it. While benchmarks a=
nd code reviews are useful, they don=E2=80=99t uncover many of the issues t=
hat can potentially wake one up at 3am. I=E2=80=99d hunted around on the we=
b for a while but wasn=E2=80=99t able to find any articles on running WireG=
uard in a production environment. I know the project is still young but was=
 wondering if anyone on the mailing list had started using WireGuard in pro=
duction? And, if so, if they=E2=80=99d be willing to share some details abo=
ut their use case and experience.</div></blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">I&#39;ve been using it for about 6 month=
s to tie together remote video streaming servers in a star pattern with a v=
xlan overlay running on top of the wireguard connections. I mostly push low=
 latency video over the connections.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">I&#39;ve only had an issue once which was a bug resulting from=
 some refactoring work, and Jason immediately pounced on it and had a fixed=
 release out within a few hours. Honestly, a project with a maintainer that=
 takes ownership of the code base like that imparts much more cred than any=
 &quot;stable&quot; or &quot;production ready&quot; label does.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">-Reuben</div><div class=3D"gmail_ex=
tra" dir=3D"auto"></div>
</div>

--f403045f50f0acbb6c055d648771--
