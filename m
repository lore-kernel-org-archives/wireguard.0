Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66872C04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 12:02:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE96206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 12:02:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=urlichs.de header.i=@urlichs.de header.b="LkLKwERg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE96206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5eeadb06;
	Mon, 3 Dec 2018 11:54:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 094bf00a
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 11:54:46 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95655c4f
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 11:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x2EildRDpjt1kNPj2JwOG8uqOBZThvJgS0x58nAaqVw=; b=LkLKwERg+Li8SVEcu/QyAx2aoO
 G1alPw+F/ccgjCyf8ehXg26M9OlI9jzzHzcTzo0X0jpM3KyHf5T5UePGCXOIC6otOGFcviAQ0/Lw8
 Qw1MaAYfSrJ0ZKB0rZO/uj7w/NRqdgl/aT9nqKTqRpz48xJ8X7m9NOuXcmmxMK6GN9116aupvZnQy
 bfj8GHrYaianprz3f469MbIbUI3DeaZ0qlZ7+cYJG/LRWYJzXpvCdxN6+5MK1NwIFMJOtYQhO3QYc
 TZNx/7jP8vWg3DvK12gHNkWTXjhHIlHOqVVfpOK979Y3ar0Pa8jn+VsDIJvQo5P3PoMeLKUTeCjko
 t7CSoBISsQkqCl+w4/lUSEkwtXVgOqIiR9hNv6ZlIOulj7Hg2IEcr8wfTfvXpLJqwBJVuGzdN2DbD
 EvTfWf59o+R5DxHzTAPqzNWHOi0c640y+Cx/j7rcqOF30R0kBOQq/WzcWxb4Nd/38ZsC9TTVnFVUW
 Sv9mBYcCk+0IAAPHyo28b5eORCKkzI8TOqEN6qzUvmkL0QvEolUvp9bVIml8EqA6Y4MKTWCbkYtQ1
 vx97qnfukGONCDQvFkVn22kZ46TX3UuzbIXyR1kF4LXgXs9cubHSgvI6YbrmkU5sEnDs32bRqYt99
 RnI8We0C93OMjCD09beTg9Js9XaV0vx4EWnGaHuCg=;
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.18.2.42])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1gTmvU-00064a-Fs
 for wireguard@lists.zx2c4.com; Mon, 03 Dec 2018 13:02:12 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Matthias Urlichs <matthias@urlichs.de>
Subject: =?UTF-8?Q?Host_routes_=e2=80=93_ARP_on_wireguard_interfaces=3f?=
Openpgp: preference=signencrypt
Autocrypt: addr=matthias@urlichs.de; prefer-encrypt=mutual; keydata=
 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
Message-ID: <8f102b9a-c476-24b7-c800-d4abdb4318d1@urlichs.de>
Date: Mon, 3 Dec 2018 13:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
Content-Language: de-CH
X-Smurf-Spam-Score: 0.0 (/)
X-Smurf-Whitelist: +relay_from_hosts
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

SGksCgpNeSBwcm9ibGVtOiBJIGhhdmUgYSBjb3VwbGUgb2YgaG9zdCByb3V0ZXMgd2l0aGluIG15
IG5ldHdvcmsgdGhhdCBwb2ludAp0byBhIHNlcnZpY2UncyAiY3VycmVudCBtYXN0ZXIiLiBXaGVu
IHRoYXQgbWFjaGluZSBnb2VzIGRvd24sIEkgbmVlZCB0bwphdXRvbWF0aWNhbGx5IHJlZGlyZWN0
IGl0cyBhZGRyZXNzIHRvIGEgZGlmZmVyZW50IGdhdGV3YXkuIFRoYXQncyBlYXN5IOKAkwpsb29r
dXAgdGhlIG5leHRob3AgZm9yIHRoZSAicmVhbCIgc2VydmVyIGFkZHJlc3MgYW5kIGNoYW5nZSB0
aGUgaG9zdApyb3V0ZSDigJMgZXhjZXB0IHdoZW4gdGhlIGRlc3RpbmF0aW9uIGlzIG9uIHdpcmVn
dWFyZCBhbmQgbmVlZHMgdG8gYmUKKHJlKWRpcmVjdGVkIHRvIGEgKGRpZmZlcmVudCkgcGVlci4K
Ck15IHByZWZlcnJlZCBzb2x1dGlvbiBmb3IgdGhpcyAoYW5kIGFsc28gdGhlIG9uZSB0aGF0IGlz
IG1vc3QgaW50dWl0aXZlCklNSE8pIHdvdWxkIGJlIHNvbWUgc29ydCBvZiBwc2V1ZG8tQVJQIOKA
kyBqdXN0IGVub3VnaCB0byBtYWtlICJpcCByb3V0ZQphZGQgRk9PIHZpYSBCQVIiIHdvcmssICdC
QVInIGJlaW5nIGEgaG9zdCBhZGRyZXNzIHRoYXQncyBhc3NvY2lhdGVkIHdpdGgKZXhhY3RseSBv
bmUgd2lyZWd1YXJkIHBlZXIuCgpUaG91Z2h0cz8KCi0tIAotLSBNYXR0aGlhcyBVcmxpY2hzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
