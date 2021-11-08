Return-Path: <SRS0=+cFr=P5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13894C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 00:52:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FA5361184
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Nov 2021 00:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5FA5361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23491ed6;
	Wed, 10 Nov 2021 00:52:47 +0000 (UTC)
Received: from mr85p00im-hyfv06011401.me.com (mr85p00im-hyfv06011401.me.com
 [17.58.23.191])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 312a697e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Nov 2021 16:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1636388356;
 bh=W+IdGy6pMcBrw4Q/HaqIdSdYOf8rN1DBHI8F7/ncw7s=;
 h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
 b=fHxzlGgejMjKTApJ9vWJMRIvxswEK4koGU21+8lNfH78Vr9iv8gTJfdOtAhLmGtCD
 mk+A3Cpaq+MndPFf1WKIRuLmr27zXvwugzzOGWHqPpyVqw9HaCs6nQW6jlzDxqvkMg
 UPz/IZCOLD+R0fB3ljaqTFfB10uI5RajUCShab8Hgg7n0q4q7CTNZsQVQ7cpU3D1ie
 6gnZg+pQPS5H9zaQeyOmPI3w0yaNOjipvknXi86kDQLQoRkg4PiLWsd7ZkSH1eel/r
 LE0mnfVNtyCulXxqnNU779f/HoKOTfT3gX9AZIJ0pIdwZ4EBnHc25rxN1jCAzdXrTC
 YQJIbPoOYIndg==
Received: from smtpclient.apple (unknown [95.157.33.99])
 by mr85p00im-hyfv06011401.me.com (Postfix) with ESMTPSA id 788D05A3509
 for <wireguard@lists.zx2c4.com>; Mon,  8 Nov 2021 16:19:16 +0000 (UTC)
From: Ludwig Huber <ludwig.huber79@icloud.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: iOS on demand VPN
Message-Id: <84B7A7A3-9E7F-4040-9BA5-8BCAA00FF3AF@icloud.com>
Date: Mon, 8 Nov 2021 17:19:13 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-11-08=5F05:2021-11-08=5F01,2021-11-08=5F05,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 adultscore=0 clxscore=1015 bulkscore=0 mlxlogscore=599 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2111080100
X-Mailman-Approved-At: Wed, 10 Nov 2021 00:52:46 +0000
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

Hello,

would it be possible that the Wireguard iOS App also gets support for =
VPN on demand via DNS domain match =
(https://developer.apple.com/documentation/networkextension/neondemandrule=
/1406150-dnssearchdomainmatch).
I would like to use Wireguard only when trying to access my smart home =
server. In the current version I have to leave VPN always on, which =
costs a lot of battery.

Thanks a lot,
Ludwig=
