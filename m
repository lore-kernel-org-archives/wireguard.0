Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50657C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:29:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6873206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=davidlane.io header.i=@davidlane.io header.b="AFtg2TlC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hEuiD9y6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6873206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davidlane.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae694e2a;
	Sun, 25 Aug 2019 15:29:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fadc9e76
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 15:17:02 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fede22ba
 for <wireguard@lists.zx2c4.com>; Tue, 6 Aug 2019 15:17:02 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0EBA921D28
 for <wireguard@lists.zx2c4.com>; Tue,  6 Aug 2019 11:17:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 06 Aug 2019 11:17:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=davidlane.io; h=
 content-type:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to; s=fm2; bh=033szGoXAYdCbWMewZDmkXmEzUiTR/
 0eZAQ+0PvA1aw=; b=AFtg2TlCzrx/HgmZyQCPAy2AiXWTb9tGbLJ+Pf5IbuzJYv
 MUirOUj7BZEIvr502BemXMZPQhtZQmKVKF48mKid7/i2Sbuj4sWaULXdff9uoR17
 T67AOspz6JXuiCJZHKzfd6+gfxhn69oLBCAlEHYFfrNfL7CMQGMPeOfqjkrFUcUM
 nTSrlKXvJLuwRMYkTDWSzBuEUWyhJBUiHgy5zRDMDqmK+qWFl5FUgTzjrOabWini
 sFee5tMJlO86oBgrVKCk7iHALqFemgxKEZcembkZF635mNrLEGU/E5E5JCyJdmMt
 ZVbpRggJe/39in27vGSCKt7TtQJU1250968gkHtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=033szG
 oXAYdCbWMewZDmkXmEzUiTR/0eZAQ+0PvA1aw=; b=hEuiD9y672+XJIp3UHWpOp
 /IJFrrQwy4bEIEvJVUbZsRFEynaFMn/DDat3CAIiPas3Eaq71rjvIfUbpPNtvjJU
 Sw7XV4x35/DWbEN4Bn8fdEWuflyXuWDhhT/9xZFnHHSfGYHEow2bzB4FOrYlWtnD
 +k00wMVYz9nYEIsAXJ/p0su8911mu55C8/tp3bAc+ZvzfXqfhel42oqcmOM8wflI
 MULvKZURLNCmS2UIgGqDeur0mtWSJi030ajEIJ1bmQqgWQTOLjmONBIttOUTRzGo
 KaouHTGOBFU77VS/BviWVMKDdTKrSMnaVrgQDm7vPv7lD3QWSjJqhYHqhD4niU0A
 ==
X-ME-Sender: <xms:7ZlJXV9FUMVpAsfaiMGRQyKgYCMuscM17ZXt8HM0SwsPahqht6VImQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpegtgffhggffuffkvffosehtqhhmtd
 hhtdejnecuhfhrohhmpeffrghvihguucfnrghnvgcuoegurghvihgusegurghvihgulhgr
 nhgvrdhioheqnecuffhomhgrihhnpeiggidrgiiggienucfkphepudekkedrudeifedrge
 dvrddvudegnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurghvihgusegurghvihgulhgr
 nhgvrdhiohenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7ZlJXVL1XXYFNIq-faitEU4MLcUDsQPskJFlK1Go-O0OfAYY8JlhcQ>
 <xmx:7ZlJXRtG8mPruY5E2o5WgNsDkt8Y1Rmod6rY6GQz-Ee5bBe338Y74Q>
 <xmx:7ZlJXWlKqpwrYJslTYfkZQKK_TCK10B3b6Sp3NS6Zv6BxNRsqOPpCQ>
 <xmx:7ZlJXcYaAv6kt08BUVQ4ZWbjQKRGYQGqJiD9gtsb35d8MRKclKMoXg>
Received: from [192.168.1.2] (unknown [188.163.42.214])
 by mail.messagingengine.com (Postfix) with ESMTPA id 39D273800A0
 for <wireguard@lists.zx2c4.com>; Tue,  6 Aug 2019 11:17:01 -0400 (EDT)
From: David Lane <david@davidlane.io>
Mime-Version: 1.0 (1.0)
Date: Tue, 6 Aug 2019 18:16:58 +0300
Subject: Wireguard not working on iOS 13 Beta
Message-Id: <75AC1513-1F06-44D0-9700-06AE7FC814D0@davidlane.io>
To: wireguard@lists.zx2c4.com
X-Mailer: iPad Mail (17A5547d)
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:29:25 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGkgZXZlcnlvbmUsCgpXaXJlZ3VhcmQgaGFzbid0IHdvcmtlZCBzaW5jZSBJIGluc3RhbGxlZCB0
aGUgaU9TIDEzIGJldGEgb24gbXkgaVBhZCAoMjAxNyBQcm8sIDEyLjkiKS4KCkhlcmUncyB0aGUg
bG9nIGZyb20gY29ubmVjdGluZyBhbmQgZGlzY29ubmVjdGluZyBmcm9tIG15IGlQYWQ6Cj4gMjAx
OS0wOC0wNiAxNzo1NDoxNS4wNDk0Nzc6IFtORVRdIEFwcCB2ZXJzaW9uOiAwLjAuMjAxOTA2MDkg
KDExKTsgR28gYmFja2VuZCB2ZXJzaW9uOiAwLjAuMjAxOTA1MTcKPiAyMDE5LTA4LTA2IDE3OjU0
OjE1LjMwMjk4NDogW05FVF0gU3RhcnRpbmcgdHVubmVsIGZyb20gdGhlIE9TIGRpcmVjdGx5LCBy
YXRoZXIgdGhhbiB0aGUgYXBwCj4gMjAxOS0wOC0wNiAxNzo1NDoxNS40NDYzNDU6IFtORVRdIFR1
bm5lbCBpbnRlcmZhY2UgaXMgdXR1bjIKPiAyMDE5LTA4LTA2IDE3OjU0OjE1LjQ0ODY3NzogW05F
VF0gRE5TNjQ6IG1hcHBlZCBYWFguWFguWFhYLjIyNiB0byBpdHNlbGYuCj4gMjAxOS0wOC0wNiAx
Nzo1NDoxNS40NDk3OTU6IFtORVRdIEF0dGFjaGluZyB0byBpbnRlcmZhY2UKPiAyMDE5LTA4LTA2
IDE3OjU0OjE1LjQ1MTIwNTogW05FVF0gUm91dGluZTogZW5jcnlwdGlvbiB3b3JrZXIgLSBzdGFy
dGVkCj4gMjAxOS0wOC0wNiAxNzo1NDoxNS40NTEyNjY6IFtORVRdIFJvdXRpbmU6IGVuY3J5cHRp
b24gd29ya2VyIC0gc3RhcnRlZAo+IDIwMTktMDgtMDYgMTc6NTQ6MTUuNDUyODQzOiBbTkVUXSBS
b3V0aW5lOiBkZWNyeXB0aW9uIHdvcmtlciAtIHN0YXJ0ZWQKPiAyMDE5LTA4LTA2IDE3OjU0OjE1
LjQ1NDgwMTogW05FVF0gUm91dGluZTogaGFuZHNoYWtlIHdvcmtlciAtIHN0YXJ0ZWQKPiAyMDE5
LTA4LTA2IDE3OjU0OjE1LjQ1NzcyNTogW05FVF0gUm91dGluZTogaGFuZHNoYWtlIHdvcmtlciAt
IHN0YXJ0ZWQKPiAyMDE5LTA4LTA2IDE3OjU0OjE1LjQ2MjgwNDogW05FVF0gUm91dGluZTogZGVj
cnlwdGlvbiB3b3JrZXIgLSBzdGFydGVkCj4gMjAxOS0wOC0wNiAxNzo1NDoxNS40NjQwNDU6IFtO
RVRdIFJvdXRpbmU6IFRVTiByZWFkZXIgLSBzdGFydGVkCj4gMjAxOS0wOC0wNiAxNzo1NDoxNS40
Njc0NzQ6IFtORVRdIFJvdXRpbmU6IGV2ZW50IHdvcmtlciAtIHN0YXJ0ZWQKPiAyMDE5LTA4LTA2
IDE3OjU0OjE1LjQ4Mjc5NjogW05FVF0gVUFQSTogVXBkYXRpbmcgcHJpdmF0ZSBrZXkKPiAyMDE5
LTA4LTA2IDE3OjU0OjE1LjQ4MzE4NDogW05FVF0gVUFQSTogUmVtb3ZpbmcgYWxsIHBlZXJzCj4g
MjAxOS0wOC0wNiAxNzo1NDoxNS40ODM5NTg6IFtORVRdIFVBUEk6IFRyYW5zaXRpb24gdG8gcGVl
ciBjb25maWd1cmF0aW9uCj4gMjAxOS0wOC0wNiAxNzo1NDoxNS40ODYwMDQ6IFtORVRdIHBlZXIo
QUFBQeKApkFBQUEpIC0gVUFQSTogVXBkYXRpbmcgZW5kcG9pbnQKPiAyMDE5LTA4LTA2IDE3OjU0
OjE1LjQ4OTQ4MzogW05FVF0gcGVlcihBQUFB4oCmQUFBQSkgLSBVQVBJOiBVcGRhdGluZyBwZXJz
aXN0ZW50IGtlZXBhbGl2ZSBpbnRlcnZhbAo+IDIwMTktMDgtMDYgMTc6NTQ6MTUuNDg5OTYyOiBb
TkVUXSBwZWVyKEFBQUHigKZBQUFBKSAtIFVBUEk6IFJlbW92aW5nIGFsbCBhbGxvd2VkaXBzCj4g
MjAxOS0wOC0wNiAxNzo1NDoxNS40OTA1NzY6IFtORVRdIHBlZXIoQUFBQeKApkFBQUEpIC0gVUFQ
STogQWRkaW5nIGFsbG93ZWRpcAo+IDIwMTktMDgtMDYgMTc6NTQ6MTUuNDkxODc2OiBbTkVUXSBw
ZWVyKEFBQUHigKZBQUFBKSAtIFVBUEk6IEFkZGluZyBhbGxvd2VkaXAKPiAyMDE5LTA4LTA2IDE3
OjU0OjE1LjQ5NDU1NzogW05FVF0gUm91dGluZTogcmVjZWl2ZSBpbmNvbWluZyBJUHY0IC0gc3Rh
cnRlZAo+IDIwMTktMDgtMDYgMTc6NTQ6MTUuNDk2Mzk3OiBbTkVUXSBSb3V0aW5lOiByZWNlaXZl
IGluY29taW5nIElQdjYgLSBzdGFydGVkCj4gMjAxOS0wOC0wNiAxNzo1NDoxNS40OTgwMDA6IFtO
RVRdIFVEUCBiaW5kIGhhcyBiZWVuIHVwZGF0ZWQKPiAyMDE5LTA4LTA2IDE3OjU0OjE1LjQ5OTk3
NDogW05FVF0gRGV2aWNlIHN0YXJ0ZWQKPiAyMDE5LTA4LTA2IDE3OjU0OjE2LjMzNjI5ODogW05F
VF0gTmV0d29yayBjaGFuZ2UgZGV0ZWN0ZWQgd2l0aCBzYXRpc2ZpZWQgcm91dGUgYW5kIGludGVy
ZmFjZSBvcmRlciBbZW4wLCB1dHVuMl0KPiAyMDE5LTA4LTA2IDE3OjU0OjE2LjMzNzEwMzogW05F
VF0gRE5TNjQ6IG1hcHBlZCBYWFguWFguWFhYLjIyNiB0byBpdHNlbGYuCj4gMjAxOS0wOC0wNiAx
Nzo1NDoxNi4zMzgyOTI6IFtORVRdIFVBUEk6IFRyYW5zaXRpb24gdG8gcGVlciBjb25maWd1cmF0
aW9uCj4gMjAxOS0wOC0wNiAxNzo1NDoxNi4zNDA4NDI6IFtORVRdIHBlZXIoQUFBQeKApkFBQUEp
IC0gVUFQSTogVXBkYXRpbmcgZW5kcG9pbnQKPiAyMDE5LTA4LTA2IDE3OjU0OjE2LjM0MTk4Njog
W05FVF0gUm91dGluZTogcmVjZWl2ZSBpbmNvbWluZyBJUHY0IC0gc3RvcHBlZAo+IDIwMTktMDgt
MDYgMTc6NTQ6MTYuMzQzOTgwOiBbTkVUXSBSb3V0aW5lOiByZWNlaXZlIGluY29taW5nIElQdjYg
LSBzdG9wcGVkCj4gMjAxOS0wOC0wNiAxNzo1NDoxNi4zNDYwODQ6IFtORVRdIFJvdXRpbmU6IHJl
Y2VpdmUgaW5jb21pbmcgSVB2NCAtIHN0YXJ0ZWQKPiAyMDE5LTA4LTA2IDE3OjU0OjE2LjM0Nzg1
MDogW05FVF0gUm91dGluZTogcmVjZWl2ZSBpbmNvbWluZyBJUHY2IC0gc3RhcnRlZAo+IDIwMTkt
MDgtMDYgMTc6NTQ6MTYuMzUzNDAzOiBbTkVUXSBVRFAgYmluZCBoYXMgYmVlbiB1cGRhdGVkCj4g
MjAxOS0wOC0wNiAxNzo1NDozNC43NjY4MDE6IFtORVRdIE5ldHdvcmsgY2hhbmdlIGRldGVjdGVk
IHdpdGggc2F0aXNmaWVkIHJvdXRlIGFuZCBpbnRlcmZhY2Ugb3JkZXIgW2VuMF0KPiAyMDE5LTA4
LTA2IDE3OjU0OjM0Ljc2NzM1NjogW05FVF0gRE5TNjQ6IG1hcHBlZCBYWFguWFguWFhYLjIyNiB0
byBpdHNlbGYuCj4gMjAxOS0wOC0wNiAxNzo1NDozNC43Njg1NTQ6IFtORVRdIFVBUEk6IFRyYW5z
aXRpb24gdG8gcGVlciBjb25maWd1cmF0aW9uCj4gMjAxOS0wOC0wNiAxNzo1NDozNC43NzA0NzE6
IFtORVRdIHBlZXIoQUFBQeKApkFBQUEpIC0gVUFQSTogVXBkYXRpbmcgZW5kcG9pbnQKPiAyMDE5
LTA4LTA2IDE3OjU0OjM0Ljc3Mjk4MTogW05FVF0gUm91dGluZTogcmVjZWl2ZSBpbmNvbWluZyBJ
UHY0IC0gc3RvcHBlZAo+IDIwMTktMDgtMDYgMTc6NTQ6MzQuNzc0NTQyOiBbTkVUXSBSb3V0aW5l
OiByZWNlaXZlIGluY29taW5nIElQdjYgLSBzdG9wcGVkCj4gMjAxOS0wOC0wNiAxNzo1NDozNC43
Nzg1MDQ6IFtORVRdIFJvdXRpbmU6IHJlY2VpdmUgaW5jb21pbmcgSVB2NCAtIHN0YXJ0ZWQKPiAy
MDE5LTA4LTA2IDE3OjU0OjM0Ljc3ODcxMjogW05FVF0gUm91dGluZTogcmVjZWl2ZSBpbmNvbWlu
ZyBJUHY2IC0gc3RhcnRlZAo+IDIwMTktMDgtMDYgMTc6NTQ6MzQuNzgwNTg0OiBbTkVUXSBVRFAg
YmluZCBoYXMgYmVlbiB1cGRhdGVkCj4gMjAxOS0wOC0wNiAxNzo1NDozNS4wNzYzNjk6IFtORVRd
IFN0b3BwaW5nIHR1bm5lbAo+IDIwMTktMDgtMDYgMTc6NTQ6MzUuMDc2NDc5OiBbTkVUXSBEZXZp
Y2UgY2xvc2luZwo+IDIwMTktMDgtMDYgMTc6NTQ6MzUuMDc5MDg3OiBbTkVUXSBSb3V0aW5lOiBU
VU4gcmVhZGVyIC0gc3RvcHBlZAoKCkkgcmFuIHRjcGR1bXAgb24gbXkgVWJ1bnR1IFZQUywgYnV0
IGl0IGRpZG4ndCBzZWUgYW55IHBhY2tldHMuCk9uIG15IEFuZHJvaWQgcGhvbmUsIGV2ZXJ5dGhp
bmcgd29ya3MgZmluZS4KCkZvciB3aGF0IGl0J3Mgd29ydGgsIEkndmUgZ290IGJvdGggSVB2NCAm
IElQdjYgc2V0dXAgaW4gbXkgY29uZmlnczoKPiBbUGVlcl0KPiBQdWJsaWNLZXkgPSBbcmVkYWN0
ZWRdCj4gQWxsb3dlZElQcyA9IDEwLjAuMC4yLzMyLCBmZGRjOjg2ZTc6ZDMzOjk3NjU6OjIvMTI4
Cj4gRW5kcG9pbnQgPSBYWC5YWFguWFhYLlhYOjE1Njg1CgpUaGFua3MgaW4gYWR2YW5jZSBmb3Ig
YW55IGhlbHAhCgpCZXN0LAoKRGF2aWQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengy
YzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJk
Cg==
