Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2CDC31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:16:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73C1213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A73C1213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ltnglobal.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e608315;
	Tue, 18 Jun 2019 15:15:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95aeec57
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 22:57:38 +0000 (UTC)
Received: from was-smtp1.livetimenet.net
 (50-206-97-56-was-smtp1.livetimenet.net [50.206.97.56])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd6292fb
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 22:57:38 +0000 (UTC)
Received: by was-smtp1.livetimenet.net with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84_2)
 (envelope-from <lkelly@ltnglobal.com>) id 1hbCBV-0008Pf-2j
 for wireguard@lists.zx2c4.com; Wed, 12 Jun 2019 18:57:38 -0400
From: Larry Kelly <lkelly@ltnglobal.com>
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Can I be reasonably sure the code in
 /usr/share/doc/wireguard-tools/examples/embeddable-wg-library will continue
 to exist / work
Message-Id: <CFBC8785-569F-45C0-89A6-A90D063F5E0E@ltnglobal.com>
Date: Wed, 12 Jun 2019 18:57:33 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.100.39)
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:15:47 +0200
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

SGkgQWxs4oCmCgogICBXaGlsZSBJ4oCZbSBub3QgYXNraW5nIGFueW9uZSB0byBwcmVkaWN0IHRo
ZSBmdXR1cmUsIEkgaGF2ZSBiZWd1biB0byB1c2Ugc29tZSBvZiB0aGUgZXhhbXBsZSBjb2RlIHVu
ZGVyIHRoZSAvdXNyL3NoYXJlL2RvYy93aXJlZ3VhcmQtdG9vbHMvZXhhbXBsZXMvZW1iZWRkYWJs
ZS13Zy1saWJyYXJ5LCBhbmQgSSB3YW50ZWQgdG8gYmUgcmVhc29uYWJseSBzdXJlIHRoYXQgbXkg
Y29kZSB3aWxsIGNvbnRpbnVlIHRvIHdvcmvigKYgIEkgdW5kZXJzdGFuZCB0aGF0IHNwZWNpZmlj
IGRhdGEgc3RydWN0dXJlcyBtYXkgY2hhbmdlIGFzIHdpcmVndWFyZCBtYXR1cmVzLCBhbmQgYW0g
cHJlcGFyZWQgdG8gbW9uaXRvciB0aGUgY29kZWJhc2UgZm9yIHRoZXNlIGNoYW5nZXMgYW5kIHVw
ZGF0ZSBhcyBuZWVkZWQsIGJ1dCBJIGp1c3QgZGlkbuKAmXQgd2FudCBhIGxhdGVyIHdpcmVndWFy
ZCByZWxlYXNlIHRvIGp1c3QgY29tcGxldGVseSByZW1vdmUgdGhpcyBzZXQgb2YgY29kZSBhbmQg
bWVjaGFuaXNtLiAgQXMgYSBub3RlLCBoYXZpbmcgdGhpcyBjb2RlIGFuZCBtZXRob2Qgb2YgdXNl
IGlzIGEgYmlnIHBsdXMgZm9yIHdpcmVndWFyZCwgYXMgaXQgYWxsb3dzIG1lIHRvIGNyZWF0ZSBl
c3NlbnRpYWxseSBhIGN1c3RvbWl6ZWQgVlBOIGFwcGxpY2F0aW9uIChhbGxvd2luZyBtZSB0byBw
cm92aWRlIGRpZmZlcmVudCBhdXRoZW50aWNhdGlvbiBtZXRob2RzIHN1Y2ggYXMgaGF2aW5nIHRo
ZSB3aXJlZ3VhcmQga2V5IG9uIGEgc21hcnQgY2FyZCBhbmQgcmVxdWlyaW5nIGluc2VydGlvbiBv
ZiB0aGUgc21hcnQgY2FyZCBpbnRvIGEgY2FyZCByZWFkZXIgb24gYSBsYXB0b3AgaW4gb3JkZXIg
dG8gYWxsb3cgbXkgbGFwdG9wIHRvIGNvbm5lY3QgdG8gdGhlIG5ldHdvcmspLgoKCiAgIFRoYW5r
cyEKCiAgICAgIC1MYXJyeQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNv
bQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
