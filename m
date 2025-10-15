Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D7FCF6482
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:44:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e4e1e9f;
	Tue, 18 Nov 2025 17:33:35 +0000 (UTC)
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8ca5f83c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Oct 2025 02:08:54 +0000 (UTC)
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Petr Mladek <pmladek@suse.com>
CC: Lance Yang <lance.yang@linux.dev>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>, "linux-arm-kernel@lists.infradead.org"
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
Subject: RE: [????] Re: [????] Re: [PATCH][v3] hung_task: Panic after fixed
 number of hung tasks
Thread-Topic: [????] Re: [????] Re: [PATCH][v3] hung_task: Panic after fixed
 number of hung tasks
Thread-Index: AQHcPO9h0grxiWd7ak27/owdD96L07TBdJLA//+i6ACAAVy0QA==
Date: Wed, 15 Oct 2025 02:04:21 +0000
Message-ID: <b7937a55047b44c687e11e219a62009e@baidu.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <588c1935-835f-4cab-9679-f31c1e903a9a@linux.dev>
 <aO4boXFaIb0_Wiif@pathway.suse.cz>
 <e3f7ddf68c2e42d7abf8643f34d84a18@baidu.com>
 <aO5Ldv4U8QSGgfog@pathway.suse.cz>
In-Reply-To: <aO5Ldv4U8QSGgfog@pathway.suse.cz>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.127.72.27]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.50.46
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

> I would also update the subject to something like:
>=20
>     hung_task: Panic when there are more than N hung tasks at the same
> time
>=20

Ok, I will update=20

>=20
>=20
> That said, I think that both approaches make sense.
>=20
> Your approach would trigger the panic when many processes are stuck.
> Note that it still might be a transient state. But I agree that the more =
stuck
> processes exist the more serious the problem likely is for the heath of t=
he
> system.
>=20
> My approach would trigger panic when a single process hangs for a long
> time. It will trigger more likely only when the problem is persistent. Th=
e
> seriousness depends on which particular process get stuck.
>=20
Yes, both are reasonable requirement, and I will leave it to you or anyone =
else interested to implement it

Thanks

-Li.


> I am fine with your approach. Just please, make more clear that the numbe=
r
> means the number of hung tasks at the same time.
> And mention the problems to login, ...
>=20
> Best Regards,
> Petr
