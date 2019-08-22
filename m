Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5901C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A0FC2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="KZTFpWNh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A0FC2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 155191e0;
	Sun, 25 Aug 2019 15:44:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9359f36
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Aug 2019 19:11:09 +0000 (UTC)
Received: from st43p00im-zteg10062001.me.com (st43p00im-zteg10062001.me.com
 [17.58.63.166])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec372515
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Aug 2019 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1566501068;
 bh=Xc5C8Trd2eHQUxxjCUxaB5V7GC4FyrI5YbZ4ed0N0dg=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=KZTFpWNhYISkh14Y2iIw1rbiQnDL2sBwSQ/TQoO+QbTznPAdQK05U3+m/Dw3pY9af
 VIIhL/vPR8cG4P4zvM+3usmeWCJEyWY1fsYZvUzBX1ii+R10aFXKjx3N430C74bneL
 knrbnpNdLtZbLgWmBNDBUy6Uz0SLjI8FcdgyIepleCY6vpZ6gVuT8wnRpkVpuqir44
 vGb6GnzCxtZ+CLTipN1thDG9f1Ha3QS9GUWVZlWBl3RRlFKbfnOp8vOv3UsywSetuG
 we1eH4wzBF57V8lnObvVAO036KscCh8UcyC3uewYy+LOYsmJT6GKJqdna/PhXNrMlK
 DP8oWVkt+i20w==
Received: from [127.0.0.1] (unknown [198.143.181.104])
 by st43p00im-zteg10062001.me.com (Postfix) with ESMTPSA id D26436C0928
 for <wireguard@lists.zx2c4.com>; Thu, 22 Aug 2019 19:11:06 +0000 (UTC)
From: Aryn Starr <whereislelouch@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [Feature Request] Add ability to exclude subnets from AllowedIPs
Message-Id: <5301677D-D6E6-4DBB-ADA0-89AFC2D277AE@icloud.com>
Date: Thu, 22 Aug 2019 23:40:55 +0430
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=484 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1908220164
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:44:08 +0200
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

SSBsaXZlIGluIElyYW4sIGFuZCBoZXJlIHRoZSBpbnRlcm5ldCBjZW5zb3JzaGlwIGlzIGZpZXJj
ZS4gSSBuZWVkIHRvIHJvdXRlIGFsbW9zdCBhbGwgb2YgbXkgdHJhZmZpYyB0aHJvdWdoIHRoZSBW
UE4sIGJ1dCBzb21lIGRvbWVzdGljIHNpdGVzIGFyZSBub3QgYWNjZXNzaWJsZSBmcm9tIHRoZSBV
Uy4gQWxzbywgc2luY2UgSVNQcyBhcHBseSBkaWZmZXJlbnQgY2Vuc29yaW5nIHJ1bGVzLCBzb21l
dGltZXMgbXkgb3duIHNlcnZlcnMgYXJlIG5vdCByZWFjaGFibGUgdmlhIHRoZSBWUE4gKGJlY2F1
c2UgdGhlIHNlcnZlcuKAmXMgSVNQIGJsb2NrcyB0aGUgVlBOLCB3aGlsZSBteSBsb2NhbCBJU1Ag
ZG9lcyBub3QuKQpUaGUgYmVzdCBjdXJyZW50IHNvbHV0aW9uIEnigJl2ZSBzZWVuIGlzCmBgYAok
IHB5dGhvbjMKCj4+PiBpbXBvcnQgaXBhZGRyZXNzCj4+PiBuMSA9IGlwYWRkcmVzcy5pcF9uZXR3
b3JrKCcxMDYuMjAzLjIwMi4wLzIzJykKPj4+IG4yID0gaXBhZGRyZXNzLmlwX25ldHdvcmsoJzEw
Ni4yMDMuMjAzLjEzLzMyJykKPj4+IGwgPSBsaXN0KG4xLmFkZHJlc3NfZXhjbHVkZShuMikpCj4+
PiBwcmludChsKQoKYGBgCldoaWNoIGlzIHRlcnJpYmxlLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
