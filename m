Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCDFFC04AAB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B8CD206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B8CD206BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xakeps.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5655714a;
	Mon, 6 May 2019 20:35:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a97676a
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Apr 2019 07:07:36 +0000 (UTC)
Received: from forward400p.mail.yandex.net (forward400p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:105])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c00009df
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Apr 2019 07:07:36 +0000 (UTC)
Received: from mxback10j.mail.yandex.net (mxback10j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::113])
 by forward400p.mail.yandex.net (Yandex) with ESMTP id C9E8E1BC153B
 for <wireguard@lists.zx2c4.com>; Thu, 11 Apr 2019 10:07:33 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxback10j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id eSBDRRopAX-7WFCBLWL;
 Thu, 11 Apr 2019 10:07:33 +0300
Received: by iva3-bb39b28eb4f4.qloud-c.yandex.net with HTTP;
 Thu, 11 Apr 2019 10:07:32 +0300
From: admin@xakeps.dk
To: wireguard@lists.zx2c4.com
Subject: RX errors and dropped packets on server interface
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 11 Apr 2019 09:07:32 +0200
Message-Id: <3938491554966452@iva3-bb39b28eb4f4.qloud-c.yandex.net>
X-Mailman-Approved-At: Mon, 06 May 2019 22:35:06 +0200
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
Content-Type: multipart/mixed; boundary="===============1356290153838786629=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1356290153838786629==
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCI+TXkgd2lyZWd1YXJkIHNl
cnZlciBpbnRlcmZhY2UgcmVwb3J0cyBoaWdoIHJ4IGVycm9yIHJhdGUgYW5kIGRyb3BwZWQgcGFj
a2V0cyByYXRlLjwvZGl2PjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwi
Pk15IHNlcnZlciBjb25maWc6PC9kaXY+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5
OS94aHRtbCI+W0ludGVyZmFjZV08YnIgLz5BZGRyZXNzID0gMTAuMS4wLjEvMjQsIGZkMTA6MTox
OjoxLzY0PGJyIC8+TGlzdGVuUG9ydCA9ICZsdDtvbW1pdGVkJmd0OzxiciAvPlByaXZhdGVLZXkg
PSAmbHQ7b21taXRlZCZndDs8YnIgLz5Qb3N0VXAgPSBpcHRhYmxlcyAtdCBuYXQgLUEgUE9TVFJP
VVRJTkcgLW8gZXRoMCAtaiBNQVNRVUVSQURFOyBpcDZ0YWJsZXMgLXQgbmF0IC1BIFBPU1RST1VU
SU5HIC1vIGV0aDAgLWogTUFTUVVFUkFERTxiciAvPlBvc3REb3duID0gaXB0YWJsZXMgLXQgbmF0
IC1EIFBPU1RST1VUSU5HIC1vIGV0aDAgLWogTUFTUVVFUkFERTsgaXA2dGFibGVzIC10IG5hdCAt
RCBQT1NUUk9VVElORyAtbyBldGgwIC1qIE1BU1FVRVJBREU8YnIgLz48YnIgLz5bUGVlcl08YnIg
Lz5QdWJsaWNLZXkgPSAmbHQ7b21taXRlZCZndDs8YnIgLz5BbGxvd2VkSVBzID0gMTAuMS4wLjIv
MzIsIGZkMTA6MToxOjE6OjIvMTI4PGJyIC8+PGJyIC8+TXkgY2xpZW50IGNvbmZpZzo8L2Rpdj48
ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sIj5bSW50ZXJmYWNlXTxiciAv
PlByaXZhdGVLZXkgPSAmbHQ7b21taXRlZCZndDs8YnIgLz5BZGRyZXNzID0gMTAuMS4wLjIvMjQs
ZmQxMDoxOjE6MTo6Mi82NDxiciAvPkROUyA9IDEyNy4wLjAuMTxiciAvPjxiciAvPltQZWVyXTxi
ciAvPlB1YmxpY0tleSA9ICZsdDtvbW1pdGVkJmd0OzxiciAvPkVuZHBvaW50ID0gJmx0O29tbWl0
ZWQmZ3Q7PGJyIC8+QWxsb3dlZElQcyA9IDAuMC4wLjAvMCw6Oi8wPC9kaXY+PGRpdiB4bWxucz0i
aHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCI+wqA8L2Rpdj48ZGl2IHhtbG5zPSJodHRwOi8v
d3d3LnczLm9yZy8xOTk5L3hodG1sIj5JJ20gc3RhcnRpbmcgc2VydmVyIGFuZCBjbGllbnQgdXNp
bmcgd2ctcXVpY2sgdXAgJmx0O25hbWUmZ3Q7PC9kaXY+PGRpdiB4bWxucz0iaHR0cDovL3d3dy53
My5vcmcvMTk5OS94aHRtbCI+PGJyIC8+Q29tbWFuZCBpcCAtcyBsaW5rIHNob3cgb24gc2VydmVy
IHNpZGUgc2hvd3MsIHRoYXQgd2lyZWd1YXJkIGludGVyZmFjZSBoYXMgaGlnaCBSWCBlcnJvciBy
YXRlLCBkcm9wcGVkIHBhY2tldHMgYW5kIFRYIGVycm9yczwvZGl2PjxkaXYgeG1sbnM9Imh0dHA6
Ly93d3cudzMub3JnLzE5OTkveGh0bWwiPlJYIGVycm9ycyBhbmQgZHJvcHBlZCBwYWNrZXRzIHJp
c2VzLCBUWCBlcnJvcnMgY29uc3RhbnRseSBzdGF5cyBhdCByYW5kb20oPykgdmFsdWUuPC9kaXY+
PGRpdiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCI+T3RoZXIgaW50ZXJmYWNl
cyBoYXZlIG5vIGlzc3Vlcy48L2Rpdj48ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5
L3hodG1sIj7CoDwvZGl2PjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwi
PlNlcnZlcjo8L2Rpdj48ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sIj53
ZzA6ICZsdDtQT0lOVE9QT0lOVCxOT0FSUCxVUCxMT1dFUl9VUCZndDsgbXR1IDE0MjAgcWRpc2Mg
bm9xdWV1ZSBzdGF0ZSBVTktOT1dOIG1vZGUgREVGQVVMVCBncm91cCBkZWZhdWx0IHFsZW4gMTwv
ZGl2PjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiPkNsaWVudDo8L2Rp
dj48ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1sIj53ZzA6ICZsdDtQT0lO
VE9QT0lOVCxOT0FSUCxVUCxMT1dFUl9VUCZndDsgbXR1IDE0MjAgcWRpc2Mgbm9xdWV1ZSBzdGF0
ZSBVTktOT1dOIG1vZGUgREVGQVVMVCBncm91cCBkZWZhdWx0IHFsZW4gMTAwMDwvZGl2PjxkaXYg
eG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0bWwiPsKgPC9kaXY+PGRpdiB4bWxucz0i
aHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbCI+SSdtIHBlcnNvbmFsbHkgZXhwZXJpZW5jaW5n
IHJhbmRvbSBwYWNrZXQgbG9zcy48L2Rpdj48ZGl2IHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8x
OTk5L3hodG1sIj7CoDwvZGl2PjxkaXYgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGh0
bWwiPkknbSBkb24ndCBrbm93LCB3aGF0IHNob3VsZCBpIGRvIHRvIGRlYnVnIGFuZCBmaXggdGhp
cy48L2Rpdj4=

--===============1356290153838786629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1356290153838786629==--
