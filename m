Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419DEC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Nov 2021 07:26:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0ad6f693;
	Sun, 21 Nov 2021 07:24:26 +0000 (UTC)
Received: from gn213.whpservers.com (gn213mail.whpservers.com [69.65.24.74])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7fd038ef
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Nov 2021 15:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=peterhyman.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gsk/tOIgue+cp3DgIc/qg4d66jzZBSAX78LQthIluXQ=; b=VI956Nd1rIlIGeRNO8R2J+CDyH
 2adlwzxOcVDtxBb6zVPVBKgXJVHS0pZ24w7ZgaQ63UPPmkgmIZQ3/Vic82MFordFYY/aJY2h8NAdO
 0BY9QNwpdZ+0vddIh3YFuslPusCEXlU2vYbwBCOLago3fFZAvN34vPBY5+65PzoPR7bFX7Q5XxSP4
 GLeeTnQ3GLNU7bKaNlI56ggwTloPsihsiayETFSnPvKQKOxlDJmPet6dKe5HwAJb73A937gQEXpzB
 HUq3kW/wj3e4DnibeCXk7vN/Ai0069VblXAe6gf1d6s9iVWhXYuZQBfQrxp95d4mrEwxFlaMGdgHp
 PsDTcXtg==;
Received: from 208-73-101-10.fttp.usinternet.com ([208.73.101.10]:53648
 helo=tommyv.localhost)
 by gn213.whpservers.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <pete@peterhyman.com>) id 1mo5tI-00CNR3-HL
 for wireguard@lists.zx2c4.com; Fri, 19 Nov 2021 09:33:40 -0600
Date: Fri, 19 Nov 2021 09:33:34 -0600
From: Peter Hyman <pete@peterhyman.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Improvements to wg-quick output for linux.bash.
Message-ID: <20211119093334.3428f3ee@tommyv.localhost>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: base64
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gn213.whpservers.com
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - peterhyman.com
X-Get-Message-Sender-Via: gn213.whpservers.com: authenticated_id:
 pete@peterhyman.com
X-Authenticated-Sender: gn213.whpservers.com: pete@peterhyman.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Sun, 21 Nov 2021 07:24:25 +0000
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

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQ0KSGFzaDogUklQRU1EMTYwDQoNCg0K
LSBGcm9tIGM2NzVjMTczYThiMDA4YmQyODUzZmRlODY4OGY0ZGEzNDI3MWFlMTggTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxDQpGcm9tOiBQZXRlciBIeW1hbiA8cGV0ZUBwZXRlcmh5bWFuLmNvbT4N
CkRhdGU6IEZyaSwgMTkgTm92IDIwMjEgMDg6MzA6MjkgLTA2MDANClN1YmplY3Q6IFtQQVRDSF0g
SW1wcm92ZW1lbnRzIHRvIHdnLXF1aWNrIG91dHB1dCBmb3IgbGludXguYmFzaC4NCg0KUmVwbGFj
ZWQgdXNlIG9mICc8KGVjaG8gJHZhciknIGZvciAnd2cgc2V0Y29uZiAtZicgYW5kICduZnQgLWYn
IGNvbW1hbmRzLg0KVXNlIG9mICc8KGVjaG8gJHZhciknIG9ic2N1cmVkIGFjdHVhbCBpbnB1dCB0
byAnd2cnIGFuZCAnbmZ0JyBjb21tYW5kcw0KYW5kIHJlcGxhY2VkIHdpdGggL2Rldi9mZC82MyB3
aGljaCBqdXN0IGluZGljYXRlcyBwaXBlZCBpbnB1dC4NCkFmdGVyIHRoaXMgY29tbWl0LCBvdXRw
dXQgd2lsbCByZWZsZWN0IGFjdHVhbCBjb21tYW5kcyBmb3IgJ25mdCcNCmFuZCB3aWxsIGVjaG8g
dGhlIGNvbmZpZyBwYXJhbWV0ZXJzIGJlaW5nIHJlYWQgYnkgJ3dnIHNldGNvbmYnLg0KQ29uZmln
IHBhcmFtZXRlcnMgd2lsbCBhbHNvIGhpZGUgUHJpdmF0ZSBhbmQgUHJlc2hhcmVkIGtleXMgbGlr
ZQ0KdGhlICd3ZycgY29tbWFuZC4NCg0KQmVmb3JlDQo9PT09PT0NClsjXSB3ZyBzZXRjb25mIHdn
MCAvZGV2L2ZkLzYzDQpbI10gbmZ0IC1mIC9kZXYvZmQvNjMNCg0KQWZ0ZXINCj09PT09DQpbI10g
d2cgc2V0Y29uZiB3ZzAgL2Rldi9mZC82Mw0Kd2cgY29uZmlndXJhdGlvbg0KW0ludGVyZmFjZV0N
ClByaXZhdGVLZXkgPSAoaGlkZGVuKQ0KTGlzdGVuUG9ydCA9IDUxODIwDQoNCltQZWVyXQ0KUHVi
bGljS2V5ID0geHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eD0NClBy
ZXNoYXJlZEtleSA9IChoaWRkZW4pDQpBbGxvd2VkSVBzID0gMC4wLjAuMC8wDQpFbmRwb2ludCA9
IHh4eC54eHgueHh4Lnh4eDo1MTgyMA0KUGVyc2lzdGVudEtlZXBhbGl2ZSA9IDI1DQoNClsjXSBu
ZnQgZGVsZXRlIHRhYmxlIGlwIHdnLXF1aWNrLXdnMA0KDQpTaWduZWQtb2ZmLWJ5OiBQZXRlciBI
eW1hbiA8cGV0ZUBwZXRlcmh5bWFuLmNvbT4NCi0gLS0tDQogc3JjL3dnLXF1aWNrL2xpbnV4LmJh
c2ggfCA3ICsrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvc3JjL3dnLXF1aWNrL2xpbnV4LmJhc2ggYi9zcmMvd2ct
cXVpY2svbGludXguYmFzaA0KaW5kZXggZTRkNGM0Zi4uZjRmNzI5OCAxMDA3NTUNCi0gLS0tIGEv
c3JjL3dnLXF1aWNrL2xpbnV4LmJhc2gNCisrKyBiL3NyYy93Zy1xdWljay9saW51eC5iYXNoDQpA
QCAtMTkyLDcgKzE5Miw3IEBAIHJlbW92ZV9maXJld2FsbCgpIHsNCiAJCXdoaWxlIHJlYWQgLXIg
dGFibGU7IGRvDQogCQkJW1sgJHRhYmxlID09ICoiIHdnLXF1aWNrLSRJTlRFUkZBQ0UiIF1dICYm
IHByaW50ZiAtdiBuZnRjbWQgJyVzZGVsZXRlICVzXG4nICIkbmZ0Y21kIiAiJHRhYmxlIg0KIAkJ
ZG9uZSA8IDwobmZ0IGxpc3QgdGFibGVzIDI+L2Rldi9udWxsKQ0KLSAtCQlbWyAteiAkbmZ0Y21k
IF1dIHx8IGNtZCBuZnQgLWYgPChlY2hvIC1uICIkbmZ0Y21kIikNCisJCVtbIC16ICRuZnRjbWQg
XV0gfHwgY21kIG5mdCAiJG5mdGNtZCINCiAJZmkNCiAJaWYgdHlwZSAtcCBpcHRhYmxlcyA+L2Rl
di9udWxsOyB0aGVuDQogCQlsb2NhbCBsaW5lIGlwdGFibGVzIGZvdW5kIHJlc3RvcmUNCkBAIC0y
MzksNyArMjM5LDcgQEAgYWRkX2RlZmF1bHQoKSB7DQogCXByaW50ZiAtdiBuZnRjbWQgJyVzYWRk
IHJ1bGUgJXMgJXMgcHJlbWFuZ2xlIG1ldGEgbDRwcm90byB1ZHAgbWV0YSBtYXJrIHNldCBjdCBt
YXJrIFxuJyAiJG5mdGNtZCIgIiRwZiIgIiRuZnRhYmxlIg0KIAlbWyAkcHJvdG8gPT0gLTQgXV0g
JiYgY21kIHN5c2N0bCAtcSBuZXQuaXB2NC5jb25mLmFsbC5zcmNfdmFsaWRfbWFyaz0xDQogCWlm
IHR5cGUgLXAgbmZ0ID4vZGV2L251bGw7IHRoZW4NCi0gLQkJY21kIG5mdCAtZiA8KGVjaG8gLW4g
IiRuZnRjbWQiKQ0KKwkJY21kIG5mdCAiJG5mdGNtZCINCiAJZWxzZQ0KIAkJZWNobyAtbiAiJHJl
c3RvcmUiIHwgY21kICRpcHRhYmxlcy1yZXN0b3JlIC1uDQogCWZpDQpAQCAtMjQ4LDcgKzI0OCwx
MCBAQCBhZGRfZGVmYXVsdCgpIHsNCiB9DQogDQogc2V0X2NvbmZpZygpIHsNCisJbG9jYWwgV0df
Q09ORklHVE1QDQorCVdHX0NPTkZJR1RNUD0kKGVjaG8gIndnIGNvbmZpZ3VyYXRpb25cbiRXR19D
T05GSUciIHwgc2VkIC1lICdzL1woUHJpdmF0ZUtleSA9IFx8UHJlc2hhcmVkS2V5ID0gXCkuKiQv
XDEoaGlkZGVuKS8nKQ0KIAljbWQgd2cgc2V0Y29uZiAiJElOVEVSRkFDRSIgPChlY2hvICIkV0df
Q09ORklHIikNCisJZWNobyAtZSAiJFdHX0NPTkZJR1RNUCINCiB9DQogDQogc2F2ZV9jb25maWco
KSB7DQotIC0tIA0KMi4zNC4wDQoNCg0KLSAtLSANClBldGVyIEh5bWFuDQpHUEc6IDB4NDY3RkJG
N0QNCi0tLS0tQkVHSU4gUEdQIFNJR05BVFVSRS0tLS0tDQoNCmlFWUVBUkVEQUFZRkFtR1h3ODRB
Q2drUVRUZkdMVVovdjMwNzlnQ2d2eDJaQ2JCZm1GSDJGUWJTWEFsMmxoUHkNCnN2TUFtd2F2MkVm
a1l3SjJqTGdCbTB3czVqNklRVVJjDQo9THMrUw0KLS0tLS1FTkQgUEdQIFNJR05BVFVSRS0tLS0t
DQo=
