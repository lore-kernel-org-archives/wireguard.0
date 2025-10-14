Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00EDCF34C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 14:47:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23f9eb7e;
	Tue, 18 Nov 2025 17:32:30 +0000 (UTC)
Received: from baidu.com (mx22.baidu.com [220.181.50.185])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c00fda3b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Oct 2025 02:05:20 +0000 (UTC)
From: "Li,Rongqing" <lirongqing@baidu.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Andrew Morton
 <akpm@linux-foundation.org>, Lance Yang <lance.yang@linux.dev>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Shuah Khan <shuah@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 "Petr Mladek" <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Feng
 Tang <feng.tang@linux.alibaba.com>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>, Kees Cook <kees@kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>, Phil Auld <pauld@redhat.com>, Joel Granados
 <joel.granados@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Simon Horman
 <horms@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, "Stanislav
 Fomichev" <sdf@fomichev.me>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, David Hildenbrand
 <david@redhat.com>, Florian Westphal <fw@strlen.de>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
 <linux-kselftest@vger.kernel.org>
Subject: =?utf-8?B?UkU6IFvlpJbpg6jpgq7ku7ZdIFJlOiBbUEFUQ0hdW3YzXSBodW5nX3Rhc2s6?=
 =?utf-8?Q?_Panic_after_fixed_number_of_hung_tasks?=
Thread-Topic: =?utf-8?B?W+WklumDqOmCruS7tl0gUmU6IFtQQVRDSF1bdjNdIGh1bmdfdGFzazogUGFu?=
 =?utf-8?Q?ic_after_fixed_number_of_hung_tasks?=
Thread-Index: AQHcO26DBhE8v5YbxE+aupLwXa3Lo7TAWTwAgACNKWA=
Date: Tue, 14 Oct 2025 02:03:19 +0000
Message-ID: <61a45c98b3a14b75bb83a2a5ea4dab51@baidu.com>
References: <20251012115035.2169-1-lirongqing@baidu.com>
 <b16d76de-688a-4697-bcfe-06f2785a1d3c@infradead.org>
In-Reply-To: <b16d76de-688a-4697-bcfe-06f2785a1d3c@infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.127.72.30]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.50.47
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

DQoNCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFy
YW1ldGVycy50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0
ZXJzLnR4dA0KPiA+IGluZGV4IGE1MWFiNDYuLjdkOWE4ZWUgMTAwNjQ0DQo+ID4gLS0tIGEvRG9j
dW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiA+IEBAIC0x
OTkyLDE0ICsxOTkyLDIwIEBADQo+ID4gIAkJCXRoZSBhZGRlZCBtZW1vcnkgYmxvY2sgaXRzZWxm
IGRvIG5vdCBiZSBhZmZlY3RlZC4NCj4gPg0KPiA+ICAJaHVuZ190YXNrX3BhbmljPQ0KPiA+IC0J
CQlbS05MXSBTaG91bGQgdGhlIGh1bmcgdGFzayBkZXRlY3RvciBnZW5lcmF0ZSBwYW5pY3MuDQo+
ID4gLQkJCUZvcm1hdDogMCB8IDENCj4gPiArCQkJW0tOTF0gTnVtYmVyIG9mIGh1bmcgdGFza3Mg
dG8gdHJpZ2dlciBrZXJuZWwgcGFuaWMuDQo+ID4gKwkJCUZvcm1hdDogPGludD4NCj4gPiArDQo+
ID4gKwkJCVNldCB0aGlzIHRvIHRoZSBudW1iZXIgb2YgaHVuZyB0YXNrcyB0aGF0IG11c3QgYmUN
Cj4gPiArCQkJZGV0ZWN0ZWQgYmVmb3JlIHRyaWdnZXJpbmcgYSBrZXJuZWwgcGFuaWMuDQo+ID4g
Kw0KPiA+ICsJCQkwOiBkb24ndCBwYW5pYw0KPiA+ICsJCQkxOiBwYW5pYyBpbW1lZGlhdGVseSBv
biBmaXJzdCBodW5nIHRhc2sNCj4gPiArCQkJTjogcGFuaWMgYWZ0ZXIgTiBodW5nIHRhc2tzIGFy
ZSBkZXRlY3QNCj4gDQo+IAkJCSAgICAgICAgICAgICAgICAgICAgICAgICAgICBhcmUgZGV0ZWN0
ZWQNCj4gDQoNClRoYW5rcywgd2lsbCBmaXggaW4gbmV4dCB2ZXJzaW9uDQoNCi1MaQ0KDQoNCg==
