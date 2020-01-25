Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCE9C33CB7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AC6206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="T2TKu/sQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7AC6206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26868725;
	Thu, 30 Jan 2020 01:53:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 159a0f2e
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 15:57:26 +0000 (UTC)
Received: from mr85p00im-zteg06023901.me.com (mr85p00im-zteg06023901.me.com
 [17.58.23.192])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a22700a0
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1579967845;
 bh=ekAMZGB3V3q0CAmISHWhy39un2qhFDlSYDqwq3jHcZc=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=T2TKu/sQxQ4Jkpxtf0S2zXGGQVzFtYVr0eaY1sql8M3TfFxXItL5ejiPVNpoNeoc8
 O0gyepE1i635afFhdIFX3xoiFcAxyvlzmweslm/y1Tffait9LjB2xjXIdt2q+Ffu6a
 OK1Vx+stj9EnaBmiTaCSvCer2cOR5gZESlu/RSpw9/Db5S+pSq3fB6xwbE2S20dbg3
 Ojn8vfiDcNdgJjmuKX5FdVRIbzx5qXbFDybRhH8yCgLK2Q4HB1oits14YhSLzu2cfG
 qI2TEArXm9rL00eZtZrAGuZsWxrTW26UuK2Ql8ftawGME513FjcYu47G2345rnGF5E
 yWK8edNXntOEQ==
Received: from [192.168.0.100] (unknown [151.66.239.109])
 by mr85p00im-zteg06023901.me.com (Postfix) with ESMTPSA id 73694960AE8
 for <wireguard@lists.zx2c4.com>; Sat, 25 Jan 2020 15:57:25 +0000 (UTC)
From: Mario Costa <mario.costa@icloud.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: [iOS - macOS] Route all traffic through peer only for IPv6
Message-Id: <94B02F73-F9D3-4C7A-B65C-613CCCB683EB@icloud.com>
Date: Sat, 25 Jan 2020 16:57:22 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2020-01-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-2001250134
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:14 +0100
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

SGkgYWxsLgoKSSBoYXZlIGEgVlBTIHdpdGggSVB2NiBjb25uZWN0aXZpdHkgdGhhdCBJIHVzZSBh
cyBXaXJlR3VhcmQg4oCcc2VydmVy4oCdIGZvciBvdGhlciBwZWVycy4gSSBzdWNjZXNzZnVsbHkg
Y29uZmlndXJlZCBlYWNoIHBlZXIgd2l0aCBhbiBJUHY0IGFuZCBhbiBJUHY2IGFkZHJlc3MsIGJ1
dCBJIGRvbuKAmXQgd2FudCB0byByb3V0ZSBhbGwgdHJhZmZpYyB0aHJvdWdoIHRoZSBzZXJ2ZXIu
IEkgb25seSB3YW50IHRvIHJvdXRlIHRoZSBXaXJlR3VhcmQgSVB2NCBzdWJuZXQgc28gdGhhdCBt
eSBwZWVycyBjYW4gdGFsayB0byB0aGUgc2VydmVyLCBidXQgSSB3YW50IHRoZSByZXN0IG9mIHRo
ZSB2NCBJbnRlcm5ldCB0byBnbyBvdXRzaWRlIG9mIHRoZSB0dW5uZWwuCgpJbiBhZGRpdGlvbiB0
byB0aGF0LCBJ4oCZZCBsaWtlIHRvIGFkZCBJUHY2IGNvbm5lY3Rpdml0eSB0byBteSBwZWVycywg
d2hpY2ggdXN1YWxseSBkb27igJl0IGhhdmUuIFRoZSBwcm9ibGVtIGlzLCB3aGVuIEkgYWRkIHRo
ZSBJUHY2IGNhdGNoYWxsIDo6LzAgdG8gdGhlIEFsbG93ZWRJUHMgc2VjdGlvbiBvZiBteSBpT1Mg
YW5kIG1hY09TIHBlZXJzIHRoZSBJUHY2IHRyYWZmaWMgZ2V0cyBjb3JyZWN0bHkgcm91dGVkLCBi
dXQgSSBjb21wbGV0ZWx5IGxvc2UgSVB2NCBjb25uZWN0aXZpdHkuCgpUaGUgaXNzdWUgc2VlbXMg
cmVsYXRlZCB0byBob3cgdGhlIHJvdXRpbmcgdGFibGVzIGFyZSBjaGFuZ2VkIHdoZW4gV0cgZXN0
YWJsaXNoZXMgdGhlIGNvbm5lY3Rpb24uIFdpdGggOjovMCwgYSBkZWZhdWx0IGdhdGV3YXkgZm9y
IElQdjQgZ2V0cyBhZGRlZCAoaXQgc2F5cyBsaW5rIzIxLCBJIGRvbuKAmXQga25vdyB3aGF0IHRo
YXQgbWVhbnMpLiBJZiBJIGFkZCAwLjAuMC4wLzAgdG9vIHRoZW4gZXZlcnl0aGluZyB3b3JrcyBh
bmQgSSBhcHBlYXIgdG8gaGF2ZSBkdWFsIHN0YWNrLCBidXQgSSBvbmx5IHdhbnQgSVB2NiB0byBi
ZSByb3V0ZWQgdGhvdWdoIHRoZSB0dW5uZWwhCgpJIHRoaW5rIHRoYXQgaWYgb25seSA6Oi8wIGlz
IGNvbmZpZ3VyZWQsIGFuIElQdjQgZGVmYXVsdCBnYXRld2F5IHNob3VsZCBub3QgYmUgYWRkZWQu
IEJ5IHRoZSB3YXksIGEgRGViaWFuIHBlZXIgd2l0aCB0aGUgc2FtZSBjb25maWd1cmF0aW9uIHNl
ZW1zIHRvIHdvcmsgY29ycmVjdGx5IChJUHY2IHRocm91Z2ggdGhlIHR1bm5lbCBhbmQgSVB2NCB0
aHJvdWdoIG15IExBTuKAmXMgZ2F0ZXdheSksIGJ1dCBJ4oCZbSB1c2luZyB3ZyBhbmQgbm90IHdn
LXF1aWNrLiBJIGRvbuKAmXQga25vdyBpZiB0aGlzIGlzc3VlIGlzIGNhdXNlZCBieSB0aGUgaU9T
L21hY09TIGFwcHMgb3IgaWYgd2ctcXVpY2sgcnVucyB1bmRlciB0aG9zZSBhcHBzIGFuZCBjYXVz
ZXMgdGhlIHJvdXRpbmcgcHJvYmxlbS4gTWF5YmUgbGF0ZXIgSSB3aWxsIHRyeSB3Zy1xdWljayBv
biBEZWJpYW4gdG8gc2VlIGhvdyBpdCBhZmZlY3RzIHRoZSByb3V0aW5nIHRhYmxlcywgYnV0IHRo
ZSBhcHBzIHNob3VsZCB3b3JrIHdpdGggdGhlc2Ugc2V0dGluZ3Mgbm9uZXRoZWxlc3MuCgotbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
