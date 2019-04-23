Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F341AC04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF33206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF33206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hetzner-cloud.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3818c33d;
	Mon, 6 May 2019 20:35:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7e0f844
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Apr 2019 09:49:12 +0000 (UTC)
Received: from dediextern.your-server.de (dediextern.your-server.de
 [85.10.215.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 774208f2
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Apr 2019 09:49:12 +0000 (UTC)
Received: from [78.46.172.3] (helo=sslproxy06.your-server.de)
 by dediextern.your-server.de with esmtpsa
 (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89_1)
 (envelope-from <joshua.grimm@hetzner-cloud.de>) id 1hIs35-0004se-12
 for wireguard@lists.zx2c4.com; Tue, 23 Apr 2019 11:49:11 +0200
Received: from [217.110.77.26] (helo=[172.30.1.151])
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.89)
 (envelope-from <joshua.grimm@hetzner-cloud.de>) id 1hIs34-000Kac-Ss
 for wireguard@lists.zx2c4.com; Tue, 23 Apr 2019 11:49:10 +0200
To: wireguard@lists.zx2c4.com
From: Joshua Grimm <joshua.grimm@hetzner-cloud.de>
Subject: Wireguard Link issue
Openpgp: preference=signencrypt
Autocrypt: addr=joshua.grimm@hetzner-cloud.de; keydata=
 mQENBFsRE2wBCACudCsfCQ/yC9WAgxheqDcVl9zZeK9filDpQ6ox9saK63Ce8iBWBK314Mk5
 ccMaxSQhLqfqj73vf1PoUeqinSv6ZZeJafiBKn/gPqBgVIa3r5Wc7rEvDR/4yETLnoeEttzh
 TXE0rfI94qXT3KTDzPWXsQ7QGJjycdSxr+XTAElv6rK+SaoH3NWniaHku+3Tayf9OVaMB1vM
 N+CsextGBOhFrmRKktQhus7n+/zLuIJ0OOqj0ZwWba/BawEcLcs2qZDPqrPIz1s2jjQGQuWY
 04HKsNM7OhgJ7qKa0mvv+FG6qQPoR4kjgGrMdleAjK2OfTwzLzb9MrQNmCm/BvxViAV1ABEB
 AAG0LEpvc2h1YSBHcmltbSA8am9zaHVhLmdyaW1tQGhldHpuZXItY2xvdWQuZGU+iQFUBBMB
 CAA+FiEEilyPo5/MMhJ+n7MlKk07Jn3doXcFAlsRE3ACGwMFCQHhM4AFCwkIBwIGFQoJCAsC
 BBYCAwECHgECF4AACgkQKk07Jn3doXeMkQgAkx3OuBclK8GZRUz8ACh/Hw3hOrPXM4E3wzKn
 +R3jP1d4GA6FWcdjIOT/Eq7kyjLdH+OR2f48qqSBsgWynLdV70Uo6vB15HbIhebcJn5KyjDL
 BUl/sCrHhrFqFjtxlc05O97SfxdvWhgYiSP/zaF/66SWYrdabq8B3BxMIeqaGVLyfoA7AL/H
 gjQNqC1E7nnF5gXVpcvSD1qyESJ95Y3Ku8ykGuNVbUgNxSG3Q4XkWkyjSpfD8dMve0gjE++b
 FWqyyOY6OI16uOCd7qnTv9iOu0YD9NOHFflfx0KcnQgFIwTB9LKCh81uZKEeDYAlCy5dbHtL
 H0BztxBWibL/C+xQebkBDQRbERNvAQgAkIifDT7S8GUTrG9yg/0evogo5oWDK/GWhgkTbdP1
 g7E+ZuTnFS0Al6t5QeS7EHDA9/CBf9NcC1Mnz5XYx1kqitDViGNEkXG+s8ADXiNF3d6p38QZ
 hEmbscftS8LUNLmuTfAno4oYHytgAb0xvIfg5QwTz1YlHp/dkaD+mSDhDOTwfw4xhUHQnmPi
 oP133N5A6OH/MrVaxcyQAD2asN4/r3SVGMF06vp88A3LVSD79LZZSX88Btgub69x06QRYn9j
 lp5o6WRgzcd3rjh2T1psTafrL4FdNVpbz/JmWZIl96ygdnmIGuGrN1tIWSqWHasNSEUweaX0
 33ZX60XtJyD+OwARAQABiQE8BBgBCAAmFiEEilyPo5/MMhJ+n7MlKk07Jn3doXcFAlsRE28C
 GwwFCQHhM4AACgkQKk07Jn3doXeeRwf+IPQ44QhXBr/fMXFK0ruNCYrLERmzrQSYd6pifn0Z
 G3FtJrqGjS3NhTnnegt1+PPYON+ienATgPmGc+7lGLv9Jcy96nR+VtRFPkqL+LI+iI4toPVu
 U0ud2xe/ABLApi3UjKsq8XKgb2YgtrxqphDEOLxxVnbH2/BqeSvXdBwU2o5sCITFeyEwEEje
 EMv/o+CEvr2Wv13cM/TtZMiuqsRuqKl3i3ndl1X3oRAPSjHHHcV3LDA1VYdDBgZnQ4BZw75r
 k2wrCSUDm+iDbJA345vg2QZZiH0iYZLro/SzgG6q4zc7QWuBf+3s8f19+TLDp8ZK1XaA0lPP
 MVWoKB5Cp60yoQ==
Message-ID: <e31bad62-8b62-eaaa-30a1-6aaff6060881@hetzner-cloud.de>
Date: Tue, 23 Apr 2019 11:49:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
X-Authenticated-Sender: joshua.grimm@hetzner-cloud.de
X-Virus-Scanned: Clear (ClamAV 0.100.3/25428/Tue Apr 23 10:00:55 2019)
X-Mailman-Approved-At: Mon, 06 May 2019 22:35:06 +0200
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

SGV5IEd1eXMsCgpJIGhhdmUgdXNlZCBXaXJlZ3VhcmQgZm9yIHF1aXRlIHNvbWUgdGltZSBub3cg
YW5kIEknbSBmYWNpbmcgYSBwcm9ibGVtLgoKZXZlcnkgb3RoZXIgZGF5IG9uZSB3aXJlZ3VhcmQg
bGluayBzdG9wcyB3b3JraW5nLiBJdCBqdXN0IHN0b3BzCmFjY2VwdGluZyB0cmFmZmljOgoKcm9v
dEBibGFkZXJ1bm5lci0yOn4jIHBpbmcgLWMgMSAxMC4wLjEuMQpQSU5HIDEwLjAuMS4xICgxMC4w
LjEuMSkgNTYoODQpIGJ5dGVzIG9mIGRhdGEuCgotLS0gMTAuMC4xLjEgcGluZyBzdGF0aXN0aWNz
IC0tLQoxIHBhY2tldHMgdHJhbnNtaXR0ZWQsIDAgcmVjZWl2ZWQsIDEwMCUgcGFja2V0IGxvc3Ms
IHRpbWUgMG1zCgp3ZyB0ZWxscyBtZSB0aGF0IHRoZSBsaW5rIGlzIHVwIGFuZCBoYW5kc2hha2Vz
IGFyZSBzdGlsbCB3b3JraW5nOgoKcGVlcjogUTdwTzZYVWVCS2kyZHRTWk9JeVhqcGt5VUVTYnZH
SGZTRjdjdTFLbUQxZz0KwqAgZW5kcG9pbnQ6IHJlZGFjdGVkOjUxODIwCsKgIGFsbG93ZWQgaXBz
OiAwLjAuMC4wLzAKwqAgbGF0ZXN0IGhhbmRzaGFrZTogMTEgc2Vjb25kcyBhZ28KwqAgdHJhbnNm
ZXI6IDE2Mi42NyBHaUIgcmVjZWl2ZWQsIDguMzIgR2lCIHNlbnQKwqAgcGVyc2lzdGVudCBrZWVw
YWxpdmU6IGV2ZXJ5IDEgbWludXRlCgppZiBJIHJlc3RhcnQgdGhlIGxpbmsgd2l0aAoKc3lzdGVt
Y3RsIHJlc3RhcnQgd2ctcXVpY2tAd2cwCgppdCB3b3JrcyBhZ2Fpbi4KCkhlcmUgaXMgdGhlIHJl
bGV2ZW50IHBhcnQgb2YgbXkgY29uZmlnOgoKW0ludGVyZmFjZV0KQWRkcmVzcyA9IDEwLjAuMS4z
ClByaXZhdGVLZXkgPSByZWRhY3RlZApMaXN0ZW5Qb3J0ID0gNTE4MjAKVGFibGUgPSBvZmYKRndN
YXJrID0gMTIzNAoKW1BlZXJdClB1YmxpY0tleSA9IHJlZGFjdGVkCkFsbG93ZWRJcHMgPSAwLjAu
MC4wLzAKRW5kcG9pbnQgPSByZWRhY3RlZDo1MTgyMApQZXJzaXN0ZW50S2VlcGFsaXZlPTYwCgpJ
IHRyaWVkIHJ1bm5pbmcgd2lyZWd1YXJkIGluIHRoaXMgZGVidWcgbW9kZSB3aXRoCgplY2hvICJt
b2R1bGUgd2lyZWd1YXJkICtwIiA+L3N5cy9rZXJuZWwvZGVidWcvZHluYW1pY19kZWJ1Zy9jb250
cm9sCgp0aGUgb25seSBtZXNzYWdlcyBJIGdldCBhcmU6CgpbNjc3NTY5LjEwNTU1MV0gd2lyZWd1
YXJkOiB3ZzA6IFNlbmRpbmcgaGFuZHNoYWtlIGluaXRpYXRpb24gdG8gcGVlciAxCihyZWRhY3Rl
ZDo1MTgyMCkKWzY3NzU2OS4xMTY3NDRdIHdpcmVndWFyZDogd2cwOiBSZWNlaXZpbmcgaGFuZHNo
YWtlIHJlc3BvbnNlIGZyb20gcGVlciAxCihyZWRhY3RlZDo1MTgyMCkKWzY3NzU2OS4xMTY3NjFd
IHdpcmVndWFyZDogd2cwOiBLZXlwYWlyIDI4NTUxIGRlc3Ryb3llZCBmb3IgcGVlciAxCls2Nzc1
NjkuMTE2NzY1XSB3aXJlZ3VhcmQ6IHdnMDogS2V5cGFpciAyODU1NCBjcmVhdGVkIGZvciBwZWVy
IDEKWzY3NzU2OS4xMTY3NzVdIHdpcmVndWFyZDogd2cwOiBTZW5kaW5nIGtlZXBhbGl2ZSBwYWNr
ZXQgdG8gcGVlciAxCihyZWRhY3RlZDo1MTgyMCkKWzY3NzU4NS4xMDU2MDNdIHdpcmVndWFyZDog
d2cwOiBSZXRyeWluZyBoYW5kc2hha2Ugd2l0aCBwZWVyIDEKKHJlZGFjdGVkOjUxODIwKSBiZWNh
dXNlIHdlIHN0b3BwZWQgaGVhcmluZyBiYWNrIGFmdGVyIDE1IHNlY29uZHMKWzY3NzU4NS4xMDU2
NDRdIHdpcmVndWFyZDogd2cwOiBTZW5kaW5nIGhhbmRzaGFrZSBpbml0aWF0aW9uIHRvIHBlZXIg
MQoocmVkYWN0ZWQ6NTE4MjApCls2Nzc1ODUuMTEyODc3XSB3aXJlZ3VhcmQ6IHdnMDogUmVjZWl2
aW5nIGhhbmRzaGFrZSByZXNwb25zZSBmcm9tIHBlZXIgMQoocmVkYWN0ZWQ6NTE4MjApCls2Nzc1
ODUuMTEyODkzXSB3aXJlZ3VhcmQ6IHdnMDogS2V5cGFpciAyODU1MyBkZXN0cm95ZWQgZm9yIHBl
ZXIgMQpbNjc3NTg1LjExMjg5OF0gd2lyZWd1YXJkOiB3ZzA6IEtleXBhaXIgMjg1NTUgY3JlYXRl
ZCBmb3IgcGVlciAxCls2Nzc1ODUuMTEyOTA3XSB3aXJlZ3VhcmQ6IHdnMDogU2VuZGluZyBrZWVw
YWxpdmUgcGFja2V0IHRvIHBlZXIgMQoocmVkYWN0ZWQ6NTE4MjApCgpIZXJlIGFyZSBzb21lIG1v
cmUgZGV0YWlsczoKCnRoaXMgaXMgYSA2IG5vZGUgbmV0d29yayB3aXRoIG9uZSBub2RlIGFjdGlu
ZyBhcyBnYXRld2F5LCBJIHNldCB0aGUKcm91dGVzIHZpYSBQcmVVcC9Qb3N0VXAgYW5kIHJlbW92
ZSB0aGVtIHZpYSBQcmVEb3duL1Bvc3REb3duLgoKcm9vdEBibGFkZXJ1bm5lci0yOn4jIHVuYW1l
IC1hCkxpbnV4IGJsYWRlcnVubmVyLTIgNC40LjAtMTQ1LWdlbmVyaWMgIzE3MS1VYnVudHUgU01Q
IFR1ZSBNYXIgMjYKMTI6NDM6NDAgVVRDIDIwMTkgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xp
bnV4Cgpyb290QGJsYWRlcnVubmVyLTI6fiMgaXAgbGluayBzaG93IHdnMAozOiB3ZzA6IDxQT0lO
VE9QT0lOVCxOT0FSUCxVUCxMT1dFUl9VUD4gbXR1IDE0MjAgcWRpc2Mgbm9xdWV1ZSBzdGF0ZQpV
TktOT1dOIG1vZGUgREVGQVVMVCBncm91cCBkZWZhdWx0IHFsZW4gMQrCoMKgwqAgbGluay9ub25l
CsKgwqAgwqAKcm9vdEBibGFkZXJ1bm5lci0yOn4jIGRwa2cgLWwgfCBncmVwIHdpcmVndWFyZApp
acKgIHdpcmVndWFyZC1ka21zwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgCjAu
MC4yMDE5MDQwNi13ZzF+eGVuaWFswqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYWxswqDCoMKgwqDCoMKgwqDCoMKgIGZhc3QsIG1vZGVybiwKc2VjdXJlIGtlcm5lbCBWUE4g
dHVubmVsIChES01TIHZlcnNpb24pCmlpwqAgd2lyZWd1YXJkLXRvb2xzwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoAowLjAuMjAxOTA0MDYtd2cxfnhlbmlhbMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFtZDY0wqDCoMKgwqDCoMKgwqAgZmFzdCwgbW9kZXJu
LApzZWN1cmUga2VybmVsIFZQTiB0dW5uZWwgKHVzZXJsYW5kIHV0aWxpdGllcykKClBsZWFzZSBo
ZWxwIG1lIGRlYnVnZ2luZyB0aGlzIElzc3VlLCBJJ20gYSBiaWcgZmFuIG9mIFdpcmVndWFyZCBh
bmQKd291bGQgbG92ZSB0byB1c2UgaXQgd2l0aCBtb2RlIHByb2plY3RzCgpIYXZlIGEgbmljZSBE
YXksCkpvc2hpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczov
L2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
