Return-Path: <SRS0=jywV=SH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC286C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732C12184B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  5 Apr 2019 15:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732C12184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d97817f6;
	Fri, 5 Apr 2019 15:21:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13639b92
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Mar 2019 20:20:58 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [IPv6:2a00:1a28:1251:46:246:28:121:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7da811fd
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Mar 2019 20:20:58 +0000 (UTC)
Received: from [IPv6:2001:470:de6f:1301::83b] (unknown
 [IPv6:2001:470:de6f:1301::83b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 5067C60098C2
 for <wireguard@lists.zx2c4.com>; Sun, 31 Mar 2019 20:22:40 +0000 (UTC)
From: mikma.wg@lists.m7n.se
Subject: Crashes in wg_allowedips_insert_X
To: wireguard@lists.zx2c4.com
Message-ID: <505e458e-4df9-8fbe-9891-83bdc8933260@m7n.se>
Date: Sun, 31 Mar 2019 22:22:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------FB6347239F3AF977EC93E666"
Content-Language: en-US
X-Mailman-Approved-At: Fri, 05 Apr 2019 17:21:48 +0200
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--------------FB6347239F3AF977EC93E666
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello list,

I'm experiencing crashes in wg_allowedips_insert_v4 and 
wg_allowedips_insert_v6 in the wireguard kernel module. It happens both 
with the current snapshot (0.0.20190227-wg1~bionic) and the current git 
master (65e1f283). It seems to be caused by commit 20a230b3 (allowedips: 
maintain per-peer list of allowedips), since I can't trigger the bug(s) 
after reverting that commit.

I have attached a dmesg dump of one general protection fault, and 
included two scripts below which triggers the bug(s). I am running 
Ubuntu 18.04 x86_64 with mainline linux 5.0.5 from 
https://kernel.ubuntu.com/~kernel-ppa/mainline.

/Mikma

#!/bin/sh

name=wgtest
key="pUZ1gXtFRRNeJFcBx2cGLELdeJTA00nTdQMuHjMYI2E="

ips="
0.0.0.0/0
10.0.0.0/8
100.64.0.0/10
172.16.0.0/12
192.168.0.0/16
"

allowed_ips=$(echo $ips | tr ' ' ',')

ip l add $name type wireguard
wg set $name peer $key allowed-ips $allowed_ips
wg set $name peer $key allowed-ips '0.0.0.0/0'


#!/bin/sh

name=wgtest
key="pUZ1gXtFRRNeJFcBx2cGLELdeJTA00nTdQMuHjMYI2E="

ips="
::/0
17e5:9cdb:34ce:1800::/111
5000::/4
eb3f:fbec:5000::/37
9730:9636:d403:e000::/75
"

allowed_ips=$(echo $ips | tr ' ' ',')

ip l add $name type wireguard
wg set $name peer $key allowed-ips $allowed_ips
wg set $name peer $key allowed-ips '::/0'


--------------FB6347239F3AF977EC93E666
Content-Type: text/plain; charset=UTF-8;
 name="gpf.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="gpf.txt"

WyAgIDQ3LjUwODQ4NV0gd2lyZWd1YXJkOiBsb2FkaW5nIG91dC1vZi10cmVlIG1vZHVsZSB0
YWludHMga2VybmVsLgpbICAgNDcuNTA4NTkxXSB3aXJlZ3VhcmQ6IG1vZHVsZSB2ZXJpZmlj
YXRpb24gZmFpbGVkOiBzaWduYXR1cmUgYW5kL29yIHJlcXVpcmVkIGtleSBtaXNzaW5nIC0g
dGFpbnRpbmcga2VybmVsClsgICA0Ny41MTEwNThdIHdpcmVndWFyZDogV2lyZUd1YXJkIDAu
MC4yMDE5MDIyNyBsb2FkZWQuIFNlZSB3d3cud2lyZWd1YXJkLmNvbSBmb3IgaW5mb3JtYXRp
b24uClsgICA0Ny41MTEwNTldIHdpcmVndWFyZDogQ29weXJpZ2h0IChDKSAyMDE1LTIwMTkg
SmFzb24gQS4gRG9uZW5mZWxkIDxKYXNvbkB6eDJjNC5jb20+LiBBbGwgUmlnaHRzIFJlc2Vy
dmVkLgpbICAgNDcuNTE3NDU2XSBnZW5lcmFsIHByb3RlY3Rpb24gZmF1bHQ6IDAwMDAgWyMx
XSBTTVAgUFRJClsgICA0Ny41MTc1NDVdIENQVTogMCBQSUQ6IDEyNzggQ29tbTogd2cgVGFp
bnRlZDogRyAgICAgICAgICAgT0UgICAgIDUuMC41LTA1MDAwNS1nZW5lcmljICMyMDE5MDMy
NzEyMTIKWyAgIDQ3LjUxNzYzOV0gSGFyZHdhcmUgbmFtZTogUUVNVSBTdGFuZGFyZCBQQyAo
aTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgMS4xMC4yLTF1YnVudHUxIDA0LzAxLzIwMTQK
WyAgIDQ3LjUxNzc1MF0gUklQOiAwMDEwOndnX2FsbG93ZWRpcHNfaW5zZXJ0X3Y0KzB4Mjk4
LzB4M2MwIFt3aXJlZ3VhcmRdClsgICA0Ny41MTc4NDVdIENvZGU6IDAwIDAwIDQ4IDgzIGM0
IDE4IDViIDQxIDVjIDQxIDVkIDQxIDVlIDQxIDVmIDVkIGMzIDQ4IDg5IGQ5IDQ4IDhiIDQx
IDM4IDQ4IDhiIDcxIDMwIDQ4IDhkIDUxIDMwIDRjIDg5IDMxIDQ5IDgxIGM2IDIwIDA2IDAw
IDAwIDw0OD4gODkgNDYgMDggNDggODkgMzAgNDkgOGIgNDYgMDggNDkgODkgNTYgMDggNGMg
ODkgNzEgMzAgNDggODkgNDEKWyAgIDQ3LjUxODA0M10gUlNQOiAwMDE4OmZmZmZhOWFjYzA4
NTc5ZjAgRUZMQUdTOiAwMDAxMDI4MgpbICAgNDcuNTE4MTMxXSBSQVg6IGRlYWQwMDAwMDAw
MDAyMDAgUkJYOiBmZmZmOGQ5NDkzNzhhMzQwIFJDWDogZmZmZjhkOTQ5Mzc4YTM0MApbICAg
NDcuNTE4MTkwXSBSRFg6IGZmZmY4ZDk0OTM3OGEzNzAgUlNJOiBkZWFkMDAwMDAwMDAwMTAw
IFJESTogMDAwMDAwMDBmZmZmZmZmZgpbICAgNDcuNTE4MjgzXSBSQlA6IGZmZmZhOWFjYzA4
NTdhMzAgUjA4OiBmZmZmOGQ5NDk0ZjlhZDA4IFIwOTogMDAwMDAwMDAwMDAwMDAwMwpbICAg
NDcuNTE4Mzc2XSBSMTA6IDNhMmNhYTQyMzc0NGEwMjQgUjExOiBjZWE0NWFiZmIzNWM1YmUz
IFIxMjogMDAwMDAwMDAwMDAwMDAwMApbICAgNDcuNTE4NDcyXSBSMTM6IDAwMDAwMDAwMDAw
MDAwMDAgUjE0OiBmZmZmOGQ5NDkzZWI3ZTIwIFIxNTogZmZmZjhkOTQ5NGY5YWNmMApbICAg
NDcuNTE4NTgwXSBGUzogIDAwMDA3ZjQ0YTI4Yzc3NDAoMDAwMCkgR1M6ZmZmZjhkOTQ5ZjIw
MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgICA0Ny41MTg2OTBdIENTOiAg
MDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAgIDQ3LjUx
ODc4MF0gQ1IyOiAwMDAwN2ZmZWQ1N2VlMGEwIENSMzogMDAwMDAwMDAxMzdiYTAwNCBDUjQ6
IDAwMDAwMDAwMDAzNjA2ZjAKWyAgIDQ3LjUxODkwN10gQ2FsbCBUcmFjZToKWyAgIDQ3LjUx
OTA1NV0gIHNldF9wZWVyKzB4M2I3LzB4NGMwIFt3aXJlZ3VhcmRdClsgICA0Ny41MTkxNDhd
ICB3Z19zZXRfZGV2aWNlKzB4MmU5LzB4NGMwIFt3aXJlZ3VhcmRdClsgICA0Ny41MTkyNDNd
ICBnZW5sX2ZhbWlseV9yY3ZfbXNnKzB4MWQ4LzB4NDEwClsgICA0Ny41MTkzMzRdICBnZW5s
X3Jjdl9tc2crMHg0Yy8weDkzClsgICA0Ny41MTk0MjRdICA/IF9jb25kX3Jlc2NoZWQrMHgx
OS8weDMwClsgICA0Ny41MTk1MTFdICA/IGdlbmxfZmFtaWx5X3Jjdl9tc2crMHg0MTAvMHg0
MTAKWyAgIDQ3LjUxOTU5OF0gIG5ldGxpbmtfcmN2X3NrYisweDRmLzB4MTIwClsgICA0Ny41
MTk2OTldICBnZW5sX3JjdisweDI4LzB4NDAKWyAgIDQ3LjUxOTc5NF0gIG5ldGxpbmtfdW5p
Y2FzdCsweDFhMS8weDI2MApbICAgNDcuNTE5ODY0XSAgbmV0bGlua19zZW5kbXNnKzB4MjBk
LzB4M2MwClsgICA0Ny41MTk4ODFdICBzb2NrX3NlbmRtc2crMHgzZS8weDUwClsgICA0Ny41
MTk5MzFdICBfX3N5c19zZW5kdG8rMHgxMTQvMHgxYTAKWyAgIDQ3LjUyMDAxOV0gID8gX19z
eXNfcmVjdm1zZysweDU5LzB4YTAKWyAgIDQ3LjUyMDEwM10gIF9feDY0X3N5c19zZW5kdG8r
MHgyOC8weDMwClsgICA0Ny41MjAxOTNdICBkb19zeXNjYWxsXzY0KzB4NWEvMHgxMTAKWyAg
IDQ3LjUyMDI4MF0gIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkK
WyAgIDQ3LjUyMDM3MV0gUklQOiAwMDMzOjB4N2Y0NGEyMWQ3ZGE3ClsgICA0Ny41MjA0NTdd
IENvZGU6IDY0IDg5IDAyIDQ4IGM3IGMwIGZmIGZmIGZmIGZmIGViIGI2IDBmIDFmIDgwIDAw
IDAwIDAwIDAwIDQ4IDhkIDA1IDYxIGRiIDJjIDAwIDQxIDg5IGNhIDhiIDAwIDg1IGMwIDc1
IDE4IGI4IDJjIDAwIDAwIDAwIDBmIDA1IDw0OD4gM2QgMDAgZjAgZmYgZmYgNzcgNzkgZjMg
YzMgMGYgMWYgODAgMDAgMDAgMDAgMDAgNDEgNTcgNDEgNTYgNGQKWyAgIDQ3LjUyMDY1NF0g
UlNQOiAwMDJiOjAwMDA3ZmZlZDU3MjhmMTggRUZMQUdTOiAwMDAwMDI0NiBPUklHX1JBWDog
MDAwMDAwMDAwMDAwMDAyYwpbICAgNDcuNTIwNzg3XSBSQVg6IGZmZmZmZmZmZmZmZmZmZGEg
UkJYOiAwMDAwMDAwMDAwMDAwMDAwIFJDWDogMDAwMDdmNDRhMjFkN2RhNwpbICAgNDcuNTIw
ODkyXSBSRFg6IDAwMDAwMDAwMDAwMDAwNzQgUlNJOiAwMDAwNTVjNzBmMTEwNDUwIFJESTog
MDAwMDAwMDAwMDAwMDAwMwpbICAgNDcuNTIwOTg1XSBSQlA6IDAwMDA1NWM3MGYxMTA0NTAg
UjA4OiAwMDAwN2Y0NGEyNGE5OWUwIFIwOTogMDAwMDAwMDAwMDAwMDAwYwpbICAgNDcuNTIx
MDc3XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjog
MDAwMDU1YzcwZjExMDRhOApbICAgNDcuNTIxMTcwXSBSMTM6IDAwMDAwMDAwMDAwMDAwMDAg
UjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogMDAwMDU1YzcwZjExMDI2MApbICAgNDcuNTIx
Mjg1XSBNb2R1bGVzIGxpbmtlZCBpbjogd2lyZWd1YXJkKE9FKSBpcDZfdWRwX3R1bm5lbCB1
ZHBfdHVubmVsIGJpbmZtdF9taXNjIHZldGggYnRyZnMgenN0ZF9jb21wcmVzcyB4b3IgcmFp
ZDZfcHEgZWJ0YWJsZV9maWx0ZXIgZWJ0YWJsZXMgaXA2dGFibGVfbmF0IG5mX25hdF9pcHY2
IGlwNnRhYmxlX2ZpbHRlciBpcDZfdGFibGVzIHh0X0NIRUNLU1VNIHh0X2NvbW1lbnQgeHRf
dGNwdWRwIGlwdGFibGVfbmF0IG5mX25hdF9pcHY0IG5mX25hdCBuZl9jb25udHJhY2sgbmZf
ZGVmcmFnX2lwdjYgbmZfZGVmcmFnX2lwdjQgbGliY3JjMzJjIGlwdGFibGVfbWFuZ2xlIGlw
dGFibGVfZmlsdGVyIGJwZmlsdGVyIGJyaWRnZSBzdHAgbGxjIHNuZF9oZGFfY29kZWNfZ2Vu
ZXJpYyBsZWR0cmlnX2F1ZGlvIGNyY3QxMGRpZl9wY2xtdWwgY3JjMzJfcGNsbXVsIGdoYXNo
X2NsbXVsbmlfaW50ZWwgYWVzbmlfaW50ZWwgYWVzX3g4Nl82NCBjcnlwdG9fc2ltZCBjcnlw
dGQgc25kX2hkYV9pbnRlbCBnbHVlX2hlbHBlciBzbmRfaGRhX2NvZGVjIHNuZF9oZGFfY29y
ZSBzbmRfaHdkZXAgam95ZGV2IGlucHV0X2xlZHMgc2VyaW9fcmF3IHNuZF9wY20gc25kX3Rp
bWVyIHNuZCBzb3VuZGNvcmUgbWFjX2hpZCBxZW11X2Z3X2NmZyBzY2hfZnFfY29kZWwgaXBf
dGFibGVzIHhfdGFibGVzIGF1dG9mczQgaGlkX2dlbmVyaWMgdXNiaGlkIGhpZCBxeGwgdHRt
IGRybV9rbXNfaGVscGVyIHBzbW91c2Ugc3lzY29weWFyZWEgc3lzZmlsbHJlY3Qgc3lzaW1n
Ymx0IHZpcnRpb19ibGsgdmlydGlvX25ldCBuZXRfZmFpbG92ZXIgZmFpbG92ZXIgaTJjX3Bp
aXg0IGZiX3N5c19mb3BzIGRybSBpZGVfcGNpX2dlbmVyaWMgcGlpeCBpZGVfY29yZSBwYXRh
X2FjcGkgZmxvcHB5ClsgICA0Ny41MjUzOTFdIC0tLVsgZW5kIHRyYWNlIDk0MDFkMTVkYzMw
NzFhOTQgXS0tLQpbICAgNDcuNTI2MjA3XSBSSVA6IDAwMTA6d2dfYWxsb3dlZGlwc19pbnNl
cnRfdjQrMHgyOTgvMHgzYzAgW3dpcmVndWFyZF0KWyAgIDQ3LjUyNjk4Ml0gQ29kZTogMDAg
MDAgNDggODMgYzQgMTggNWIgNDEgNWMgNDEgNWQgNDEgNWUgNDEgNWYgNWQgYzMgNDggODkg
ZDkgNDggOGIgNDEgMzggNDggOGIgNzEgMzAgNDggOGQgNTEgMzAgNGMgODkgMzEgNDkgODEg
YzYgMjAgMDYgMDAgMDAgPDQ4PiA4OSA0NiAwOCA0OCA4OSAzMCA0OSA4YiA0NiAwOCA0OSA4
OSA1NiAwOCA0YyA4OSA3MSAzMCA0OCA4OSA0MQpbICAgNDcuNTI4NTI2XSBSU1A6IDAwMTg6
ZmZmZmE5YWNjMDg1NzlmMCBFRkxBR1M6IDAwMDEwMjgyClsgICA0Ny41MjkyNjhdIFJBWDog
ZGVhZDAwMDAwMDAwMDIwMCBSQlg6IGZmZmY4ZDk0OTM3OGEzNDAgUkNYOiBmZmZmOGQ5NDkz
NzhhMzQwClsgICA0Ny41MzAwMTVdIFJEWDogZmZmZjhkOTQ5Mzc4YTM3MCBSU0k6IGRlYWQw
MDAwMDAwMDAxMDAgUkRJOiAwMDAwMDAwMGZmZmZmZmZmClsgICA0Ny41MzA3NTldIFJCUDog
ZmZmZmE5YWNjMDg1N2EzMCBSMDg6IGZmZmY4ZDk0OTRmOWFkMDggUjA5OiAwMDAwMDAwMDAw
MDAwMDAzClsgICA0Ny41MzE1NjhdIFIxMDogM2EyY2FhNDIzNzQ0YTAyNCBSMTE6IGNlYTQ1
YWJmYjM1YzViZTMgUjEyOiAwMDAwMDAwMDAwMDAwMDAwClsgICA0Ny41MzIzMTBdIFIxMzog
MDAwMDAwMDAwMDAwMDAwMCBSMTQ6IGZmZmY4ZDk0OTNlYjdlMjAgUjE1OiBmZmZmOGQ5NDk0
ZjlhY2YwClsgICA0Ny41MzMwMzFdIEZTOiAgMDAwMDdmNDRhMjhjNzc0MCgwMDAwKSBHUzpm
ZmZmOGQ5NDlmMjAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKWyAgIDQ3LjUz
Mzc4M10gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
MwpbICAgNDcuNTM0NTI5XSBDUjI6IDAwMDA3ZmZlZDU3ZWUwYTAgQ1IzOiAwMDAwMDAwMDEz
N2JhMDA0IENSNDogMDAwMDAwMDAwMDM2MDZmMAo=
--------------FB6347239F3AF977EC93E666
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------FB6347239F3AF977EC93E666--
