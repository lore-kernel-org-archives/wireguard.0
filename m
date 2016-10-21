Return-Path: pageexec@gmail.com
Received: from r00tworld.com (r00tworld.com [212.85.137.150])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1fc556d
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 00:23:19 +0000 (UTC)
From: "PaX Team" <pageexec@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Oct 2016 02:24:09 +0200
MIME-Version: 1.0
Message-ID: <58096029.23859.5C451AE@pageexec.gmail.com>
In-reply-to: <CAHmME9qDnL8QDtP-n8vDno01YnyrA6DgezxSf37TOTgnPe4n=w@mail.gmail.com>
References: <87mvi0jxsb.fsf@toke.dk>, <87zim0wcdy.fsf@toke.dk>,
 <CAHmME9qDnL8QDtP-n8vDno01YnyrA6DgezxSf37TOTgnPe4n=w@mail.gmail.com>
Content-type: text/plain; charset=UTF-8
Cc: Emese Revfy <re.emese@gmail.com>,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
Reply-To: pageexec@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 20 Oct 2016 at 11:19, Jason A. Donenfeld wrote:

> Hey PaX Team,
> 
> People are trying to run WireGuard with PaX and running into problems.
> I wasn't able to reproduce any issues with CONFIG_PAX_SIZE_OVERFLOW=3Dy,
> but I did find issues with CONFIG_PAX_SIZE_OVERFLOW_EXTRA=3Dy.

that's because sk_buff.mac_header is in one of those hash tables that
gets used by the extra feature only.

in any case, whoever can reproduce this should print out the value of
head->mac_header before the increment. my guess based on past experience
on similar network problems is that the field is probably invalid (ffff
or similar) and adding to it will trigger the size overflow check. this
in turn means that there's usually some higher level logic bug and you'll
have to talk to netdev guys as i'm way out of my depths at that point ;).

> The resulting stack trace didn't seem to hit any WireGuard code, but it'=
s
> possible that WireGuard is triggering some other bug in the kernel
> that might interest you:
> 
> [   21.286622] PAX: size overflow detected in function ipv6_frag_rcv
> net/ipv6/reassembly.c:459 cicus.188_740 max, count: 21, decl:
> mac_header; num: 0; context: sk_buff;
> [   21.286777] CPU: 0 PID: 82 Comm: kworker/0:2 Not tainted 4.7.8-grsec =
#3
> [   21.286816] Workqueue: wireguard-crypt-wg0 ffffffff810ccd20
> [   21.286862]  0000000000000000 98fa0e0487e67b73 0000000000000286
> 0000000000000000
> [   21.286921]  ffffffff81195536 ffffffff814b18b8 98fa0e0487e67b73
> ffffffff814b18b8
> [   21.286986]  00000000000001cb ffffffff81124253 ffff880002d7fb00
> ffff880003c03d10
> [   21.287047] Call Trace:
> [   21.287061]  <IRQ>  [<ffffffff81195536>] ? dump_stack+0x70/0xca
> [   21.287103]  [<ffffffff81124253>] ? report_size_overflow+0x63/0x80
> [   21.287142]  [<ffffffff81332769>] ? ipv6_frag_rcv+0x1589/0x1710
> [   21.287180]  [<ffffffff81310006>] ? ipv6_dev_get_saddr+0x1b6/0x270
> [   21.287218]  [<ffffffff813083cf>] ? ip6_input_finish+0xcf/0x3b0
> [   21.287254]  [<ffffffff81308d56>] ? ip6_input+0xc6/0xe0
> [   21.287287]  [<ffffffff81308ab8>] ? ipv6_rcv+0x408/0x5e0
> [   21.287322]  [<ffffffff8129a103>] ? ip_rcv+0x343/0x500
> [   21.287358]  [<ffffffff812315ce>] ? __netif_receive_skb_core+0x49e/0x=
a10
> [   21.287395]  [<ffffffff812324d8>] ? process_backlog+0xa8/0x160
> [   21.287432]  [<ffffffff81237c70>] ? net_rx_action+0x300/0x4b0
> [   21.287470]  [<ffffffff81048711>] ? __do_softirq+0x101/0x230
> [   21.287508]  [<ffffffff8134ee7c>] ? do_softirq_own_stack+0x1c/0x30
> [   21.287544]  <EOI>  [<ffffffff81048504>] ? do_softirq.part.15+0x34/0x=
50
> [   21.287591]  [<ffffffff810485f4>] ? __local_bh_enable_ip+0x84/0xa0
> [   21.287627]  [<ffffffff810cce0d>] ? padata_serial_worker+0xed/0x130
> [   21.287691]  [<ffffffff8105e167>] ? process_one_work+0x177/0x440
> [   21.287734]  [<ffffffff8105e48b>] ? worker_thread+0x5b/0x4d0
> [   21.287803]  [<ffffffff813485e5>] ? __schedule+0x275/0x610
> [   21.287846]  [<ffffffff8105e430>] ? process_one_work+0x440/0x440
> [   21.287887]  [<ffffffff81064ec4>] ? kthread+0xe4/0x110
> [   21.287933]  [<ffffffff8134cffe>] ? _raw_spin_unlock_irq+0xe/0x50
> [   21.287973]  [<ffffffff8134dd7e>] ? ret_from_fork+0x1e/0x50
> [   21.288006]  [<ffffffff81064de0>] ? __kthread_parkme+0x80/0x80
> [   21.288045] Kernel panic - not syncing: Aiee, killing interrupt handl=
er!
> [   21.288199] Kernel Offset: disabled
> [   21.288239] ---[ end Kernel panic - not syncing: Aiee, killing
> interrupt handler!
> 
> Regards,
> Jason
> 
> On Thu, Oct 20, 2016 at 1:07 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
toke.dk> wrote:
> > Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:
> >
> >> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:
> >>
> >>> I'm getting build errors when building WireGuard against a grsec-ena=
bled
> >>> kernel (on Arch linux):
> >>>
> >>> DKMS make.log for wireguard-0.0.20161014 for kernel 4.7.8.2016101617=
20-1-grsec (x86_64)
> >>> Wed 19 Oct 14:59:25 CEST 2016
> >>> make: Entering directory '/usr/lib/modules/4.7.8.201610161720-1-grse=
c/build'
> >>>   LD      /var/lib/dkms/wireguard/0.0.20161014/build/built-in.o
> >>>   CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/main.o
> >>> /var/lib/dkms/wireguard/0.0.20161014/build/main.o: warning: objtool:=
 mod_exit(): can't find starting instruction
> >>>   CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/noise.o
> >>>   CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/device.o
> >>> /var/lib/dkms/wireguard/0.0.20161014/build/device.c:330:29: error: c=
onstified variable =E2=80=98link_ops=E2=80=99 placed into writable section=
 ".data..read_mostly"
> >>>  static struct rtnl_link_ops link_ops __read_mostly =3D {
> >>>                              ^~~~~~~~
> >>> make[1]: *** [scripts/Makefile.build:290: /var/lib/dkms/wireguard/0.=
0.20161014/build/device.o] Error 1
> >>> make: *** [Makefile:1465: _module_/var/lib/dkms/wireguard/0.0.201610=
14/build] Error 2
> >>> make: Leaving directory '/usr/lib/modules/4.7.8.201610161720-1-grsec=
/build'
> >>>
> >>> Any idea how to fix this?
> >>
> >> OK, so turns out just getting rid of the __read_mostly fixes things.

FWIW, i've been carrying such a local patch on my gentoo box too ;).
