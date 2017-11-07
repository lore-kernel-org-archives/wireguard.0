Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acd50ba2
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 13:26:39 +0000 (UTC)
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
 [209.85.220.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 769d8a7c
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 13:26:39 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id y23so15157996qkb.10
 for <wireguard@lists.zx2c4.com>; Tue, 07 Nov 2017 05:29:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALJ2VGZzPmYvVDethJkeYzGq38g1Y4Nj6=QyscWcXVY+xnWXow@mail.gmail.com>
References: <CAC4KqtwH_XAXeXHSf9Kxs5t80Qag9GrMwp6SaPnO9bj=GVL-7w@mail.gmail.com>
 <CALJ2VGZzPmYvVDethJkeYzGq38g1Y4Nj6=QyscWcXVY+xnWXow@mail.gmail.com>
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Tue, 7 Nov 2017 08:29:52 -0500
Message-ID: <CAM3m09T26HgZfNihNO+-QR-5bsd=m+koY=gudThW6Kii9jETgQ@mail.gmail.com>
Subject: Re: Production usage of Wireguard
To: Reuben Martin <reuben.m.work@gmail.com>
Content-Type: multipart/alternative; boundary="001a114d6dbce3ee00055d649011"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114d6dbce3ee00055d649011
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2017 at 8:27 AM, Reuben Martin <reuben.m.work@gmail.com>
wrote:

> On Nov 6, 2017 3:41 PM, "Ferris Ellis" <ferris@ferrisellis.com> wrote:
>
>> Hello Wireguard mailing list!
>>
>> I have been very interested in the WireGuard project for a little while
>> now and am in the process of evaluating it. While benchmarks and code
>> reviews are useful, they don=E2=80=99t uncover many of the issues that c=
an
>> potentially wake one up at 3am. I=E2=80=99d hunted around on the web for=
 a while
>> but wasn=E2=80=99t able to find any articles on running WireGuard in a p=
roduction
>> environment. I know the project is still young but was wondering if anyo=
ne
>> on the mailing list had started using WireGuard in production? And, if s=
o,
>> if they=E2=80=99d be willing to share some details about their use case =
and
>> experience.
>>
>
> I've been using it for about 6 months to tie together remote video
> streaming servers in a star pattern with a vxlan overlay running on top o=
f
> the wireguard connections. I mostly push low latency video over the
> connections.
>
> I've only had an issue once which was a bug resulting from some
> refactoring work, and Jason immediately pounced on it and had a fixed
> release out within a few hours. Honestly, a project with a maintainer tha=
t
> takes ownership of the code base like that imparts much more cred than an=
y
> "stable" or "production ready" label does.
>
> -Reuben
>

I'll second that.  I've never seen a developer / maintainer thats as
engaged and responsive as Jason.

...And he sends out free stickers!

--001a114d6dbce3ee00055d649011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Nov 7, 2017 at 8:27 AM, Reuben Martin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:reuben.m.work@gmail.com" target=3D"_blank">reuben.m.work@gma=
il.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"auto"><div class=3D"gmail_extra" dir=3D"auto"><div class=
=3D"gmail_quote"><span class=3D"gmail-">On Nov 6, 2017 3:41 PM, &quot;Ferri=
s Ellis&quot; &lt;<a href=3D"mailto:ferris@ferrisellis.com" target=3D"_blan=
k">ferris@ferrisellis.com</a>&gt; wrote:<br type=3D"attribution"></span><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Hello Wire=
guard mailing list!</div><div dir=3D"auto"><br></div><div dir=3D"auto">I ha=
ve been very interested in the WireGuard project for a little while now and=
 am in the process of evaluating it. While benchmarks and code reviews are =
useful, they don=E2=80=99t uncover many of the issues that can potentially =
wake one up at 3am. I=E2=80=99d hunted around on the web for a while but wa=
sn=E2=80=99t able to find any articles on running WireGuard in a production=
 environment. I know the project is still young but was wondering if anyone=
 on the mailing list had started using WireGuard in production? And, if so,=
 if they=E2=80=99d be willing to share some details about their use case an=
d experience.</div></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I&#39;ve been using it for about 6 months to tie together re=
mote video streaming servers in a star pattern with a vxlan overlay running=
 on top of the wireguard connections. I mostly push low latency video over =
the connections.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;v=
e only had an issue once which was a bug resulting from some refactoring wo=
rk, and Jason immediately pounced on it and had a fixed release out within =
a few hours. Honestly, a project with a maintainer that takes ownership of =
the code base like that imparts much more cred than any &quot;stable&quot; =
or &quot;production ready&quot; label does.</div><span class=3D"gmail-HOEnZ=
b"><font color=3D"#888888"><div dir=3D"auto"><br></div><div dir=3D"auto">-R=
euben</div></font></span></div></blockquote><div><br></div>I&#39;ll second =
that.=C2=A0 I&#39;ve never seen a developer / maintainer thats as engaged a=
nd responsive as Jason.<div><br></div><div>...And he sends out free sticker=
s!=C2=A0</div></div></div></div>

--001a114d6dbce3ee00055d649011--
