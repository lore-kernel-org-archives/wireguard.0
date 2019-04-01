Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B04ECC10F0F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6EBC2184B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.ru header.i=@mail.ru header.b="e1jOW6kO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6EBC2184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mail.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cb5b1bb;
	Fri, 5 Apr 2019 15:21:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 021167c3
 for <WireGuard@lists.zx2c4.com>; Mon, 1 Apr 2019 10:03:33 +0000 (UTC)
Received: from f500.i.mail.ru (f500.i.mail.ru [217.69.138.167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9321c843
 for <WireGuard@lists.zx2c4.com>; Mon, 1 Apr 2019 10:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail2; 
 h=Content-Type:Message-ID:Reply-To:Date:MIME-Version:Subject:To:From;
 bh=iYcuGWbdLGFHg/EgFU5B8oQu5o81puGX60NUPB+AYLw=; 
 b=e1jOW6kOWtClUvP/gwBKOmsoexdUkODLD6CHSn8CWG0aWq9cwPOrcKZbDd6awrKGWQsRNKMGa0/m7yEc9gomCfyyXVAZBtXBvf22aRKAYP9BFfEYbWsjo8KLIUFyNNyeIHFjkZzRDSerHntPJPnfhR7KINQPM8p4JXA3gy9R1tQ=;
Received: by f500.i.mail.ru with local (envelope-from <dmitri__13@mail.ru>)
 id 1hAtoe-0003F5-Jt
 for WireGuard@lists.zx2c4.com; Mon, 01 Apr 2019 13:05:20 +0300
Received: by e.mail.ru with HTTP;
	Mon, 01 Apr 2019 13:05:20 +0300
From: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JzQsNGA0LrQvtCy?= <dmitri__13@mail.ru>
To: WireGuard@lists.zx2c4.com
Subject: =?UTF-8?B?SG93IGNhIEkgdXNlIHR3byBwZWVycyB3aXRoIDAuMC4wLjA/?=
MIME-Version: 1.0
X-Mailer: Mail.Ru Mailer 1.0
Date: Mon, 01 Apr 2019 13:05:20 +0300
X-Priority: 3 (Normal)
Message-ID: <1554113120.148180037@f500.i.mail.ru>
Authentication-Results: f500.i.mail.ru; auth=pass smtp.auth=dmitri__13@mail.ru
 smtp.mailfrom=dmitri__13@mail.ru
X-77F55803: 8685B747EC89CCEF7F9F52485CB584D7ADE63D71A4B1B0B8A2A8B4A1A3DEEA0A680D903E3C0523D392508005EFFF34AFDDDE7B70B5F5C79F
X-7FA49CB5: 70AAF3C13DB70168C09775C1D3CA48CF09BC2A87FC68FC48CEDC9CE4EAAF8441BD4B6F7A4D31EC0B5B47ED7565F4D52D9742502CCDD46D0DBBEA9FB9FD75E40EB2086D80B05047785571747095F342E8C7A0BC55FA0FE5FC2AEEB488AF3FB734EFCC7479B7845CAA147B9CF108172C17389733CBF5DBD5E913377AFFFEAFD269176DF2183F8FC7C0D9442B0B5983000E8941B15DA834481FCF19DD082D7633A0E7DDDDC251EA7DABA471835C12D1D977725E5C173C3A84C3ED8438A78DFE0A9E117882F4460429728AD0CFFFB425014E40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE7AF27F542621AC2F308FA5F6CFEDF902D75ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF57C2F2A386D11C4599BD9CCCA9EDD067B1EDA766A37F9254B7
X-Mailru-MI: 800
X-Mailru-Sender: F34414D909EE10BDAEBE92CA5FC6E99A5011D95C30CFA4C383AA9CE88E48525C50491E3DA783203D213C4330B72B886D29380EAE0A631D0E2C908C450ED9CD232924E1E2236B0C362AA3CDD27765A5669A02EFF957BA886E3A5DB60FBEB33A8A0DA7A0AF5A3A8387
X-Mras: OK
X-Spam: undefined
X-Mailman-Approved-At: Fri, 05 Apr 2019 17:21:48 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JzQsNGA0LrQvtCy?= <dmitri__13@mail.ru>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0807292963980244235=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============0807292963980244235==
Content-Type: multipart/alternative;
	boundary="--ALT--8fYDnyepl1qazkAA0U0VHVTMrO4GdBVi1554113120"


----ALT--8fYDnyepl1qazkAA0U0VHVTMrO4GdBVi1554113120
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

CkhlbGxvIQoKUmVjZW50bHkgSSB0cmllZCB0byBpbnN0YWxsIHdpcmVndWFyZC7CoAoKSSBoYXZl
IDQgY29tcHV0ZXJzLiAyIG9mIHRoZW0gaGF2ZSBwdWJsaWMgaXAuIDIgb2YgdGhlbSBiZWhpbmQg
TkFULgoKSSB3YW50IHRvIHVzZSAyIHB1YmxpYyBQQyBhcyBlbmRwb2l0cywgYnV0IEkgZG9uJ3Qg
dW5kZXJzdGFuZCBob3cgdG8gc2V0IHVwIDAuMC4wLjAgZm9yIGJvdGggb2YgdGhlbSBvbiBjbGll
bnQgc2lkZS4KClNvIHRoaXMgbXkgY29uZmlndXJhdGlvbiBvbiBjbGllbnRzaWRlIGJlaGluZCBO
QVQKW0ludGVyZmFjZV0KTGlzdGVuUG9ydCA9IDUxODIwClByaXZhdGVLZXkgPSBLRVkKW1BlZXJd
ClB1YmxpY0tleSA9IEtFWTEKQWxsb3dlZElQcyA9IDAuMC4wLjAvMApFbmRwb2ludCA9IFguWC5Y
Llg6NTE4MjAKW1BlZXJdClB1YmxpY0tleSA9IEtFWTIKQWxsb3dlZElQcyA9IDAuMC4wLjAvMApF
bmRwb2ludCA9IFguWC5YLlg6NTE4MjAKV2lyZWd1YXJkIGRvbid0IGFsbG93IG1lIHRvIHVzZSAw
LjAuMC4wIG9uIGJvdGggb2YgdGhlbS4gSG93IGNhbiBJIHVzZSB0d28gcGVlcnMgYXQgdGhpcyBz
aXR1YXRpb24/CgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApEbWl0cnkgTWFya292

----ALT--8fYDnyepl1qazkAA0U0VHVTMrO4GdBVi1554113120
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

CjxIVE1MPjxCT0RZPjxwPkhlbGxvITxicj48YnI+UmVjZW50bHkgSSB0cmllZCB0byBpbnN0YWxs
IHdpcmVndWFyZC4mbmJzcDs8YnI+PGJyPkkgaGF2ZSA0IGNvbXB1dGVycy4gMiBvZiB0aGVtIGhh
dmUgcHVibGljIGlwLiAyIG9mIHRoZW0gYmVoaW5kIE5BVC48YnI+PGJyPkkgd2FudCB0byB1c2Ug
MiBwdWJsaWMgUEMgYXMgZW5kcG9pdHMsIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHRvIHNl
dCB1cCAwLjAuMC4wIGZvciBib3RoIG9mIHRoZW0gb24gY2xpZW50IHNpZGUuPGJyPjxicj5TbyB0
aGlzIG15IGNvbmZpZ3VyYXRpb24gb24gY2xpZW50c2lkZSBiZWhpbmQgTkFUPC9wPjxwPltJbnRl
cmZhY2VdPC9wPjxwPkxpc3RlblBvcnQgPSA1MTgyMDxicj5Qcml2YXRlS2V5ID0gS0VZPC9wPjxw
PltQZWVyXTxicj5QdWJsaWNLZXkgPSBLRVkxPGJyPkFsbG93ZWRJUHMgPSAwLjAuMC4wLzA8YnI+
RW5kcG9pbnQgPSBYLlguWC5YOjUxODIwPC9wPjxwPltQZWVyXTxicj5QdWJsaWNLZXkgPSBLRVky
PGJyPkFsbG93ZWRJUHMgPSAwLjAuMC4wLzA8YnI+RW5kcG9pbnQgPSBYLlguWC5YOjUxODIwPC9w
PjxwPldpcmVndWFyZCBkb24ndCBhbGxvdyBtZSB0byB1c2UgMC4wLjAuMCBvbiBib3RoIG9mIHRo
ZW0uIEhvdyBjYW4gSSB1c2UgdHdvIHBlZXJzIGF0IHRoaXMgc2l0dWF0aW9uPzxicj48YnI+PGJy
Pi0tIDxicj5XaXRoIEJlc3QgUmVnYXJkcyw8YnI+RG1pdHJ5IE1hcmtvdjwvcD48L0JPRFk+PC9I
VE1MPgo=

----ALT--8fYDnyepl1qazkAA0U0VHVTMrO4GdBVi1554113120--

--===============0807292963980244235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0807292963980244235==--
