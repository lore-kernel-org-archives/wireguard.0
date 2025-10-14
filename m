Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13D5CF34C9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 15:15:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d8e739a;
	Tue, 18 Nov 2025 17:32:34 +0000 (UTC)
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 33508ae3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Oct 2025 10:54:47 +0000 (UTC)
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Petr Mladek <pmladek@suse.com>, Lance Yang <lance.yang@linux.dev>
CC: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, David Hildenbrand <david@redhat.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, Stanislav Fomichev <sdf@fomichev.me>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "Russell King" <linux@armlinux.org.uk>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>, Steven Rostedt
 <rostedt@goodmis.org>, "Jonathan Corbet" <corbet@lwn.net>, Joel Granados
 <joel.granados@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>, Phil
 Auld <pauld@redhat.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "Pawan Gupta"
 <pawan.kumar.gupta@linux.intel.com>, Simon Horman <horms@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Florian Westphal
 <fw@strlen.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Kees Cook
 <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Paul E . McKenney"
 <paulmck@kernel.org>, Feng Tang <feng.tang@linux.alibaba.com>, "Jason A .
 Donenfeld" <Jason@zx2c4.com>
Subject: RE: [????] Re: [PATCH][v3] hung_task: Panic after fixed number of
 hung tasks
Thread-Topic: [????] Re: [PATCH][v3] hung_task: Panic after fixed number of
 hung tasks
Thread-Index: AQHcPO9h0grxiWd7ak27/owdD96L07TBdJLA
Date: Tue, 14 Oct 2025 10:49:53 +0000
Message-ID: <e3f7ddf68c2e42d7abf8643f34d84a18@baidu.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
In-Reply-To: <aO4boXFaIb0_Wiif@pathway.suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.127.72.24]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.50.48
X-FE-Policy-ID: 52:10:53:SYSTEM
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


> On Tue 2025-10-14 13:23:58, Lance Yang wrote:
> > Thanks for the patch!
> >
> > I noticed the implementation panics only when N tasks are detected
> > within a single scan, because total_hung_task is reset for each
> > check_hung_uninterruptible_tasks() run.
>=20
> Great catch!
>=20
> Does it make sense?
> Is is the intended behavior, please?
>=20

Yes, this is intended behavior

> > So some suggestions to align the documentation with the code's
> > behavior below :)
>=20
> > On 2025/10/12 19:50, lirongqing wrote:
> > > From: Li RongQing <lirongqing@baidu.com>
> > >
> > > Currently, when 'hung_task_panic' is enabled, the kernel panics
> > > immediately upon detecting the first hung task. However, some hung
> > > tasks are transient and the system can recover, while others are
> > > persistent and may accumulate progressively.
>=20
> My understanding is that this patch wanted to do:
>=20
>    + report even temporary stalls
>    + panic only when the stall was much longer and likely persistent
>=20
> Which might make some sense. But the code does something else.
>=20

A single task hanging for an extended period may not be a critical issue, a=
s users might still log into the system to investigate. However, if multipl=
e tasks hang simultaneously-such as in cases of I/O hangs caused by disk fa=
ilures-it could prevent users from logging in and become a serious problem,=
 and a panic is expected.=20


> > > --- a/kernel/hung_task.c
> > > +++ b/kernel/hung_task.c
> > > @@ -229,9 +232,11 @@ static void check_hung_task(struct task_struct
> *t, unsigned long timeout)
> > >   	 */
> > >   	sysctl_hung_task_detect_count++;
> > > +	total_hung_task =3D sysctl_hung_task_detect_count -
> > > +prev_detect_count;
> > >   	trace_sched_process_hang(t);
> > > -	if (sysctl_hung_task_panic) {
> > > +	if (sysctl_hung_task_panic &&
> > > +			(total_hung_task >=3D sysctl_hung_task_panic)) {
> > >   		console_verbose();
> > >   		hung_task_show_lock =3D true;
> > >   		hung_task_call_panic =3D true;
>=20
> I would expect that this patch added another counter, similar to
> sysctl_hung_task_detect_count. It would be incremented only once per chec=
k
> when a hung task was detected. And it would be cleared (reset) when no
> hung task was found.
>=20
> Best Regards,
> Petr
