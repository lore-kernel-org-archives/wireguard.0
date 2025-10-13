Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ABCCF34B7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa04537d;
	Tue, 18 Nov 2025 17:32:29 +0000 (UTC)
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id da2fa09b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Oct 2025 02:17:43 +0000 (UTC)
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Markus Elfring <Markus.Elfring@web.de>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Andrew Morton <akpm@linux-foundation.org>, Anshuman Khandual
 <anshuman.khandual@arm.com>, Arnd Bergmann <arnd@arndb.de>, David Hildenbrand
 <david@redhat.com>, Feng Tang <feng.tang@linux.alibaba.com>, Florian Westphal
 <fw@strlen.de>, Jakub Kicinski <kuba@kernel.org>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, Joel Granados <joel.granados@kernel.org>, Joel Stanley
 <joel@jms.id.au>, Jonathan Corbet <corbet@lwn.net>, Kees Cook
 <kees@kernel.org>, Lance Yang <lance.yang@linux.dev>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Paul E . McKenney"
 <paulmck@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Petr
 Mladek" <pmladek@suse.com>, Phil Auld <pauld@redhat.com>, Randy Dunlap
 <rdunlap@infradead.org>, Russell King <linux@armlinux.org.uk>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>, Stanislav Fomichev
 <sdf@fomichev.me>, Steven Rostedt <rostedt@goodmis.org>
CC: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>
Subject: =?utf-8?B?UkU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0ggdjNdIGh1bmdfdGFzazog?=
 =?utf-8?Q?Panic_after_fixed_number_of_hung_tasks?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSCB2M10gaHVuZ190YXNrOiBQYW5p?=
 =?utf-8?Q?c_after_fixed_number_of_hung_tasks?=
Thread-Index: AQHcO3v66ZG2hk4PtE6ORt/xqoKtirS/VpVw
Date: Mon, 13 Oct 2025 02:14:58 +0000
Message-ID: <2b19bac7de174fe6baa07234b88c8156@baidu.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <0aea408f-f6d7-4e2d-8cee-1801ad7f3139@web.de>
In-Reply-To: <0aea408f-f6d7-4e2d-8cee-1801ad7f3139@web.de>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.127.72.21]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.50.45
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

PiDigKYNCj4gPiBUaGlzIHBhdGNoIGV4dGVuZHMgdGhlIOKApg0KPiANCj4gV2lsbCBhbm90aGVy
IGltcGVyYXRpdmUgd29yZGluZyBhcHByb2FjaCBiZWNvbWUgbW9yZSBoZWxwZnVsIGZvciBhbg0K
PiBpbXByb3ZlZCBjaGFuZ2UgZGVzY3JpcHRpb24/DQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtDQo+
IGVudGF0aW9uL3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdD9oPXY2LjE3I245NA0KPiAN
Cg0Kd2lsbCBmaXggaW4gbmV4dCB2ZXJzaW9uDQo+IA0KPiDigKYNCj4gPiArKysgYi9rZXJuZWwv
aHVuZ190YXNrLmMNCj4g4oCmDQo+IEBAIC0yMjksOSArMjMyLDExIEBAIHN0YXRpYyB2b2lkIGNo
ZWNrX2h1bmdfdGFzayhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnQsDQo+IHVuc2lnbmVkIGxvbmcgdGlt
ZW91dCkg4oCmDQo+ID4gIAl0cmFjZV9zY2hlZF9wcm9jZXNzX2hhbmcodCk7DQo+ID4NCj4gPiAt
CWlmIChzeXNjdGxfaHVuZ190YXNrX3BhbmljKSB7DQo+ID4gKwlpZiAoc3lzY3RsX2h1bmdfdGFz
a19wYW5pYyAmJg0KPiA+ICsJCQkodG90YWxfaHVuZ190YXNrID49IHN5c2N0bF9odW5nX3Rhc2tf
cGFuaWMpKSB7DQo+IOKApg0KPiANCj4gSSBzdWdnZXN0IHRvIHVzZSB0aGUgZm9sbG93aW5nIHNv
dXJjZSBjb2RlIHZhcmlhbnQgaW5zdGVhZC4NCj4gDQo+IAlpZiAoc3lzY3RsX2h1bmdfdGFza19w
YW5pYyAmJiB0b3RhbF9odW5nX3Rhc2sgPj0gc3lzY3RsX2h1bmdfdGFza19wYW5pYykNCj4gew0K
PiANCg0Kd2lsbCBmaXggaW4gbmV4dCB2ZXJzaW9uDQoNCnRoYW5rcw0KDQotTGkNCg0KPiANCj4g
UmVnYXJkcywNCj4gTWFya3VzDQoNCg==
