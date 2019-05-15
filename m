Return-Path: <SRS0=wsGv=TQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0812C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 06:27:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 409EF20848
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 May 2019 06:27:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kobVaseL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 409EF20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cdf597df;
	Thu, 16 May 2019 06:27:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87ef6f30
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 13:49:06 +0000 (UTC)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 048e2588
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 May 2019 13:49:06 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id m32so3346647qtf.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 May 2019 06:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ThXy67B5BuHb9LL3u5KR/3dx14v5f4P2CRo0SHQ3NEk=;
 b=kobVaseLa5onZA4tQDsuYdMoOTOHFIzB7+DZzyxjrtPx3/uDYxuMQsx4uR7NiJnyYF
 xOftDCAEOLD52PtJAAz/KPr646MS75e17tsHQHPTMmmBdicNmUGauW+sw+D+NQwZ5j4T
 eM/x6YrXsnBE6KLiUrO3wLUL+JPBCWHPEi+fsUKYmr4YRIfumXxyCGpZ2dawzXU3k2mk
 F6jtWBcqk+la4YAeFTpzqjsahUvnjOXFrQsv1KLsOxwJPtj72CK2S88RdmPNgl1tO9aJ
 uvMtFRhOseExrwUjONJRCHq1mzNcleYHs3SV1NIE9Fkbk8W7O4KZ6NyjBCjKSlophH0k
 y9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ThXy67B5BuHb9LL3u5KR/3dx14v5f4P2CRo0SHQ3NEk=;
 b=Z0sg24iPLNN+KMqpnor30ZeMXTqgQ58SlCbizTfLDUDHGrsBO4ow5QSMxauGSfKfEj
 4DIssEDtf9WpuCJAyYNFq9Oab9RotNcxYEdhYsU6pWi2ZyqdmhLB3lSWSqM9NKjETmm+
 7fbOcOzGW45ONR45IUPvPGt4SOWm4oI6wpVUGrurvEoz3XFBPlpCbMJi6Ju+cvegJtnf
 xgw4m60l0jPQm4ZhKeamtBU+jbM6la359MEIFQN1HGWb5vfRXPHYXjpRa9WqxC41I2eq
 FWOMqll1oXE086kT6ADxQ8p2KS2FV9WQhRAYrMSRPTsKV8H8AvyQi3wbyiMl/j5da/bK
 mL2Q==
X-Gm-Message-State: APjAAAXg5QRysL0Lw56jXXHtEZU2Q5Z4yc0wNrBniKJq6VRongOGMp6S
 sG+8glNMKn79/leMhCfp9g9K5gvX8nCYWV/8jgGzfBNWtKU=
X-Google-Smtp-Source: APXvYqyl5xbr+0iz3D+wF7EfGjGbay9YL/Rn5z0QKs6fFHzh4rSmoSAsQoaXbY1hrj2T1akkfyiuTxzBmhUP46FYbmg=
X-Received: by 2002:ac8:2de1:: with SMTP id q30mr35438236qta.312.1557928145758; 
 Wed, 15 May 2019 06:49:05 -0700 (PDT)
MIME-Version: 1.0
From: Lev Stipakov <lstipakov@gmail.com>
Date: Wed, 15 May 2019 16:48:56 +0300
Message-ID: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
Subject: Wintun performance results
To: wireguard@lists.zx2c4.com, openvpn-devel@lists.sourceforge.net
X-Mailman-Approved-At: Thu, 16 May 2019 08:27:23 +0200
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
Content-Type: multipart/mixed; boundary="===============5632998736336709836=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5632998736336709836==
Content-Type: multipart/alternative; boundary="000000000000b6b1350588ed693e"

--000000000000b6b1350588ed693e
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I made openvpn3 (required changes will be incorporated into main branch at
some point) work with wintun and did performance testing in AWS.

Client:    c5.xlarge, Windows Server 2016, patched openvpn3 test client and
OpenVPN Connect 2.7.1.103 (uses tap-windows6, based on openvpn3).

Server:  c5.xlarge, Ubuntu 18.04, openvpn 2.4.4

Client and server instances are in the same VPC and placement group.

iPerf3 running on server:

> iperf3 -s -B 0.0.0.0 -V

iPerf3 running on client:

> iperf3 -c 10.8.0.1 -V (server VPN address)
> iperf3 -c 10.0.0.18 -V (server VPC address)

Results:

- no vpn

[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec  8.67 GBytes  7.45 Gbits/sec                  sender
[  4]   0.00-10.00  sec  8.67 GBytes  7.45
Gbits/sec                  receiver
CPU Utilization: local/sender 61.4% (5.6%u/55.8%s), remote/receiver 33.9%
(1.7%u/32.2%s)

- tap-windows6

[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec   404 MBytes   339 Mbits/sec                  sender
[  4]   0.00-10.00  sec   404 MBytes   339
Mbits/sec                  receiver
CPU Utilization: local/sender 4.6% (0.3%u/4.3%s), remote/receiver 21.4%
(2.2%u/19.2%s)

- wintun

[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec   536 MBytes   449 Mbits/sec                  sender
[  4]   0.00-10.00  sec   536 MBytes   449
Mbits/sec                  receiver
CPU Utilization: local/sender 2.9% (0.1%u/2.8%s), remote/receiver 10.1%
(0.7%u/9.3%s)

As you see, wintun performs 30% better comparison to tap-windows6 and
incurs significantly less CPU usage.

-- 
-Lev

--000000000000b6b1350588ed693e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGkgZ3V5cyw8ZGl2Pjxicj48L2Rpdj48ZGl2PkkgbWFkZSBvcGVudnBu
MyAocmVxdWlyZWQgY2hhbmdlcyB3aWxsIGJlIGluY29ycG9yYXRlZCBpbnRvIG1haW4gYnJhbmNo
IGF0IHNvbWUgcG9pbnQpIHdvcmsgd2l0aCB3aW50dW4gYW5kIGRpZCBwZXJmb3JtYW5jZSB0ZXN0
aW5nIGluIEFXUy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+Q2xpZW50OsKgIMKgIGM1
LnhsYXJnZSwgV2luZG93cyBTZXJ2ZXIgMjAxNiwgcGF0Y2hlZCBvcGVudnBuMyB0ZXN0IGNsaWVu
dCBhbmQgT3BlblZQTiBDb25uZWN0IDIuNy4xLjEwMyAodXNlcyB0YXAtd2luZG93czYsIGJhc2Vk
IG9uIG9wZW52cG4zKS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PlNlcnZlcjrCoCBjNS54bGFy
Z2UsIFVidW50dSAxOC4wNCwgb3BlbnZwbiAyLjQuNDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
Q2xpZW50IGFuZCBzZXJ2ZXIgaW5zdGFuY2VzIGFyZSBpbiB0aGUgc2FtZSBWUEMgYW5kIHBsYWNl
bWVudCBncm91cC48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmlQZXJmMyBydW5uaW5nIG9uIHNl
cnZlcjo8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PiZndDsgaXBlcmYzIC1zIC1CIDAuMC4wLjAg
LVY8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmlQZXJmMyBydW5uaW5nIG9uIGNsaWVudDo8L2Rp
dj48ZGl2Pjxicj48L2Rpdj48ZGl2PiZndDsgaXBlcmYzIC1jIDEwLjguMC4xIC1WIChzZXJ2ZXIg
VlBOIGFkZHJlc3MpPC9kaXY+PGRpdj4mZ3Q7IGlwZXJmMyAtYyAxMC4wLjAuMTggLVYgKHNlcnZl
ciBWUEMgYWRkcmVzcynCoMKgPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+UmVzdWx0czo8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0gbm8gdnBuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRp
dj5bIElEXSBJbnRlcnZhbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBUcmFuc2ZlcsKgwqDCoMKgwqBC
YW5kd2lkdGg8L2Rpdj48ZGl2PlvCoMKgNF3CoMKgwqAwLjAwLTEwLjAwwqDCoHNlY8KgwqA4LjY3
IEdCeXRlc8KgwqA3LjQ1IEdiaXRzL3NlY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHNlbmRlcjwvZGl2PjxkaXY+W8KgwqA0XcKgwqDCoDAuMDAtMTAuMDDCoMKgc2VjwqDCoDgu
NjcgR0J5dGVzwqDCoDcuNDUgR2JpdHMvc2VjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmVjZWl2ZXI8L2Rpdj48ZGl2PkNQVSBVdGlsaXphdGlvbjogbG9jYWwvc2VuZGVyIDYx
LjQlICg1LjYldS81NS44JXMpLCByZW1vdGUvcmVjZWl2ZXIgMzMuOSUgKDEuNyV1LzMyLjIlcyk8
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pi0gdGFwLXdpbmRvd3M2PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5bIElEXSBJbnRlcnZhbMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBUcmFuc2ZlcsKgwqDC
oMKgwqBCYW5kd2lkdGg8L2Rpdj48ZGl2PlvCoMKgNF3CoMKgwqAwLjAwLTEwLjAwwqDCoHNlY8Kg
wqDCoDQwNCBNQnl0ZXPCoMKgwqAzMzkgTWJpdHMvc2VjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgc2VuZGVyPC9kaXY+PGRpdj5bwqDCoDRdwqDCoMKgMC4wMC0xMC4wMMKgwqBz
ZWPCoMKgwqA0MDQgTUJ5dGVzwqDCoMKgMzM5IE1iaXRzL3NlY8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJlY2VpdmVyPC9kaXY+PGRpdj5DUFUgVXRpbGl6YXRpb246IGxvY2Fs
L3NlbmRlciA0LjYlICgwLjMldS80LjMlcyksIHJlbW90ZS9yZWNlaXZlciAyMS40JSAoMi4yJXUv
MTkuMiVzKTwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+LSB3aW50dW48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PlsgSURdIEludGVydmFswqDCoMKgwqDCoMKgwqDCoMKgwqDCoFRyYW5zZmVywqDC
oMKgwqDCoEJhbmR3aWR0aDwvZGl2PjxkaXY+W8KgwqA0XcKgwqDCoDAuMDAtMTAuMDDCoMKgc2Vj
wqDCoMKgNTM2IE1CeXRlc8KgwqDCoDQ0OSBNYml0cy9zZWPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBzZW5kZXI8L2Rpdj48ZGl2PlvCoMKgNF3CoMKgwqAwLjAwLTEwLjAwwqDC
oHNlY8KgwqDCoDUzNiBNQnl0ZXPCoMKgwqA0NDkgTWJpdHMvc2VjwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmVjZWl2ZXI8L2Rpdj48ZGl2PkNQVSBVdGlsaXphdGlvbjogbG9j
YWwvc2VuZGVyIDIuOSUgKDAuMSV1LzIuOCVzKSwgcmVtb3RlL3JlY2VpdmVyIDEwLjElICgwLjcl
dS85LjMlcyk8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFzIHlvdSBzZWUsIHdpbnR1biBwZXJm
b3JtcyAzMCUgYmV0dGVyIGNvbXBhcmlzb24gdG8gdGFwLXdpbmRvd3M2IGFuZCBpbmN1cnMgc2ln
bmlmaWNhbnRseSBsZXNzIENQVSB1c2FnZS48L2Rpdj48ZGl2Pjxicj48L2Rpdj4tLSA8YnI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSIgZGF0YS1zbWFydG1haWw9ImdtYWls
X3NpZ25hdHVyZSI+LUxldjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--000000000000b6b1350588ed693e--

--===============5632998736336709836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5632998736336709836==--
