Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3064FC04EBA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:07:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C466F20685
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C466F20685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f459344;
	Mon, 19 Nov 2018 19:01:21 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 312e1221
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Nov 2018 15:55:19 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 679e8031
 for <wireguard@lists.zx2c4.com>;
 Sat, 17 Nov 2018 15:55:19 +0000 (UTC)
Received: from [10.0.0.20] ([193.81.35.23]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MRSeC-1fzsKV0oJ6-00SbfF; Sat, 17
 Nov 2018 17:01:03 +0100
From: Robert Walli <rwalli@gmx.net>
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Date: Sat, 17 Nov 2018 17:01:01 +0100
Subject: Android key-icon in statusbar
Message-Id: <8365521A-0DE2-44B0-BFDF-5AAB82054756@gmx.net>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.101.1)
X-Provags-ID: V03:K1:PHlExXvhVQzGBEUGOOzjFIQ6KOHtSkVUDewvz1adveVOIdiGS9W
 pwSfWXlkpq4VIzerK/g/PujzHOFgMIKLQ1ql0G/obETLK94mpC+Y1ChgYOLhAgHL33mmu6V
 YyYvTb1ccnSQY/SGz6t8DYvKWUkCzViUTu50qMTz9AcgYXN7H0crd4IwN8H4DkL/YBAnFBK
 EJ1KHqfP1IpXpd70OH/Og==
X-UI-Out-Filterresults: notjunk:1;V01:K0:dlns3kj61hs=:hyEoSX2bPb4Vrfb2AsSZfQ
 tJp+ruMz0XABGJUGFo8NtjOdSQjNU87WSAI98lHMPWtksyOUfLSeszRKooeQoit5X7eV89/ml
 QIX3sAIhF8FSpOdI0YzeO9uxkXJBqhjDjaKqbY3zCuEI/RuyE7yFSiZ2Ex4LKrslzElHZ2+DI
 c5QwcfTGlpB0s1uldqSzieylBIMXM5h5LCVEmvqB3OwEDW+ubV5LRccd+HC46UA7emHjDVgdo
 /7mM6bQq8jEHgHZo6jZeYJCq9vf01Zsj0JhcxLtuefmbP8eSnZ/eIcTevg4zFbOW/o+Qp/cgG
 q15/qvosNg4Uib5WGIlDqYk2LekHOagyPP3wXjPZVm7HXSjtVxfRCGwzZ3qr8HB4jKUxbeyvl
 v124B+IXBpHIibv3S2UJsBuH1eCF8709GzT4arjhoX6PySJVnrbftHQXNWbnE9NtXtNYSE4bQ
 xPlQ84+3h8p6Z3RKEAIl2fzWc+/uLiCcZO6SJEIhiEIwvTL2jTiDOmw0xVZspo1dNfda9Qu44
 AI79h3rKHax5aUR5yAGQ0Pi2XX9v0BxZxhOTnQ0DtWfXqsH9bEe1h0C3YvJaWeibKObyrL/3h
 I1JW47En6XlQc1MpGqY4Hxt4zYLM/yKtEf+12WwqVeEHTetFmt1H9LJsL83Mn/rHqW1Q3JAHJ
 isIQa3Bevo9QsiPgGjLCr5LUg7C5FQ9b6403u/ur/6mqu/T/TEGkVBWj8pDYanz0oDQa6p6ZU
 gB3cXVM0dUHqh+KF66F+JQiZMHwCg21r101ebCXMF6mGRvehForGbEetBaQ5sDXaoyqxE3Bjb
 dL+54Re1gmDvvTH7A3LSmTWN5KQVZem45oK5QbqlJXYr/dodfyw9wv4QSRixuP5kaEcYOuQhB
 wx3HDCy72I9uSYiDk+Zh/RqZ28sLyI22KZjVHhcd3/ikrKbYh2sHEh68oGs58Q
X-Mailman-Approved-At: Mon, 19 Nov 2018 20:01:18 +0100
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

SGVsbG8hCgpJ4oCZdiBpbnN0YWxsZWQgd2lyZWd1YXJkLWFwcCBmcm9tIHBsYXkgc3RvcmUgb24g
YW5kcm9pZCA4LjEuCklmIHVzaW5nIHRoZSB1c2Vyc3BhY2UgdmVyc2lvbiBpIGdldCBhICJrZXkt
aWNvbiIgaW4gdGhlIHN0YXR1cy1iYXIgd2hlbiBhIHR1bm5lbCBpcyBhY3RpdmUuClN3aXRjaGlu
ZyB0byB0aGUga2VybmVsIHZlcnNpb24gdGhlIGljb24gaXMgbm90IHdvcmtpbmcgYW55IG1vcmUu
CgpBbnkgc3VnZXN0aW9ucz8KClJvYmVydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56
eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3Vh
cmQK
