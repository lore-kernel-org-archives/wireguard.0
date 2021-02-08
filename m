Return-Path: <SRS0=YvsD=HK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEB1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Feb 2021 21:17:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A7264E56
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Feb 2021 21:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02A7264E56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sec.uni-passau.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f3f6116;
	Mon, 8 Feb 2021 21:15:34 +0000 (UTC)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1dd1c329
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Feb 2021 21:15:32 +0000 (UTC)
Received: from puremessage.rz.uni-passau.de (puremessage.rz.uni-passau.de
 [132.231.51.54])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 2EE7A127F00D5;
 Mon,  8 Feb 2021 22:15:32 +0100 (CET)
Received: from puremessage.rz.uni-passau.de (localhost.localdomain [127.0.0.1])
 by localhost (Email Security Appliance) with SMTP id 1701E10709C_21A9F4B;
 Mon,  8 Feb 2021 21:15:32 +0000 (GMT)
Received: from tom.rz.uni-passau.de (tom.rz.uni-passau.de [132.231.51.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by puremessage.rz.uni-passau.de (Sophos Email Appliance) with ESMTPS id
 12F951047FB_21A9F4F; Mon,  8 Feb 2021 21:15:32 +0000 (GMT)
Received: from localhost (localhost [127.0.0.1])
 by tom.rz.uni-passau.de (Postfix) with ESMTP id 08B95127F00D3;
 Mon,  8 Feb 2021 22:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-passau.de;
 s=up-2020-11-19; t=1612818932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TGD34YMEK+BN4lRVVeVAdySNvJpwd6wxMy4qMVoIHWU=;
 b=cCSibMP/Ko5JQhJpbnCSthr+9vno5AB9BK+TMP0Cr0jdyym0j/Vp5vFCUznrJbX1TSwPZj
 uuaR3+6jcK6RMjWNU3Y/mJkMKzV2zi8t5s4hZXQjO5ioW59aHDAE+BQqS0rurF8+GxozfW
 jqIwXr8VZoFWzWQTt6N3zt4pR7tKzQ4=
Received: from [132.231.11.13] (helo=smith.sec.uni-passau.de)
 by mail.uni-passau.de with ESMTPS (eXpurgate 4.15.1)
 (envelope-from <jp@sec.uni-passau.de>)
 id 6021a9f3-0ace-84e733040019-84e70b0d9f6f-3
 for <multiple-recipients>; Mon, 08 Feb 2021 22:15:31 +0100
Received: from smith.sec.uni-passau.de (132.231.11.13) by
 smith.sec.uni-passau.de (132.231.11.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Feb 2021 22:10:46 +0100
Received: from smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9]) by
 smith.sec.uni-passau.de ([fe80::55d2:6c14:41:dff9%12]) with mapi id
 15.00.1497.010; Mon, 8 Feb 2021 22:10:46 +0100
From: "Posegga, Joachim" <jp@sec.uni-passau.de>
To: pg131072 <pg131072@protonmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: RE: Suggestion: Extended AllowedIPs syntax
Thread-Topic: Suggestion: Extended AllowedIPs syntax
Thread-Index: AQHW/WhK62zMFcf7OEqvIHRdAoN2sapOwY4g
Date: Mon, 8 Feb 2021 21:10:46 +0000
Message-ID: <e2f7a02c4aa1436abbb88467faf2a05b@smith.sec.uni-passau.de>
References: <IVCtdT6g25RGmvC0J8IaIfgXll8aFl8QRaSYYN-fsGA40QXw2xuMVS39Ujnaq1bqqg6LoKRxyo80ZrV-yxoYIUSNXAZV_sWZhfdRj3QWPFo=@protonmail.com>
 <GTiw2RsJf2QRZPV5fdL0Ae5UH4u5SlycvoZJKMDbH4f7D7H7MFeNaIdNiMAcJRFZISYndJSaj-rQQIH0XhV7r1kJk3GkVH-7yiCkZeJQSCU=@protonmail.com>
In-Reply-To: <GTiw2RsJf2QRZPV5fdL0Ae5UH4u5SlycvoZJKMDbH4f7D7H7MFeNaIdNiMAcJRFZISYndJSaj-rQQIH0XhV7r1kJk3GkVH-7yiCkZeJQSCU=@protonmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [132.231.11.57]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-purgate-ID: 151291::1612818931-00000ACE-6BC69636/0/0
X-purgate-type: clean
X-purgate-size: 1396
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
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

SSB3b3VsZCB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZSBhIHdheSB0byBleGNsdWRlIHN1Ym5ldHMgZnJv
bSBiZWluZyByb3V0ZWQgdGhyb3VnaCBhIHdnIHR1bm5lbC4gV291bGQgYmUgbXVjaCBtb3JlIGNv
bnZlbmllbnQgdGhhbiBjaGFuZ2luZyB0aGUgc3lzdGVtJ3Mgcm91dGluZyB0YWJsZSBieSBoYW5k
LCBlLmcuIGlmIHlvdSB3YW50IHRvIGtlZXAgY29ubmVjdGl2aXR5IHRvIHlvdXIgbG9jYWwgc3Vi
bmV0IHdoZW4gZXN0YWJsaXNoaW5nIGEgdHVubmVsIGZvciAwLjAuMC4wLzAuDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBXaXJlR3VhcmQgW21haWx0bzp3aXJlZ3VhcmQtYm91
bmNlc0BsaXN0cy56eDJjNC5jb21dIE9uIEJlaGFsZiBPZiBwZzEzMTA3Mg0KU2VudDogU3VuZGF5
LCA3IEZlYnJ1YXJ5LCAyMDIxIDE1OjIxDQpUbzogd2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbQ0K
U3ViamVjdDogRnc6IFN1Z2dlc3Rpb246IEV4dGVuZGVkIEFsbG93ZWRJUHMgc3ludGF4DQoNCkkg
ZmluZCB0aGUgQWxsb3dlZElQcyBDSURSIGZvcm1hdCBkaWZmaWN1bHQgdG8gZ3Jvay4gV2hhdCBp
ZiBXaXJlZ3VhcmQgYWxsb3dlZC4uLg0KDQogK0lQL21hc2sgLSBhZGQgYSByYW5nZQ0KICtJUC1J
UCAtIGFkZCBhIHJhbmdlDQogLUlQL21hc2sgLSByZW1vdmUgYSByYW5nZQ0KIC1JUC1JUCAtIHJl
bW92ZSBhIHJhbmdlDQoNCk11bHRpcGxlIHRlcm1zIHdvdWxkIGJlIGludGVycHJldGVkIGxlZnQg
dG8gcmlnaHQNCg0KaS5lLg0KDQpBbGxvd2VkSVBzOiArMS4yLjMuMC8yNCAtMS4yLjMuMS0xLjIu
My4xMCAtMS4yLjMuMjU1DQoNCkV4YW1wbGUgQysrIGNvZGU6aHR0cHM6Ly9wYXN0ZWJpbi5jb20v
bUNMQ2c1dnINCg0KVGhhbmtzDQoNClBHDQoNCk5vdGU6IEkgb3JpZ2luYWxseSBwb3N0ZWQgdG8g
UmVkZGl0OsKgDQpodHRwczovL3d3dy5yZWRkaXQuY29tL3IvV2lyZUd1YXJkL2NvbW1lbnRzL2xl
bWRtdi9zdWdnZXN0aW9uX2V4dGVuZGVkX2FsbG93ZWRpcHNfc3ludGF4Lw0KDQoNCg==
