Return-Path: <SRS0=v8Vx=FE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9AEC64E8A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 11:13:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B8AB207BC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 11:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rozman.si header.i=@rozman.si header.b="gT+bfHGm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B8AB207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=rozman.si
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77698282;
	Mon, 30 Nov 2020 11:07:11 +0000 (UTC)
Received: from krn.amebis.si (krn.amebis.si [93.103.235.207])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e620dbc9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 11:07:08 +0000 (UTC)
Received: by krn.amebis.si (Postfix, from userid 982)
 id 16E4518E87AC; Mon, 30 Nov 2020 12:13:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rozman.si;
 s=default; t=1606734804;
 bh=bZKZ3crt9e9nXiAFXoA0ZCSb/sYqkCtAudbmkqnZxGk=;
 h=From:To:Subject:Date:References:In-Reply-To:From;
 b=gT+bfHGmuNPTvCK+GAwu7Fq9UHkIYer67Sew+9Vxcfdzl6A07l9pVbOa6Pivw0Q+7
 d3VH+lhZuNcrACSoSK2o+6xWyyzMV+C6AMUz2RCS9zx9NhdvL4TCyTOG8Ezs65db8t
 SI5Zo5RSLu2GliYr0VQ4PIGnokHxliOtJORhvB/Y=
Received: from Konj.amebis.doma (konj.amebis.doma [IPv6:2a01:260:4101:1464::4])
 by krn.amebis.si (Postfix) with ESMTPS id 277A318E87AB;
 Mon, 30 Nov 2020 12:13:22 +0100 (CET)
Received: from Konj.amebis.doma (2a01:260:4101:1464::4) by Konj.amebis.doma
 (2a01:260:4101:1464::4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.659.4; Mon, 30 Nov 2020
 12:13:22 +0100
Received: from Konj.amebis.doma ([fe80::545:cd17:7444:be04]) by
 Konj.amebis.doma ([fe80::545:cd17:7444:be04%9]) with mapi id 15.02.0659.008;
 Mon, 30 Nov 2020 12:13:21 +0100
From: Simon Rozman <simon@rozman.si>
To: Henning Ryll <henning.ryll@web.de>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: wireguard on multi user windows ?
Thread-Topic: wireguard on multi user windows ?
Thread-Index: AQHWxpMRJ4eMmch6O0qu3BiWcQH+iKnghnmA
Date: Mon, 30 Nov 2020 11:13:21 +0000
Message-ID: <C32D3AC1-CDBA-4035-BDCE-2F566D939D63@rozman.si>
References: <trinity-8b39e676-4010-4d53-9bc2-9ca84bcf3a85-1606583048495@3c-app-webde-bap18>
In-Reply-To: <trinity-8b39e676-4010-4d53-9bc2-9ca84bcf3a85-1606583048495@3c-app-webde-bap18>
Accept-Language: en-GB, sl-SI, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.43.20110804
x-originating-ip: [2a01:260:4101:140a::5]
Content-Type: text/plain; charset="utf-8"
Content-ID: <52F98578188E5C43A09260741A455E8E@amebis.si>
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

SGksDQoNCklmIHlvdXIgY2hpZWYgZmluZHMgb3V0LCB5b3VyIGNvbXBhbnkgbGFwdG9wIGlzIGJl
aW5nIHVzZWQgYnkgeW91ciBraWQgYW5kIHdpZmUsIHRha2VuIHRvIGtpZCdzIHNjaG9vbCBhbmQg
d2hhdCBub3QsICp0aGVuKiwgeW91ciBjaGllZiB3aWxsIGdldCB2ZXJ5IHZlcnkgdmVyeSB1bmhh
cHB5LiA6KQ0KDQpJbWFnaW5lIHlvdXIga2lkIGhhdmluZyBhIHRyb2phbiBob3JzZSBydW5uaW5n
IG9uIGhpcyBkZXNrdG9wLCBqdXN0IGxvY2tzIHRoZSBkZXNrdG9wLCB5b3UgYm9ycm93IGJhY2sg
dGhlIGNvbXB1dGVyIHRvIGRvIHNvbWUgY29tcGFueSB3b3JrLiBXaGVuIHlvdSBjb25uZWN0IHRv
IHlvdXIgY29tcGFueSwgdGhlIHRyb2phbiBob3JzZSBnZXRzIGFsbCB0aGUgbmV0d29yayBhY2Nl
c3MgdG8geW91ciBjb21wYW55IHJlc291cmNlcyB5b3VyIFZQTiBjb25uZWN0aW9uIGFsbG93cy4N
Cg0KVGhlIFdpcmVHdWFyZCB0dW5uZWwgcHJvZmlsZXMgYXJlIGJvdW5kIHRvIGNvbXB1dGVyLCBu
b3QgaW5kaXZpZHVhbCB1c2VycyB3aXRoIGEgcmVhc29uOiBvbiBXaW5kb3dzLCBWUE4gY29ubmVj
dHMgdGhlIGVudGlyZSBjb21wdXRlciB0byBhIG5ldHdvcmsuIE5vdCBqdXN0IGEgcGFydGljdWxh
ciB1c2VyLg0KDQpTb3JyeSwgV2lyZUd1YXJkIGlzIGFuZCB3aWxsIHJlbWFpbiAidW51c2FibGUi
IGZvciBzdWNoIGlsbCBhbmQgdW5zYWZlIHByYWN0aWNlcyBsaWtlIHlvdXJzLg0KDQpSZWdhcmRz
LCBTaW1vbg0KDQrvu78tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogV2lyZUd1YXJk
IDx3aXJlZ3VhcmQtYm91bmNlc0BsaXN0cy56eDJjNC5jb20+IG9uIGJlaGFsZiBvZiBIZW5uaW5n
IFJ5bGwgPGhlbm5pbmcucnlsbEB3ZWIuZGU+DQpEYXRlOiBTdW5kYXksIDI5IE5vdmVtYmVyIDIw
MjAgYXQgMjIuMDMNClRvOiAid2lyZWd1YXJkQGxpc3RzLnp4MmM0LmNvbSIgPHdpcmVndWFyZEBs
aXN0cy56eDJjNC5jb20+DQpTdWJqZWN0OiB3aXJlZ3VhcmQgb24gbXVsdGkgdXNlciB3aW5kb3dz
ID8NCg0KICAgIEhlbGxvLA0KDQogICAgSSdtIGxvb2tpbmcgZm9yIGEgKG1vcmUgb3IgbGVzcykg
c2VjdXJlIHNvbHV0aW9uIG9mIGluc3RhbGxpbmcgYW5kIHJ1bm5pbmcgd2lyZWd1YXJkLg0KDQog
ICAgSW4gb3VyIGZhbWlseSB3ZSBoYXZlIG9ubHkgb25lIG5vdGVib29rIHJ1bm5pbmcgd2luMTAv
NjQuDQogICAgU2luY2UgdGhpcyBpcyB0aGUgb25seSBkZXZpY2Ugd2l0aCBpbnRlcm5ldCBhY2Nl
c3MgaXQgaGFzIHRvIGJlIHJlbGlhYmxlIGFzIHBvc3NpYmxlLiBTbyB3ZSBhcmUgcnVubmluZyA0
IGFjY291bnRzLg0KICAgIGFkbWluLCBmYXRoZXIsIG1vdGhlciwgc29uLiBPZiBjb3Vyc2Ugb25s
eSB0aGUgYWRtaW4gaGFzIGFkbWluIHJpZ2h0cy4gQnV0IGFsbCB1c2VycyBoYXZlIG9wZXJhdG9y
IHJpZ2h0cyBiZWNhdXNlIHRoZSBub3RlYm9vayBpcyB0YWtlbiB0byBkaWZmZXJlbnQgbG9jYXRp
b25zIGkuZS4gYXQgc2Nob29sLCB0byBmcmllbmRzLCBkdXJpbmcgaG9saWRheS4NCg0KICAgIEkn
bSBydW5uaW5nIE9wZW5WUE4gdG8gZG8gbXkgaG9tZXdvcmsgd2l0aCB0aGlzIG5vdGVib29rIHRv
by4gQW5kIGJlY2F1c2UgbXkgb3BlbnZwbi5wMTIgZmlsZSBpcyBwcm90ZWN0ZWQgYnkgYSBwYXNz
d29yZCBteSBmYW1pbHkgY2FuIG5vdCB1c2UgaXQgYmVjYXVzZSB0aGUgZGlkIG5vdCBrbm93IG15
IHBhc3N3b3JkLiBFdmVuIGlmIHRoZXkgaGF2ZSBwaHlzaWNhbCBhY2Nlc3MgdG8gaXQuDQoNCiAg
ICBCdXQgd2l0aCB3aXJlZ3VhcmQgdGhlcmUgaXMgbm8gc3VjaCBwcm90ZWN0aW9uLiBBbmQgd2l0
aCB0aGUgbmV3IHdpcmVndWFyZCBmb3Igd2luZG93cyB0aGUga2V5IGZpbGVzIGhhdmUgYmVlbiBt
b3ZlZC4NCiAgICBBbmQgYXMgZmFyIGFzIGkgdW5kZXJ0c3R1ZCBldmVyeWJvZHkgaW4gdGhlIG9w
ZXJhdG9yIGdyb3VwIGNhbiBzdGFydCB0aGUgd2lyZWd1YXJkIHR1bm5lbC4NCiAgICBCdXQgbXkg
Y2hpZWYgd2lsbCBiZSB2ZXJ5IHZlcnkgdW5oYXBweSBpZiB0aGlzIHdpbGwgb2NjdXIgLi4uLg0K
DQogICAgSG93IHRvIGluc3RhbGwgd2lyZWd1YXJkIG9uIGEgbXVsdGl1c2VyIHN5c3RlbS4gQW5k
IG9ubHkgdGhlIG93bmVyIG9mIGEga2V5ZmlsZSBjYW4gcnVuIGhpcyB0dW5uZWw/DQogICAgT3Ro
ZXIgdXNlcnMgbWF5IGJlIGFibGUgdG8gcnVuIG90aGVyIHR1bm5lbHMuDQogICAgT3IgaXMgd2ly
ZWd1YXJkIHN0aWxsIHVudXNlYWJsZSBmb3IgbWUgYW5kIEkgaGF2ZSB0byBzdGF5IGF0IE9wZW5W
UE4/DQoNCiAgICBIZW5uaW5nDQoNCg==
