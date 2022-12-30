Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6602C3DA7A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Jan 2023 02:43:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bcc020a;
	Tue, 3 Jan 2023 02:42:28 +0000 (UTC)
Received: from st43p00im-zteg10063401.me.com (st43p00im-zteg10063401.me.com
 [17.58.63.175])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 57663bf8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2022 15:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1672415113; bh=LxglsnYrXjpcVetkBJytXB1SPg2047C3321KN4MWdZM=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=WgVHlUcCQBS4S1BpN9CmsOeXPhW/l0er0F3G6N6wU/S1WCbZL77sHJaLusaih2qmt
 183d3ulMQy0whzVg1yn5nCYGs4O1vcogybnZE2Fnjy4mH9CV4X6ihhBSt6DL8clwMu
 z0JN6PiP4XG9rZxHPIWnEb9SZdITLUhhRzqBh61YGcso06ZXzVOZBOf7Idz+9Dw0Gq
 AR3IuYtUXnbb/iDoJQSRky8o5KGdtCxha0Y+BUb0O9rEMgvutIEGZn+DBjcGFA0iGa
 EaSHgxiFfMqNj9Q/eVkVeekDAdOLsLYr5SJ3lv5+TBJGZc4CcrgDe2RtbMjkjdC34e
 MwHNRbrBxTstg==
Received: from smtpclient.apple (st43p00im-dlb-asmtp-mailmevip.me.com
 [17.42.251.41])
 by st43p00im-zteg10063401.me.com (Postfix) with ESMTPSA id 5DAB2C60554
 for <wireguard@lists.zx2c4.com>; Fri, 30 Dec 2022 15:45:13 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Subject: Rounded-rectangle icons for MacOS
From: Pierrick Rouxel <pierrick.rouxel@me.com>
Resent-From: Pierrick Rouxel <pierrick.rouxel@me.com>
Date: Fri, 30 Dec 2022 09:16:23 +0100
Content-Transfer-Encoding: quoted-printable
Resent-Date: Fri, 30 Dec 2022 16:45:00 +0100
Resent-To: wireguard@lists.zx2c4.com
Message-Id: <8DCA5CA8-6560-45ED-8D07-99FAD6568E61@me.com>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Proofpoint-ORIG-GUID: lkG3W_HHuc46OC-xvOzMnUDWxlA0VQAr
X-Proofpoint-GUID: lkG3W_HHuc46OC-xvOzMnUDWxlA0VQAr
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 adultscore=0 mlxscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2212300138
X-Mailman-Approved-At: Tue, 03 Jan 2023 02:42:20 +0000
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

Hello team !

I=E2=80=99m a mac user on macOS Ventura. I use the wireguard client.

Since macOS Big Sur, Apple changed the guidelines of app icon. It should =
be defined in a rounded rectangle : =
https://developer.apple.com/design/human-interface-guidelines/foundations/=
app-icons/#platform-considerations

This change affect :
    =E2=80=A2 The app icon
    =E2=80=A2 The VPN setting icons
    =E2=80=A2 Maybe others ?

I would have been happy to submit a PR but I saw that the github projet =
is a mirror of your private repository.=20
So, I ask to you here, can you change app  icons to follow Apple =
Guidelines and provide a better intergration in the last versions of =
macOS ?

Regards,
Pierrick.=
