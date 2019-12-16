Return-Path: <SRS0=hbZ4=2G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FA6C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Dec 2019 05:57:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 554A620717
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Dec 2019 05:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gtt.tools header.i=@gtt.tools header.b="Q4k+sMK1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 554A620717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gtt.tools
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26d55baf;
	Mon, 16 Dec 2019 05:57:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45da6046
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 05:57:02 +0000 (UTC)
Received: from smtp93.ord1d.emailsrvr.com (smtp93.ord1d.emailsrvr.com
 [184.106.54.93])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18196e8e
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gtt.tools;
 s=20170515; t=1576475822;
 bh=n6zR7AbLVaBM6sF7JaF3SKaRYWZglhX+kZ/8BLPs2e0=;
 h=To:From:Subject:Date:From;
 b=Q4k+sMK1FR4jdVla/kKF6t99wH2NP0k9pqbzu8+XO9vD3jVoTZh1AwaU9wsj9jE3i
 ++Xpy7Gmr7GZiZ9k19V5WNiOlYjLf1+yX8P4D+J1L8PflzBRR11BNdmCwNJzQ4z2XS
 kVk8LlZzqkjSlV1j0Oa++sdvhlVyHwd1VTfbm8/g=
X-Auth-ID: dirk@gtt.tools
Received: by smtp20.relay.ord1d.emailsrvr.com (Authenticated sender:
 dirk-AT-gtt.tools) with ESMTPSA id E0186C0109
 for <wireguard@lists.zx2c4.com>; Mon, 16 Dec 2019 00:57:01 -0500 (EST)
X-Sender-Id: dirk@gtt.tools
Received: from [192.168.88.32] ([UNAVAILABLE]. [176.234.155.244])
 (using TLSv1.2 with cipher AES128-SHA) by 0.0.0.0:465 (trex/5.7.12);
 Mon, 16 Dec 2019 00:57:02 -0500
To: wireguard@lists.zx2c4.com
From: Dirk Kaiser <dirk@gtt.tools>
Subject: wireguard-android: Unable to import tunnel: invalid name
Openpgp: preference=signencrypt
Autocrypt: addr=dirk@gtt.tools; keydata=
 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 XpE=
Message-ID: <e391693c-d4c4-91a0-6ebc-72a038d95a6b@gtt.tools>
Date: Mon, 16 Dec 2019 08:57:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
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

SSd2ZSBjcmVhdGVkIHRoZSBmb2xsb3dpbmcgY2xpZW50IGNvbmZpZ3VyYXRpb25zIHdpdGggdGhl
IGZvbGxvd2luZwpmaWxlbmFtZXM6CgpicmF0LmJhdHlyX0xTLlVTX3Rlc3QuY29uZsKgIDw9PWtp
Y2tzIG9mZiBlcnJvcgpwa2RzX0xTLlVTX3Rlc3QuY29uZsKgIDw9PWltcG9ydHMgZmluZQp5X0xT
LlVTX3Rlc3QuY29uZsKgIDw9PWltcG9ydHMgZmluZQp6YXJpbmFfTFMuVVNfdGVzdC5jb25mwqAg
PD09a2lja3Mgb2ZmIGVycm9yCgpPbiB0aGUgQW5kcm9pZCBjbGllbnQsIHRoZSBmaXJzdCBhbmQg
bGFzdCBmaWxlbmFtZSBnZW5lcmF0ZSB0aGUgJ1VuYWJsZQp0byBpbXBvcnQgdHVubmVsOiBpbnZh
bGlkIG5hbWUnIHdoZW4gdHJ5aW5nIHRvIGltcG9ydC7CoCBUaGUgb3RoZXIgdHdvCmNvbWUgaW1w
b3J0IGp1c3QgZmluZS7CoCBJZiBJIHJlbmFtZSB0aGUgdHdvIHByb2JsZW0gZmlsZXMgdG8gc29t
ZXRoaW5nCmVsc2UgKGkuZS4sIGJyYXQuYmF0eXIuY29uZiBhbmQgemFyaW5hLmNvbmYpLCB0aGV5
IGltcG9ydCBqdXN0IGZpbmUuwqAKVGhlcmUgb2J2aW91c2x5IGlzIGEgYnVnIGluIHRoZSBmaWxl
bmFtZSBoYW5kbGluZyB0aGF0IG5lZWRzIHRvIGJlIGZpeGVkLgoKLSBHZW9EaXJrCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWls
aW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
