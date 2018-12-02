Return-Path: <SRS0=1Qce=OL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58684C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Dec 2018 11:10:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BD582082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 Dec 2018 11:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="KkShS+4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BD582082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 634d642a;
	Sun, 2 Dec 2018 11:03:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95d257ce
 for <wireguard@lists.zx2c4.com>; Sun, 2 Dec 2018 11:03:08 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60b3678a
 for <wireguard@lists.zx2c4.com>; Sun, 2 Dec 2018 11:03:08 +0000 (UTC)
Date: Sun, 02 Dec 2018 11:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1543749039;
 bh=EB/o+aDD2W4M0mxqfnyrku2/7YujGsnBzDwH8Y1fJfU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=KkShS+4W3zwO+c+t0GL9VMnq/+UVZb6tT7TYpeK0eTgnMA6FFNLpjyRrYCcKBTHhK
 LO7TYaulPcVfIj41n3yHL42kWuYJ9ueVHLOmxqtNO4BnjbxocDvfI8k1xDYiDsbV81
 dqONMAoG0GPkcYTJHqmDkt1DMmJkSwVEcWziipwI=
To: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: Build fails on Debian, kernel 4.20.0-rc4
Message-ID: <ZXZgXRYJnrxY3Gq_xY8uWt7ZJiY1WguNk-BA-UY67mIJyGtZMGkcU3xr_bOuJ7YCvBtis033v6rcZKGq4VALz1VQYLwHRZjrsGRw-WfKa_I=@protonmail.ch>
In-Reply-To: <CANcuY=r=6fd+1+4arDi+95+BnWAiQupkT1Zct=Osktf9J4AUcA@mail.gmail.com>
References: <CANcuY=pwgLeSBdsxSmRMULK0BPzXpSczBg8Z-uCkBCuBg+ezbQ@mail.gmail.com>
 <dsoqviekeu6evb7laiisjpi0.1543698163154@gmail.com>
 <CANcuY=pCONP7Xy8hXmJfczeszwnLOmmbWagOOE19iYpEinXV2g@mail.gmail.com>
 <CANO=1y+bnK7Hr_rDJOovxsq38ZVYNO67gvCGVu3E3pTrwBzC3g@mail.gmail.com>
 <CANcuY=r=6fd+1+4arDi+95+BnWAiQupkT1Zct=Osktf9J4AUcA@mail.gmail.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6699973257730503449=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.

--===============6699973257730503449==
Content-Type: multipart/alternative;
	boundary="b1_9f23f02240a3229ad313786290da516a"

This is a multi-part message in MIME format.

--b1_9f23f02240a3229ad313786290da516a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

T24gU3VuZGF5LCBEZWNlbWJlciAyLCAyMDE4IDEyOjM4IEFNLCBMYXN6bG8gS0VSVEVTWiA8bGFz
emxvLmtlcnRlc3pAZ21haWwuY29tPiB3cm90ZToKCj4gT24gU3VuLCBEZWMgMiwgMjAxOCBhdCAx
OjI2IEFNIFR1c2hhciBQYW5rYWogPHR1c2hhci5zLnBhbmthakBnbWFpbC5jb20+IHdyb3RlOgo+
Cj4+IERvZXMgaXQgaGF2ZSB0byBkbyB3aXRoIG1hY3Jvcy5TIGhhdmluZyBhIGNhcGl0YWwgUyBl
eHRlbnNpb24/Cj4+Cj4+IFRoYW5rcywKPj4gVHVzaGFyIFBhbmthago+Cj4gUHJvYmFibHkgbm90
LiBJIGRvbid0IGhhdmUgYW55ICJhcmNoL3g4Ni9rZXJuZWwvbWFjcm9zLnMiIGZpbGUgKGFjdHVh
bGx5ICIvdXNyL3NyYy9saW51eC1oZWFkZXJzLTQuMjAuMC1yYzQvYXJjaC94ODYva2VybmVsL21h
Y3Jvcy5zIikgYXQgYWxsLiBJbiBmYWN0IG5laXRoZXIgZG8gaSBoYXZlIG1hY3Jvcy5zIG9yIG1h
Y3Jvcy5TIGluIHByZXZpb3VzIGtlcm5lbHMgZGlyZWN0b3JpZXMuCgpBbmQgdGhhdCdzIHdoeSBp
dCBmYWlsc1sxXS4gWW91IGhhdmUgdG8gYWRkICJhcmNoL3g4Ni9rZXJuZWwvbWFjcm9zLnMiIHRv
IGxpc3Qgb2YgZmlsZXMKdG8gYmUgY29waWVkIGFzIGZlZG9yYSBkaWQuIFRoZWlyIGZpcnN0IHBh
dGNoIGNvbnRhaW5lZCBhIHR5cG8gKGNhcGl0YWwgJ1MnIGluc3RlYWQgb2YgJ3MnWzJdLgpJIGRv
bicga25vdyB3aGVyZSBkZWJpYW4gZG9lcyBoYW5kbGUgdGhpcyB0aG91Z2guCgpbMV0gaHR0cHM6
Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNjQzNTk5ClsyXSBodHRwczov
L3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9jZ2l0L3JwbXMva2VybmVsLmdpdC9jb21taXQva2VybmVs
LnNwZWM/aWQ9ZTdjMzk2YmJmM2NkMTU2M2Q0NDUyNzVmOTJiNjNmOGU5ZGEzZjEzZQ==


--b1_9f23f02240a3229ad313786290da516a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj4gT24gU3VuZGF5LCBEZWNlbWJlciAyLCAyMDE4IDEyOjM4IEFNLCBMYXN6bG8gS0VSVEVT
WiAmbHQ7bGFzemxvLmtlcnRlc3pAZ21haWwuY29tJmd0OyB3cm90ZTo8YnI+PC9kaXY+PGRpdj4g
PGJyPjwvZGl2PjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNsYXNzPSJwcm90b25tYWlsX3F1b3Rl
Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2IGRpcj0ibHRyIj48ZGl2Pjxicj48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0
ciI+T24gU3VuLCBEZWMgMiwgMjAxOCBhdCAxOjI2IEFNIFR1c2hhciBQYW5rYWogJmx0OzxhIGhy
ZWY9Im1haWx0bzp0dXNoYXIucy5wYW5rYWpAZ21haWwuY29tIj50dXNoYXIucy5wYW5rYWpAZ21h
aWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9x
dW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29s
aWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0iYXV0byI+PGRp
dj5Eb2VzIGl0IGhhdmUgdG8gZG8gd2l0aCBtYWNyb3MuUyBoYXZpbmcgYSBjYXBpdGFsIFMgZXh0
ZW5zaW9uPzxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+VGhhbmtzLDxicj48L2Rp
dj48ZGl2PlR1c2hhciBQYW5rYWo8YnI+PC9kaXY+PC9kaXY+PC9kaXY+PC9ibG9ja3F1b3RlPjxk
aXY+PGJyPjwvZGl2PjxkaXY+UHJvYmFibHkgbm90LiBJIGRvbid0IGhhdmUgYW55ICJhcmNoL3g4
Ni9rZXJuZWwvbWFjcm9zLnMiIGZpbGUgKGFjdHVhbGx5ICIvdXNyL3NyYy9saW51eC1oZWFkZXJz
LTQuMjAuMC1yYzQvYXJjaC94ODYva2VybmVsL21hY3Jvcy5zIikgYXQgYWxsLiBJbiBmYWN0IG5l
aXRoZXIgZG8gaSBoYXZlIG1hY3Jvcy5zIG9yIG1hY3Jvcy5TIGluIHByZXZpb3VzIGtlcm5lbHMg
ZGlyZWN0b3JpZXMuPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2PjwvYmxvY2txdW90
ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PkFuZCB0aGF0J3Mgd2h5IGl0IGZhaWxzWzFdLiBZb3UgaGF2
ZSB0byBhZGQgImFyY2gveDg2L2tlcm5lbC9tYWNyb3MucyIgdG8gbGlzdCBvZiBmaWxlczxicj48
L2Rpdj48ZGl2PnRvIGJlIGNvcGllZCBhcyBmZWRvcmEgZGlkLiBUaGVpciBmaXJzdCBwYXRjaCBj
b250YWluZWQgYSB0eXBvIChjYXBpdGFsICdTJyBpbnN0ZWFkIG9mICdzJ1syXS48YnI+PC9kaXY+
PGRpdj5JIGRvbicga25vdyB3aGVyZSBkZWJpYW4gZG9lcyBoYW5kbGUgdGhpcyB0aG91Z2guPGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+WzFdIDxhIGhyZWY9Imh0dHBzOi8vYnVnemlsbGEu
cmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MTY0MzU5OSI+aHR0cHM6Ly9idWd6aWxsYS5yZWRo
YXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNjQzNTk5PC9hPjxicj48L2Rpdj48ZGl2PlsyXSA8YSBo
cmVmPSJodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9jZ2l0L3JwbXMva2VybmVsLmdpdC9j
b21taXQva2VybmVsLnNwZWM/aWQ9ZTdjMzk2YmJmM2NkMTU2M2Q0NDUyNzVmOTJiNjNmOGU5ZGEz
ZjEzZSI+aHR0cHM6Ly9zcmMuZmVkb3JhcHJvamVjdC5vcmcvY2dpdC9ycG1zL2tlcm5lbC5naXQv
Y29tbWl0L2tlcm5lbC5zcGVjP2lkPWU3YzM5NmJiZjNjZDE1NjNkNDQ1Mjc1ZjkyYjYzZjhlOWRh
M2YxM2U8L2E+PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pg==



--b1_9f23f02240a3229ad313786290da516a--


--===============6699973257730503449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6699973257730503449==--

