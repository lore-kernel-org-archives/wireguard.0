Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_FACE_BAD,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8B5EC10F05
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:47:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 090B0218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 090B0218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ukl-1.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fb84a4b;
	Wed, 20 Mar 2019 22:46:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0af98e11
 for <WireGuard@lists.zx2c4.com>; Sat, 9 Mar 2019 04:34:58 +0000 (UTC)
Received: from mx10.dapyxis.com (mx10.dapyxis.com [58.64.164.198])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f68182f
 for <WireGuard@lists.zx2c4.com>; Sat, 9 Mar 2019 04:34:57 +0000 (UTC)
Received: from [123.120.10.113] (helo=mochan) by mx10.dapyxis.com with esmtpa 
 id 1h2Tri-000MdJ-Sa by authid <louis@ukl-1.com> with fixed_login
 for <WireGuard@lists.zx2c4.com>; Sat, 09 Mar 2019 12:45:43 +0800
From: "=?utf-8?B?bG91aXM=?="<louis@ukl-1.com>
To: "=?utf-8?B?V2lyZUd1YXJk?="<WireGuard@lists.zx2c4.com>
Subject: Hardware acceleration
Mime-Version: 1.0
Date: Sat, 9 Mar 2019 12:45:42 +0800
Message-ID: <tencent_E00004E5DFAED0E0A9E47E70@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: Foxmail_for_Mac 1.0.0
X-AV-Status: Clean (ClamAV 0.98.1/25382/Fri Mar  8 16:55:42 2019)
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:46:07 +0100
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
Content-Type: multipart/mixed; boundary="===============0289959453879261642=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============0289959453879261642==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5C8344F6_7F3E90B0_6702E645"
Content-Transfer-Encoding: 8Bit

This is a multi-part message in MIME format.

------=_NextPart_5C8344F6_7F3E90B0_6702E645
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

RGVhciB0ZWFtLAoKCknigJltIHRyeWluZyB0byBtYWtlIFdpcmVndWFyZCB1c2UgQ1BV4oCZ
cyBoYXJkd2FyZSBjcnlwdG8gZW5naW5lIC4gVGhlIGhhcmR3YXJlIGNyeXB0byBlbmdpbmUg
Y2FuIGJlIGRyaXZlbiBieSBsaW51eCBrZXJuZWwuIEFuZCBpdCBoYXMgcmVnaXN0ZXJlZCB0
aGUgYWxnb3JpdGhtcyB3aGljaCBpdCBzdXBwb3J0cyB0byB0aGUgbGludXgga2VybmVsIGFz
IEkgY2FuIHNlZSB0aG9zZSBieSDigJxjYXQgL3Byb2MvY3J5cHRv4oCdLiBVbmZvcnR1bmF0
ZWx5ICwgdGhlcmXigJlzIG5vIENIQUNIQSBhdmFpbGFibGUuIElzIHRoZXJlIGFueSBnb29k
IHN1Z2dlc3Rpb25zIGFib3V0IGhvdyBJIGNhbiBtYWtlIFdpcmVndWFyZCB1c2UgdGhlIGVu
Z2luZT8KU3VjaCBhcyBjaGFuZ2UgdGhlIGNyeXB0byBzdWl0ZSB0byDigJxHQ00tQUVT4oCd
PyBPciBvdGhlciBncmVhdGVyPwoKCkhvcGUgdG8gaGVhciB5b3UuClJlZ2FyZHMuCgoKTG91
aXMgTWljaGFlbCAgTmV0d29ya2luZyBBcmNoaXRlY3QKVGVsLjogKzg2IDE4NSAwMDA4IDQy
MDgKRS1NYWlsOmxvdWlzQHVrbC0xLmNvbQpXZWIgc2l0ZTp3d3cudWtsLTEuY29tCkFkZHJl
c3M6Um9vbSA1MDYyOSwgNkYsQnVpbGRpbmcgRCwgR2FsYXh5IFNPSE8sIERvbmdjaGVuZyBE
aXN0cmljdCwgQmVpamluZywgQ2hpbmE=

------=_NextPart_5C8344F6_7F3E90B0_6702E645
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udDoxNHB4LzEuNSAnTHVjaWRhIEdyYW5kZScsICflvq7ova/pm4Xp
u5EnO2NvbG9yOiMzMzM7Ij48cCBzdHlsZT0iZm9udDoxNHB4LzEuNSAnTHVjaWRhIEdyYW5k
ZSc7bWFyZ2luOjA7Ij5EZWFyIHRlYW0sPC9wPjxwIHN0eWxlPSJmb250OjE0cHgvMS41ICdM
dWNpZGEgR3JhbmRlJzttYXJnaW46MDsiPjxicj48L3A+PHAgc3R5bGU9ImZvbnQ6MTRweC8x
LjUgJ0x1Y2lkYSBHcmFuZGUnO21hcmdpbjowOyI+SeKAmW0gdHJ5aW5nIHRvIG1ha2UgV2ly
ZWd1YXJkIHVzZSBDUFXigJlzIGhhcmR3YXJlIGNyeXB0byBlbmdpbmUgLiBUaGUgaGFyZHdh
cmUgY3J5cHRvIGVuZ2luZSBjYW4gYmUgZHJpdmVuIGJ5IGxpbnV4IGtlcm5lbC4gQW5kIGl0
IGhhcyByZWdpc3RlcmVkIHRoZSBhbGdvcml0aG1zIHdoaWNoIGl0IHN1cHBvcnRzIHRvIHRo
ZSBsaW51eCBrZXJuZWwgYXMgSSBjYW4gc2VlIHRob3NlIGJ5IOKAnGNhdCAvcHJvYy9jcnlw
dG/igJ0uIFVuZm9ydHVuYXRlbHkgLCB0aGVyZeKAmXMgbm8gQ0hBQ0hBIGF2YWlsYWJsZS4g
SXMgdGhlcmUgYW55IGdvb2Qgc3VnZ2VzdGlvbnMgYWJvdXQgaG93IEkgY2FuIG1ha2UgV2ly
ZWd1YXJkIHVzZSB0aGUgZW5naW5lPzwvcD48cCBzdHlsZT0iZm9udDoxNHB4LzEuNSAnTHVj
aWRhIEdyYW5kZSc7bWFyZ2luOjA7Ij5TdWNoIGFzIGNoYW5nZSB0aGUgY3J5cHRvIHN1aXRl
IHRvIOKAnEdDTS1BRVPigJ0/IE9yIG90aGVyIGdyZWF0ZXI/PC9wPjxwIHN0eWxlPSJmb250
OjE0cHgvMS41ICdMdWNpZGEgR3JhbmRlJzttYXJnaW46MDsiPjxicj48L3A+PHAgc3R5bGU9
ImZvbnQ6MTRweC8xLjUgJ0x1Y2lkYSBHcmFuZGUnO21hcmdpbjowOyI+SG9wZSB0byBoZWFy
IHlvdS48L3A+PHAgc3R5bGU9ImZvbnQ6MTRweC8xLjUgJ0x1Y2lkYSBHcmFuZGUnO21hcmdp
bjowOyI+UmVnYXJkcy48L3A+PGJyPjxkaXY+PGRpdiBzdHlsZT0iZm9udDogMTRweC8xLjUg
J0x1Y2lkYSBHcmFuZGUnOyI+PHAgY2xhc3M9Ik1zb05vcm1hbCIgYWxpZ249ImxlZnQiIHN0
eWxlPSJtYXJnaW46IDBjbSAwY20gMC4wMDAxcHQ7Ij48Zm9udCBmYWNlPSLlrovkvZMiIHNp
emU9IjUiPkxvdWlzIE1pY2hhZWwgJm5ic3A7ICZuYnNwOzwvZm9udD48YiBzdHlsZT0iZm9u
dC1mYW1pbHk6ICZxdW90O1RpbWVzIE5ldyBSb21hbiZxdW90Oywgc2VyaWY7IGZvbnQtc2l6
ZTogMTZwdDsiPk5ldHdvcmtpbmcgQXJjaGl0ZWN0PC9iPjwvcD48cCBjbGFzcz0iTXNvTm9y
bWFsIiBhbGlnbj0ibGVmdCIgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtMdWNpZGEgR3Jh
bmRlJnF1b3Q7LCAmcXVvdDtMdWNpZGEgU2FucyBVbmljb2RlJnF1b3Q7LCBzYW5zLXNlcmlm
OyBtYXJnaW46IDBjbSAwY20gMC4wMDAxcHQ7Ij48c3BhbiBsYW5nPSJFTi1VUyI+VGVsLjom
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgKzg2IDE4NSAwMDA4
IDQyMDg8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgYWxpZ249
ImxlZnQiIHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7THVjaWRhIEdyYW5kZSZxdW90Oywg
JnF1b3Q7THVjaWRhIFNhbnMgVW5pY29kZSZxdW90Oywgc2Fucy1zZXJpZjsgbWFyZ2luOiAw
Y20gMGNtIDAuMDAwMXB0OyI+PHNwYW4gbGFuZz0iRU4tVVMiPkUtTWFpbDombmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDs8YSBocmVmPSJtYWlsdG86eWVwZW5nQHdvbmRlcmZ1bG5ldC5jbiIg
dGl0bGU9Im1haWx0bzp5ZXBlbmdAd29uZGVyZnVsbmV0LmNuIiBzdHlsZT0iY29sb3I6IHJn
YigxNDksIDc5LCAxMTQpOyAtd2Via2l0LXVzZXItZHJhZzogbm9uZTsiPjxzcGFuIHN0eWxl
PSJjb2xvcjogcmdiKDUsIDk5LCAxOTMpOyI+bG91aXNAdWtsLTEuY29tPC9zcGFuPjwvYT48
bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9Ik1zb05vcm1hbCIgYWxpZ249ImxlZnQi
IHN0eWxlPSJmb250LWZhbWlseTogJnF1b3Q7THVjaWRhIEdyYW5kZSZxdW90OywgJnF1b3Q7
THVjaWRhIFNhbnMgVW5pY29kZSZxdW90Oywgc2Fucy1zZXJpZjsgbWFyZ2luOiAwY20gMGNt
IDAuMDAwMXB0OyI+PHNwYW4gbGFuZz0iRU4tVVMiPldlYiBzaXRlOiZuYnNwOzxhIGhyZWY9
Imh0dHA6Ly93d3cud29uZGVyZnVsbmV0LmNuLyIgdGl0bGU9Imh0dHA6Ly93d3cud29uZGVy
ZnVsbmV0LmNuLyIgc3R5bGU9ImNvbG9yOiByZ2IoMTQ5LCA3OSwgMTE0KTsgLXdlYmtpdC11
c2VyLWRyYWc6IG5vbmU7Ij48c3BhbiBzdHlsZT0iY29sb3I6IHJnYig1LCA5OSwgMTkzKTsi
Pnd3dy51a2wtMS5jb208L3NwYW4+PC9hPjxvOnA+PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFz
cz0iTXNvTm9ybWFsIiBhbGlnbj0ibGVmdCIgc3R5bGU9ImZvbnQtZmFtaWx5OiAmcXVvdDtM
dWNpZGEgR3JhbmRlJnF1b3Q7LCAmcXVvdDtMdWNpZGEgU2FucyBVbmljb2RlJnF1b3Q7LCBz
YW5zLXNlcmlmOyBtYXJnaW46IDBjbSAwY20gMC4wMDAxcHQ7Ij48c3BhbiBsYW5nPSJFTi1V
UyI+QWRkcmVzczombmJzcDs8L3NwYW4+PGIgc3R5bGU9InRleHQtaW5kZW50OiAyMXB0OyI+
PHNwYW4gbGFuZz0iRU4tVVMiPlJvb20gNTA2MjksIDZGLEJ1aWxkaW5nIEQsIEdhbGF4eSBT
T0hPLCBEb25nY2hlbmcgRGlzdHJpY3QsIEJlaWppbmcsIENoaW5hPC9zcGFuPjwvYj48L3A+
PC9kaXY+PC9kaXY+PC9kaXY+

------=_NextPart_5C8344F6_7F3E90B0_6702E645--


--===============0289959453879261642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0289959453879261642==--

