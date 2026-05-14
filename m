Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A84CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 06:55:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 567dc4f9;
	Mon, 5 Oct 2026 06:55:48 +0000 (UTC)
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net
 [178.154.239.214])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dae679d5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 May 2026 15:17:27 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:489d:0:640:baa6:0])
 by forward103d.mail.yandex.net (Yandex) with ESMTPS id E9B1EC46ED
 for <wireguard@lists.zx2c4.com>; Thu, 14 May 2026 18:17:26 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net (smtp)
 with ESMTPSA id PHO09bDS6W20-gbqx5UP5; 
 Thu, 14 May 2026 18:17:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1778771846; bh=SbCKDMg5X1qsoGb+M6HHUAUkvEd0JYXJCjZSEZb+RS8=;
 h=Message-ID:References:Date:Subject:In-Reply-To:To:From;
 b=d8v3B097fnWp8qm4TZHv4CICQ/C6t2JIme0jA6YOS71+NOXlYaY204PBX6Pbl+k+K
 zjZzivcFOZmEDAi/JXTxQxEO+6q82arDf4k35L1/JoWtdQNbWDjYMZyYqKIYVessvI
 t1HKDD/dMu+x9fCmKinuP4k+xOmDzQNMNyvPNfq0=
Authentication-Results: mail-nwsmtp-smtp-production-main-59.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex.ru
From: "Yandex Mail" <chernyak0927@yandex.ru>
To: <wireguard@lists.zx2c4.com>
References: 
In-Reply-To: 
Subject: Re: Sunsetting support for old Windows versions
Date: Thu, 14 May 2026 18:17:25 +0300
Message-ID: <001001dce3b4$c568cb30$503a6190$@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: base64
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKEDj62aEikAr22m/Nu1sXLkAYMtLS/S/9Q
Content-Language: ru
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

4SDLwcsg1sUg0NLPx9LBzc3BIFZ4S2V4IChodHRwczovL2dpdGh1Yi5jb20vaTQ4Ni9WeEtleCkg
xMzRIFdpbmRvd3MgNz8g98XE2A0Kz87BINDP2tfPzNHF1CDawdDV08vB1Ngg0NLPx9LBzc3ZLCDL
wcsgwtkg1yDSxdbJzcUg08/XzcXT1MnNz9PUySDTIFdpbmRvd3MNCjEwLzExLCDUwcsg1sUgy8HL
INzUzyDQz9rXz8zRxdQgxMXMwdTYIE9uZSBDb3JlIEFQSQ0KKGh0dHBzOi8vZ2l0aHViLmNvbS9z
aG9ydGhvcm4tcHJvamVjdC9PbmUtQ29yZS1BUEktQmluYXJpZXMpIMTM0SB3aW5kb3dzIFhQLg0K
4tXExdQgzMkg0yDOxcog0sHCz9TB1NggV2lyZWd1YXJkPyDtz9bF1CDPzsEgzsUgz8LF09DF3snU
INfTwCDT1MHCyczYzs/T1NgNCtDSz8fSwc3N2Swgzs8g0sHCz9TB1Ngg0SDE1c3BwCDC1cTF1C4N
CuXTzMkg0SDP09TBztXT2CDOwSDT1MHSz8og18XS08nJINDSz8fSwc3N2Swgzc7Px8/FIMzJINEg
0M/UxdLRwCwg6czJDQrQ0s/H0sHNzcEgwtXExdQg0sHCz9TB1Ngg1MHL1sUgyM/Sz9vPIMvByyDJ
INLBztjbxT8g6SDF09TYIMzJIMvBy8HRLc7JwtXE2A0K09PZzMvBIM7BINPUwdLVwCDXxdLTycAg
0NLPx9LBzc3ZLCDe1M/C2SDTy8HeydfB1NggxaMgwsXaINDSz8LMxc0sIMEgzsUNCtDF0sXOz9PJ
1Ngg0yDPxM7Px88gy8/N0NjA1MXSwSDOwSDE0tXHz8o/DQoNCg0KRW5nbGlzaCB2ZXJzaW9uOg0K
V2hhdCBhYm91dCBWeEtleCAoaHR0cHM6Ly9naXRodWIuY29tL2k0ODYvVnhLZXgpIGZvciBXaW5k
b3dzIDc/IEl0IGFsbG93cw0KeW91IHRvIHJ1biBwcm9ncmFtcyBpbiBjb21wYXRpYmlsaXR5IG1v
ZGUgd2l0aCBXaW5kb3dzIDEwLzExLCBqdXN0IGxpa2UgT25lDQpDb3JlIEFQSSAoaHR0cHM6Ly9n
aXRodWIuY29tL3Nob3J0aG9ybi1wcm9qZWN0L09uZS1Db3JlLUFQSS1CaW5hcmllcykgZG9lcw0K
Zm9yIFdpbmRvd3MgWFAuIFdpbGwgV2lyZWd1YXJkIHdvcmsgd2l0aCBpdD8gSXQgbWlnaHQgbm90
IGd1YXJhbnRlZSBjb21wbGV0ZQ0KcHJvZ3JhbSBzdGFiaWxpdHksIGJ1dCBJIHRoaW5rIGl0IHdp
bGwgd29yay4NCklmIEkgc3RpY2sgd2l0aCB0aGUgb2xkIHZlcnNpb24sIHdpbGwgSSBtaXNzIG91
dCBvbiBtdWNoPyBPciB3aWxsIGl0IHN0aWxsDQp3b3JrIGp1c3QgYXMgd2VsbD8gQW5kIGlzIHRo
ZXJlIGEgbGluayB0byB0aGUgb2xkIHZlcnNpb24gc28gSSBjYW4gZG93bmxvYWQNCml0IHdpdGhv
dXQgaGF2aW5nIHRvIHRyYW5zZmVyIGl0IGZyb20gb25lIGNvbXB1dGVyIHRvIGFub3RoZXI/DQo=

