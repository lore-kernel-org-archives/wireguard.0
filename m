Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE61C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Oct 2021 07:25:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C3F860F39
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Oct 2021 07:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C3F860F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slarew.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f4caf76;
	Thu, 28 Oct 2021 07:25:38 +0000 (UTC)
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com
 [17.58.23.181])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 130698ce
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Oct 2021 07:25:36 +0000 (UTC)
Received: from hilbert.lan (ip68-8-45-126.sd.sd.cox.net [68.8.45.126])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id BA572400834
 for <wireguard@lists.zx2c4.com>; Thu, 28 Oct 2021 07:16:43 +0000 (UTC)
From: Stephen Larew <stephen@slarew.net>
To: wireguard@lists.zx2c4.com
Subject: Split DNS for macOS
Date: Thu, 28 Oct 2021 00:16:37 -0700
Message-Id: <20211028071638.88001-1-stephen@slarew.net>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-10-27=5F07:2021-10-25=5F02,2021-10-27=5F07,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 bulkscore=0
 clxscore=1030 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=893 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2110280036
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

For many months now, I have been running a patched WireGuard macOS app
that enables a split DNS configuration. I would like to try to upstream
my patches for split DNS.

There has been some interest in this patch:
- "Mac APP DNS Search Domain" thread from July and August 2021 [1]
- A commenter on my GitHub fork of wireguard-apple.

What is split DNS? It allows sending DNS queries to a specific server
based on the domain name. Systemd-resolved calls it a routing domain.
Apple's Network Extension framework calls it a match domain.  Split DNS
is especially useful for internal DNS servers.

For example, if corp.example.com is a routing domain for the DNS server
at 192.0.2.1 (only accessible over WireGuard), then
server.corp.example.com is resolved using 192.0.2.1 while
www.example.com is resolved using some other DNS resolver (depending on
the other network settings in macOS).

The proposed patch adds new syntax to the wg-quick DNS= line.
Specifically, a tilde prefixed domain is treated as a routing domain.
Multiple routing domains can be added.

Limitations:
- Needs modifications to iOS UI to work on iOS.
- Only matching routing domains are sent to the DNS servers specified in
  the DNS= config line.  No separate fallback catch-all DNS server can
  be set.
- Routing/match domains are also included in the list of search domains.
  This could be changed with the matchDomainsNoSearch API, but lacking
  more UI or config file changes to expose this option to the user, I
  went with the default.

[1] https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMacBookAir-2.local/T/
[2] https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5e89f1af57fcdff8


