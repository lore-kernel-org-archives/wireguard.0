Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58631C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:34:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 27624387;
	Mon, 21 Mar 2022 19:34:52 +0000 (UTC)
Received: from m1351.mail.163.com (m1351.mail.163.com [220.181.13.51])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id b2a43cec
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Mar 2022 22:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=kuLkz
 c3UKFc1Mr4yLNbXZdF1sbSg7zki4EkPn0a4Xpg=; b=pwYEezUEJkZ6iJa59bSq2
 RNhBxI01V+9oLfkkcjcWAn+0GEKAXKBl3UdvZmUjCwxfg0M05VliGX9ItEaY2Ngk
 4bZ30rxLvweEG9OC4sbXwoC+lLxiUVxPI2p9jcEhzLrG0TomIn2+CtqQ3/eIf9JV
 K/q2zpGBSAbFisdRpXEGuk=
Received: from laodeng99$163.com ( [120.230.73.139] ) by
 ajax-webmail-wmsvr51 (Coremail) ; Fri, 18 Mar 2022 06:58:55 +0800 (CST)
X-Originating-IP: [120.230.73.139]
Date: Fri, 18 Mar 2022 06:58:55 +0800 (CST)
From: "Lao Deng" <laodeng99@163.com>
To: wireguard@lists.zx2c4.com
Subject: Introduce Navigation component to Wireguard-Android
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210622(1d4788a8)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7fd66fe3.14e.17f9a1b030e.Coremail.laodeng99@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: M8GowAA36AYyvTNidwMKAA--.8643W
X-CM-SenderInfo: xodrvvlqjzmqqrwthudrp/xtbBth3GdV1uNPLUvwABsH
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Mailman-Approved-At: Mon, 21 Mar 2022 19:34:47 +0000
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

CgpJIGFtIGdvaW5nIHRvIGFkZCBzb21lIHVuLXJlbGF0ZWQgZnVuY3Rpb25zIHRvIFdpcmVndWFy
ZC1BbmRyb2lkIC4gVGhlIGZpbmFsIGFwcC4gc2hvdWxkIGxvb2sgbGlrZSB0aGUgZGVtbyBvZiBj
b20uZ29vZ2xlLmFuZHJvaWQubWF0ZXJpYWwuYm90dG9tbmF2aWdhdGlvbi5Cb3R0b21OYXZpZ2F0
aW9uVmlldyAsCsKgd2hpY2jCoCBjb25zaXN0cyBvZiBhwqAgYm90dG9tIG5hdmlnYXRpb24gY29t
cG9uZW50IGFuZCBzZXZlcmFswqAgaW5kZXBlbmRlbnQgZnJhZ21lbnRzKCBvciBhY3Rpdml0aWVz
ICkgLsKgCgoKSSBhbSB3b25kZXJpbmcgaG93IHRvIGludHJvZHVjZSB0aGlzIG5hdmlnYXRpb24g
Y29tcG9uZW50IHRvIHRoZSB3aXJlZ3VhcmQtYW5kcm9pZMKgIHByb2plY3Qgd2l0aCB0aGUgbGVh
c3QgbW9kaWZpY2F0aW9uIDopIENvdWxkIHlvdSBwbGVhc2Ugc2hlZCBzb21lIGxpZ2h0IG9uIGl0
ID8KVGhhbmt5b3UgZm9yIHlvdXIgYXR0ZW50aW9uIDopwqDCoAoKCsKg
