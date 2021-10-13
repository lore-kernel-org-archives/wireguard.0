Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C7EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 00:30:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7ED60C4B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 00:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC7ED60C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 533231dc;
	Wed, 13 Oct 2021 00:30:14 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5cb165ec
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 00:30:12 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id x4so640017pln.5
 for <wireguard@lists.zx2c4.com>; Tue, 12 Oct 2021 17:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:thread-topic:thread-index:date:message-id
 :references:in-reply-to:accept-language:content-language
 :content-transfer-encoding:mime-version;
 bh=bKmEZ0i0ALw25uKMPCGTmrxqAZyvuH9499IYDkeDa3o=;
 b=Tv1pNpoTIscjgUjYC2qarSl8P8SS+7irZus/+2Vy0dDXopDW1Le+6p4IZGtigkKQRz
 PRiMO1HwY5paIdiJAqQQgmyirn6rQ4kX6CnRMk4ri1zgF2YxqQ8NV54Ay1IaBFyoYRvZ
 DaeEngdtBZu+qNxms5fu8j7efmW49ae+DLVthV+EiwBTT3ex/xNojRYJ2zffCuh+/EHy
 aISxMKWTOIzgWAtK0lUVKemae+Ey3jiSI884E5xtt2tkpk0n0o4LXMi/0OxCq3KHZlaJ
 9ESTVGughvIzRG4N+gTO/c32LgxDI5QU7nJ4PjdcZqDaubOHZGo7AMV+2lOBdMTEUX69
 CwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:thread-topic:thread-index
 :date:message-id:references:in-reply-to:accept-language
 :content-language:content-transfer-encoding:mime-version;
 bh=bKmEZ0i0ALw25uKMPCGTmrxqAZyvuH9499IYDkeDa3o=;
 b=O+ceRY9iyLtAAyvYszYkpbEYFeVv4kA9qfLjhiovYUGq7+bi2AcB1SUPyWe+pq7FLm
 M9t9jmyyJPCfDcs1dp6phRj/yAHKCnRxSMgqCfMmMxqwdc6ukqvBFxI0U26nsWbjlJWW
 POIa3ZtLDPux1FOeLkcCkZBfsT/aZop2nEieyAKXtO0FsS4axlKzDAyMZSJlPV6isMEV
 KG2I1uwRD+uKzy8rxrjrfHpU6sWDWAdUxNHPueWot3qTw2Q5WGp1pfhmNFlQPQ22mMfx
 Ff1TwSY6eZcWGbqHiqUSxEXf4uAhUW3n/+Ua+5KH8nuFtBjBcEtevzj2SUXQorObPRyP
 sU8Q==
X-Gm-Message-State: AOAM533Vr91OG8qioyO8hzHqSBGE9ay4SMjsjs+PxTxwrMkmqPFVDg0Y
 w5gieMZ5paf3LcEja3/IqSShC/WHY7LqmQ==
X-Google-Smtp-Source: ABdhPJyTmVIsVQ5H/RCMaRzYbLrqBOjCveVsvdztwjyBGsZXsnCGrcMja1tQ5YFRVpMUsPM45pKoig==
X-Received: by 2002:a17:90a:1649:: with SMTP id x9mr85536pje.34.1634085010568; 
 Tue, 12 Oct 2021 17:30:10 -0700 (PDT)
Received: from MW2PR18MB2251.namprd18.prod.outlook.com ([2603:1036:908:3::5])
 by smtp.gmail.com with ESMTPSA id
 c27sm12836480pgb.89.2021.10.12.17.30.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Oct 2021 17:30:10 -0700 (PDT)
From: Scott Bonar <sbonar@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Wintun.dll (amd64) GetProcAddress failure
Thread-Topic: Wintun.dll (amd64) GetProcAddress failure
Thread-Index: AXdneXdh7sZtlrNMaD+wM5wU6MKuK0FpTEx1vqVVolM=
X-MS-Exchange-MessageSentRepresentingType: 1
Date: Wed, 13 Oct 2021 00:30:08 +0000
Message-ID: <MW2PR18MB225138007844015EDBF28F8CADB79@MW2PR18MB2251.namprd18.prod.outlook.com>
References: <CABGW2bUxOaOBuChZTS4w7+3OX0WNvypjYc-+cSNgQO-zWQHaFw@mail.gmail.com>
 <CAHmME9rd7uKcbKY0dXKLOPKVdxqrULOOCMvtjgFiaXK1ki1KHA@mail.gmail.com>
In-Reply-To: <CAHmME9rd7uKcbKY0dXKLOPKVdxqrULOOCMvtjgFiaXK1ki1KHA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-Exchange-Organization-SCL: -1
X-MS-TNEF-Correlator: 
X-MS-Exchange-Organization-RecordReviewCfmType: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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

VGhhbmtzLiAgSSBkb27igJl0IGtub3cgd2hhdCB2ZXJzaW9uIG9mIGV4YW1wbGUuYyBhbmQgd2lu
dHVuLmggSSB3YXMgbG9va2luZyBhdCB2ZXJzZSB3aGF0IGNvbWVzIGluIHRoZSByZWxlYXNlIHpp
cC4NCkJ1dCB0aGV5IGFyZSBmb3Igc3VyZSBkaWZmZXJlbnQuICBOb3cgdGhhdCBJIGhhdmUgdGhl
IGNvcnJlY3QgZmlsZXMgdGhpbmdzIGFwcGVhciB0byB3b3JrIGJldHRlciBhbmQgSeKAmW0gbm90
IGdvaW5nIHRvIGV2ZW4NClRyeSBhbmQgdHJhY2sgZG93biB3aGF0IHZlcnNpb24gSSB3YXMgbG9v
a2luZyBhdC4NCg0K77u/T24gMTAvMTIvMjEsIDY6MTMgUE0sICJKYXNvbiBBLiBEb25lbmZlbGQi
IDxKYXNvbkB6eDJjNC5jb20+IHdyb3RlOg0KDQogICAgSWYgeW91J3JlIHVzaW5nIHRoZSBqdXN0
LXJlbGVhc2VzIFdpbnR1biAwLjE0LCBtYWtlIHN1cmUgeW91J3JlIHVzaW5nDQogICAgdGhlIHdp
bnR1bi5oIGZyb20gdGhhdCByZWxlYXNlLCBhbG9uZ3NpZGUgdGhlIEluaXRpYWxpemVXaW50dW4N
CiAgICBmdW5jdGlvbiBmcm9tIGV4YW1wbGUuYy4NCg==
