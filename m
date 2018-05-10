Return-Path: henry.snow@nielsen.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fb025ad
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 21:39:12 +0000 (UTC)
Received: from mail-pg0-x233.google.com (mail-pg0-x233.google.com
 [IPv6:2607:f8b0:400e:c05::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a878a170
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 21:39:12 +0000 (UTC)
Received: by mail-pg0-x233.google.com with SMTP id z4-v6so1505022pgu.13
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 14:41:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAFuSFDHSJ8zezCqKuA+JM5asoWH-B2AYLAN2fbcWCwNE=r33hQ@mail.gmail.com>
 <CAHmME9pocAi6bsEkpycRhz1LQmipzj-=6ztBPPihE8HQ7ZhQDw@mail.gmail.com>
 <CAHmME9oQNfscJCUkoVW4qKoukTKBdCj3MYaW9C4jGW2m0Nm9LA@mail.gmail.com>
 <CAFuSFDEf9gUMW5nOcStnFM22dvAa_mAtMAVnk92m-dRY2xFa5w@mail.gmail.com>
 <CAFuSFDFziCyiL=J_aom9YTWCM6gpGmY1cC56TroxJJvFcC3GKQ@mail.gmail.com>
 <CAHmME9pRTWCEzhuFAbDBtWPAxk0hB7AobZWa8bDHC3EuPbN95A@mail.gmail.com>
 <CAFuSFDEREZibd5Vb-J1GreLK9ZV+y2wGOc5MuaHvHx4XdbwDkw@mail.gmail.com>
 <CAHmME9pJJi3ReS_am0xopy1E=hpnaUZ1k1WnVNZLGdi_jA4eeA@mail.gmail.com>
 <CAHmME9qYv_5+TM-MaYowi5mf8g1=mgTC6_JasipYt29oJ4xFHQ@mail.gmail.com>
 <CAHmME9qhmPiDEE81h6rmA+iWdV4KpbqV7vCcw-6Nr+PZcQfnYw@mail.gmail.com>
In-Reply-To: <CAHmME9qhmPiDEE81h6rmA+iWdV4KpbqV7vCcw-6Nr+PZcQfnYw@mail.gmail.com>
From: Henry Snow <henry.snow@nielsen.com>
Date: Thu, 10 May 2018 21:41:47 +0000
Message-ID: <CAFuSFDHaFoF1SkbbdqDA87SKzOuwfV1GWWnZapDkOWTa7yYObA@mail.gmail.com>
Subject: Re: wireguard-dkms and CentOS 7.5
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="0000000000008bc448056be0e35b"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000008bc448056be0e35b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hmm...yeah, I've followed these steps:

Fresh CentOS 7.5 install
yum install git libmnl-devel elfutils-libelf-devel kernel-devel
@development-tools
git clone https://git.zx2c4.com/WireGuard
cd WireGuard/src
make
make install
deploy /etc/wireguard/wg0.conf
systemctl start wg-quick@wg0
kernel panic.

Any additional debugging steps I can provide? This trace looks a little
different, so also including it:

[ 1571.621740] ------------[ cut here ]------------
[ 1571.627195] WARNING: CPU: 1 PID: 264 at arch/x86/kernel/smp.c:127
native_smp_send_reschedule+0x65/0x70
[ 1571.637324] Modules linked in: wireguard(OE) ip6_udp_tunnel udp_tunnel
bonding skx_edac intel_powerclamp coretempd
[ 1571.715278] CPU: 1 PID: 264 Comm: kworker/1:2 Tainted: G      D    OE
------------   3.10.0-862.2.3.el7.x86_64 #1
[ 1571.726478] Hardware name: Dell Inc. PowerEdge R640/0W23H8, BIOS 1.3.7
02/08/2018
[ 1571.734820] Workqueue: wg-crypt-wg0 packet_rx_worker [wireguard]
[ 1571.741700] Call Trace:
[ 1571.744990]  <IRQ>  [<ffffffffa7d0d78e>] dump_stack+0x19/0x1b
[ 1571.751604]  [<ffffffffa76916d8>] __warn+0xd8/0x100
[ 1571.757319]  [<ffffffffa769181d>] warn_slowpath_null+0x1d/0x20
[ 1571.763975]  [<ffffffffa7654245>] native_smp_send_reschedule+0x65/0x70
[ 1571.771325]  [<ffffffffa76dd791>] trigger_load_balance+0x191/0x280
[ 1571.778320]  [<ffffffffa76d1f75>] ? sched_clock_cpu+0x85/0xc0
[ 1571.784883]  [<ffffffffa76cd41a>] scheduler_tick+0x10a/0x150
[ 1571.791355]  [<ffffffffa7701420>] ? tick_sched_do_timer+0x50/0x50
[ 1571.798254]  [<ffffffffa76a4825>] update_process_times+0x65/0x80
[ 1571.805063]  [<ffffffffa7701220>] tick_sched_handle+0x30/0x70
[ 1571.811608]  [<ffffffffa7701459>] tick_sched_timer+0x39/0x80
[ 1571.818060]  [<ffffffffa76beff6>] __hrtimer_run_queues+0xd6/0x260
[ 1571.824937]  [<ffffffffa76bf58f>] hrtimer_interrupt+0xaf/0x1d0
[ 1571.831549]  [<ffffffffa76577fb>] local_apic_timer_interrupt+0x3b/0x60
[ 1571.838863]  [<ffffffffa7d24063>] smp_apic_timer_interrupt+0x43/0x60
[ 1571.846003]  [<ffffffffa7d207b2>] apic_timer_interrupt+0x162/0x170
[ 1571.852973]  <EOI>  [<ffffffffa7d07b80>] ? panic+0x1d8/0x21f
[ 1571.859455]  [<ffffffffa7d17763>] oops_end+0xd3/0xe0
[ 1571.865223]  [<ffffffffa762e96b>] die+0x4b/0x70
[ 1571.870555]  [<ffffffffa7d16eb0>] do_trap+0x60/0x170
[ 1571.876314]  [<ffffffffa762b284>] do_invalid_op+0xb4/0x130
[ 1571.882591]  [<ffffffffa77f6bbc>] ? kfree+0x13c/0x140
[ 1571.888435]  [<ffffffffa76d3838>] ? __enqueue_entity+0x78/0x80
[ 1571.895059]  [<ffffffffa76da2fc>] ? enqueue_entity+0x26c/0xb60
[ 1571.901676]  [<ffffffffa795bb78>] ? prandom_u32+0x18/0x20
[ 1571.907858]  [<ffffffffa7bd60c5>] ? skb_release_data+0xf5/0x140
[ 1571.914561]  [<ffffffffa7d22aee>] invalid_op+0x1e/0x30
[ 1571.920479]  [<ffffffffa7bd60c5>] ? skb_release_data+0xf5/0x140
[ 1571.927164]  [<ffffffffa77f6bbc>] ? kfree+0x13c/0x140
[ 1571.932962]  [<ffffffffa7bd60c5>] skb_release_data+0xf5/0x140
[ 1571.939446]  [<ffffffffa7bd6134>] skb_release_all+0x24/0x30
[ 1571.945743]  [<ffffffffa7bd659c>] consume_skb+0x2c/0x90
[ 1571.951700]  [<ffffffffc08eff35>] packet_rx_worker+0x2d5/0x7f0
[wireguard]
[ 1571.959302]  [<ffffffffa76b2dff>] process_one_work+0x17f/0x440
[ 1571.965847]  [<ffffffffa76b3ac6>] worker_thread+0x126/0x3c0
[ 1571.972117]  [<ffffffffa76b39a0>] ? manage_workers.isra.24+0x2a0/0x2a0
[ 1571.979327]  [<ffffffffa76bae31>] kthread+0xd1/0xe0
[ 1571.984873]  [<ffffffffa76bad60>] ? insert_kthread_work+0x40/0x40
[ 1571.991611]  [<ffffffffa7d1f5dd>] ret_from_fork_nospec_begin+0x7/0x21
[ 1571.998687]  [<ffffffffa76bad60>] ? insert_kthread_work+0x40/0x40
[ 1572.005389] ---[ end trace 5ef54fbe37d13ebd ]---



On Thu, May 10, 2018 at 4:25 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Henry,
>
> Here's a transcript of things working fine with the latest master
> branch: https://=D7=90.cc/GEDdGn4N <https://xn--4db.cc/GEDdGn4N>
>
> I'm still playing to see if I can reproduce your crash.
>
> Jason
>
--=20
Henry Snow | Director, Site Reliability Engineering
eXelate, a Nielsen company <http://exelate.com/>
E: henry.snow@nielsen.com | M: 347.366.2700
675 6th Ave, 3rd Floor, New York, NY 10010

--0000000000008bc448056be0e35b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hmm...yeah, I&#39;ve followed these steps:<div><br></div><=
div>Fresh CentOS 7.5 install</div><div>yum install git=C2=A0libmnl-devel el=
futils-libelf-devel kernel-devel @development-tools</div><div>git clone=C2=
=A0<a href=3D"https://git.zx2c4.com/WireGuard">https://git.zx2c4.com/WireGu=
ard</a></div><div>cd WireGuard/src</div><div>make</div><div>make install</d=
iv><div>deploy /etc/wireguard/wg0.conf</div><div>systemctl start wg-quick@w=
g0</div><div>kernel panic.=C2=A0</div><div><br></div><div>Any additional de=
bugging steps I can provide? This trace looks a little different, so also i=
ncluding it:</div><div><br></div><div><div>[ 1571.621740] ------------[ cut=
 here ]------------</div><div>[ 1571.627195] WARNING: CPU: 1 PID: 264 at ar=
ch/x86/kernel/smp.c:127 native_smp_send_reschedule+0x65/0x70</div><div>[ 15=
71.637324] Modules linked in: wireguard(OE) ip6_udp_tunnel udp_tunnel bondi=
ng skx_edac intel_powerclamp coretempd</div><div>[ 1571.715278] CPU: 1 PID:=
 264 Comm: kworker/1:2 Tainted: G=C2=A0 =C2=A0 =C2=A0 D=C2=A0 =C2=A0 OE=C2=
=A0 ------------=C2=A0 =C2=A03.10.0-862.2.3.el7.x86_64 #1</div><div>[ 1571.=
726478] Hardware name: Dell Inc. PowerEdge R640/0W23H8, BIOS 1.3.7 02/08/20=
18</div><div>[ 1571.734820] Workqueue: wg-crypt-wg0 packet_rx_worker [wireg=
uard]</div><div>[ 1571.741700] Call Trace:</div><div>[ 1571.744990]=C2=A0 &=
lt;IRQ&gt;=C2=A0 [&lt;ffffffffa7d0d78e&gt;] dump_stack+0x19/0x1b</div><div>=
[ 1571.751604]=C2=A0 [&lt;ffffffffa76916d8&gt;] __warn+0xd8/0x100</div><div=
>[ 1571.757319]=C2=A0 [&lt;ffffffffa769181d&gt;] warn_slowpath_null+0x1d/0x=
20</div><div>[ 1571.763975]=C2=A0 [&lt;ffffffffa7654245&gt;] native_smp_sen=
d_reschedule+0x65/0x70</div><div>[ 1571.771325]=C2=A0 [&lt;ffffffffa76dd791=
&gt;] trigger_load_balance+0x191/0x280</div><div>[ 1571.778320]=C2=A0 [&lt;=
ffffffffa76d1f75&gt;] ? sched_clock_cpu+0x85/0xc0</div><div>[ 1571.784883]=
=C2=A0 [&lt;ffffffffa76cd41a&gt;] scheduler_tick+0x10a/0x150</div><div>[ 15=
71.791355]=C2=A0 [&lt;ffffffffa7701420&gt;] ? tick_sched_do_timer+0x50/0x50=
</div><div>[ 1571.798254]=C2=A0 [&lt;ffffffffa76a4825&gt;] update_process_t=
imes+0x65/0x80</div><div>[ 1571.805063]=C2=A0 [&lt;ffffffffa7701220&gt;] ti=
ck_sched_handle+0x30/0x70</div><div>[ 1571.811608]=C2=A0 [&lt;ffffffffa7701=
459&gt;] tick_sched_timer+0x39/0x80</div><div>[ 1571.818060]=C2=A0 [&lt;fff=
fffffa76beff6&gt;] __hrtimer_run_queues+0xd6/0x260</div><div>[ 1571.824937]=
=C2=A0 [&lt;ffffffffa76bf58f&gt;] hrtimer_interrupt+0xaf/0x1d0</div><div>[ =
1571.831549]=C2=A0 [&lt;ffffffffa76577fb&gt;] local_apic_timer_interrupt+0x=
3b/0x60</div><div>[ 1571.838863]=C2=A0 [&lt;ffffffffa7d24063&gt;] smp_apic_=
timer_interrupt+0x43/0x60</div><div>[ 1571.846003]=C2=A0 [&lt;ffffffffa7d20=
7b2&gt;] apic_timer_interrupt+0x162/0x170</div><div>[ 1571.852973]=C2=A0 &l=
t;EOI&gt;=C2=A0 [&lt;ffffffffa7d07b80&gt;] ? panic+0x1d8/0x21f</div><div>[ =
1571.859455]=C2=A0 [&lt;ffffffffa7d17763&gt;] oops_end+0xd3/0xe0</div><div>=
[ 1571.865223]=C2=A0 [&lt;ffffffffa762e96b&gt;] die+0x4b/0x70</div><div>[ 1=
571.870555]=C2=A0 [&lt;ffffffffa7d16eb0&gt;] do_trap+0x60/0x170</div><div>[=
 1571.876314]=C2=A0 [&lt;ffffffffa762b284&gt;] do_invalid_op+0xb4/0x130</di=
v><div>[ 1571.882591]=C2=A0 [&lt;ffffffffa77f6bbc&gt;] ? kfree+0x13c/0x140<=
/div><div>[ 1571.888435]=C2=A0 [&lt;ffffffffa76d3838&gt;] ? __enqueue_entit=
y+0x78/0x80</div><div>[ 1571.895059]=C2=A0 [&lt;ffffffffa76da2fc&gt;] ? enq=
ueue_entity+0x26c/0xb60</div><div>[ 1571.901676]=C2=A0 [&lt;ffffffffa795bb7=
8&gt;] ? prandom_u32+0x18/0x20</div><div>[ 1571.907858]=C2=A0 [&lt;ffffffff=
a7bd60c5&gt;] ? skb_release_data+0xf5/0x140</div><div>[ 1571.914561]=C2=A0 =
[&lt;ffffffffa7d22aee&gt;] invalid_op+0x1e/0x30</div><div>[ 1571.920479]=C2=
=A0 [&lt;ffffffffa7bd60c5&gt;] ? skb_release_data+0xf5/0x140</div><div>[ 15=
71.927164]=C2=A0 [&lt;ffffffffa77f6bbc&gt;] ? kfree+0x13c/0x140</div><div>[=
 1571.932962]=C2=A0 [&lt;ffffffffa7bd60c5&gt;] skb_release_data+0xf5/0x140<=
/div><div>[ 1571.939446]=C2=A0 [&lt;ffffffffa7bd6134&gt;] skb_release_all+0=
x24/0x30</div><div>[ 1571.945743]=C2=A0 [&lt;ffffffffa7bd659c&gt;] consume_=
skb+0x2c/0x90</div><div>[ 1571.951700]=C2=A0 [&lt;ffffffffc08eff35&gt;] pac=
ket_rx_worker+0x2d5/0x7f0 [wireguard]</div><div>[ 1571.959302]=C2=A0 [&lt;f=
fffffffa76b2dff&gt;] process_one_work+0x17f/0x440</div><div>[ 1571.965847]=
=C2=A0 [&lt;ffffffffa76b3ac6&gt;] worker_thread+0x126/0x3c0</div><div>[ 157=
1.972117]=C2=A0 [&lt;ffffffffa76b39a0&gt;] ? manage_workers.isra.24+0x2a0/0=
x2a0</div><div>[ 1571.979327]=C2=A0 [&lt;ffffffffa76bae31&gt;] kthread+0xd1=
/0xe0</div><div>[ 1571.984873]=C2=A0 [&lt;ffffffffa76bad60&gt;] ? insert_kt=
hread_work+0x40/0x40</div><div>[ 1571.991611]=C2=A0 [&lt;ffffffffa7d1f5dd&g=
t;] ret_from_fork_nospec_begin+0x7/0x21</div><div>[ 1571.998687]=C2=A0 [&lt=
;ffffffffa76bad60&gt;] ? insert_kthread_work+0x40/0x40</div><div>[ 1572.005=
389] ---[ end trace 5ef54fbe37d13ebd ]---</div></div><div><br></div><div><b=
r><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, May 10, 2018 at 4=
:25 PM Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c=
4.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Henry,<br>
<br>
Here&#39;s a transcript of things working fine with the latest master<br>
branch: <a href=3D"https://xn--4db.cc/GEDdGn4N" rel=3D"noreferrer" target=
=3D"_blank">https://=D7=90.cc/GEDdGn4N</a><br>
<br>
I&#39;m still playing to see if I can reproduce your crash.<br>
<br>
Jason<br>
</blockquote></div></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><font color=3D"#8=
08080" style=3D"line-height:normal;font-family:cantarell">Henry Snow | Dire=
ctor, Site Reliability Engineering</font><div><font color=3D"#808080" style=
=3D"line-height:normal;font-family:cantarell"><a href=3D"http://exelate.com=
/">eXelate, a Nielsen company</a></font><br style=3D"line-height:normal;col=
or:rgb(0,0,0);font-family:cantarell"><font color=3D"#808080" style=3D"line-=
height:normal;font-family:cantarell">E:=C2=A0<a href=3D"mailto:henry.snow@n=
ielsen.com">henry.snow@nielsen.com</a>=C2=A0|=C2=A0</font><span style=3D"co=
lor:rgb(128,128,128);font-family:cantarell;line-height:normal">M: 347.366.2=
700</span><br style=3D"line-height:normal;color:rgb(0,0,0);font-family:cant=
arell"><font color=3D"#808080" style=3D"line-height:normal;font-family:cant=
arell">675 6th Ave, 3rd Floor, New York, NY 10010=C2=A0</font><br></div></d=
iv></div>

--0000000000008bc448056be0e35b--
