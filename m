Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6145cd63
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 13:09:40 +0000 (UTC)
Sender: toke@toke.dk
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <87mvi0jxsb.fsf@toke.dk>
 <58096029.23859.5C451AE@pageexec.gmail.com>
 <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
 <5809CB98.15179.767FB18@pageexec.gmail.com>
 <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
 <87bmyet4dx.fsf@toke.dk>
 <CAHmME9pF_jcwP6ZbnH1zLmA4vG6c6z+yZ_wO2cSB4W80u0TkEw@mail.gmail.com>
Date: Sat, 22 Oct 2016 15:10:49 +0200
In-Reply-To: <CAHmME9pF_jcwP6ZbnH1zLmA4vG6c6z+yZ_wO2cSB4W80u0TkEw@mail.gmail.com>
 (Jason A. Donenfeld's message of "Sat, 22 Oct 2016 17:03:03 +0900")
Message-ID: <87wph0pm06.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: Emese Revfy <re.emese@gmail.com>, Pipacs <pageexec@gmail.com>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hi Toke,
>
> On Fri, Oct 21, 2016 at 6:53 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@t=
oke.dk> wrote:
>> Wooh! FYI I was seeing the bug being triggered on IPv4 as well...
>
> Think you could try to acquire a backtrace? I'm not able to reproduce
> this.

Yup, here you go:

[  161.303946] PAX: size overflow detected in function __netif_receive_skb_=
core include/linux/skbuff.h:2045 cicus.1788_555 min, count: 84, decl: mac_l=
en; num: 0; context: sk_buf
f;                                                                         =
                                                                           =
                           [  161.492637] Kernel panic - not syncing: Aiee,=
 killing interrupt handler!
[  161.572979] CPU: 0 PID: 166 Comm: kworker/0:2 Tainted: G           O    =
4.7.9.201610200819-1-grsec #1
[  161.683444] Hardware name: Shuttle Inc. DS47D/FS47D, BIOS 1.03 08/09/2013
[  161.764756] Workqueue: wireguard-crypt-wg0 ffffffff8114cc70
[  161.831672]  d2e8090500000002 d2e809059eef7236 0000000000000086 00000000=
00000000
[  161.920683]  ffff880100203c40 ffffffff81330c53 0000000000000002 d2e80905=
9eef7236
[  162.009812]  ffffffff819196b8 ffff880100203ce0 ffff880100203cd0 ffffffff=
8114f0ba
[  162.098838] Call Trace:
[  162.128078]  <IRQ>  [<ffffffff81330c53>] dump_stack+0x76/0xd3
[  162.196943]  [<ffffffff8114f0ba>] panic+0xdb/0x26f
[  162.254360]  [<ffffffff8107843e>] do_exit+0x8fe/0xb70
[  162.314888]  [<ffffffff81078757>] do_group_exit+0x37/0xc0
[  162.379579]  [<ffffffff811f03c8>] report_size_overflow+0x78/0x90
[  162.451557]  [<ffffffff81550cf0>] __netif_receive_skb_core+0xd70/0xe10
[  162.529767]  [<ffffffff81554d85>] ? napi_gro_receive+0x75/0xd0
[  162.599654]  [<ffffffffa008e69e>] ? rtl8169_poll+0x8e/0x6a0 [r8169]
[  162.674744]  [<ffffffff81553c0b>] __netif_receive_skb+0x1b/0x80
[  162.745670]  [<ffffffff815561b5>] process_backlog+0xa5/0x170
[  162.813478]  [<ffffffff8155601c>] net_rx_action+0x24c/0x340
[  162.880246]  [<ffffffff81079606>] __do_softirq+0x106/0x240
[  162.945975]  [<ffffffff816a9a1c>] do_softirq_own_stack+0x1c/0x30
[  163.017945]  <EOI>  [<ffffffff81079119>] do_softirq.part.2+0x39/0x50
[  163.094170]  [<ffffffff810791b9>] __local_bh_enable_ip+0x89/0xb0
[  163.166150]  [<ffffffff8114cd5b>] padata_serial_worker+0xeb/0x130
[  163.239161]  [<ffffffff81093e54>] process_one_work+0x184/0x3e0
[  163.309049]  [<ffffffff81094108>] worker_thread+0x58/0x4e0
[  163.374774]  [<ffffffff810940b0>] ? process_one_work+0x3e0/0x3e0
[  163.446747]  [<ffffffff8109aeaa>] kthread+0xea/0x120
[  163.506228]  [<ffffffff816a85fe>] ret_from_fork+0x1e/0x50
[  163.570919]  [<ffffffff8109adc0>] ? kthread_worker_fn+0x1c0/0x1c0
[  163.643942] Kernel Offset: disabled
[  163.685729] ---[ end Kernel panic - not syncing: Aiee, killing interrupt=
 handler!


-Toke
