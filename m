Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 498FBC05027
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 21:40:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dd60397;
	Sun, 19 Feb 2023 21:40:04 +0000 (UTC)
Received: from sonic305-22.consmr.mail.ne1.yahoo.com
 (sonic305-22.consmr.mail.ne1.yahoo.com [66.163.185.148])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 195f2643
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 21:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1676842799; bh=UcOYo7rT4HSrTgx/Rld4Ko/NNo7/ghe21UlYooGryTY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject:Reply-To;
 b=oTg24Xd1OYx4V82wtKRLL5NWA12AOsPfZzeN9I5f40HXqDxAcHtGBpMcyr48Jd2Fto19Yvz6WmBIkPGLpPA4UOZY8olWngIvd3k+SWO04O6AypthX903VZbg2dCSTFpzrR4z6GHSG2FNqgwvuKUkqD6bVc7iEf4IejWv6TdzOYm99YjmDgv9RVMTOYL2d+8eI/XYQ9em1MyFbvZIbCNFsjI3zTr0mqqZe9AFiSs4y4qg+Bz+lN5Nug/2kHdITBlkxycHoqsYhcZWjeRTes0XoeVKIlYha9ADUEpyMOI78KYIV/+pFGlhIZPuR7XrArfenWEhaHcAmgth5HxkcNBw0g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1676842799; bh=V6EVuHVHCh1sb9S1yibDFWRDeHwWgnOo1VIyA+h4PxO=;
 h=X-Sonic-MF:Date:From:Subject:To:From:Subject;
 b=IuIdR4fVMy9wHkUgkAgM50N8hhhbrcxLh6WzOE+tIsqJkfXZT8E9tbQ3CI/J7dQ5dmT2Esx8nvOhuA4j/ukcLTXm2zkDpp7ghUTsrpxG1yqYa0ib77xpSktiu249I6wQWG5BrQaBGK5+tPektDGk9eU8FpXjFzcFSAJrafPLV9XbtsYpq3aD8LN5TXlWqcO8S+Ohu1FOGVSuRfHqActe/wiCi0cgqyfk+QGZfeSafTG6ak6o/Yecj7UMAH9tw+NqYuSmmuBIG3+07poBG0LXP/gSsOaeNRhaHeTV2hipENTfg4yOXPDqN6YBnfPJ7j8N5ZB7Sjor4uxu8T9hf+e0DQ==
X-YMail-OSG: YWF0FFoVM1k3YTCWtALq6dOEVSUkghWqkScdbC8UAHdWaup45H3AuPykLM1oWpk
 RvrspOCV9VRouqfAZl9skMiZvOF2Z4DcD43XaSw.t45Hh7jgLdkk3A6T9AAX6v92hTTf141X.AkG
 1sgOeVYrMfESMkwmPaCGt4vt5FCLtZgFKtQ7ON3RJTS.7RGS7NXQFA0kbM8gNjjbECGLF0jZmsWX
 msfMJPg77ytYmyv_erP1EmCa0ewDkNsaPiu0ZlqgOj68VnMxuEJIaSkNzgf.v7rAt58_bxADqFal
 tLJupeIR52Xj.wlFCx2d_4NioLq8CWCbzOu9SJaVohdj9yP68lArGNXeJCZ8mQ2SMNg5GZ8AW8ZZ
 sc1VQ33EPmIfub0x34HCBQSucSnytvTPJcfbeYVysSiW6vjmnAzf_GgBqnyI.bRl.vE3Y7FoBjVH
 RNCRcz344y3b2YTNtQbXvCfECFmemXYn6yQCxp8E._oRghE4_GB2jyQf.0u_Oqzg5CmYxXn_BMZY
 zEWK.FylnIEXZqf2zSJIW.Bci579Sby6bzz3ZDJ_x5IKcMdz_.zbolv47BaRhmHuzixhJEinVmVc
 gF2_tnsZ47Ua3huZcF4ABlLoOfkb6p6on0m8tbgYrwe6quiUXWCP4b3OSHVEmubsCc7OxTdvqRek
 REQHejkh2hrVd6pHzBen_E74t7HpQFug11eXzRkNFKwfsAdoRC0wf9wuj51aJNS_6MdlRnlec8Y7
 _4TeoXd3YaMBIHKNOEVh7mY_WVAUMTWhwgCadj3xC6AwpSzCZdycVrNDW28Y4uDT2ZGExxMwIQJt
 9GKecLpLHINvB7uqb1eMAeTTjXAauRmSrkrY.dClQWv_J8ya.RqmBYkneMi71PwJGsc9STSAEkCc
 M3wPBj6Phdn_6drppQO7rrW6KuihfrOE2EUsFiSegV0HFzQEgaTVv85c2Yz08ZnKBdIwadQy175L
 JkITY4QDJKW30sn4ZLrypMr4bhpTAevv9vFifubdMfo7sywqr4pX9gdeWHgq.qj.HavATlbjN6Zz
 XlLbUxmbomVIgtffeazsvSE4KFHVltASOvSxNcMawhkYaw8LTm7iJ3XeAtR04ZxpWP2bFdombyQW
 3nOLiQ.j7M55_mml1tCxZ8Fve1H2rGKhYv.RIjRA6uhwkoou9Ago1rHn6iPsfWcuccO194_Q1e8P
 mDXfVgHYudVN1cbLwTeRd9Nc939pXxN5ApI1L7ZLxZY_GZk4LXd1mv6VRCsXJSQ62klziOrxO0bT
 JdMp5Le2uGB5HGisf2g6RTApW2o20NQPupYLjJUckYRtYtlFJf5WJZV.0Mubnk7xBaHCb62y1Y0R
 WvP8b7TqsiaqhpndoWkboMC4DDuwhwR5UlauAdJmwRUoAomztDJ382JpLbQcibbH5OIkierlVlY_
 7LHjYthAvh8ysM8QhK03h_9hYam9b6PWiLsIVY.hwpw_VDGGQeGIc4PGr1pgf_DcwVxuSLPVtM9X
 PiwcpzeGu9i3Ew6nFmGkHWb6sDZWO0fji1O19ndgBzVvMdJf4ArIwuXExEDcG9CSSu3jVO6XUk0O
 wvFZT.lV7l5zl7cWwVs0a7CdPVN5dbynl6S2xFlBKisdL9yaSti_w8NgkXxIKdrZ01cCd.kFJAWZ
 .Gf9LY9d4VbvQeOLzH0u4_.TTq1u2ENqIFsx7J84eVct0Z66E77sqFkCpUANYqHge9uMkQPkbHmE
 K70aCKph2BTF4NDLcMBtyh_cPjIqASbmy8CnZNcKNOo95EGsiXs4H8Lve2ziPLdVn9td.ouWw9oP
 SueEHyIgAub1pcBrXH0ipUkHGEUqTSAz3NQR01nsrVb7mNzuPyxO9qYw19dmyVAs6wBhp1aacoFl
 s_w6OKcgxTp2BdIniXmqvahSKzYcV9LvkG7lnGNB6GOPSbSR75mt6_YJukJLkEtWVtdRnZEUXaYq
 vZjp8oF6n70dCTszq22mg7EaQRAbZnISjSp8.zrmjmUew8u2CN_OoIbPAMSkVoYw6XgX49VXIOJl
 KZZqM_oiUHSAJ_0J8SCi53hxeDcESu9marmpeSOU8.fg.6EqCGLPOenKXLhOOztPeC7TGJ_6WKuZ
 WzEQudqSqp.GRUMUHITy4S2hz9j9IrYs_GOyLInqFi86YGph43nqaaqrHYuCPfW1ZHduEeufG28l
 NpKMkLmJ1yiGbe0yCTA7z834yM3nsqYPMAnEBL3Lb3C.TaFThGavaIHEqCSDQ5ty40sxTD5odQQu
 dNF_rnmeDU_wCGeRjcvXOV4.pcA1XlfybjaDsuQf2QkR1Zw8-
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.ne1.yahoo.com with HTTP; Sun, 19 Feb 2023 21:39:59 +0000
Received: by hermes--production-bf1-57c96c66f6-l6456 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 82d3e364fc7bd30fc88d2e18914af1da; 
 Sun, 19 Feb 2023 21:39:54 +0000 (UTC)
Message-ID: <7d5c1dd6-fded-37bb-2ac1-d8dc541a822e@yahoo.com>
Date: Sun, 19 Feb 2023 16:39:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: tlhackque <tlhackque@yahoo.com>
Subject: Re: Source IP incorrect on multi homed systems
To: Roman Mamedov <rm@romanrm.net>,
 Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com> <87o7pp76a2.fsf@ungleich.ch>
 <20230220014252.21178988@nvm>
Content-Language: en-US
In-Reply-To: <20230220014252.21178988@nvm>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------t6cedkW0qVQjaD6aQD80h2E2"
X-Mailer: WebService/1.1.21183
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------t6cedkW0qVQjaD6aQD80h2E2
Content-Type: multipart/mixed; boundary="------------Yo1QlxRg0gcdNVzM6kpSaepG";
 protected-headers="v1"
From: tlhackque <tlhackque@yahoo.com>
To: Roman Mamedov <rm@romanrm.net>,
 Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Message-ID: <7d5c1dd6-fded-37bb-2ac1-d8dc541a822e@yahoo.com>
Subject: Re: Source IP incorrect on multi homed systems
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch> <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com> <87o7pp76a2.fsf@ungleich.ch>
 <20230220014252.21178988@nvm>
In-Reply-To: <20230220014252.21178988@nvm>

--------------Yo1QlxRg0gcdNVzM6kpSaepG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTktRmViLTIzIDE1OjQyLCBSb21hbiBNYW1lZG92IHdyb3RlOg0KPiBPbiBTdW4sIDE5
IEZlYiAyMDIzIDIxOjE4OjM0ICswMTAwDQo+IE5pY28gU2Nob3R0ZWxpdXM8bmljby5zY2hv
dHRlbGl1c0B1bmdsZWljaC5jaD4gIHdyb3RlOg0KPg0KPj4gSWYgSSBhbSBub3QgbWlzdGFr
ZW4gdGhhdCB3b3VsZCBtZWFuIGluIHByYWN0aWNlOg0KPj4NCj4+ICAgICBpZiBvcmlnbmFs
X3BrZy5pcF9kc3QgPT0gb25lX29mX215X2lwcyB0aGVuDQo+PiAgICAgICAgcmV0dXJuX3Br
Zy5pcC5zcmMgPSBvcmlnbmFsX3BrZy5pcF9kc3QNCj4+ICAgICAgICByZXR1cm5fcGtnLmlw
LmRzdCA9IG9yaWduYWxfcGtnLmlwX3NyYw0KPj4gICAgIGZpDQo+Pg0KPj4gRm9yIG1lIHRo
YXQgc291bmRzIGxpa2UgYSBzYW5lIGFwcHJvYWNoIChhc2lkZSBmcm9tDQo+PiBteSB2ZXJ5
IHNpbXBsaWZpZWQgYWxnb3JpdGhtKS4NCj4gRXhjZXB0IHRoZXJlIGlzIG5vIHJlcXVlc3Qg
YW5kIHJlc3BvbnNlIGluIFdHLCBhbmQgYXMgc3VjaCBubyBvcmlnaW5hbCBvcg0KPiByZXR1
cm4gcGFja2V0LiBBbm90aGVyIHBlZXIgY29udGFjdHMgeW91LCB0aGVuIHNvbWUgdGltZSBs
YXRlciB5b3UgY29udGFjdCB0aGUNCj4gb3RoZXIgcGVlci4gT3IgdGhlIG90aGVyIHdheSBy
b3VuZC4NCj4NCj4gV0ctd2lzZSB3aGF0IHdpbGwgbmVlZCB0byBiZSBkb25lIGlzIHRvIHN0
b3JlIGluIHRoZSBlYWNoIHBlZXIncyBpbmZvcm1hdGlvbg0KPiBzdHJ1Y3R1cmUgdGhlIGxv
Y2FsIElQIHRoYXQgd2UgYXJlIHN1cHBvc2VkIHRvIHVzZSBmb3IgY29tbXVuaWNhdGlvbiB3
aXRoIHRoYXQNCj4gcGVlcjsgYW5kIHVwZGF0aW5nIGl0IHdoZW4gcmVjZWl2aW5nIHBhY2tl
dHMgZnJvbSB0aGUgcGVlciwgdXNpbmcgdGhlDQo+IGRlc3RpbmF0aW9uIG9mIHRob3NlLiBT
byB5b3Ugd291bGQgc2VlIGEgIkxvY2FsIElQIiBpbiBlYWNoICJwZWVyIiBzZWN0aW9uDQo+
IHdoZW4gZG9pbmcgYSAid2cgc2hvdyIuDQo+DQo+IEFsc28sIHVudGlsIHRoZXJlIGlzIHN1
Y2ggSVAgaW5pdGlhbGx5IHN0b3JlZCwgaXQgd2lsbCBoYXZlIHRvIGJlIHNvbWUgZGVmYXVs
dA0KPiBvdXRnb2luZyBJUCBvZiB0aGUgc3lzdGVtIHRvd2FyZHMgdGhhdCBwZWVyLiBCVFcs
IGhvdyB3b3VsZCB0aGlzIHdvcmsgaW4geW91cg0KPiBzZXR1cCwgd2hhdCBpZiBub3QgdGhl
IHBlZXIgY29udGFjdHMgeW91IGZpcnN0LCBidXQgeW91ciBtYWNoaW5lIG5lZWRzIHRvDQo+
IGNvbnRhY3QgdGhlIHBlZXI/DQo+DQpUaGUgc2l0dWF0aW9uIGNhbiBiZSAoYW5kIG9mdGVu
IGlzKSB0aGUgc2FtZSBmb3IgYm90aCBwZWVycy4NCg0KSWYgeW91J3JlIHRoZSBpbml0aWF0
b3IsIHlvdSBzZW5kIHRvIHRoZSBwZWVyIGFkZHJlc3MgdXNpbmcgaXRzIA0KY29uZmlndXJl
ZCBvciBETlMgSVAgYWRkcmVzcywgYW5kIG5vcm1hbCByb3V0aW5nLsKgIFlvdSBub3RlIHRo
ZSBhZGRyZXNzIA0KdXNlZCB0byBzZW5kLCBhbmQgdXNlIGl0IGZvciBmdXR1cmUgY29tbXVu
aWNhdGlvbnMgdG8gdGhhdCBwZWVyLsKgIFRoZSANCmZpcnN0IHBhY2tldCBzZXRzIHN0YXRl
IGluIHRoZSBwb3NpdGVkIGZpcmV3YWxsL25hdC4gU3Vic2VxdWVudCBwYWNrZXRzIA0KdXNp
bmcgdGhlIHNhbWUgc291cmNlIGFkZHJlc3MgZW5zdXJlcyB0aGF0IHRoZSBmaXJld2FsbCBz
ZWVzIHRoZW0gYXMgdGhlIA0Kc2FtZSBmbG93Lg0KDQpXaGVuIHRoZSBwZWVyIGdldHMgYXJv
dW5kIHRvIHNheWluZyBzb21ldGhpbmcgLSB3aGljaCBpdCB3aWxsIGF0IGxhdGVzdCANCndo
ZW4gdGhlIGtlZXBhbGl2ZSB0aW1lciBnb2VzIG9mZiwgYnV0IHByb2JhYmx5IHNvb25lciwg
aXQgd2lsbCBoYXZlIA0Kbm90ZWQgeW91ciBzb3VyY2UgYWRkcmVzcyBhbmQgaXQncyBsb2Nh
bCBJUCBhZGRyZXNzICh0aGUgb25lIHlvdSB1c2VkKS7CoCANClNvIGl0IHdpbGwgc2VuZCB1
c2luZyB0aGUgc291cmNlIGFkZHJlc3MgdGhhdCB5b3Uga25vdyBhYm91dC4NCg0KVGhpcyBp
cyB0aGUgc2FtZSBhbGdvcml0aG0gdXNlZCBieSB0aGUgcGVlciwgc28gdGhleSBzaG91bGQg
YWdyZWUuDQoNCldoZW4gZWl0aGVyIGVuZCBkZXRlY3RzIGFuZCBhZGRyZXNzIGNoYW5nZSwg
dGhlIHByb2Nlc3MgcmVzdGFydHMuDQoNClRoZXJlIGlzIGEgcG9zc2liaWxpdHkgdGhhdCB0
aGUgaW5pdGlhbCBwYWNrZXRzIHBhc3MgaW4gZmxpZ2h0LCBidXQgSSANCnRoaW5rIHRoYXQg
d291bGQgYXQgbW9zdCByZXN1bHQgaW4gYSBkcm9wcGVkIHBhY2tldCwgd2hpY2ggd2lsbCBi
ZSByZXNlbnQuDQoNCkkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIGRlYWRsb2NrLCBidXQgaW4g
dGhlIGV2ZW50IG9mIHRocmFzaGluZywgYSANCnRpZS1icmVha2VyIG9mIHVzaW5nIHRoZSBs
b3dlc3QgY2FuZGlkYXRlIElQIGFkZHJlc3MgZ2VuZXJhbGx5IHdvcmtzLi4NCg0KV2hlbiB0
aGVyZSBhcmUgbXVsdGlwbGUgY2hvaWNlcywgaXQgZG9lc24ndCByZWFsbHkgbWF0dGVyIHdo
aWNoIHBhaXIgb2YgDQpJUCBhZGRyZXNzZXMgYXJlIHBpY2tlZCwgYXMgbG9uZyBhcyB0aGV5
J3JlIHN0YWJsZSB3aGlsZSB0aGUgc3lzdGVtcyANCnJlc2lkZSBvbiB0aGUgc2FtZSBuZXR3
b3Jrcy7CoCAoRS5HLiBpdCBjb3VsZCBiZSB0d28gbm90ZWJvb2sgUENzIGluIA0KZGlmZmVy
ZW50IGhvdGVsIHJvb21zLCBub3QganVzdCB0d28gZml4ZWQgc2VydmVycyBvciBvbmUgZml4
ZWQgc2VydmVyIA0KYW5kIG9uZSBtb2JpbGUuKcKgIFRoZSBnb2FsIGlzIHRvIGVzdGFibGlz
aCBhIGZsb3cgdGhhdCBzdGF0ZWZ1bCBwYWNrZXQgDQppbnNwZWN0aW9uLCBOQVQsIHJvdXRp
bmcgY2FuIHJlY29nbml6ZSBhbmQgdXNlIHRvIGtlZXAgYSBwaW5ob2xlIG9wZW4uLi4NCg0K
SSBkb24ndCBoYXZlIHRpbWUgYXQgdGhlIG1vbWVudCB0byB3b3JrIG91dCB0aGUgY29ybmVy
IGNhc2VzLCBidXQgdGhhdCdzIA0KdGhlIG92ZXJhbGwgYXBwcm9hY2guDQoNCg0K

--------------Yo1QlxRg0gcdNVzM6kpSaepG--

--------------t6cedkW0qVQjaD6aQD80h2E2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEhUZRCZitYt5SlPbZ3PhOoB301mYFAmPylykFAwAAAAAACgkQ3PhOoB301mbk
uhAAgdtQ1hwcMVMpB+diSqlB5Yoh2mmJ4ge+vtBhCf5WwWmF3dn0YcF49LBzdBSMK0At24W5vwpG
VhPBg+7OXw2kpWw5kSD/CVmbw2S+6Dk1lkGiGgDRYUpzFRaGty4j1DE8ln4OyOWde/7SbDw0PD7p
1OmjLe8i+OCRXpLt6UYfLQrGUgK8KQlceLKYAL48LvWS2h9oCTD5xChlR9PEm3SToGCiRnbCfHPu
hRWPhasZ0+FH76+v9MFC+XX+dgbhr0nfLy99124s2X9TDuY+mziw481k41MA4BOqzJ8hD0TlgsJj
y/ccWkYr+mV9Bg7M3z8wWNyovEpP7cJHdbDf8HF3m88VeaugCQXbrD9abQt4JRD/GUmyzlbIssZ4
ASGO9oXX1CxepCPwiBv9jgZczDteOrlODLmHtBNXquooRfv7Aj/O6iMcV8fj9kx9anY4BXPyPS7z
d/uLsx1ptGq8tkUFkRYI1Vg9x9PyCqR21cq/nmDvwNP7x9TlFR7dZmudj2WgDjNFyYkN6PAGlbKp
m+BV8p+Fg1th2S0Bnqlz6IyFaKgHFJ3qy5yfcNePBV0sUCE8N2080LXE5cjmyPXupcGQJjMfeKQr
4AWksLTZB9YrZck3HSmQfMqrVzZr2ZstsNc3kb4nVvddJBYA7KXNdTEDd6mutD2aOVcfRI+Xlz3U
VB8=
=t2w3
-----END PGP SIGNATURE-----

--------------t6cedkW0qVQjaD6aQD80h2E2--
