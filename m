Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A025EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:27:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC241218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 19:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=me.com header.i=@me.com header.b="UwCuwEsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC241218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=me.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbf9d094;
	Wed, 2 Jan 2019 19:25:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a89e1411
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Dec 2018 11:53:38 +0000 (UTC)
Received: from mr85p00im-ztdg06021701.me.com (mr85p00im-ztdg06021701.me.com
 [17.58.23.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ceabaad
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Dec 2018 11:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=04042017;
 t=1545738897; bh=teO9PkSYZ485Q8Lq3N/o+kJ4+QVPkN5f7doHx335q5k=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type;
 b=UwCuwEsIZh0kpo+EKVQr0l/Yv1RIWKYYEfTHr2cUYr4SFq4XkMk4wsSA6kSsBRQqy
 3gzLQjcix4eMLClG/k/eBHsP20CQtPEzRg6wXX5Io0jdj87KmMQYWj0TbeOzm7QG7E
 5UNqJqarkEjbXrRILrQMHOytDVHRQ66CmAA2K7HY4nlKLoSz5JuO8+5gRrvj8FzeQn
 9coojjE0aTmFd8RyzeFe9mbp51zEO7IxCbXpGt+44Lo12XBAzhp7Odu2aBjLX4AZ9c
 7VzvntKoF1F3kbXU/paY+9n9e0ODxDqLaam5QlW9NETRUAFg6HPCjrnziGv7Zyz3cL
 6RhA9ZrPHF5dQ==
Received: from brigid.local (unknown [75.3.244.127])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 8E201A00058;
 Tue, 25 Dec 2018 11:54:57 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: Shankar Ramamoorthy <shankar@me.com>
Subject: Problems on MacOS (Mojave)
Message-ID: <17359ea7-e029-bfac-10d5-213faa7b2c0e@me.com>
Date: Tue, 25 Dec 2018 03:54:56 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.3
MIME-Version: 1.0
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-25_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1812250108
X-Mailman-Approved-At: Wed, 02 Jan 2019 20:25:10 +0100
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

SW5zdGFsbGVkIFdpcmVndWFyZCB2aWEgTWFjUG9ydHMgb24gbWFjaGluZSBydW5uaW5nIG1hY09T
IE1vamF2ZSAxMC4xNC4yLgoKSXQgd29ya2VkIHRoZSB2ZXJ5IGZpcnN0IHRpbWUsIGJ1dCBoYXZl
bid0IGJlZW4gYWJsZSB0byBnZXQgaXQgdG8gd29yawpzaW5jZS4KCkFueSBoZWxwIG9yIHN1Z2dl
c3Rpb25zIGFwcHJlY2lhdGVkLiBHb3J5IGRldGFpbHMgYmVsb3cuCgpNYWNoaW5lczogMTkyLjE2
OC4xMS40NCAobWFjb3MsIDE5Mi4xNjguMS4yKSBhbmQgMTkyLjE2OC4xMS4xNSAoRGViaWFuLAox
OTIuMTY4LjEuMSkKCkkga25vdyB0aGF0IFdpcmVndWFyZCBvbiB0aGUgRGViaWFuIGJveCBpcyB3
b3JraW5nIHByb3Blcmx5IGJlY2F1c2UgSQpjYW4gY29ubmVjdCB0byBpdCBmcm9tIGEgZGlmZmVy
ZW50IHBlZXIuCgptYWNvcyBjb25maWc6CltJbnRlcmZhY2VdCkFkZHJlc3MgPSAxOTIuMTY4LjEu
Mi8yNApQcml2YXRlS2V5ID0ga0piV0xWWDZ0aitQeFY5ZUtUWjBnNGFrSGlQRk9yZVV3c3FzRHJS
WEptbz0KTGlzdGVuUG9ydCA9IDIyMDAKCltQZWVyXQpQdWJsaWNLZXkgPSBIK1JMaW93Uk9qMTQz
WGpuL1A4N1I0cWNTbXQrWDdST2FQVnpYWXJZYjFVPQpBbGxvd2VkSVBzID0gMC4wLjAuMC8wLCA6
Oi8wCkVuZHBvaW50ID0gMTkyLjE2OC4xMS4xNToyMjAwCiMgVGhpcyBpcyBmb3IgaWYgeW914oCZ
cmUgYmVoaW5kIGEgTkFUIGFuZCB3YW50IHRoZSBjb25uZWN0aW9uIHRvIGJlIGtlcHQKYWxpdmUu
ClBlcnNpc3RlbnRLZWVwYWxpdmUgPSAyNQoKRGViaWFuIGNvbmZpZzoKW0ludGVyZmFjZV0KUHJp
dmF0ZUtleSA9IHVNWnp5NDU4aHdlZWh5RmZENFBlbkt3c0gxL2JLSFNuMGF5T1dMa25sMlU9Ckxp
c3RlblBvcnQgPSAyMjAwCgpbUGVlcl0KUHVibGljS2V5ID0gdU0zT3lrRjk0SW9yM0NuUnVkTjZB
d0g0ek5xTjhWaDdDd2N1d1FhQ3QzRT0KQWxsb3dlZElQcyA9IDAuMC4wLjAvMApFbmRwb2ludCA9
IDE5Mi4xNjguMTEuNDQ6MjIwMAojIFRoaXMgaXMgZm9yIGlmIHlvdeKAmXJlIGJlaGluZCBhIE5B
VCBhbmQgd2FudCB0aGUgY29ubmVjdGlvbiB0byBiZSBrZXB0CmFsaXZlLgpQZXJzaXN0ZW50S2Vl
cGFsaXZlID0gMjUKCk91dHB1dCBvZiAic3VkbyB3Zy1xdWljayB1cCB+Ly5jb25maWcvd2lyZWd1
YXJkL3dnMC5jb25mIjoKSU5GTzogKHV0dW4xKSAyMDE4LzEyLzI1IDAzOjQ3OjM1IFN0YXJ0aW5n
IHdpcmVndWFyZC1nbyB2ZXJzaW9uIDAuMC4yMDE4MTIyMgpbK10gSW50ZXJmYWNlIGZvciB3ZzAg
aXMgdXR1bjEKWyNdIHdnIHNldGNvbmYgdXR1bjEgL2Rldi9mZC82MwpbI10gaWZjb25maWcgdXR1
bjEgaW5ldCAxOTIuMTY4LjEuMi8yNCAxOTIuMTY4LjEuMiBhbGlhcwpbI10gaWZjb25maWcgdXR1
bjEgdXAKWyNdIHJvdXRlIC1xIC1uIGFkZCAtaW5ldDYgOjovMSAtaW50ZXJmYWNlIHV0dW4xCnJv
dXRlOiB3cml0aW5nIHRvIHJvdXRpbmcgc29ja2V0OiBOZXR3b3JrIGlzIHVucmVhY2hhYmxlClsj
XSByb3V0ZSAtcSAtbiBhZGQgLWluZXQ2IDgwMDA6Oi8xIC1pbnRlcmZhY2UgdXR1bjEKcm91dGU6
IHdyaXRpbmcgdG8gcm91dGluZyBzb2NrZXQ6IE5ldHdvcmsgaXMgdW5yZWFjaGFibGUKWyNdIHJv
dXRlIC1xIC1uIGFkZCAtaW5ldCAwLjAuMC4wLzEgLWludGVyZmFjZSB1dHVuMQpbI10gcm91dGUg
LXEgLW4gYWRkIC1pbmV0IDEyOC4wLjAuMC8xIC1pbnRlcmZhY2UgdXR1bjEKWyNdIHJvdXRlIC1x
IC1uIGFkZCAtaW5ldCAxOTIuMTY4LjExLjE1IC1nYXRld2F5IDE5Mi4xNjguMTEuMQpbK10gQmFj
a2dyb3VuZGluZyByb3V0ZSBtb25pdG9yCgppZmNvbmZpZyBmb3IgdXR1bjAgYW5kIHV0dW4xOgp1
dHVuMDogZmxhZ3M9ODA1MDxQT0lOVE9QT0lOVCxSVU5OSU5HLE1VTFRJQ0FTVD4gbXR1IDIwMDAK
wqDCoMKgIGluZXQ2IGZlODA6OjY0MzE6MTM4ZDozNTMwOmM2OTYldXR1bjAgcHJlZml4bGVuIDY0
IHNjb3BlaWQgMHhiCsKgwqDCoCBpbmV0IDE5Mi4xNjguMS4yIC0tPiAxOTIuMTY4LjEuMSBuZXRt
YXNrIDB4ZmZmZmZmMDAKwqDCoMKgIG5kNiBvcHRpb25zPTIwMTxQRVJGT1JNTlVELERBRD4KdXR1
bjE6IGZsYWdzPTgwNTE8VVAsUE9JTlRPUE9JTlQsUlVOTklORyxNVUxUSUNBU1Q+IG10dSAxNDIw
CsKgwqDCoCBpbmV0IDE5Mi4xNjguMS4yIC0tPiAxOTIuMTY4LjEuMiBuZXRtYXNrIDB4ZmZmZmZm
MDAKCk91dHB1dCBvZiAibmV0c3RhdCAtYW4gfCBncmVwIHV0dW4iOgpuZXRzdGF0IC1ybiB8IGdy
ZXAgdXR1bgowLzHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXR1bjHCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBVU2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDY3wqDCoMKgwqDCoMKg
wqAgMMKgwqAKdXR1bjHCoMKgwqDCoMKgwqAKMTI4LjAvMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dXR1bjHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBVU2PCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMsKgwqDCoMKgwqDCoMKgIDDCoMKgCnV0dW4xwqDCoMKgwqDCoMKgCjE5Mi4xNjguMS4ywqDC
oMKgwqDCoMKgwqAgMTkyLjE2OC4xLjLCoMKgwqDCoMKgwqDCoCBVSMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDDCoMKgwqDCoMKgwqDCoCAwwqDCoAp1dHVuMcKgwqDCoMKgwqDCoApkZWZhdWx0
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBmZTgwOjoldXR1bjDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oApVR2NJwqDCoMKgwqDCoMKgwqDCoMKgIHV0dW4wwqDCoMKgwqDCoMKgCmZlODA6OiV1dHVuMC82
NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmZTgwOjo2
NDMxOjEzOGQ6MzUzMDpjNjk2JXV0dW4wClVjScKgwqDCoMKgwqDCoMKgwqDCoMKgIHV0dW4wwqDC
oMKgwqDCoMKgCmZlODA6OjY0MzE6MTM4ZDozNTMwOmM2OTYldXR1bjDCoMKgwqDCoMKgwqDCoMKg
IGxpbmsjMTHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAK
VUhMScKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG8wwqDCoMKgwqDCoMKgCmZmMDE6OiV1dHVuMC8z
MsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmZTgwOjo2
NDMxOjEzOGQ6MzUzMDpjNjk2JXV0dW4wClVtQ0nCoMKgwqDCoMKgwqDCoMKgwqAgdXR1bjDCoMKg
wqDCoMKgwqAKZmYwMjo6JXV0dW4wLzMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGZlODA6OjY0MzE6MTM4ZDozNTMwOmM2OTYldXR1bjAKVW1DScKgwqDC
oMKgwqDCoMKgwqDCoCB1dHVuMMKgwqDCoMKgCgpCb3RoICJwaW5nIDE5Mi4xNjguMS4xIiBhbmQg
InBpbmcgMTkyLjE2OC4xLjIiIHJlcG9ydCBSZXF1ZXN0IHRpbWVvdXQuCgpJJ20gYWxzbyBub3Qg
YWJsZSB0byBnZXQgcmlkIG9mIHRoZSB1dHVuMCBpbnRlcmZhY2UsIHdoaWNoIGRpZCBub3QgZXhp
c3QKYmVmb3JlIFdpcmVndWFyZCBJIHRoaW5rLgpTaGFua2FyCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1
YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL3dpcmVndWFyZAo=
