Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a44e704a
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Jun 2017 17:28:33 +0000 (UTC)
Received: from mail.crimel.ro (109.166.220.71 [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95e19239
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Jun 2017 17:28:33 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Lucian Cristian <luci@createc.ro>
Subject: fix centos 6 compile
Message-ID: <8cfef683-d9e1-fb6b-704c-f0c938c84c5b@createc.ro>
Date: Mon, 19 Jun 2017 20:44:01 +0300
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------893737C815486DF61B1E3B31"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------893737C815486DF61B1E3B31
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

centos 6 has gcc 4.4.7

with some minor modification and the updated kernel from elrepo this is 
working as it should


Regards


--------------893737C815486DF61B1E3B31
Content-Type: text/plain; charset=UTF-8;
 name="fix_gcc_centos_6.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="fix_gcc_centos_6.patch"

ZGlmZiAtYXVyIFdpcmVHdWFyZC0wLjAuMjAxNzA2MTMvc3JjL3NvY2tldC5jIFdpcmVHdWFy
ZC0wLjAuMjAxNzA2MTMtY250Ni9zcmMvc29ja2V0LmMKLS0tIFdpcmVHdWFyZC0wLjAuMjAx
NzA2MTMvc3JjL3NvY2tldC5jCTIwMTctMDYtMTMgMDE6MTg6MTQuMDAwMDAwMDAwICswMzAw
CisrKyBXaXJlR3VhcmQtMC4wLjIwMTcwNjEzL3NyYy9zb2NrZXQuYwkyMDE3LTA2LTE5IDIw
OjM2OjU4Ljk5NzAxODc2OSArMDMwMApAQCAtMTIsNiArMTIsOSBAQAogI2luY2x1ZGUgPGxp
bnV4L2lmX2V0aGVyLmg+CiAjaW5jbHVkZSA8bmV0L3VkcF90dW5uZWwuaD4KICNpbmNsdWRl
IDxuZXQvaXB2Ni5oPgorI2RlZmluZSBHQ0NfVkVSU0lPTiAoX19HTlVDX18gKiAxMDAwMCBc
CisJCSAgICArIF9fR05VQ19NSU5PUl9fICogMTAwIFwKKwkJICAgICsgX19HTlVDX1BBVENI
TEVWRUxfXykKIAogc3RhdGljIGlubGluZSBpbnQgc2VuZDQoc3RydWN0IHdpcmVndWFyZF9k
ZXZpY2UgKndnLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgZW5kcG9pbnQgKmVuZHBv
aW50LCB1OCBkcywgc3RydWN0IGRzdF9jYWNoZSAqY2FjaGUpCiB7CkBAIC0zMDcsNyArMzEw
LDEwIEBACiAJc3RydWN0IHNvY2tldCAqbmV3NCA9IE5VTEw7CiAJc3RydWN0IHVkcF9wb3J0
X2NmZyBwb3J0NCA9IHsKIAkJLmZhbWlseSA9IEFGX0lORVQsCisvKiBUZXN0IGZvciBHQ0Mg
PiA0LjQuNyAqLworI2lmIEdDQ19WRVJTSU9OID4gNDA0MDcKIAkJLmxvY2FsX2lwLnNfYWRk
ciA9IGh0b25sKElOQUREUl9BTlkpLAorI2VuZGlmCiAJCS5sb2NhbF91ZHBfcG9ydCA9IGh0
b25zKHdnLT5pbmNvbWluZ19wb3J0KSwKIAkJLnVzZV91ZHBfY2hlY2tzdW1zID0gdHJ1ZQog
CX07CkBAIC0zMTYsNyArMzIyLDEwIEBACiAJc3RydWN0IHNvY2tldCAqbmV3NiA9IE5VTEw7
CiAJc3RydWN0IHVkcF9wb3J0X2NmZyBwb3J0NiA9IHsKIAkJLmZhbWlseSA9IEFGX0lORVQ2
LAorLyogVGVzdCBmb3IgR0NDID4gNC40LjcgKi8KKyNpZiBHQ0NfVkVSU0lPTiA+IDQwNDA3
CiAJCS5sb2NhbF9pcDYgPSBJTjZBRERSX0FOWV9JTklULAorI2VuZGlmCiAJCS5sb2NhbF91
ZHBfcG9ydCA9IGh0b25zKHdnLT5pbmNvbWluZ19wb3J0KSwKIAkJLnVzZV91ZHA2X3R4X2No
ZWNrc3VtcyA9IHRydWUsCiAJCS51c2VfdWRwNl9yeF9jaGVja3N1bXMgPSB0cnVlLApkaWZm
IC1hdXIgV2lyZUd1YXJkLTAuMC4yMDE3MDYxMy9zcmMvdG9vbHMvTWFrZWZpbGUgV2lyZUd1
YXJkLTAuMC4yMDE3MDYxMy1jbnQ2L3NyYy90b29scy9NYWtlZmlsZQotLS0gV2lyZUd1YXJk
LTAuMC4yMDE3MDYxMy9zcmMvdG9vbHMvTWFrZWZpbGUJMjAxNy0wNi0xMyAwMToxODoxNC4w
MDAwMDAwMDAgKzAzMDAKKysrIFdpcmVHdWFyZC0wLjAuMjAxNzA2MTMvc3JjL3Rvb2xzL01h
a2VmaWxlCTIwMTctMDYtMTkgMjA6MTk6NDIuNTYwNDY3MjI2ICswMzAwCkBAIC0xMSw2ICsx
MSw4IEBACiBXSVRIX0JBU0hDT01QTEVUSU9OID89CiBXSVRIX1dHUVVJQ0sgPz0KIFdJVEhf
U1lTVEVNRFVOSVRTID89CitHQ0NfRVFfNDQ3IDo9ICQoc2hlbGwgZXhwciBgZ2NjIC1kdW1w
dmVyc2lvbiB8IHNlZCAtZSAncy9cLlwoWzAtOV1bMC05XVwpL1wxL2cnIC1lICdzL1wuXChb
MC05XVwpLzBcMS9nJyAtZSAncy9eWzAtOV1cezMsNFx9JCQvJjAwLydgIFw9IDQwNDA3KQor
CiAKIGlmZXEgKCQoV0lUSF9CQVNIQ09NUExFVElPTiksKQogaWZuZXEgKCQoc3RyaXAgJCh3
aWxkY2FyZCAkKEJBU0hDT01QRElSKSkpLCkKQEAgLTMyLDcgKzM0LDExIEBACiBlbmRpZgog
CiBDRkxBR1MgPz0gLU8zCitpZmVxICIkKEdDQ19FUV80NDcpIiAiMSIKK0NGTEFHUyArPSAt
c3RkPWdudTk5IC1EX0dOVV9TT1VSQ0UKK2Vsc2UKIENGTEFHUyArPSAtc3RkPWdudTExIC1E
X0dOVV9TT1VSQ0UKK2VuZGlmCiBDRkxBR1MgKz0gLVdhbGwgLVdleHRyYQogQ0ZMQUdTICs9
IC1NTUQgLU1QCiBDRkxBR1MgKz0gLURSVU5TVEFURURJUj0iXCIkKFJVTlNUQVRFRElSKVwi
Igo=
--------------893737C815486DF61B1E3B31--
