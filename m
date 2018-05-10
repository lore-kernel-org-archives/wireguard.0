Return-Path: henry.snow@nielsen.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2c66032
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:32:34 +0000 (UTC)
Received: from mail-pl0-x22f.google.com (mail-pl0-x22f.google.com
 [IPv6:2607:f8b0:400e:c01::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf7afa16
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 17:32:34 +0000 (UTC)
Received: by mail-pl0-x22f.google.com with SMTP id e6-v6so1689381plt.11
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 10:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
 <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
 <CAHmME9pRTWCEzhuFAbDBtWPAxk0hB7AobZWa8bDHC3EuPbN95A@mail.gmail.com>
In-Reply-To: <CAHmME9pRTWCEzhuFAbDBtWPAxk0hB7AobZWa8bDHC3EuPbN95A@mail.gmail.com>
From: Henry Snow <henry.snow@nielsen.com>
Date: Thu, 10 May 2018 17:35:08 +0000
Message-ID: <CAFuSFDEREZibd5Vb-J1GreLK9ZV+y2wGOc5MuaHvHx4XdbwDkw@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="00000000000071225c056bdd71fd"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000071225c056bdd71fd
Content-Type: text/plain; charset="UTF-8"

Was able to pull a little more this time. This help?

 datasource:      [   29.570013] ------------[ cut here ]------------
[   29.575937] kernel BUG at mm/slub.c:3601!
[   29.580741] invalid opcode: 0000 [#1] SMP
[   29.585663] Modules linked in: wireguard(OE) veth vxlan ip6_udp_tunnel
udp_tunnel bridge sd
[   29.689129] CPU: 1 PID: 223 Comm: kworker/1:1 Tainted: G           OE
------------   3.101
[   29.700019] Hardware name: Dell Inc. PowerEdge R640/0W23H8, BIOS 1.3.7
02/08/2018
[   29.708399] Workqueue: wg-crypt-wg0 packet_rx_worker [wireguard]
[   29.715340] task: ffff920e8b608000 ti: ffff920e8b610000 task.ti:
ffff920e8b610000
[   29.723722] RIP: 0010:[<ffffffff8b1f6c1c>]  [<ffffffff8b1f6c1c>]
kfree+0x13c/0x140
[   29.732222] RSP: 0018:ffff920e8b613ce8  EFLAGS: 00010246
[   29.738429] RAX: 006fffff00000000 RBX: ffff920e76fbf000 RCX:
00000000fffbdd13
[   29.746466] RDX: 006fffff00000000 RSI: 0000000000000206 RDI:
ffff920e76fbf000
[   29.754489] RBP: ffff920e8b613d00 R08: 0000000000000001 R09:
b7c55a3205f72200
[   29.762508] R10: 0000000000000000 R11: ffffeddddfdbefc0 R12:
ffff920e76fbf6c0
[   29.770525] R13: ffffffff8b5d60c5 R14: ffff920e80220000 R15:
ffff920e7e7e2500
[   29.778535] FS:  0000000000000000(0000) GS:ffff920e8be00000(0000)
knlGS:0000000000000000
[   29.787497] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   29.794125] CR2: 00007ffe415adee0 CR3: 0000000c0e1ea000 CR4:
00000000007607e0
[   29.802143] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
0000000000000000
[   29.810161] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7:
0000000000000400
[   29.818152] PKRU: 00000000
[   29.821713] Call Trace:
[   29.825002]  [<ffffffff8b5d60c5>] skb_release_data+0xf5/0x140
[   29.831595]  [<ffffffff8b5d6134>] skb_release_all+0x24/0x30
[   29.838008]  [<ffffffff8b5d659c>] consume_skb+0x2c/0x90
[   29.844073]  [<ffffffffc088df35>] packet_rx_worker+0x2d5/0x7f0
[wireguard]
[   29.851802]  [<ffffffff8b71291c>] ? __schedule+0x41c/0xa20
[   29.858139]  [<ffffffff8b0b2dff>] process_one_work+0x17f/0x440
[   29.864817]  [<ffffffff8b0b3ac6>] worker_thread+0x126/0x3c0
[   29.871238]  [<ffffffff8b0b39a0>] ? manage_workers.isra.24+0x2a0/0x2a0
[   29.878612]  [<ffffffff8b0bae31>] kthread+0xd1/0xe0
[   29.884338]  [<ffffffff8b0bad60>] ? insert_kthread_work+0x40/0x40
[   29.891284]  [<ffffffff8b71f61d>] ret_from_fork_nospec_begin+0x7/0x21
[   29.898578]  [<ffffffff8b0bad60>] ? insert_kthread_work+0x40/0x40
[   29.905513] Code: 49 8b 03 31 f6 f6 c4 40 74 04 41 8b 73 68 4c 89 df e8
89 63 fa ff eb 84
[   29.927746] RIP  [<ffffffff8b1f6c1c>] kfree+0x13c/0x140
[   29.933888]  RSP <ffff920e8b613ce8>
                [   29.938300] ---[ end trace 66811942e35f2cba ]---
                            #
[   29.948435] Kernel panic - not syncing: Fatal exception in interrupt


On Thu, May 10, 2018 at 1:26 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Yikes. I guess I need to examine my compat backport closely. Do you
> have any more logging than that? Usually there's a backtrace.
>
-- 
Henry Snow | Director, Site Reliability Engineering
eXelate, a Nielsen company <http://exelate.com/>
E: henry.snow@nielsen.com | M: 347.366.2700
675 6th Ave, 3rd Floor, New York, NY 10010

--00000000000071225c056bdd71fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Was able to pull a little more this time. This help?<div><=
br></div><div><div>=C2=A0datasource:=C2=A0 =C2=A0 =C2=A0 [=C2=A0 =C2=A029.5=
70013] ------------[ cut here ]------------</div><div>[=C2=A0 =C2=A029.5759=
37] kernel BUG at mm/slub.c:3601!</div><div>[=C2=A0 =C2=A029.580741] invali=
d opcode: 0000 [#1] SMP=C2=A0</div><div>[=C2=A0 =C2=A029.585663] Modules li=
nked in: wireguard(OE) veth vxlan ip6_udp_tunnel udp_tunnel bridge sd</div>=
<div>[=C2=A0 =C2=A029.689129] CPU: 1 PID: 223 Comm: kworker/1:1 Tainted: G=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OE=C2=A0 ------------=C2=A0 =C2=A0=
3.101</div><div>[=C2=A0 =C2=A029.700019] Hardware name: Dell Inc. PowerEdge=
 R640/0W23H8, BIOS 1.3.7 02/08/2018</div><div>[=C2=A0 =C2=A029.708399] Work=
queue: wg-crypt-wg0 packet_rx_worker [wireguard]</div><div>[=C2=A0 =C2=A029=
.715340] task: ffff920e8b608000 ti: ffff920e8b610000 task.ti: ffff920e8b610=
000</div><div>[=C2=A0 =C2=A029.723722] RIP: 0010:[&lt;ffffffff8b1f6c1c&gt;]=
=C2=A0 [&lt;ffffffff8b1f6c1c&gt;] kfree+0x13c/0x140</div><div>[=C2=A0 =C2=
=A029.732222] RSP: 0018:ffff920e8b613ce8=C2=A0 EFLAGS: 00010246</div><div>[=
=C2=A0 =C2=A029.738429] RAX: 006fffff00000000 RBX: ffff920e76fbf000 RCX: 00=
000000fffbdd13</div><div>[=C2=A0 =C2=A029.746466] RDX: 006fffff00000000 RSI=
: 0000000000000206 RDI: ffff920e76fbf000</div><div>[=C2=A0 =C2=A029.754489]=
 RBP: ffff920e8b613d00 R08: 0000000000000001 R09: b7c55a3205f72200</div><di=
v>[=C2=A0 =C2=A029.762508] R10: 0000000000000000 R11: ffffeddddfdbefc0 R12:=
 ffff920e76fbf6c0</div><div>[=C2=A0 =C2=A029.770525] R13: ffffffff8b5d60c5 =
R14: ffff920e80220000 R15: ffff920e7e7e2500</div><div>[=C2=A0 =C2=A029.7785=
35] FS:=C2=A0 0000000000000000(0000) GS:ffff920e8be00000(0000) knlGS:000000=
0000000000</div><div>[=C2=A0 =C2=A029.787497] CS:=C2=A0 0010 DS: 0000 ES: 0=
000 CR0: 0000000080050033</div><div>[=C2=A0 =C2=A029.794125] CR2: 00007ffe4=
15adee0 CR3: 0000000c0e1ea000 CR4: 00000000007607e0</div><div>[=C2=A0 =C2=
=A029.802143] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000000=
0000</div><div>[=C2=A0 =C2=A029.810161] DR3: 0000000000000000 DR6: 00000000=
fffe0ff0 DR7: 0000000000000400</div><div>[=C2=A0 =C2=A029.818152] PKRU: 000=
00000</div><div>[=C2=A0 =C2=A029.821713] Call Trace:</div><div>[=C2=A0 =C2=
=A029.825002]=C2=A0 [&lt;ffffffff8b5d60c5&gt;] skb_release_data+0xf5/0x140<=
/div><div>[=C2=A0 =C2=A029.831595]=C2=A0 [&lt;ffffffff8b5d6134&gt;] skb_rel=
ease_all+0x24/0x30</div><div>[=C2=A0 =C2=A029.838008]=C2=A0 [&lt;ffffffff8b=
5d659c&gt;] consume_skb+0x2c/0x90</div><div>[=C2=A0 =C2=A029.844073]=C2=A0 =
[&lt;ffffffffc088df35&gt;] packet_rx_worker+0x2d5/0x7f0 [wireguard]</div><d=
iv>[=C2=A0 =C2=A029.851802]=C2=A0 [&lt;ffffffff8b71291c&gt;] ? __schedule+0=
x41c/0xa20</div><div>[=C2=A0 =C2=A029.858139]=C2=A0 [&lt;ffffffff8b0b2dff&g=
t;] process_one_work+0x17f/0x440</div><div>[=C2=A0 =C2=A029.864817]=C2=A0 [=
&lt;ffffffff8b0b3ac6&gt;] worker_thread+0x126/0x3c0</div><div>[=C2=A0 =C2=
=A029.871238]=C2=A0 [&lt;ffffffff8b0b39a0&gt;] ? manage_workers.isra.24+0x2=
a0/0x2a0</div><div>[=C2=A0 =C2=A029.878612]=C2=A0 [&lt;ffffffff8b0bae31&gt;=
] kthread+0xd1/0xe0</div><div>[=C2=A0 =C2=A029.884338]=C2=A0 [&lt;ffffffff8=
b0bad60&gt;] ? insert_kthread_work+0x40/0x40</div><div>[=C2=A0 =C2=A029.891=
284]=C2=A0 [&lt;ffffffff8b71f61d&gt;] ret_from_fork_nospec_begin+0x7/0x21</=
div><div>[=C2=A0 =C2=A029.898578]=C2=A0 [&lt;ffffffff8b0bad60&gt;] ? insert=
_kthread_work+0x40/0x40</div><div>[=C2=A0 =C2=A029.905513] Code: 49 8b 03 3=
1 f6 f6 c4 40 74 04 41 8b 73 68 4c 89 df e8 89 63 fa ff eb 84=C2=A0=C2=A0</=
div><div>[=C2=A0 =C2=A029.927746] RIP=C2=A0 [&lt;ffffffff8b1f6c1c&gt;] kfre=
e+0x13c/0x140</div><div>[=C2=A0 =C2=A029.933888]=C2=A0 RSP &lt;ffff920e8b61=
3ce8&gt;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
[=C2=A0 =C2=A029.938300] ---[ end trace 66811942e35f2cba ]---</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 #</div><div>[=C2=A0 =C2=A029.948435] Kernel panic - no=
t syncing: Fatal exception in interrupt</div></div><div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 10, 2018 at 1:26 P=
M Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Yikes. I guess I ne=
ed to examine my compat backport closely. Do you<br>
have any more logging than that? Usually there&#39;s a backtrace.<br>
</blockquote></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-s=
martmail=3D"gmail_signature"><div dir=3D"ltr"><font color=3D"#808080" style=
=3D"line-height:normal;font-family:cantarell">Henry Snow | Director, Site R=
eliability Engineering</font><div><font color=3D"#808080" style=3D"line-hei=
ght:normal;font-family:cantarell"><a href=3D"http://exelate.com/">eXelate, =
a Nielsen company</a></font><br style=3D"line-height:normal;color:rgb(0,0,0=
);font-family:cantarell"><font color=3D"#808080" style=3D"line-height:norma=
l;font-family:cantarell">E:=C2=A0<a href=3D"mailto:henry.snow@nielsen.com">=
henry.snow@nielsen.com</a>=C2=A0|=C2=A0</font><span style=3D"color:rgb(128,=
128,128);font-family:cantarell;line-height:normal">M: 347.366.2700</span><b=
r style=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"><font=
 color=3D"#808080" style=3D"line-height:normal;font-family:cantarell">675 6=
th Ave, 3rd Floor, New York, NY 10010=C2=A0</font><br></div></div></div>

--00000000000071225c056bdd71fd--
