Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABB1ECDE20
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801DC206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.ua header.i=@mail.ua header.b="I6xQPWZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801DC206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mail.ua
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91beb739;
	Wed, 11 Sep 2019 16:40:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a22ceadb
 for <wireguard@lists.zx2c4.com>; Mon, 9 Sep 2019 23:11:40 +0000 (UTC)
Received: from f522.i.mail.ru (f522.i.mail.ru [94.100.184.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eee44327
 for <wireguard@lists.zx2c4.com>; Mon, 9 Sep 2019 23:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ua;
 s=mail; 
 h=Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:To:From;
 bh=+AoMRbS/cidtnqKJQqHiR4+nQOSQR7ZjWT8TTcErEhk=; 
 b=I6xQPWZODuBI6ggAbhneuggv+uva1041P3l70h8V4VUZwVGbhrB2pTXExS6ZL6eKWusRMrHSStd2RejweUhy7V+Hr+dtX0WVfZuscD8tCjfsd456vw2Px2AbIsVX+g7u9Vs86g+KvvzShHFcuL7sxXMMw9XAP0PYQI2N4Wer6eY=;
Received: by f522.i.mail.ru with local (envelope-from <iron@mail.ua>)
 id 1i7Sor-00024P-QJ
 for wireguard@lists.zx2c4.com; Tue, 10 Sep 2019 02:11:38 +0300
Received: by e.mail.ru with HTTP;
	Tue, 10 Sep 2019 02:11:37 +0300
From: =?UTF-8?B?0JXQstCz0LXQvdC40LkgSVJPTg==?= <iron@mail.ua>
To: wireguard@lists.zx2c4.com
Subject: =?UTF-8?B?V2lyZWd1YXJkIHdpdGggZGlzYWJsZWQgSVB2NiB1bmRlciBGcmVlQlNE?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
Date: Tue, 10 Sep 2019 02:11:37 +0300
X-Priority: 3 (Normal)
Message-ID: <1568070697.332144477@f522.i.mail.ru>
Authentication-Results: f522.i.mail.ru; auth=pass smtp.auth=iron@mail.ua
 smtp.mailfrom=iron@mail.ua
X-77F55803: C25EFC2EB3804F3A9110AD76CAB125BE45CFA22AAFF36450A9B3F007CD7F4FE240B5F7B097B5751E3A5BB986DF78545B
X-7FA49CB5: 70AAF3C13DB7016878DA827A17800CE775391C3A22ADB47CD82A6BABE6F325ACA01ED31736435A1FBFD28B28ED4578739E625A9149C048EE0295F3697264BFA8B237B30BB4E08982B287FD4696A6DC2FA8DF7F3B2552694A4E2F5AFA99E116B42401471946AA11AF269823B5EC1E9D4DED6B9921EE2920938F08D7030A58E5AD6BA297DBC24807EAA9D420A4CFB5DD3EC8FDB296C59A0BD93088ABB567818FBB3FC07C0C7AD49DD08941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476C0CAF46E325F83A522CA9DD8327EE493D58E677C372A3F47AD19C9A918A40246E6498CEBD523939F731C566533BA786A40A5AABA2AD371193C9F3DD0FB1AF5EBE26B79914A659FB62623479134186CDE6BA297DBC24807EABDAD6C7F3747799A
X-Mailru-MI: 800
X-Mailru-Sender: 108D79A39691CE80892F2FA9BE89D15E8FBD315BAC9093B8056CCC2992A6EA9DF2E6B909CECB75D67CC34E373F918147CF966ECF4123ED9E0DA589AF0A473323C1066F626AABBBD9DEC57AFBCB8B665245EC9C6EA746485E67EA787935ED9F1B
X-Mras: OK
X-Spam: undefined
X-Mailman-Approved-At: Wed, 11 Sep 2019 18:40:39 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: =?UTF-8?B?0JXQstCz0LXQvdC40LkgSVJPTg==?= <iron@mail.ua>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0301299502665017224=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============0301299502665017224==
Content-Type: multipart/alternative;
	boundary="--ALT--9OdNzaWgnHuwfchkUqxwchUWjiVdJRRm1568070697"


----ALT--9OdNzaWgnHuwfchkUqxwchUWjiVdJRRm1568070697
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpJJ20gdHJ5aW5nIHRvIHNldHVwIHdpcmVndWFyZCBzZXJ2ZXIgb24gRnJlZUJTRCB3
aGljaCB3YXMgYnVpbHQgZnJvbSBwb3J0cy4gSSBoYXZlIGN1c3RvbSBrZXJuZWwgYnVpbGQgd2hl
cmUgSSBkaXNhYmxlZCBJUHY2IHdoaWNoIEkgY3VycmVudGx5IGRvbid0IHVzZSBhdCB0aGlzIFZN
LiBXaGVuIEkgdHJ5aW5nIHRvIHN0YXJ0IFdJcmVndWFyZCBJIHJlY2VpdmUgYW4gZXJyb3I6Cgoj
IHNlcnZpY2Ugd2lyZWd1YXJkIHN0YXJ0ClsjXSB3aXJlZ3VhcmQtZ28gd2cwCklORk86ICh3ZzAp
IDIwMTkvMDkvMTAgMDI6MDI6MjkgU3RhcnRpbmcgd2lyZWd1YXJkLWdvIHZlcnNpb24gMC4wLjIw
MTkwODA1CkVSUk9SOiAod2cwKSAyMDE5LzA5LzEwIDAyOjAyOjI5IEZhaWxlZCB0byBjcmVhdGUg
VFVOIGRldmljZTogYWRkcmVzcyBmYW1pbHkgbm90IHN1cHBvcnRlZCBieSBwcm90b2NvbCBmYW1p
bHkKWyNdIHJtIC1mIC92YXIvcnVuL3dpcmVndWFyZC93ZzAuc29jawpuZXRzdGF0OiBpbmV0Njog
dW5rbm93biBhZGRyZXNzIGZhbWlseQoKSGVyZSBpcyBteSBjb25maWcgZmlsZSB3ZzAuY29uZjoK
CltJbnRlcmZhY2VdCkFkZHJlc3MgPSAxOTIuMTY4LjIyMi4xLzMyClByaXZhdGVLZXkgPSA8cHJp
diBLZXk+Ckxpc3RlblBvcnQgPSA1MTgyMAoKW1BlZXJdClB1YmxpY0tleSA9IDxwdWIga2V5PgpB
bGxvd2VkSVBzID0gMTkyLjE2OC4yMjIuMi8zMgoKV2h5IGRvZXMgaXQgdHJ5IHRvIHVzZSBJUHY2
IG9uIHR1bjAgaW50ZXJmYWNlIHdoZW4gSSBkaWRuJ3Qgc3BlY2lmeSBJUHY2IGFkZHJlc3MgaW4g
dGhlIGNvbmZpZyBmaWxlLgoKVGhhbmsgeW91IQo=

----ALT--9OdNzaWgnHuwfchkUqxwchUWjiVdJRRm1568070697
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

CjxIVE1MPjxCT0RZPkhlbGxvLDxicj48YnI+SSdtIHRyeWluZyB0byBzZXR1cCB3aXJlZ3VhcmQg
c2VydmVyIG9uIEZyZWVCU0Qgd2hpY2ggd2FzIGJ1aWx0IGZyb20gcG9ydHMuIEkgaGF2ZSBjdXN0
b20ga2VybmVsIGJ1aWxkIHdoZXJlIEkgZGlzYWJsZWQgSVB2NiB3aGljaCBJIGN1cnJlbnRseSBk
b24ndCB1c2UgYXQgdGhpcyBWTS4gV2hlbiBJIHRyeWluZyB0byBzdGFydCBXSXJlZ3VhcmQgSSBy
ZWNlaXZlIGFuIGVycm9yOjxicj48YnI+IyBzZXJ2aWNlIHdpcmVndWFyZCBzdGFydDxicj5bI10g
d2lyZWd1YXJkLWdvIHdnMDxicj5JTkZPOiAod2cwKSAyMDE5LzA5LzEwIDAyOjAyOjI5IFN0YXJ0
aW5nIHdpcmVndWFyZC1nbyB2ZXJzaW9uIDAuMC4yMDE5MDgwNTxicj5FUlJPUjogKHdnMCkgMjAx
OS8wOS8xMCAwMjowMjoyOSBGYWlsZWQgdG8gY3JlYXRlIFRVTiBkZXZpY2U6IGFkZHJlc3MgZmFt
aWx5IG5vdCBzdXBwb3J0ZWQgYnkgcHJvdG9jb2wgZmFtaWx5PGJyPlsjXSBybSAtZiAvdmFyL3J1
bi93aXJlZ3VhcmQvd2cwLnNvY2s8YnI+bmV0c3RhdDogaW5ldDY6IHVua25vd24gYWRkcmVzcyBm
YW1pbHk8YnI+PGJyPkhlcmUgaXMgbXkgY29uZmlnIGZpbGUgd2cwLmNvbmY6PGJyPjxicj5bSW50
ZXJmYWNlXTxicj5BZGRyZXNzID0gMTkyLjE2OC4yMjIuMS8zMjxicj5Qcml2YXRlS2V5ID0gJmx0
O3ByaXYgS2V5Jmd0Ozxicj5MaXN0ZW5Qb3J0ID0gNTE4MjA8YnI+PGJyPltQZWVyXTxicj5QdWJs
aWNLZXkgPSAmbHQ7cHViIGtleSZndDs8YnI+QWxsb3dlZElQcyA9IDE5Mi4xNjguMjIyLjIvMzI8
YnI+PGJyPldoeSBkb2VzIGl0IHRyeSB0byB1c2UgSVB2NiBvbiB0dW4wIGludGVyZmFjZSB3aGVu
IEkgZGlkbid0IHNwZWNpZnkgSVB2NiBhZGRyZXNzIGluIHRoZSBjb25maWcgZmlsZS48YnI+PGJy
PlRoYW5rIHlvdSE8YnI+PC9CT0RZPjwvSFRNTD4K

----ALT--9OdNzaWgnHuwfchkUqxwchUWjiVdJRRm1568070697--

--===============0301299502665017224==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0301299502665017224==--
