Return-Path: <SRS0=LuSS=P6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86633C37122
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 00:56:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54972085A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 00:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="Oa23JlRP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54972085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f8c3909;
	Tue, 22 Jan 2019 00:51:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31987303
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Jan 2019 23:33:54 +0000 (UTC)
Received: from sonic306-22.consmr.mail.ne1.yahoo.com
 (sonic306-22.consmr.mail.ne1.yahoo.com [66.163.189.84])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1541472
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Jan 2019 23:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1548113926; bh=fN6mAyFXL0LMIYfaW0mmjtRF/NJUMUxzxXzaNebS+/8=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=Oa23JlRPyZgvXsbnzhmYY2foAyS4btn1ZlR+nMTf9l8FEYpmkTvCwfBc6oo1vRI8MvZ8/XaL5fvBlCq2BVYhLpRWa0tY/LiaOfJ/bb56+d5y7rfA3DlnKzgw7wZw03Fzc9DjMDZqEFCZmo+lwyTV5hL8bvFhVoVfS6oyZKrVThRLh8+IzQGGGI9KfQA+H9vjU/vlGvXVXnvSF7q33C0rtw5Bo/tzx7aj3jGbQpG7pPE1iYR/8TLBlY1OBCelhOwIRbVXlY7oyIVbXXcP3ZZNYEneS2exdrVGPzWlD/uj0gLUMTkVhslIjar/2RZG+BNbGlXB4aRjiUyR1xGNfD3mlA==
X-YMail-OSG: h2fGrYoVM1kKiSavzDIxwI2o.K.bEcKHOHfxWLslbBARuuiRMddQpY6zfT3yhMt
 DQrbwmXhKLExzTZUNJDYE96mSb5VsVSWGQfZFd7ZVGfV30JJhoPKFb.WvMEbqXqnhyhcNFxKeNxG
 hROAuel27bhfmJH3oCHBbS0dRDP0eEexVWNwpZ5lJmXK040RDYDjIGIrq9iL1RJtiztvXFBAXg2d
 0hJRiUuhG1i7mjhRPHqun0b2UriQ9X.oneW2uldzUose4_kjZ3E0MXutoZU6KONaouHPkre6CBbV
 ovX.bzcULl46KrdSu6gTMfnOGIHjnNSDjk5PArmEryAMYLImrn_odzUPxDJ0TY2OmZEJuXjkh4Mq
 YwH7MYkzYOduWoTwdU7XK_u.igOF0EjmbBFt82lPY.J.fLStqgEjl7OKdFwAzXDI4cNlBoF9qklc
 57nDc9JfPNEZy0GF7sknPGQMl2vEMvmzBt1iLgdEFXimD7kz4n_ts0PZRQnYcqHTSvl9X_pDTTpw
 eUoiOhKtSLgi.IwJ0gKVJw0EiJicEd7G4iUI_Au1rYj3YfjxuQ37WiQc2H1cqVyasV7hwHc5mOnL
 M_IWmx0U_luSbyNBucXh7OL.oUq_ZEYUzbPiOyzqXNsndjc9jNwudhPIBHZMzfQ5X.QzcHxeLse3
 AkVpdGuxecf8fdZrVM7DN0YikXPnz0iaD1ES2l3FG.B8U9lD1PHGAU_6DwdmyC9YBwQ0xa8BT6sZ
 btlnuKXE9XBOIWau4HpvMocAAV6QprBuT4pFSmeSf3x3s97yUbMho7PX8ppi60JZS5SoYVVZPhpD
 jzYwPwVl2Vz5pe9LUiyLzAtLvClJtDN3F3QncIAKNyWrbJt.NW3i5uGxDDS9TQc90sRAsUFwO5aK
 3iSNLI9Otj7PcK4LbjcsW_V.Mdbt6x8OdJ9ssv0.ziWoh25tQ5G7jSZX9wTZynWPgfMTlVA9YpGP
 hsukKQhP1NSJvpbA7KIvA4MJIgaoIJLvknOONUvvayc9dHKxOTrlxZVi0B.lq9ZDICp9cypVIATU
 RXrx1bbpS9aTfw0DrLiS6H1eksuwf0h3Zm8nj1w--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ne1.yahoo.com with HTTP; Mon, 21 Jan 2019 23:38:46 +0000
Received: from pink.alxu.ca (EHLO localhost.localdomain) ([198.98.62.56])
 by smtp421.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 f153e4accb73679a09346c4e663a1ba8; 
 Mon, 21 Jan 2019 23:38:44 +0000 (UTC)
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] %i is not a valid format specifier
Date: Mon, 21 Jan 2019 18:38:40 -0500
Message-Id: <20190121233840.6401-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 22 Jan 2019 01:51:21 +0100
Cc: "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>
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

LS0tCiBhcHAvc3JjL21haW4vcmVzL3ZhbHVlcy9zdHJpbmdzLnhtbCB8IDggKysrKy0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvYXBwL3NyYy9tYWluL3Jlcy92YWx1ZXMvc3RyaW5ncy54bWwgYi9hcHAvc3JjL21haW4vcmVz
L3ZhbHVlcy9zdHJpbmdzLnhtbAppbmRleCA3MmI4MTUzLi4zNzUxY2IwIDEwMDY0NAotLS0gYS9h
cHAvc3JjL21haW4vcmVzL3ZhbHVlcy9zdHJpbmdzLnhtbAorKysgYi9hcHAvc3JjL21haW4vcmVz
L3ZhbHVlcy9zdHJpbmdzLnhtbApAQCAtMTIzLDggKzEyMyw4IEBACiAgICAgPHN0cmluZyBuYW1l
PSJzZXRfZXhjbHVzaW9ucyI+U2V0IEV4Y2x1c2lvbnM8L3N0cmluZz4KICAgICA8c3RyaW5nIG5h
bWU9InNldHRpbmdzIj5TZXR0aW5nczwvc3RyaW5nPgogICAgIDxzdHJpbmcgbmFtZT0ic2hlbGxf
ZXhpdF9zdGF0dXNfcmVhZF9lcnJvciI+U2hlbGwgY2Fubm90IHJlYWQgZXhpdCBzdGF0dXM8L3N0
cmluZz4KLSAgICA8c3RyaW5nIG5hbWU9InNoZWxsX21hcmtlcl9jb3VudF9lcnJvciI+U2hlbGwg
ZXhwZWN0ZWQgNCBtYXJrZXJzLCByZWNlaXZlZCAlaTwvc3RyaW5nPgotICAgIDxzdHJpbmcgbmFt
ZT0ic2hlbGxfc3RhcnRfZXJyb3IiPlNoZWxsIGZhaWxlZCB0byBzdGFydDogJWk8L3N0cmluZz4K
KyAgICA8c3RyaW5nIG5hbWU9InNoZWxsX21hcmtlcl9jb3VudF9lcnJvciI+U2hlbGwgZXhwZWN0
ZWQgNCBtYXJrZXJzLCByZWNlaXZlZCAlZDwvc3RyaW5nPgorICAgIDxzdHJpbmcgbmFtZT0ic2hl
bGxfc3RhcnRfZXJyb3IiPlNoZWxsIGZhaWxlZCB0byBzdGFydDogJWQ8L3N0cmluZz4KICAgICA8
c3RyaW5nIG5hbWU9InRvZ2dsZV9lcnJvciI+RXJyb3IgdG9nZ2xpbmcgV2lyZUd1YXJkIHR1bm5l
bDogJXM8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9InRvb2xzX2luc3RhbGxlcl9hbHJlYWR5
Ij53ZyBhbmQgd2ctcXVpY2sgYXJlIGFscmVhZHkgaW5zdGFsbGVkPC9zdHJpbmc+CiAgICAgPHN0
cmluZyBuYW1lPSJ0b29sc19pbnN0YWxsZXJfZmFpbHVyZSI+VW5hYmxlIHRvIGluc3RhbGwgY29t
bWFuZC1saW5lIHRvb2xzIChubyByb290Pyk8L3N0cmluZz4KQEAgLTEzNywxNCArMTM3LDE0IEBA
CiAgICAgPHN0cmluZyBuYW1lPSJ0b29sc19pbnN0YWxsZXJfd29ya2luZyI+SW5zdGFsbGluZyB3
ZyBhbmQgd2ctcXVpY2s8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9InRvb2xzX3VuYXZhaWxh
YmxlX2Vycm9yIj5SZXF1aXJlZCB0b29scyB1bmF2YWlsYWJsZTwvc3RyaW5nPgogICAgIDxzdHJp
bmcgbmFtZT0idHVuX2NyZWF0ZV9lcnJvciI+VW5hYmxlIHRvIGNyZWF0ZSB0dW4gZGV2aWNlPC9z
dHJpbmc+Ci0gICAgPHN0cmluZyBuYW1lPSJ0dW5uZWxfY29uZmlnX2Vycm9yIj5VbmFibGUgdG8g
Y29uZmlndXJlIHR1bm5lbCAod2ctcXVpY2sgcmV0dXJuZWQgJWkpPC9zdHJpbmc+CisgICAgPHN0
cmluZyBuYW1lPSJ0dW5uZWxfY29uZmlnX2Vycm9yIj5VbmFibGUgdG8gY29uZmlndXJlIHR1bm5l
bCAod2ctcXVpY2sgcmV0dXJuZWQgJWQpPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJ0dW5u
ZWxfY3JlYXRlX2Vycm9yIj5VbmFibGUgdG8gY3JlYXRlIHR1bm5lbDogJXM8L3N0cmluZz4KICAg
ICA8c3RyaW5nIG5hbWU9InR1bm5lbF9jcmVhdGVfc3VjY2VzcyI+U3VjY2Vzc2Z1bGx5IGNyZWF0
ZWQgdHVubmVsIOKAnCVz4oCdPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJ0dW5uZWxfZXJy
b3JfYWxyZWFkeV9leGlzdHMiPlR1bm5lbCDigJwlc+KAnSBhbHJlYWR5IGV4aXN0czwvc3RyaW5n
PgogICAgIDxzdHJpbmcgbmFtZT0idHVubmVsX2Vycm9yX2ludmFsaWRfbmFtZSI+SW52YWxpZCBu
YW1lPC9zdHJpbmc+CiAgICAgPHN0cmluZyBuYW1lPSJ0dW5uZWxfbGlzdF9wbGFjZWhvbGRlciI+
QWRkIGEgdHVubmVsIHVzaW5nIHRoZSBibHVlIGJ1dHRvbjwvc3RyaW5nPgogICAgIDxzdHJpbmcg
bmFtZT0idHVubmVsX25hbWUiPlR1bm5lbCBOYW1lPC9zdHJpbmc+Ci0gICAgPHN0cmluZyBuYW1l
PSJ0dW5uZWxfb25fZXJyb3IiPlVuYWJsZSB0byB0dXJuIHR1bm5lbCBvbiAod2dUdXJuT24gcmV0
dXJuZWQgJWkpPC9zdHJpbmc+CisgICAgPHN0cmluZyBuYW1lPSJ0dW5uZWxfb25fZXJyb3IiPlVu
YWJsZSB0byB0dXJuIHR1bm5lbCBvbiAod2dUdXJuT24gcmV0dXJuZWQgJWQpPC9zdHJpbmc+CiAg
ICAgPHN0cmluZyBuYW1lPSJ0dW5uZWxfcmVuYW1lX2Vycm9yIj5VbmFibGUgdG8gcmVuYW1lIHR1
bm5lbDogJXM8L3N0cmluZz4KICAgICA8c3RyaW5nIG5hbWU9InR1bm5lbF9yZW5hbWVfc3VjY2Vz
cyI+U3VjY2Vzc2Z1bGx5IHJlbmFtZWQgdHVubmVsIHRvIOKAnCVz4oCdPC9zdHJpbmc+CiAgICAg
PHN0cmluZyBuYW1lPSJ0eXBlX25hbWVfZ29fdXNlcnNwYWNlIj5HbyB1c2Vyc3BhY2U8L3N0cmlu
Zz4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0
dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
