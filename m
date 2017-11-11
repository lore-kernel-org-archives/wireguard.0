Return-Path: ishitatsuyuki@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4efe4ccf
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 10:30:28 +0000 (UTC)
Received: from mail3.protonmail.ch (mail3.protonmail.ch [185.70.40.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 410a7216
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 10:30:27 +0000 (UTC)
Date: Sat, 11 Nov 2017 05:33:55 -0500
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Tatsuyuki Ishi <ishitatsuyuki@protonmail.com>
Subject: Multilink/handover: proposal
Message-ID: <QiBM8URr-HKCMq4BcIPXG7YFxKwmqj7pJE8-O3T6z8f3q5ZNr2rzpHiKsw42PX8t_i1z5z1HuTKn7PibpxaPk6rccBsi871tkyedEU-Y0Iw=@protonmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="b1_63880b34889682e39cde93387c1125e7"
Reply-To: Tatsuyuki Ishi <ishitatsuyuki@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--b1_63880b34889682e39cde93387c1125e7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

SSBoYXZlIHNlZW4gYSB0aHJlYWQgcmVnYXJkaW5nIG11bHRpbGluayB0aGlzIG1vbnRoLCBhbmQg
SSdtIGFsc28gaW50ZXJlc3RlZCBpbiBpdC4KCkknbSBub3QgZXhhY3RseSBzdXJlIGlmIHRoaXMg
aXMgYSB0aGluZyB0byBpbXBsZW1lbnQgaW4gV2lyZUd1YXJkIGxheWVyIChNUFRDUCBtZW50aW9u
ZWQgaW4gcHJldmlvdXMgdGhyZWFkIGlzIGEgZ29vZCBjb21wZXRpdG9yKSwgYnV0IEkgaGF2ZSBz
b21lIGlkZWFzIGZvciBpdHMgZGVzaWduLgoKRXh0ZW5kaW5nIHRoZSAicm9hbWluZyIgZGVzaWdu
LCB3ZSBjYW4gY2hvb3NlIHRvIG5vdCBkaXJlY3RseSBzd2l0Y2ggdG8gdGhlIG5ldyBwZWVyIGJ1
dCBhbGxvdyBpdCB0byBzcGxpdCB0aGUgdHJhZmZpYy4gV2Ugc3RhcnQgcm91bmQgcm9iaW4sIGFu
ZCBpbiBlYWNoIHRpbWUgZnJhbWUsIHdlIGNoZWNrIGhvdyBtYW55IHBhY2tldHMgaGF2ZSB3ZSBy
ZWNlaXZlZCBmcm9tIGVhY2ggcGF0aCwgYW5kIGFkanVzdCB0aGUgcmF0aW8gb2Ygc2VuZGluZy4g
VGhpcyB3YXkgYSBkaXNjb25uZWN0IHNob3VsZCBncmFjZWZ1bGx5IHByb3BhZ2F0ZS4KCkhvdyBk
b2VzIHRoaXMgc291bmQ/IENvbW1lbnRzIHdlbGNvbWUuCgpOT1RJQ0U6IEkgaGF2ZSBtYWlsIGRl
bGl2ZXJ5IGRpc2FibGVkLiBQbGVhc2UgdXNlICJSZXBseSBBbGwiIHNvIGl0J3MgYWxzbyBkaXJl
Y3RseSBzZW50IHRvIG1lLg==


--b1_63880b34889682e39cde93387c1125e7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdj5JIGhhdmUgc2VlbiBhIHRocmVhZCByZWdhcmRpbmcgbXVsdGlsaW5rIHRoaXMgbW9udGgs
IGFuZCBJJ20gYWxzbyBpbnRlcmVzdGVkIGluIGl0Ljxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PkknbSBub3QgZXhhY3RseSBzdXJlIGlmIHRoaXMgaXMgYSB0aGluZyB0byBpbXBsZW1lbnQg
aW4gV2lyZUd1YXJkIGxheWVyIChNUFRDUCBtZW50aW9uZWQgaW4gcHJldmlvdXMgdGhyZWFkIGlz
IGEgZ29vZCBjb21wZXRpdG9yKSwgYnV0IEkgaGF2ZSBzb21lIGlkZWFzIGZvciBpdHMgZGVzaWdu
Ljxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkV4dGVuZGluZyB0aGUgInJvYW1pbmciIGRl
c2lnbiwgd2UgY2FuIGNob29zZSB0byBub3QgZGlyZWN0bHkgc3dpdGNoIHRvIHRoZSBuZXcgcGVl
ciBidXQgYWxsb3cgaXQgdG8gc3BsaXQgdGhlIHRyYWZmaWMuIFdlIHN0YXJ0IHJvdW5kIHJvYmlu
LCBhbmQgaW4gZWFjaCB0aW1lIGZyYW1lLCB3ZSBjaGVjayBob3cgbWFueSBwYWNrZXRzIGhhdmUg
d2UgcmVjZWl2ZWQgZnJvbSBlYWNoIHBhdGgsIGFuZCBhZGp1c3QgdGhlIHJhdGlvIG9mIHNlbmRp
bmcuIFRoaXMgd2F5IGEgZGlzY29ubmVjdCBzaG91bGQgZ3JhY2VmdWxseSBwcm9wYWdhdGUuPGJy
PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SG93IGRvZXMgdGhpcyBzb3VuZD8gQ29tbWVudHMg
d2VsY29tZS48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48Yj5OT1RJQ0U6IEkgaGF2ZSBt
YWlsIGRlbGl2ZXJ5IGRpc2FibGVkLiBQbGVhc2UgdXNlICJSZXBseSBBbGwiIHNvIGl0J3MgYWxz
byBkaXJlY3RseSBzZW50IHRvIG1lLjwvYj48YnI+PC9kaXY+



--b1_63880b34889682e39cde93387c1125e7--
