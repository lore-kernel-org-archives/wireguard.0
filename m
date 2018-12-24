Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F830C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:48:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2638218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="TLDPI3F2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2638218D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f9a4f5c;
	Wed, 2 Jan 2019 18:46:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a364ca7a
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Dec 2018 13:45:28 +0000 (UTC)
Received: from st43p00im-ztfb10071701.me.com (st43p00im-ztfb10071701.me.com
 [17.58.63.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1099fe7b
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Dec 2018 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=04042017; t=1545659201;
 bh=3nyNAlTLrzndJuA1uLV7o6TDBV/CACt4jKeBxVS51qo=;
 h=From:Content-Type:Mime-Version:Date:Subject:Message-Id:To;
 b=TLDPI3F2o0iz7POo5sKPG6RsDzZVUyw3mWm7+tfdPSZSI5+V6WP38XdhNPW6fCKla
 MqmvtHPRMI6PnLDUy6VZ0I34XnrlvcK5pyIQ4YJjw/iN20tKZqwWu0bhWGIjdSZVH1
 QuEBoZotGKYope0B3ROfTBtXCTuK9gNdtFvQbwA3hSG0cCNANJ7D5nPMJgfQXG7otc
 /PMCbEyjwo6/a39If7TdfxCgoPJ0JDJmlpG446Nj3OMKEy0H96ZZxx6Doc3ECUor7Q
 glSt6RWv5H8CT0tDa2422ifEQ0ppl/zKhuDLeo7DWf0g4cmxI8F9xrcWhxJseRwdwW
 PKFTlNw8fV/Ow==
Received: from retgrover.fritz.box
 (HSI-KBW-078-042-189-083.hsi3.kabel-badenwuerttemberg.de [78.42.189.83])
 by st43p00im-ztfb10071701.me.com (Postfix) with ESMTPSA id 390C2AC016E;
 Mon, 24 Dec 2018 13:46:41 +0000 (UTC)
From: Sterrenboer <sterrenboer@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Mon, 24 Dec 2018 14:46:39 +0100
Subject: Re: sysctl of Alpine standard 3.8.1 doesn't support option -r.
Message-Id: <92AA4920-D2F5-4F15-9BAB-9FFCBB6066F7@icloud.com>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.102.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-24_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=465 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1812240122
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:45:59 +0100
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

SGkgRHUsIExvbm5pZSwgSmFzb24gCgpUbyBnZXQgd2ctcXVpY2sgd29ya2luZyBvbiBteSBhbHBp
bmUgZWRnZSwgSSBoYWQgdG8gaW5zdGFsbCAKCi0gYmFzaCBmb3IgL2Jpbi9iYXNoCi0gcHJvY3Bz
IGZvciBzeXN0Y3RsCi0gb3BlbnJlc29sdiBmb3IgZG5zCi0gaXByb3V0ZTIgZm9yIC9zYmluL2lw
CgpJIHN1c3BlY3QgdGhhdCBpdCBpcyB0aGUgc2FtZSBvbiAzLjguMS4gSSBkb27igJl0IGtub3cg
d2h5IHRoZSB3aXJlZ3VhcmQtdG9vbHMgcGFja2FnZSBkb2VzIG5vdCBkZXBlbmQgb24gdGhlbSwg
YXMgd2ctcXVpY2sgZG9lcyBub3Qgd29yayB3aXRob3V0IHRoZW0uICBJIGd1ZXNzIHRoYXQgdGhl
IHJlYXNvbiBpcyB0aGF0IHRoZSB3ZyBiaW5hcnkgaXRzZWxmIGRvZXMgbm90IGRlcGVuZCBvbiB0
aGVt4oCmLiBmb3JtYWxseS4gIElmIHRoYXQgaXMgdGhlIGNhc2UsIHRoZW4gbWF5YmUgaXQgd291
bGQgbWFrZSBzZW5zZSBpZiB3Zy1xdWljayBpcyBpdHMgb3duIHBhY2thZ2UsIHdoaWNoIGNhbiB0
aGVuIGhhdmUgaXRzIG93biBkZXBlbmRlbmNpZXMuCgpUaGFua3MgZm9yIHRoZSBhd2Vzb21lIHdv
cmsgb24gd2lyZWd1YXJkICYgaGFwcHkgaG9saWRheXMuCgpDaGVlcnMsClN0ZXJyZW5ib2VyCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBt
YWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
