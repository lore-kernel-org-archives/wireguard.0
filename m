Return-Path: <SRS0=zozX=E2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1BBC5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 11:49:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D841522253
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Nov 2020 11:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=su.se header.i=@su.se header.b="p256zOth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D841522253
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=su.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81a47459;
	Fri, 20 Nov 2020 11:44:34 +0000 (UTC)
Received: from mail-prod-route04.it.su.se (mail-prod-route04.it.su.se
 [77.238.37.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 200d6feb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Nov 2020 11:44:32 +0000 (UTC)
Received: from e-mailfilter01.sunet.se (e-mailfilter01.sunet.se
 [IPv6:2001:6b0:8:2::201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail-prod-route04.it.su.se (Postfix) with ESMTPS id 4CcvwT5Zg5z17pd;
 Fri, 20 Nov 2020 12:49:29 +0100 (CET)
Received: from smtp.su.se (mail-prod-smtp04.it.su.se
 [IPv6:2001:6b0:5:132:250:56ff:fe94:2456])
 by e-mailfilter01.sunet.se (8.14.4/8.14.4/Debian-8+deb8u2) with ESMTP id
 0AKBnSg6071910
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 20 Nov 2020 12:49:28 +0100
Received: from EBOX-PROD-SRV18.win.su.se (ebox-prod-srv18.win.su.se
 [IPv6:2001:6b0:5:1462:e17e:ea5e:213d:f5d])
 by smtp.su.se (Postfix) with ESMTPS id 4CcvwR5fKZz2ttZ;
 Fri, 20 Nov 2020 12:49:27 +0100 (CET)
Received: from EBOX-PROD-SRV15.win.su.se (2001:6b0:5:1162:85f3:6da2:459d:88c7)
 by EBOX-PROD-SRV18.win.su.se (2001:6b0:5:1462:e17e:ea5e:213d:f5d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 20 Nov
 2020 12:49:27 +0100
Received: from EBOX-PROD-SRV15.win.su.se ([fe80::85f3:6da2:459d:88c7]) by
 EBOX-PROD-SRV15.win.su.se ([fe80::85f3:6da2:459d:88c7%2]) with mapi id
 15.01.2106.002; Fri, 20 Nov 2020 12:49:27 +0100
From: Patrik Holmqvist <patrik.holmqvist@su.se>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: "vh217@werehub.org" <vh217@werehub.org>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: RE: Using WireGuard on Windows as non-admin - proper solution?
Thread-Topic: Using WireGuard on Windows as non-admin - proper solution?
Thread-Index: AQHWuUytyfF/TNfZ4UmGDpBws/KDu6nFQogAgAQILDCABlu7AIABTKXQ
Date: Fri, 20 Nov 2020 11:49:27 +0000
Message-ID: <6c0c1208b52848bea8b1d0f1ac0dfa3a@su.se>
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9p6FoUsFou0LkeUZt4Ba1K4ycuA6f8X4c6Kt8-jzkAH7A@mail.gmail.com>
 <665e0a8610984d938ab013ec2aac8517@su.se>
 <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
In-Reply-To: <CAHmME9rRY-+kdWLnJGsGvZJHDDAChuv2fDSDWOV9_w6=if6tmA@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [130.237.154.250]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Bayes-Prob: 0.0001 (Score 0, tokens from: outbound, outbound-su-se:default,
 su-se:default, base:default, @@RPTN)
X-CanIt-Geo: ip=2001:6b0:5:132:250:56ff:fe94:2456; country=SE; latitude=59.3247;
 longitude=18.0560; http://maps.google.com/maps?q=59.3247,18.0560&z=6
X-CanItPRO-Stream: outbound-su-se:outbound (inherits from
 outbound-su-se:default, su-se:default, base:default)
X-Canit-Stats-ID: 093SzNsSQ - 604d40bef7c6 - 20201120
X-CanIt-Archive-Cluster: PfMRe/vJWMiXwM2YIH5BVExnUnw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=su.se; h=from:to:cc
 :subject:date:message-id:references:in-reply-to:content-type
 :content-transfer-encoding:mime-version; s=canit-v2; bh=vt8nWwRa
 1RwG9/qTnRbj/9TrBu+qKQkcCHtAPWg0pQk=; b=p256zOthjDus64/yK7o8qhjQ
 cgHLZGIywlUmsDJBfWYvNQvn1RH+kYhNY7nLPSw83rThAodadxhdSvgKquxmWdEW
 I5ruw+tFBRv4oMfQ79Vmzj6x+xTQkIFHukm7Meb1jCChDn8/f2tA9mwL+SeplKjL
 r4lKbKWV2v+WcWpGtiRal70tmVIasw0eVR1m85ntViwSNTkYr2v8ftuv2NqDyh8N
 4t1N7nP4kQpprkfkYGKGXgqNQztuYdGYHcTaYglfjGRlwXdJGcnFpl9j1f4b2MO6
 dACykEhwe9j12eVKnBfUYZzsbnAOyzFgSrtlGuZdihMOEI1tfmg+2afhwq863A==
X-Scanned-By: CanIt (www . roaringpenguin . com)
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

SGkgSmFzb24gYW5kIHRoYW5rcyBmb3IgdGhlIHJlcGx5IQ0KDQpJIHdpbGwgZGVzY3JpYmUgb3Vy
IGN1cnJlbnQgd29ya2Zsb3cgYmVsb3c6DQoqIFRoZSBXaXJlR3VhcmQgY2xpZW50IGlzIGluc3Rh
bGxlZCBvbiB0aGUgY29tcHV0ZXIgd2l0aCBvdXIgZGVwbG95bWVudCBzb2x1dGlvbg0KKiBUaGUg
dXNlciBsb2dzIGluIHdpdGggU1NPIGluIG91ciB3ZWItZnJvbnQgWzBdIHdoZXJlIHRoZXkgY2Fu
IGdlbmVyYXRlIG9uZSBvciBtb3JlIGNvbmZpZ3MgKGZvciBleGFtcGxlIG9uZSBmb3IgdGhlaXIg
V2luZG93cyBjb21wdXRlciBhbmQgb25lIGZvciB0aGVpciBwaG9uZSkNCiogVGhleSBkb3dubG9h
ZCB0aGUgY29uZmlnIGZyb20gdGhlIHdlYi1mcm9udA0KKiBTdGFydCBXaXJlR3VhcmQgYW5kIGlt
cG9ydCB0aGUgY29uZmlndXJhdGlvbiBmaWxlDQoqIEFjdGl2YXRlcyB0aGUgdHVubmVsIHdoZW4g
bmVlZGVkDQoNCk5vdCBzdXJlIGlmIHlvdXIgc3VnZ2VzdGVkIHNvbHV0aW9uIHdvdWxkIGFsbG93
IGZvciB0aGlzPyBNYXliZSB0aGVyZSBjb3VsZCBiZSBkaWZmZXJlbnQgbGV2ZWxzIG9mIHBlcm1p
c3Npb25zIGRlcGVuZGluZyBvbiB0aGUgdmFsdWUgeW91IGNvbmZpZ3VyZSB0aGUgcmVnaXN0cnkg
a2V5IHRvIG9yIHNvbWV0aGluZy4NCg0KWzBdIGh0dHBzOi8vZ2l0aHViLmNvbS9FbWJhcmtTdHVk
aW9zL3dnLXVpDQoNCi9CZXN0IHJlZ2FyZHMNClBhdHJpaw0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+IA0KU2Vu
dDogZGVuIDE5IG5vdmVtYmVyIDIwMjAgMTc6NTYNClRvOiBQYXRyaWsgSG9sbXF2aXN0IDxwYXRy
aWsuaG9sbXF2aXN0QHN1LnNlPg0KQ2M6IHZoMjE3QHdlcmVodWIub3JnOyBXaXJlR3VhcmQgbWFp
bGluZyBsaXN0IDx3aXJlZ3VhcmRAbGlzdHMuengyYzQuY29tPg0KU3ViamVjdDogUmU6IFVzaW5n
IFdpcmVHdWFyZCBvbiBXaW5kb3dzIGFzIG5vbi1hZG1pbiAtIHByb3BlciBzb2x1dGlvbj8NCg0K
SGkgUGF0cmlrLA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4gSSB0aGluayB3ZSdsbCBwcm9iYWJs
eSB0YWtlIGEgcm91dGUgc2ltaWxhciB0byB0aGF0LCB3aXRoIFMtMS01LTMyLTU1NiwgYnV0IHdp
bGwgZ2F0ZSBpdCBiZWhpbmQgYSByZWdpc3RyeSBrbm9iIGFuZCBhbmQgd2lsbCBhbGxvdyBvbmx5
IGZvciBzdGFydGluZy9zdG9wcGluZy92aWV3aW5nc3RhdHVzIG9mIHR1bm5lbHMsIGJ1dCBub3Qg
ZWRpdGluZyBvciBleHRyYWN0aW5nIHByaXZhdGUga2V5cy4NCg0KV291bGQgdGhhdCBiZSBwYXNz
YWJsZSBmb3IgeW91Pw0KDQpKYXNvbg0K
