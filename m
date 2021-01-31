Return-Path: <SRS0=YmZ5=HW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E836DC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Feb 2021 14:28:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A2A64EDB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 20 Feb 2021 14:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A2A64EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=noris.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 907a345d;
	Sat, 20 Feb 2021 14:28:28 +0000 (UTC)
Received: from mail02.noris.net (mail02.noris.net [62.128.1.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab67c09b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Jan 2021 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=noris.de;
 s=201902; 
 h=Date:Subject:To:From; bh=JQEFFNTUGI8UdzhmrW3D3Walgkx2VQdsgigXPJ8vOZ0=;
 b=Ry2w8bA6qkRrMUe6Y2uOk3gLB/AC7c996z3uSaSZotHJFzRhY8QTCUTfl6z8I4XznP63dgGPrPpGPKMhP9Soza8TZk3ukRYTYTCu4pfGQs5obDWMKFduCZtHnkcnJ1a2UiKTl7Jq7713Cc8HoBjNwvY+ev4BbcaIr6BdGdE3dpadC/xwIXhguwTiGXxnxXp+DrpLqZVMt21c/lx4l2FaukmAxZaFyzRsW+HkU+ABHCgxp7Ku37TfQDG6RqIhZIZd1vQBytSMlzlDym3JOGSWHCZjZ/ivIEzpbof4aw/QdO+Mlqe0rtSXJ35G2dx2wLz/+1bYBmJdQT5EDqEpvVOKgw==;
Received: from zertificon-gw01.noris.net ([62.128.1.128])
 by mail02.noris.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) (envelope-from <matthias.urlichs@noris.de>)
 id 1l6DO7-0004hu-D4
 for wireguard@lists.zx2c4.com; Sun, 31 Jan 2021 15:07:39 +0100
Received: from zertificon-gw01.noris.net (localhost [127.0.0.1])
 by zertificon-gw01.noris.net (Postfix) with ESMTP id 585AC1B004F
 for <wireguard@lists.zx2c4.com>; Sun, 31 Jan 2021 15:07:39 +0100 (CET)
Received: from mailint1.office.noris.de (mailint1.office.noris.de [10.2.0.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by zertificon-gw01.noris.net (Postfix) with ESMTPS id 160121B0047
 for <wireguard@lists.zx2c4.com>; Sun, 31 Jan 2021 15:07:39 +0100 (CET)
Received: from grp02vp.winzone.noris.de ([10.2.1.71] helo=oma.noris.net)
 by mailint1.office.noris.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 (envelope-from <matthias.urlichs@noris.de>) id 1l6DO7-000M8C-1X
 for wireguard@lists.zx2c4.com; Sun, 31 Jan 2021 15:07:39 +0100
Received: from grp01vp.winzone.noris.de (2001:780:0:9:a12c:39f1:52e5:4315) by
 GRP02VP.winzone.noris.de (2001:780:0:9:cdf0:f863:df39:9235) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.529.5; Sun, 31 Jan 2021 15:07:33 +0100
Received: from grp01vp.winzone.noris.de ([fe80::a12c:39f1:52e5:4315]) by
 GRP01VP.winzone.noris.de ([fe80::a12c:39f1:52e5:4315%3]) with mapi id
 15.02.0529.010; Sun, 31 Jan 2021 15:07:33 +0100
From: Matthias Urlichs <matthias.urlichs@noris.de>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Feature request: tag incoming packets
Thread-Topic: Feature request: tag incoming packets
Thread-Index: AQHW99prE7+bLrbq9USqXCmamYtp8Q==
Date: Sun, 31 Jan 2021 14:07:33 +0000
Message-ID: <cc0a6bc9-5450-c30b-b3e9-8bb248b8c07d@noris.de>
References: <mailman.0.1612101211.63283.wireguard@lists.zx2c4.com>
In-Reply-To: <mailman.0.1612101211.63283.wireguard@lists.zx2c4.com>
Accept-Language: de-DE, en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.2.23.158]
x-c2processedorg: 561ef00b-2b6e-4cdf-a83d-fb19a3bc92c1
X-TBoneOriginalFrom: Matthias Urlichs <matthias.urlichs@noris.de>
X-TBoneOriginalTo: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-TBoneDomainSigned: false
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
 micalg="sha-256"; boundary="----C4ACADC1D8E7409EFDF3BF76D104F63D"
X-TBoneMailStatus: SIGNED=(SMIME | USER)
X-Noris-IP: 62.128.1.128
X-Mailman-Approved-At: Sat, 20 Feb 2021 14:28:27 +0000
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

This is an S/MIME signed message

------C4ACADC1D8E7409EFDF3BF76D104F63D
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <23CB57B02CE796419501897E9A1B41A2@noris.de>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCnRoZSBwcm9ibGVtOiBnaXZlbiBhIHdpcmVndWFyZCBpbnRlcmZhY2Ugd2l0aCBt
YW55IHBlZXJzLCBhbGwgd2l0aA0KZGlmZmVyZW50IG5ldHdvcmsgYWRkcmVzc2VzIGFuZCB3aGF0
bm90LiBJIHdhbnQgdG8gZG8gaW5ncmVzcyB0cmFmZmljDQphY2NvdW50aW5nIGFuZCBzb21lIHNw
ZWNpYWwgZmlsdGVyaW5nLg0KDQpBZGRpbmcgYW4gaW5jb21pbmcgZmlsdGVyIHRoYXQgcmUtY2xh
c3NpZmllcyBhbGwgaW5jb21pbmcgcGFja2V0cyB0byBpdHMNCmN1c3RvbWVyIGFjY291bnQgc2Vl
bXMgbGlrZSBhIGxvdCBvZiBzdXBlcmZsdW91cyB3b3JrLCBhbmQgdGhlIHdob2xlDQp0aGluZyBz
ZWVtcyBzb21ld2hhdCBmcmFnaWxlLg0KDQpJdCdkIGJlIHdheSBuaWNlciBpZiB3aXJlZ3VhcmQg
aGFkIGEgcGVyLXBlZXIgbmV0ZmlsdGVyIHRhZyB3aGljaCBpdA0Kd291bGQgc2ltcGx5IHNldCBv
biBhbGwgaW5jb21pbmcgcGFja2V0cyBmcm9tIHRoYXQgcGVlci4gRXhhbWluaW5nIHRoYXQNCmlu
IG15IG5ldGZpbHRlciB0YWJsZXMgd291bGQgdGhlbiBjYXVzZSBubyBzdXBlcmZsdW91cyBDUFUg
bG9hZCwgYW5kDQp1cGRhdGVzIHRvIHBlZXIgc3RhdHVzIHdvdWxkIGJlIGF0b21pYyBhbmQgbm90
IHJpc2sgY29sbGlkaW5nIHdpdGggb3RoZXINCnByb2Nlc3NlcycgdXBkYXRlIG9mIG5mdGFibGVz
Lg0KDQotLQ0KLS0gTWF0dGhpYXMgVXJsaWNocw0KDQoNCi0tDQpNYXR0aGlhcyBVcmxpY2hzDQpF
eGVjdXRpdmUgUHJpbmNpcGFsIFNvbHV0aW9uIEFyY2hpdGVjdCAoTGludXgpDQoNCm5vcmlzIG5l
dHdvcmsgQUcNClRob21hcy1NYW5uLVN0cmHDn2UgMTYtMjANCjkwNDcxIE7DvHJuYmVyZw0KRGV1
dHNjaGxhbmQNCg0KVGVsICs0OSA5MTEgOTM1MiAxNzE3DQpGYXggKzQ5IDkxMSA5MzUyIDEwMA0K
RW1haWwgbWF0dGhpYXMudXJsaWNoc0Bub3Jpcy5kZQ0KDQpub3JpcyBuZXR3b3JrIEFHIC0gTWVo
ciBMZWlzdHVuZyBhbHMgU3RhbmRhcmQNClZvcnN0YW5kOiBJbmdvIEtyYXVwYSAoVm9yc2l0emVu
ZGVyKSwgSm9hY2hpbSBBc3RlbCwgU3RlZmFuIEtlbGxlciwgRmxvcmlhbiBTaXBwZWwNClZvcnNp
dHplbmRlciBkZXMgQXVmc2ljaHRzcmF0czogU3RlZmFuIFNjaG5hYmVsIC0gQUcgTsO8cm5iZXJn
IEhSQiAxNzY4OQ0K

------C4ACADC1D8E7409EFDF3BF76D104F63D
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIK/AYJKoZIhvcNAQcCoIIK7TCCCukCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggc5MIIHNTCCBR2gAwIBAgIUFiOkp1ZMCyBxRm2gyUGdwnsedPsw
DQYJKoZIhvcNAQELBQAwXTELMAkGA1UEBhMCQ0gxJjAkBgNVBAoMHVF1b1ZhZGlz
IFRydXN0bGluayBTY2h3ZWl6IEFHMSYwJAYDVQQDDB1RdW9WYWRpcyBTd2lzcyBB
ZHZhbmNlZCBDQSBHNDAeFw0yMDEyMTYxNDAxNDVaFw0yMTEyMTYxNDExMDBaMIGI
MQswCQYDVQQGEwJERTEZMBcGA1UECgwQbm9yaXMgbmV0d29yayBBRzEZMBcGA1UE
CwwQbm9yaXMgbmV0d29yayBBRzEZMBcGA1UEAwwQTWF0dGhpYXMgVXJsaWNoczEo
MCYGCSqGSIb3DQEJARYZbWF0dGhpYXMudXJsaWNoc0Bub3Jpcy5kZTCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBAMvjiyILsPauQaTadbjEJVHwQQlQCyxT
5Q7p+KEYgo4XCoOIEYF9a1YOkiJAXdzvgPH7D6/4i3pHQKpv1DGOQSemixWPDXIY
bMsVqo98Gp+e8aLjjeRZGR7sB25vppsmLC7TsMFlV9fCbqhr5hCpepnCEPc3qn4P
lPZ6lPVYY5jUhTrX9QyAFYO6GOoe0bGXRllz1dzB3lU+tMkZv40G+F8Andk311vW
3hqZOWu/n++bwCbPZAizmE1OG5DVkjXKoEYzBsAZKD1uyL4iNXxVa9UITtOA8NnO
0i8iPE6Lilz93iMknPoWWbURH++yinAYzMWUVfgZ1+rBhRLIyzFWjUa3xa3oLao7
UuwlKjed2PneTMI74K7BYHTmnjmg6ECERNptQgw2UOi5VdRDV/UDG1PnGFxfgE/W
4eR/Ccj0bcsAFuFfZFudnj6i53lh47A7s84jPqo7CWTEC4ubqI+ooTi31nb7iOXl
l7iYHPuVs22vt/0fBpYyvj2QRH+fEfGaHDYi2fqSuzpzW56HOF+xCtZDEwu232YF
oyVilcKhj9qr/bWCy29AqPlfvanIAfN6FBLkykMjZRTm20D7Y96FUQxyBmrUc+K6
OdHmcOWPbfbHoXGraQ8WRj9YirzIOSaaLrL8QXXad3whGLymsQXeR4jQv/KC+TUn
Ev6A21MlWuEZAgMBAAGjggG/MIIBuzAfBgNVHSMEGDAWgBSVAeNZ11Vz5MI2Dag7
kkvZ5h4QfjCBhQYIKwYBBQUHAQEEeTB3MEkGCCsGAQUFBzAChj1odHRwOi8vdHJ1
c3QucXVvdmFkaXNnbG9iYWwuY29tL3F1b3ZhZGlzc3dpc3NhZHZhbmNlZGNhZzQu
Y3J0MCoGCCsGAQUFBzABhh5odHRwOi8vb2NzcC5xdW92YWRpc2dsb2JhbC5jb20w
JAYDVR0RBB0wG4EZbWF0dGhpYXMudXJsaWNoc0Bub3Jpcy5kZTBOBgNVHSAERzBF
MEMGCSsGAQQBvlgBZDA2MDQGCCsGAQUFBwIBFihodHRwOi8vd3d3LnF1b3ZhZGlz
Z2xvYmFsLmNvbS9yZXBvc2l0b3J5MB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3JsLnF1b3ZhZGlzZ2xvYmFs
LmNvbS9xdW92YWRpc3N3aXNzYWR2YW5jZWRjYWc0LmNybDAdBgNVHQ4EFgQUcj5I
b2tAjSnGvpy6z+CMB+0J5lUwDgYDVR0PAQH/BAQDAgWgMA0GCSqGSIb3DQEBCwUA
A4ICAQB2BhuhVey88U5xSAu/FZlv6QSA9ZmMTMB++eaf5v4/SgHKK6+60oPF0sfY
j17Y+PbuwYo5xZo5xVZ+EQZlo9q68257iDMKWJQFKg/sbJ7uplgitlEEKVnXGHEs
U9XmVh2mqpxTQ0ddqP/VJQ5TFafJ9R4LwYqyVCp8hf8nIgDo5cgE4kihJgF4jzhc
ovGsWsvyzYsAbrS7UTLw2rdFcMVP/eGPQ4XeL97ZlWGeko6r3www0jQyjphnauza
eq77kdwqRf9HwrVp9jCvgdrXQQgq1AD5R/nj3Tg/Ksqpx7QPXk0w+8Q6jSWr0uCU
7JO0fJQWi+fGRr0TG9SZD2Wm5mEEUYk9y/+R2xvO9YY29KkzLyuhwOk8aL6pT68r
4CPAkgU1qj26wVNyMitRmBQ+4SltSivLowZaGX2qaAJJfYeP8UnlNbCv0SxSg5qM
vtP4968WTZwLMo+0rN8Ex4BOIK9nr8bqf5YcmrfOKQawq23OkVu02TiTC7ZpvMr8
3JhlVrAu74l5+EvmlWP2klUW58fHTDgOjT6wsVHyySy6pGxe6iHwvWIPdzdQwM9Q
M+WGjkbzS51LDgRyOMHWy3R32c6CpXu7z+pIagMj8uS6kiVAkBixTsZikPZVXISp
yCqRFyAa83jxElIvgbnoDvICDZTnpR7smIXulYEtWu+8JN3x6zGCA4cwggODAgEB
MHUwXTELMAkGA1UEBhMCQ0gxJjAkBgNVBAoMHVF1b1ZhZGlzIFRydXN0bGluayBT
Y2h3ZWl6IEFHMSYwJAYDVQQDDB1RdW9WYWRpcyBTd2lzcyBBZHZhbmNlZCBDQSBH
NAIUFiOkp1ZMCyBxRm2gyUGdwnsedPswDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZI
hvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjEwMTMxMTQwNzM5
WjAvBgkqhkiG9w0BCQQxIgQgcZItHT8wzaQu66qcpXI2i76Qtml3WfowCy36XSBx
U8gweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcN
AwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggIA
rL67lhsTAlp9XPozLJqNMAuZh243DSZJNbQAOk0hhkw9CmE8f1iCIlMxhAjRQYX1
Kbg0WesZcAJYaL1mzb1HNcc/46Pb9/qZnm+LeZWJHCq/2axXHItCxg6sNtRyvJBc
7S4BMBV298y5k9iUNWjCql+A5bZb4TjymxAAJnDPhRek5Xr93nbZBx1IQp9w3wIC
BCfbRNNv/uWigguNebBqvPaC3tx7mR9J27DLKJJAGNfVYe3SqP1qvh54e7iN+uNe
RRI8HN/XJZoHIp5UJHkNXnIbwIsdxkJS8NOgSV349LqvukNpr1cAiQ3o3P0BYB8y
qkfwHjgarCkgo2MXriIn9KOI276+L10P0S6DsRvclnwSs3UTN0HEdx/GyxqKCTE8
+bKE22EyWIaROomFu6TgZ2mtyN8jdKYxIXs3Ua+63vW406NLCPMclOuMbGHTIrEr
5NCwkVN5jaKqHSeuS6lgNcjnNl6/jaubbwLG6rw0WRMzya4Z8Zv2QQSI7KHDAbJi
3zCmoi6joRh8jZqI2HkYH+pLLOS7pT2H89gCrh0y4Fpb3wdxRlHXAKUruH5RmQZK
KtFOvw+LzIpTkI1bilH5xm4GQskDYY2bzLnp3ZGG8zzwH4orh/Fs9ofUgNzQRFQg
99vhfYH6oP7jGPng1zpF4KuUy9V1EMUH97J2Yf04GlY=

------C4ACADC1D8E7409EFDF3BF76D104F63D--

