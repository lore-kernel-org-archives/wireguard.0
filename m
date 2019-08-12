Return-Path: <SRS0=z0pY=WI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4195C31E40
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Aug 2019 18:26:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE5F2070C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Aug 2019 18:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE5F2070C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=activezone.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cab9c88c;
	Mon, 12 Aug 2019 18:26:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7894ebe4
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 18:26:47 +0000 (UTC)
Received: from titan-smx.freebsdcloud.com (titan-smx.freebsdcloud.com
 [82.206.32.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa157717
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Aug 2019 18:26:46 +0000 (UTC)
Received: from trinitron.activezone.de (trinitron.vl8-han.freebsdcloud.com
 [159.69.229.114])
 by titan-smx.freebsdcloud.com (8.15.2/8.15.2) with ESMTPS id x7CIPULe019763
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <wireguard@lists.zx2c4.com>; Mon, 12 Aug 2019 20:25:30 +0200 (CEST)
 (envelope-from markus@activezone.de)
X-Authentication-Warning: titan-smx.freebsdcloud.com: Host
 trinitron.vl8-han.freebsdcloud.com [159.69.229.114] claimed to be
 trinitron.activezone.de
Received: from mitteilung.com (authenticated bits=0)
 by MTA1  with ESMTPSA id x7CIPP2Y002807
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Mon, 12 Aug 2019 20:25:25 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: markus <markus@activezone.de>
Openpgp: preference=signencrypt
Autocrypt: addr=markus@activezone.de; prefer-encrypt=mutual; keydata=
 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
Subject: WireGuard with a Non-Automatic-Default-Route
Message-ID: <fa3d81b0-dae5-ef28-4fc6-e72d30d540a2@activezone.de>
Date: Mon, 12 Aug 2019 20:25:25 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
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

SGkgSmFzb24hCgpUb2RheSBJIGhhdmUgY29uZmlndXJlZCB0aGUgZmlyc3QgdGltZSBhIHdpcmVn
dWFyZCBvbiBteSBkZXNrdG9wCmNvbXB1dGVyIChNYWNPU1gpLiBJIGtub3cgdGhhdCBNYWNPU1gg
aXMgZGVjbGFyZWQgYXMgYSBjbGllbnQgb3BlcmF0aW5nCnN5c3RlbSBidXQgSSBiZWxpZXZlIGEg
IkNoZWNrYm94IiBpbnRvIHRoZSB3aXJlZ3VhcmQgc2V0dXAgYm94IGZvciB0aGUKb3B0aW9uICJE
b24ndCBhZGQgYSBEZWZhdWx0LVJvdXRlIiB3YXMgYSBnb29kIGlkZWEuCgpJbiBteSAidmVyeSIg
Y29tcGxleCB3aXJlZ3VhcmQgbWVzaCBJJ20gdXNpbmcgQklSRCB3aXRoIE9TUEYgYnV0IEkgaGF2
ZQpub3cgYSBzbWFsIGpvYiB0byBjb25maWd1cmUgYSBzaW5nbGUgY2xpZW50IHdpdGggb25seSBh
IHNpbmdsZQpkZXN0aW5hdGlvbiBhZGRyZXNzLiBUaGUgImN1c3RvbWVyIiAobXkgYnJvdGhlciAq
ZyopIGlzIG9ubHkgYSBlbmR1c2VyCnRoZXkgd2FudCB0byBhY2Nlc3MgYSBzZXJ2aWNlIG9uIG15
IG5ldHdvcmsuIEhlIGRvbid0IG5lZWQgYSBkZWZhdWx0CmdhdGV3YXkgaW50byBteSBuZXR3b3Jr
LiBJbnN0ZWFkIHRoZSBnYXRld2F5IGFkZHJlc3MgYSBuZXR3b3JrIGFkZHJlc3MKd291bGQgYmUg
YSBncmVhdCB0aGluZyAoZm9yIG1lKS4KCk9waW5pb25zIG9uIHRoaXM/CgotLSAKQmVzdCByZWdh
cmRzLApNYXJrdXMKCkJldHRlciBQcml2YWN5IHdpdGggUEdQIGVuY3J5cHRlZCBNYWlsOiBodHRw
Oi8vYWN0aXZlem9uZS5kZS9wZ3AvCkZpbmdlcnByaW50OiA1OEM1IDhCQUYgNkZDRSBCMjRGIDE4
ODEgQjVCOCBGMkE4IEUxRDAgNDg0QiAwMDU0ClRocmVlbWEgSUQ6IDdaUkVUMkpZCgrigJ5XZXIg
ZGllIEZyZWloZWl0IGF1ZmdpYnQgdW0gU2ljaGVyaGVpdCB6dSBnZXdpbm5lbiwgCmRlciB3aXJk
IGFtIEVuZGUgYmVpZGVzIHZlcmxpZXJlbi7igJwgIC0tIEJlbmphbWluIEZyYW5rbGluCgkKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
