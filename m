Return-Path: <SRS0=xbiu=RJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D995BC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 10:32:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F8020661
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 10:32:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="aevEjbx8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F8020661
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e6c7e58;
	Wed, 6 Mar 2019 10:21:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54f7cb3d
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 10:21:43 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48dcff65
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 10:21:43 +0000 (UTC)
Date: Wed, 06 Mar 2019 10:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1551868329;
 bh=r6X2o12+zhxrg1oF88B6ye1zwFJ4yZu3elLlkLBOFs0=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:Feedback-ID:
 From;
 b=aevEjbx8ECq+TP62nDlH5jFoOqZzUAs0tD/O7QbgjzSlyBmQ2vzcOYfxkXOLTS6by
 jCVL714djTAoy+fnmLhQA/USlr6ldsU1kDh3a+O/NtmB6YR4y0LVEENmPaAYUFdWJg
 SFEG64gVkb4Rvw/p99RzR+HWBCjy4SspWl53nWUM=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: kolargol <kolargol@protonmail.com>
Subject: Re: iOS WG Battery Life
Message-ID: <m0TuqDHkAYGdhWF5GpR41VFR2CyQ13kQakLz3a1iM22qOCiC97dq40L2GVvnR-YL8mQFUQuBntkZjx8w9R2mgBZoW5fkAXYe3a8i4k004Ik=@protonmail.com>
In-Reply-To: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
Feedback-ID: BeuBiSQcqsr-Krwtcv9IekhH3G8BPby93wz9So6BEG3RLXEAsJdmMzmwNOSrHC8ToF3fQqLPAjlqXY7tyhxFEQ==:Ext:ProtonMail
MIME-Version: 1.0
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: kolargol <kolargol@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4711084082829604991=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============4711084082829604991==
Content-Type: multipart/alternative;
	boundary="b1_398631f1a494110a937475c80f810926"

This is a multi-part message in MIME format.

--b1_398631f1a494110a937475c80f810926
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

QWZ0ZXIgZmV3IGRheXMgb2YgdGVzdGluZyBhbmQgZGlnZ2luZyBpIGZvdW5kIG5vdGhpbmcgd3Jv
bmcgd2l0aCBXaXJlR3VhcmQuLi4gaXQgdHVybmVkIG91dCB0aGF0IGZvciBzb21lIHJlYXNvbiBh
ZnRlciB1c2luZyBXaXJlR3VhcmQsIFdpRmkgQ2FsbGluZyBhbmQvb3IgVm9MVEUgc3RhcnRlZCB0
byBnbyBjcmF6eSBhbmQgZWF0IHVwIGJhdHRlcnkuCkFmdGVyIGRpc2FibGluZyBib3RoIGZlYXR1
cmVzIGFuZCB3aXRoIFdHIGluIERhbWFuZCBtb2RlIChhbHdheXMgb24pIGFuZCA4aCBiYXR0ZXJ5
IGRyb3BwZWQgc2hvY2tpbmcgMiUgLi4uCgpub3csIHlvdS9JIGNhbiBkaXNtaXNzIHRoYXQgcmVw
b3J0IG9yIHRyeSB0byBmaW5kIHdoeSBXaS1GaSBDYWxsaW5nIGFuZCBWb0xURSBnb2luZyBjcmF6
eSB3aXRoIHdpcmVndWFyZCBlbmFibGVkLiBJdCBtaWdodCBiZSBidWcgaW4gaU9TLCBidWcgaW4g
VC1Nb2JpbGUgaW1wbGVtZW50YXRpb24sIGJ1ZyBpbiBDRk5ldHdvcmssIG9yIHZwbiBleHRlbnNp
b24sIHdobyBrbm93cy4gSWYgeW91IGhhdmUgaWRlYXMgYWJvdXQgdGhhdCBsZXQgbWUga25vdy4K
CnRoYW5rcyBhbGwgZm9yIGxpc3RlbmluZy4KX18Ka29sYXJnb2wKClNlbnQgd2l0aCBbUHJvdG9u
TWFpbF0oaHR0cHM6Ly9wcm90b25tYWlsLmNvbSkgU2VjdXJlIEVtYWlsLgoK4oCQ4oCQ4oCQ4oCQ
4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQCk9uIFRodXJz
ZGF5LCBGZWJydWFyeSAyOCwgMjAxOSAxOjA3IFBNLCBrb2xhcmdvbCA8a29sYXJnb2xAcHJvdG9u
bWFpbC5jb20+IHdyb3RlOgoKPiBIaQo+Cj4gVGhhbmtzIGZvciBncmVhdCB3b3JrIHdpdGggV2ly
ZWd1YXJkLCBpdCdzIGZyZXNoIGJyZWV6ZSBvZiBhaXIgY29tcGFyZWQgb24geWVhcnMgc3BlbmQg
b24gT3BlblZQTi4uLgo+Cj4gSSBhbSB0ZXN0aW5nIFdHIG9uIHZhcml1cyBPU2VzIGFuZCBkZXZp
Y2VzIGFuZCBJIGhhdmUgbm90ZWQgc2V2ZXJlIGJhdHRlcnkgZHJhaW4gb24gaU9TICgxMi4yLCBp
UGhvbmUgOCkuIFR5cGljYWxseSBiYXR0ZXJ5IGRyb3BzIDQwJSBkdXJpbmcgbmlnaHQtdGltZSAo
dGhhdCBpcyA3IGhvdXJzIG9mIGluYWN0aXZpdHkgb24gdGhlIHBob25lKSB3aGVuIFdpcmVHdWFy
ZCBpcyBlbmdhZ2VkLgo+IElzIHRoaXMgc29tZSBraW5kIG9mIGtub3duIGlzc3VlPyBJIGRpZCBu
b3QgaGFkIGNoYW5jZSB0byB0ZXN0IHByZXZpb3VzIGlPUyB2ZXJzaW9uIHdpdGhvdXQgU0lNRCBD
aGFDaGEyMCBzdXBwb3J0IHNvIGkgY2Fubm90IHRlbGwgaWYgaXQgaXMgYmVjb3VzZSBvZiB0aGUg
bGFzdCB1cGRhdGUuCj4KPiBBbnl0aGluZyBpIGNhbiBkbyB0byB0cmFjayBpc3N1ZSBoZXJlPwo+
Cj4gdGhhbmtzLAo+IGtvbGFyZ29s


--b1_398631f1a494110a937475c80f810926
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5BZnRlciBmZXcgZGF5cyBvZiB0ZXN0aW5nIGFuZCBkaWdnaW5nIGkgZm91bmQgbm90aGlu
ZyB3cm9uZyB3aXRoIFdpcmVHdWFyZC4uLiBpdCB0dXJuZWQgb3V0IHRoYXQgZm9yIHNvbWUgcmVh
c29uIGFmdGVyIHVzaW5nIFdpcmVHdWFyZCwgV2lGaSBDYWxsaW5nIGFuZC9vciBWb0xURSBzdGFy
dGVkIHRvIGdvIGNyYXp5IGFuZCBlYXQgdXAgYmF0dGVyeS4gPGJyPjwvZGl2PjxkaXY+QWZ0ZXIg
ZGlzYWJsaW5nIGJvdGggZmVhdHVyZXMgYW5kIHdpdGggV0cgaW4gRGFtYW5kIG1vZGUgKGFsd2F5
cyBvbikgYW5kIDhoIGJhdHRlcnkgZHJvcHBlZCBzaG9ja2luZyAyJSAuLi48YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5ub3csIHlvdS9JIGNhbiBkaXNtaXNzIHRoYXQgcmVwb3J0IG9yIHRy
eSB0byBmaW5kIHdoeSBXaS1GaSBDYWxsaW5nIGFuZCBWb0xURSBnb2luZyBjcmF6eSB3aXRoIHdp
cmVndWFyZCBlbmFibGVkLiBJdCBtaWdodCBiZSBidWcgaW4gaU9TLCBidWcgaW4gVC1Nb2JpbGUg
aW1wbGVtZW50YXRpb24sIGJ1ZyBpbiBDRk5ldHdvcmssIG9yIHZwbiBleHRlbnNpb24sIHdobyBr
bm93cy4gSWYgeW91IGhhdmUgaWRlYXMgYWJvdXQgdGhhdCBsZXQgbWUga25vdy48YnI+PC9kaXY+
PGRpdj48YnI+PC9kaXY+PGRpdj50aGFua3MgYWxsIGZvciBsaXN0ZW5pbmcuPGJyPjwvZGl2Pjxk
aXYgY2xhc3M9InByb3Rvbm1haWxfc2lnbmF0dXJlX2Jsb2NrIj48ZGl2IGNsYXNzPSJwcm90b25t
YWlsX3NpZ25hdHVyZV9ibG9jay11c2VyIj48ZGl2Pl9fPGJyPjwvZGl2PjxkaXY+a29sYXJnb2w8
YnI+PC9kaXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdiBjbGFzcz0icHJvdG9ubWFpbF9zaWdu
YXR1cmVfYmxvY2stcHJvdG9uIj5TZW50IHdpdGggPGEgaHJlZj0iaHR0cHM6Ly9wcm90b25tYWls
LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPlByb3Rvbk1haWw8L2E+IFNlY3VyZSBFbWFpbC48YnI+PC9k
aXY+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj7igJDigJDigJDigJDigJDigJDigJAgT3JpZ2lu
YWwgTWVzc2FnZSDigJDigJDigJDigJDigJDigJDigJA8YnI+PC9kaXY+PGRpdj4gT24gVGh1cnNk
YXksIEZlYnJ1YXJ5IDI4LCAyMDE5IDE6MDcgUE0sIGtvbGFyZ29sICZsdDtrb2xhcmdvbEBwcm90
b25tYWlsLmNvbSZndDsgd3JvdGU6PGJyPjwvZGl2PjxkaXY+IDxicj48L2Rpdj48YmxvY2txdW90
ZSBjbGFzcz0icHJvdG9ubWFpbF9xdW90ZSIgdHlwZT0iY2l0ZSI+PGRpdj5IaTxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PlRoYW5rcyBmb3IgZ3JlYXQgd29yayB3aXRoIFdpcmVndWFyZCwg
aXQncyBmcmVzaCBicmVlemUgb2YgYWlyIGNvbXBhcmVkIG9uIHllYXJzIHNwZW5kIG9uIE9wZW5W
UE4uLi48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGFtIHRlc3RpbmcgV0cgb24gdmFy
aXVzIE9TZXMgYW5kIGRldmljZXMgYW5kIEkgaGF2ZSBub3RlZCBzZXZlcmUgYmF0dGVyeSBkcmFp
biBvbiBpT1MgKDEyLjIsIGlQaG9uZSA4KS4gVHlwaWNhbGx5IGJhdHRlcnkgZHJvcHMgNDAlIGR1
cmluZyBuaWdodC10aW1lICh0aGF0IGlzIDcgaG91cnMgb2YgaW5hY3Rpdml0eSBvbiB0aGUgcGhv
bmUpIHdoZW4gV2lyZUd1YXJkIGlzIGVuZ2FnZWQuIDxicj48L2Rpdj48ZGl2PklzIHRoaXMgc29t
ZSBraW5kIG9mIGtub3duIGlzc3VlPyBJIGRpZCBub3QgaGFkIGNoYW5jZSB0byB0ZXN0IHByZXZp
b3VzIGlPUyB2ZXJzaW9uIHdpdGhvdXQgU0lNRCBDaGFDaGEyMCBzdXBwb3J0IHNvIGkgY2Fubm90
IHRlbGwgaWYgaXQgaXMgYmVjb3VzZSBvZiB0aGUgbGFzdCB1cGRhdGUuPGJyPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+QW55dGhpbmcgaSBjYW4gZG8gdG8gdHJhY2sgaXNzdWUgaGVyZT88YnI+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj50aGFua3MsPGJyPjwvZGl2PjxkaXY+a29sYXJnb2w8
YnI+PC9kaXY+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2Pg==



--b1_398631f1a494110a937475c80f810926--


--===============4711084082829604991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4711084082829604991==--

